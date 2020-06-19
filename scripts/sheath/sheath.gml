sprite_index = spr_player_sheath
mask_index = spr_player_mask_stand
image_speed = .6

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	mask_index = spr_player_mask_stand
	if !place_meeting(x,y,par_solid){
		if ysp <= 0{
			state = jump
		}else{
			state = fall
		}
	}
	mask_index = spr_player_mask_crouch
}else{ // If on ground
	if image_index > image_number-1{
		sheathed = true
		state = stand
	}
	
	image_xscale = face
}


