sprite_index = spr_executioner_die
image_speed = .5
mask_index = spr_executioner_mask

if prev_state != state{
	image_index = 0
}
prev_state = state

if image_index > image_number-1{
	image_speed = 0
	var dead = instance_create_layer(x,y,layer,obj_executioner_dead)
	dead.image_xscale = face
	instance_destroy()
}


