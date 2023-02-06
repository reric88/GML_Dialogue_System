// get input
up_key = keyboard_check_pressed(vk_numpad4);
down_key = keyboard_check_pressed(vk_numpad1);
accept_key = keyboard_check_pressed(vk_numpad0);

// Store number of Options in current menu
op_length = array_length(option[menu_level]);

// move cursor in menu
pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length -1};

// Using the options
if accept_key {
	
	var _sml = menu_level; 
	
	switch(menu_level) {	
	
		//Pause Menu
		case 0:
			switch(pos){
				// Start game
				case 0: room_goto(rm_gaijin_glade); break;
				// Settings
				case 1: menu_level = 1; break;
				// Quit Game
				case 2: game_end(); break;
				}
			break;
		
		//Settings menu
		case 1:
			switch(pos){
				//window size
				case 0:
					break;
				//Brightness
				case 1:
					break;
				//Music
				case 2:
					break;
				//Sound Effects
				case 3:
					break;
				//Controls
				case 4:
					break;
				//Back
				case 5:
					menu_level = 0;
					break;
			}
		}
	//set position back
	if _sml != menu_level {pos = 0};
	
	// Correct option length
	op_length = array_length(option[menu_level]);
	}
