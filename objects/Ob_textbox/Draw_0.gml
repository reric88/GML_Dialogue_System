//draw textbox
draw_sprite(sp_dialogue_box, 0, x,y);

//draw text
draw_set_font(fnt_txt);

if(charcount < string_length(text[page])){
	charcount += +.5;
}
textpart = string_copy(text[page], 1, charcount);

// Draw the name
draw_set_halign(fa_center);
draw_text(x+65,y+89,name);
draw_set_halign(fa_left);

// Draw text part
draw_text_ext(x+114,y+18,textpart,stringheight,boxwidth - 130);