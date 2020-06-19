sprite_index = spr_player_crouch_walk
mask_index = spr_player_mask_crouch
image_speed = abs(crouch_image_speed_factor*xsp)

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
			state = run
		}
		mask_index = spr_player_mask_crouch
	}
	
	if xsp = 0{
		state = crouch
	}
	
	image_xscale = face
}


