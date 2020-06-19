if drawn{
	sprite_index = spr_player_run_gun
}else{
	sprite_index = spr_player_run
}
mask_index = spr_player_mask_stand
image_speed = abs(run_image_speed_factor*xsp)

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	
	// Slide
	if abs(xsp)>=max_run_speed/1.5 && down_key && !slide_cooldown{
		/*if instance_number(obj_dust_wave_small)=0{
			var dust = instance_create_layer(x,y+15,"Effects",obj_dust_wave_small)
			dust.image_xscale = -face
		}*/
		if sprint_key{
			state = slide
			slide_cooldown = true
			alarm[7] = slide_cooldown_frames
		}else{
			state = crouch_walk
		}
	}
	
	if (xsp = 0 && move = 0){
		state = stand
	}
	/*
	if prev_face = -face && prev_state = run{
		if abs(xsp)>3{
			if instance_number(obj_dust_wave_small)<=2{
				if collision_point(x+face*-25,y+16,par_solid,true,true){
					var dust = instance_create_layer(x+face*-25,y+15,"Effects",obj_dust_wave_small)
					dust.image_xscale = -face
				}
			}
		}
	}*/
	
	prev_face = face
	
	image_xscale = face
}






