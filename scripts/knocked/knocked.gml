sprite_index = spr_player_knock_down
mask_index = spr_player_mask_crouch
image_speed = 1.2

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	
	if floor(image_index) = 2{
		image_speed = 0
	}
}else{ // If on ground
	if image_index > image_number-1{
		image_speed = 0
		
		if down_key||jump_key||up_key{
			mask_index = spr_player_mask_stand
			if !place_meeting(x,y,par_solid){
				state = get_up
				sprite_index = spr_player_get_up
				image_index = 2
			}else{
				state = crouch
			}
			mask_index = spr_player_mask_crouch
		}
	}
	
	image_xscale = face
}


