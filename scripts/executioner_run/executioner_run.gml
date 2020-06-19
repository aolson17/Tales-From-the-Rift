sprite_index = spr_executioner_run
mask_index = spr_executioner_mask
image_speed = abs(run_image_speed_factor*xsp)

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	state = executioner_fall
}else{ // If on ground
	
	
	if xsp = 0 && move = 0{
		state = executioner_stand
	}
	
	if prev_face = -face && prev_state = executioner_run{
		if abs(xsp)>3{
			if instance_number(obj_dust_wave_small)<=1{
				if collision_point(x+face*-25,y+16,par_solid,true,true){
					var dust = instance_create_layer(x+face*-25,y+15,"Instances",obj_dust_wave_small)
					dust.image_xscale = -face
				}
			}
		}
	}
	
	prev_face = face
	
	image_xscale = face
}






