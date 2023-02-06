// Toggle Hover value

if(keyboard_check_released(vk_down)){
	if(KeyboardToggle == false){
		HoverValue = 1;
		KeyboardToggle = true;
	}
	else {
		KeyboardToggle = true;
		HoverValue++;
		if(HoverValue > instance_number(ob_btn1)){
			HoverValue = 1;	
		}
	}
}

if(keyboard_check_released(vk_up)){
	if(KeyboardToggle == false){
		HoverValue = 1;
		KeyboardToggle = true;
	}
	else {
		KeyboardToggle = true;
		HoverValue--;
		if(HoverValue <= 0){
			HoverValue = instance_number(ob_btn1);	
		}
	}
}
