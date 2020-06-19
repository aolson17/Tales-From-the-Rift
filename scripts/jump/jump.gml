if drawn{
	sprite_index = spr_player_jump_gun
}else{
	sprite_index = spr_player_jump
}
mask_index = spr_player_mask_stand
image_speed = .3

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp > 0{
		state = fall
	}
	
}else{ // If on ground
	
	if xsp = 0{
		state = stand
	}else{
		state = run
	}
	
	image_xscale = face
}






