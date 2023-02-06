guiw = display_get_gui_width();
guih = display_get_gui_height();

HoverValue = 0;
KeyboardToggle = false;

// Play Button
var Button_Play = instance_create_depth(guiw/2, guih/2, -4096, ob_btn1);
Button_Play.BUTTON_TYPE = 1;
Button_Play.HoverValue = 1;

// Options
var Button_Play = instance_create_depth(guiw/2, guih/2 +40, -4096, ob_btn1);
Button_Play.BUTTON_TYPE = 2;
Button_Play.HoverValue = 2;

// Quit button
var Button_Quit = instance_create_depth(guiw/2, guih/2 +80, -4096, ob_btn1);
Button_Quit.BUTTON_TYPE = 3;
Button_Quit.HoverValue = 3;
