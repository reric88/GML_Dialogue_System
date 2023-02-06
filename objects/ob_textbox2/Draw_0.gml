accept_key = keyboard_check_pressed(vk_space);

textbox_x = camera_get_view_x(view_camera[0]);
// 4-11-22 textbox_y = camera_get_view_y(view_camera[0]) + 310;
textbox_y = camera_get_view_y(view_camera[0]) + 136;


//----------Setup----------//

if setup == false
	{
		
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through pages
	
	for (var p = 0; p < page_number; p++)
		{
		// Find how many characters are on each page and store that number in the text_length array
		text_length[p] = string_length(text[p]);	
		
		// Get the text position for the textbox
			// Character on the left
			text_x_offset[p] = 80;
			portrait_x_offset[p] = 8;
			// 4-11-22 text_x_offset[p] = 104;
			// 4-11-22 portrait_x_offset[p] = 40;
			// Character on the right
			if speaker_side[p] == -1
				{
				// 4-11-22 text_x_offset[p] = 8;
				// 4-11-22 portrait_x_offset[p] = 304;
				text_x_offset[p] = 8;
				portrait_x_offset[p] = 209;
				}
			
			// No character (center textbox)
			if speaker_sprite[p] == noone
				{
				text_x_offset[p] = 44;
				}
		// Setting individual characters and finding where the lines of text should break
		for (var c = 0; c < text_length[p]; c++)
			{
			var _char_pos = c+1;
			
			// Store individual characters into the char array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			// Get current width of the line we're typing
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			
			// Get the last free space
			if char[c, p] == " " {last_free_space = _char_pos + 1};
			
			// Get the line breaks
			if _current_txt_w - line_break_offset[p] > line_width
				{
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
				}
			}
			
		// Getting each characters x & y positions
		for (var c = 0; c < text_length[p]; c++)
			{
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			// Get current width of the line we're typing
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0;
			
			// Compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
				{
				// If the current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p]
					{
					var _string_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_txt_w = string_width(_string_copy);
					
					// Record the "line" this character should be on
					_txt_line = lb + 1 // +1 since lb starts at 0
					}
				}
				
				
			// Add to the x and y positions based on the new info
			char_x[c, p] = _txt_x + _current_txt_w;
			char_y[c, p] = _txt_y + _txt_line * line_sep;
			
			}
			
		}
	
		
	}


//----------Typing the text----------//
if text_pause_timer <= 0
	{
	if draw_char < text_length[page]
		{
		
		draw_char += text_spd;
		draw_char = clamp(draw_char, 0, text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if _check_char == "." || _check_char == "," || _check_char == "?" || _check_char == "!"
			{
			text_pause_timer = text_pause_time;
			if !audio_is_playing(snd[page])
			{
			audio_play_sound(snd[page], 8, false);
			}
			}
			
			else
			{
			// Typing Sound
			if snd_count < snd_delay
			{
				snd_count++;
			} else 
			{
				snd_count = 0;
				audio_play_sound(snd[page], 8, false);
			}
			}
		}
	} else {
			
			text_pause_timer --;
			
			}
	
//----------Advance through pages----------//
if accept_key 
	{
	
	// If the typing is done
	if draw_char == text_length[page]
		{
			
		// Next page
		if page < page_number-1
			{
			page++;
			draw_char = 0;
			}
		// Destroy textbox
		else
			{
			// Link text for options
			if option_number > 0
				{
				create_textbox(option_link_id[option_pos]);	
				}
			instance_destroy();
			}
			
		}
	// If not done typing
	else
		{
		draw_char = text_length[page];
		}
	}


//----------Draw textbox----------//
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

// Draw the speaker
if speaker_sprite[page] != noone
	{
	sprite_index = speaker_sprite[page];
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1 {_speaker_x += sprite_width}
	
	// Draw the speaker box
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, (70/txtb_spr_w), (70/txtb_spr_h), 0, c_white, 1);
	// 4-11-22 draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x+10, textbox_y, (sprite_width+20)/txtb_spr_w, (sprite_height+16)/txtb_spr_h, 0, c_white, 1);
	// Old	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width*1.25/txtb_spr_w, sprite_height*1.25/txtb_spr_h, 0, c_white, 1)

	//Draw the speaker portrait
	draw_sprite_ext(sprite_index, image_index, _speaker_x+3, textbox_y+3, speaker_side[page], 1, 0, c_white, 1)
	// 4-11-22 draw_sprite_ext(sprite_index, image_index, _speaker_x - portrait_x_offset[page]/2, textbox_y+8, speaker_side[page], 1, 0, c_white, 1)
	}

// Draw back of textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);
// 4-11-22 draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, (textbox_width/txtb_spr_w), textbox_height/txtb_spr_h, 0, c_white, 1);


//----------Options----------//
if draw_char == text_length[page] && page == page_number - 1
	{
		
	// Option Selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
		
	// Draw the options
	var _op_space = 20;
	var _op_bord = 8;
	for (var op = 0; op < option_number; op++)
		{
		// The option box
		var _o_w = string_width(option[op]) + _op_bord * 3;
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 16, _txtb_y - _op_space * option_number + _op_space * op, _o_w/txtb_spr_w, (_op_space - 1) / txtb_spr_h, 0, c_white, 1)
		
		// The arrow
		if option_pos == op
		{
		draw_sprite(spr_textbox_arrow, 0, _txtb_x, _txtb_y - _op_space * option_number + _op_space * op);	
		}
		
		// The option text
		draw_text(_txtb_x + 16 + _op_bord, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op]);
		
		}
		
	}


// Draw the text (Old code)
// var _drawtext = string_copy(text[page], 1, draw_char);
// draw_text_ext(_txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width);

// Draw the text (New code)
for (c = 0; c < draw_char; c++)
	{
		
		// ----- Special Stuff ----- //
		// Floating text
		var _float_y = 0;
		if float_text[c, page] == true
			{
				// This changes float speed
			float_dir[c, page] += -6;	
				// * number changes float amount, -1 to 1 good values
			_float_y = dsin( float_dir[c, page] ) *1;
			}
			
		// Shake Text
		var _shake_x = 0;
		var _shake_y = 0;
		if shake_text[c, page] == true
			{
			shake_timer[c, page]--;
			if shake_timer[c, page] <= 0 {
				shake_timer[c, page] = irandom_range(4, 8);
				shake_dir[c, page] = irandom(360);
				}
			if shake_timer[c, page] <= 3 {
				_shake_x = lengthdir_x(1, shake_dir[c, page]);
				_shake_y = lengthdir_y(1, shake_dir[c, page]);
				}

			}
		
	// The text
	draw_text_color(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1)
	}


