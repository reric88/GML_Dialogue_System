// Spawn main menu buttons

with(ob_btn1){
	instance_destroy();
}

var Button_Back = instance_create_depth(guiw/2, guih/2, -4096, ob_btn1);
Button_Back.BUTTON_TYPE = 4;
Button_Back.HoverValue = 1;
