/// @param text_id
function scr_game_text(_text_id){
switch(_text_id) {
		
		// Test NPC 1
	case "npc1":
		scr_text("Are you learning how to use code? I hope so. Isn't it fun? SO FUN!", "block1");
			scr_option("Yes", "npc1 - yes");
			scr_option("No", "npc1 - no");
			break;
			
		case "npc1 - yes":
		
			scr_text("That's great!", "block1");
			scr_text("Can you figure out how to display text without ID's?", "block1");
			
				scr_option("No...", "npc1 - no2");
				scr_option("YES!!", "npc1 - yes2");
				
				break;
				
					case "npc1 - no2":
					
						scr_text("Hmm... I'm sure you'll figure it out soon.", "block1");
						
						break;
						
					case "npc1 - yes2":
					
						scr_text("That's awesome!!", "block1")
			break;
			
		case "npc1 - no":
			scr_text("Well you can just fuck off", "block1");
			break;
		
		// Test NPC 2
	case "npc2":
		scr_text("Hey! I am NPC number two.", "block2");
		scr_text("I can also display multiple lines of text.", "block2");
		break;
		
		// Test NPC 3
	case "npc3":
		scr_text("And finally I am NPC number three.", "block3");
		scr_text("This is the final line of text from all three of us.");
			scr_text_color(0, 3, c_purple, c_purple, c_purple, c_purple,);
		break;
	
		// Test NPC Wisp
	case "npc4":
		scr_text("Hello there! I am Wisp and I am going to help guide you through The Rift.", "wisp");
				scr_text_color(63, 71, c_purple, c_purple, c_purple, c_purple,);
				scr_text_shake(63, 71);
		scr_text("It is boundless, so I suggest you stick to the path lest you are lost to the void...", "wisp");
		scr_text("Falling. Falling. Forever...", "wisp_sad");
		scr_text(". . .", "wisp_sad");
		scr_text("Anyway!", "wisp_happy");
		scr_text("The path is made of stardust. Look for clusters of it, they are usually safe enough for travel.", "wisp");
		scr_text("Usually.", "wisp");
		scr_text("There have been times the stardust seems to... Coalesce.", "wisp");
		scr_text("You could be sucked up into a pocket of the stuff.", "wisp_surprised");
		scr_text("I doubt you would like what happens after that.", "wisp_sad");
		scr_text(". . .", "wisp_sad");
			scr_option("What happens?", "npc4 - 1")
			break;
				case "npc4 - 1":
		scr_text("You would be trapped for a very long time. The matter around you would condense, squeezing, crushing...", "wisp_sad");
		scr_text(". . .", "wisp_sad");
			scr_option("After that?", "npc4 - 2")
			break;
				case "npc4 - 2":
		scr_text("I DON'T WANT TO TALK ABOUT IT!", "wisp_mad");
		scr_text("!", "wisp_surprised");
		scr_text("Sorry... I have some, uh, personal experience...", "wisp_sad");
		scr_text("It was not a good time.", "wisp_annoyed");
		scr_text("And there are other ways I'm sure you'd like to spend your brief time here.", "wisp");
		scr_text("You are the vessel of the Time Keeper after all.", "wisp_happy");
		scr_text("Time is very important for you.", "wisp");
		scr_text("Follow the path to continue on. We'll get you ready for the physical world in no time at all.", "wisp");
		scr_text("I have a good feeling about you.", "wisp_happy");
	
	
		break;
	
	
	}
		
}