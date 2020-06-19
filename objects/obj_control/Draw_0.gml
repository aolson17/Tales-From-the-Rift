
if !surface_exists(scope_surface){
	scope_surface = surface_create(width,height)
}

if obj_player.gamepad{
	cursor_x = obj_player.x+lengthdir_x(75,obj_player.aim_dir)
	cursor_y = obj_player.y+lengthdir_y(75,obj_player.aim_dir)
}else{
	cursor_x = mouse_x
	cursor_y = mouse_y
}

draw_sprite(spr_cursor,0,cursor_x,cursor_y)

var target_inaccuracy = obj_player.gun_accuracy+obj_player.current_recoil+obj_player.current_gun_backwards_accuracy_offset
shown_innacuracy = lerp(shown_innacuracy,target_inaccuracy,indicator_spd_factor)


var dis = point_distance(obj_player.x+lengthdir_x(obj_player.gun_length,obj_player.aim_dir),obj_player.y-1+lengthdir_y(obj_player.gun_length,obj_player.aim_dir),mouse_x,mouse_y)

var perp_dis = tan(((shown_innacuracy)/2)*.0175)*dis

draw_sprite_ext(spr_reticle,0,cursor_x+lengthdir_x(perp_dis,obj_player.aim_dir-90),cursor_y+lengthdir_y(perp_dis,obj_player.aim_dir-90),1,1,obj_player.aim_dir,c_white,1)
draw_sprite_ext(spr_reticle,0,cursor_x+lengthdir_x(perp_dis,obj_player.aim_dir+90),cursor_y+lengthdir_y(perp_dis,obj_player.aim_dir+90),1,1,obj_player.aim_dir,c_white,1)

#region Scope Effect

target_scope_alpha = 0
pos_x = obj_player.x-(obj_camera.x-width/2)
pos_y = obj_player.y-(obj_camera.y-height/2)
if obj_player.gun_scope && obj_player.scope_key{ // Player is scoped
	mouse_dis = point_distance(obj_player.x,obj_player.y,mouse_x,mouse_y)
	scope_draw_dis = 400*obj_player.gun_scope_power // How far to erase black
	scope_min_size = 20
	scope_size = scope_min_size+(max((200-mouse_dis)/100,0))*50
	
	if mouse_dis > 50{
		target_scope_alpha = (min(1-(200-mouse_dis)/150,.9))
	}
}

scope_alpha = lerp(scope_alpha,target_scope_alpha,scope_alpha_spd_factor)

surface_set_target(scope_surface)
draw_set_color(c_black)
draw_rectangle(0,0,width,height,false)

gpu_set_blendmode(bm_subtract)
draw_line_width(pos_x-lengthdir_x(scope_draw_dis,obj_player.aim_dir),pos_y-lengthdir_y(scope_draw_dis,obj_player.aim_dir),pos_x+lengthdir_x(scope_draw_dis,obj_player.aim_dir),pos_y+lengthdir_y(scope_draw_dis,obj_player.aim_dir),scope_size)
gpu_set_blendmode(bm_normal)
surface_reset_target()

draw_set_alpha(scope_alpha)
draw_surface(scope_surface,obj_camera.x-width/2,obj_camera.y-height/2)
draw_set_alpha(1)

#endregion


/*if obj_player.gun_laser_sight{
	draw_set_color(c_red)
	draw_set_alpha(.1)
	var prev_layer = layer
	layer = layer_get_id("Player")
	var step_x = obj_player.x+lengthdir_x(obj_player.gun_length,obj_player.aim_dir)
	var step_y = obj_player.y-1+lengthdir_y(obj_player.gun_length,obj_player.aim_dir)
	var step_size = 1
	for(var range = 0; range < 500; range++){
		if !collision_line(step_x+lengthdir_x(step_size,obj_player.aim_dir),step_y+lengthdir_y(step_size,obj_player.aim_dir),step_x,step_y,par_solid,true,true){
			draw_line_width(step_x+lengthdir_x(step_size,obj_player.aim_dir),step_y+lengthdir_y(step_size,obj_player.aim_dir),step_x,step_y,1)
		}else{
			break
		}
		step_x += lengthdir_x(step_size,obj_player.aim_dir)
		step_y += lengthdir_y(step_size,obj_player.aim_dir)
	}
	layer = prev_layer
	//draw_triangle(obj_player.x+lengthdir_x(obj_player.gun_length,obj_player.aim_dir),obj_player.y-1+lengthdir_y(obj_player.gun_length,obj_player.aim_dir),mouse_x+lengthdir_x(perp_dis,obj_player.aim_dir-90),mouse_y+lengthdir_y(perp_dis,obj_player.aim_dir-90),mouse_x+lengthdir_x(perp_dis,obj_player.aim_dir+90),mouse_y+lengthdir_y(perp_dis,obj_player.aim_dir+90),false)
	draw_set_alpha(1)
}*/

