depth = -9999

// Textbox parameters

// 4-11-22 textbox_width = 285;
// 4-11-22 textbox_height = 80;
textbox_width = 198;
textbox_height = 70;
border = 8;
line_sep = 15;
line_width = textbox_width - border *2;
txtb_spr[0] = sp_menu1;
txtb_img = 0;
txtb_img_spd = 15/60;


// Text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_spd = 1;


// Options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;


setup = false;

// Sound
snd_delay = 4;
snd_count = snd_delay;

// Effects
scr_set_defaults_for_text();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 30;