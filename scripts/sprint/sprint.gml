sprite_index = spr_player_sprint
mask_index = spr_player_mask_stand
image_speed = abs(sprint_image_speed_factor*xsp)

if prev_state != state{
	image_index = 0
	obj_camera.shake += 1
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	if down_key{
		if instance_number(obj_dust_wave)<=2{
			var dust = instance_create_layer(x,y+15,"Effects",obj_dust_wave)
			dust.image_xscale = -face
		}
		state = slide
	}
	
	if xsp = 0 && move = 0{
		state = stand
	}
	
	if prev_face = -face{
		if abs(xsp)>4{
			if instance_number(obj_dust_wave)<=2{
				if collision_point(x+face*-25,y+16,par_solid,true,true){
					var dust = instance_create_layer(x+face*-25,y+15,"Effects",obj_dust_wave)
					dust.image_xscale = -face
				}
			}
		}
	}
	
	prev_face = face
	
	image_xscale = face
}






