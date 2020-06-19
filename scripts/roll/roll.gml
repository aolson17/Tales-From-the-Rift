sprite_index = spr_player_roll
mask_index = spr_player_mask_crouch
image_speed = 2

if prev_state != state{
	image_index = 0
	obj_camera.shake += 2
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
	
	if xsp = 0{
		state = crouch
	}else if abs(xsp) < max_crouch_walk_speed{
		state = crouch_walk
	}
}


image_xscale = face