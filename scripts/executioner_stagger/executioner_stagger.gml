sprite_index = spr_executioner_hurt
image_speed = .4
mask_index = spr_executioner_mask

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = executioner_fall
}else{ // If on ground
	
	if image_index > image_number-1{
		state = executioner_stand
	}
	
	image_xscale = face
}


