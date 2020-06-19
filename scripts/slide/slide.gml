sprite_index = spr_player_slide
mask_index = spr_player_mask_crouch
image_speed = 1

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
	if down_key||up_key{
		mask_index = spr_player_mask_stand
		if !place_meeting(x,y,par_solid){
			state = stand
			image_index = 0
		}
		mask_index = spr_player_mask_crouch
	}
	
	if xsp = 0{
		state = crouch
	}else if abs(xsp) < max_crouch_walk_speed/2{
		state = crouch_walk
	}
}


