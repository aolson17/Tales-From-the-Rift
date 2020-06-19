sprite_index = spr_executioner_idle
mask_index = spr_executioner_mask
image_speed = .3

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = executioner_fall
}else{ // If on ground
	
	if abs(xsp) > 0{
		state = executioner_run
	}
	
	image_xscale = face
}


