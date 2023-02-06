if(place_meeting(x,y,Object11)){
	if(keyboard_check_pressed(vk_space)){
		if(mytextbox == 0){
			mytextbox = instance_create_layer(Object11.x-175,Object11.y+60,"text",Ob_textbox);
			mytextbox.text = wisptext1;
			mytextbox.master = self;
			mytextbox.name = myname;
			myportrait = instance_create_layer(mytextbox.x+65, mytextbox.y+52,"portraits",ob_wisp_portrait);
		}
	}
} else {
	if(mytextbox != 0){
		instance_destroy(mytextbox);
		instance_destroy(myportrait);
		mytextbox = 0;
	}
}
