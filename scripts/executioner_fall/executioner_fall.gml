sprite_index = spr_executioner_fall
mask_index = spr_executioner_mask
image_speed = .6

if prev_state != state{
	image_index = 0
}
prev_state = state

if place_meeting(x,y+1,par_solid){ // If on ground
	if xsp = 0{
		state = executioner_stand
	}else{
		state = executioner_run
	}
	
	image_xscale = face
}

