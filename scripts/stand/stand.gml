if drawn{
	sprite_index = spr_player_idle_gun
}else{
	sprite_index = spr_player_idle
}
mask_index = spr_player_mask_stand
image_speed = .2

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
	if down_key{
		state = crouch
	}
	
	if xsp != 0{
		state = run
	}
	
	image_xscale = face
}


