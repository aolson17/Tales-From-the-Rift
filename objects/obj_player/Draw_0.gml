
if !surface_exists(arm_surf){
	arm_surf = surface_create(40,40)
}


if !invincible{
	draw_self()
}else{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,image_alpha)
}

draw_set_color(c_red)
if place_meeting(x,y,par_solid)||keyboard_check(ord("B")){
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
}

if drawn{
	surface_set_target(arm_surf)
	draw_clear_alpha(c_black,0)
	
	//draw_sprite_ext(spr_player_gun_arm,0,3,3,1,1,0,c_white,1)
	if face = 1{
		var dir = aim_dir
		draw_sprite_ext(spr_player_gun_arm,0,20,20,1,1,dir,c_white,1)
		if flash{
			draw_sprite_ext(spr_muzzle_flash,0,20+lengthdir_x(gun_length,dir),20+lengthdir_y(gun_length,dir),1,1,dir,c_white,1)
		}
	}else{
		var dir = aim_dir+180
		draw_sprite_ext(spr_player_gun_arm,0,20,20,-1,1,dir,c_white,1)
		if flash{
			draw_sprite_ext(spr_muzzle_flash,0,20-lengthdir_x(gun_length,dir),20-lengthdir_y(gun_length,dir),-1,1,dir,c_white,1)
		}
	}
	
	surface_reset_target()
	//draw_circle(x,y,3,false)
	draw_surface_ext(arm_surf,x-20+face*2,y-21,1,1,0,c_white,1)
	/*if face = 1{
		draw_surface_ext(arm_surf,x,y,1,1,aim_dir,c_white,1)
	}else{
		draw_surface_ext(arm_surf,x,y,-1,1,aim_dir+180,c_white,1)
	}*/
	
}



/*if keyboard_check(ord("E")){
	var mask = mask_index
	mask_index = spr_player_drop_kick
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false)
	mask_index = mask
}