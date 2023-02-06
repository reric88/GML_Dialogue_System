function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	// Variables for every letter/character
	for (var c = 0; c < 500; c++)
		{
		col_1[c, page_number] = c_white;	
		col_2[c, page_number] = c_white;	
		col_3[c, page_number] = c_white;	
		col_4[c, page_number] = c_white;	
		
		float_text[c, page_number] = 0;
			// c* number changes degree of each letter floating
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
		}
	
	txtb_spr[page_number] = sp_menu1;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_8;

	}


//---------- Text VFX ---------- //
// @param 1st_char
// @param last_char
// @param col1
// @param col2
// @param col3
// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4){

for (var c = _start; c <= _end; c++)
	{
	col_1[c, page_number - 1] = _col1;
	col_2[c, page_number - 1] = _col2;
	col_3[c, page_number - 1] = _col3;
	col_4[c, page_number - 1] = _col4;
	
	}

}

//@param 1st_char
//@param last_char
function scr_text_float(_start, _end){
	
	for (var c = _start; c <= _end; c++)
		{
		float_text[c, page_number-1] = true;	
		}
	
}

function scr_text_shake(_start, _end){
	
	for (var c = _start; c <= _end; c++)
		{
		shake_text[c, page_number-1] = true;	
		}
	
}




/// @param text
/// @param [character]
/// @param [side]
function scr_text(_text){
	
	scr_set_defaults_for_text();
	
	text[page_number] = _text;
	
	// Get character info
	if argument_count > 1{
		switch(argument[1])
			{
				// Wisp				
				case "wisp":
				speaker_sprite[page_number] = sp_wisp_default_p;
				txtb_spr[page_number] = sp_textbox_rain1;
				snd[page_number] = snd_d_ding;
				break;
				
				case "wisp_sad":
				speaker_sprite[page_number] = sp_wisp_sad_p;
				txtb_spr[page_number] = sp_textbox_rain1;
				snd[page_number] = snd_5;
				break;
				
				case "wisp_mad":
				speaker_sprite[page_number] = sp_wisp_mad_p;
				txtb_spr[page_number] = sp_textbox_rain1;
				snd[page_number] = snd_11;
				break;
				
				case "wisp_annoyed":
				speaker_sprite[page_number] = sp_wisp_annoyed_p;
				txtb_spr[page_number] = sp_textbox_rain1;
				snd[page_number] = snd_11;
				break;
				
				case "wisp_happy":
				speaker_sprite[page_number] = sp_wisp_happy_p;
				txtb_spr[page_number] = sp_textbox_rain1;
				snd[page_number] = snd_d_ding;
				break;
				
				case "wisp_surprised":
				speaker_sprite[page_number] = sp_wisp_surprised_p;
				txtb_spr[page_number] = sp_textbox_rain1;
				snd[page_number] = snd_d_ding;
				break;
				
				case "block1":
				speaker_sprite[page_number] = sp_speakblock_speak;
				txtb_spr[page_number] = sp_textbox_stars1;
				break;
				
				case "block2":
				speaker_sprite[page_number] = sp_speakblock2_speak;
				break;
				
				case "block3":
				speaker_sprite[page_number] = sp_speakblock3_speak;
				txtb_spr[page_number] = sp_textbox_swirl1;
				break;
				
				
			}	
				
		}
	
	
	
	page_number ++;
}











/// @param option
/// @param link_id
function scr_option(_option, _link_id){
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number ++;
}











/// @param text_id
function create_textbox(_text_id){
	with( instance_create_depth(0, 0, -9999, ob_textbox2) )
	{
	scr_game_text(_text_id);
	}
}