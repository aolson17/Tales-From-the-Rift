if drawn{
	sprite_index = spr_player_fall_gun
}else{
	sprite_index = spr_player_fall
}
mask_index = spr_player_mask_stand
image_speed = .6

if prev_state != state{
	alarm[8] = coyote_jump_frames // Start timer to end coyote jump ability
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}
	
	face = image_xscale
}else{ // If on ground
	if xsp = 0{
		state = stand
	}else{
		state = run
	}
	
	image_xscale = face
}

prev_ysp = ysp

