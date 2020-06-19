sprite_index = spr_player_get_up
mask_index = spr_player_mask_stand
image_speed = .8

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	
	if ceil(image_index) = image_number{
		state = stand
	}
}


