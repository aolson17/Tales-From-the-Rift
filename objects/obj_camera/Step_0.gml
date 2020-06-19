

target_x = target.x+(face_offset*obj_player.face)+target.xsp*target_speed_factor

if obj_player.on_ground{
	follow_camera = false
}

if !obj_player.scope_key{
	
	possible_new_target_y = target.y-25*obj_player.on_ground
	
	if abs(possible_new_target_y - target_y) > 50 || (obj_player.on_ground && !prev_on_ground){
		if abs(possible_new_target_y - target_y) > 50{
			follow_camera = true
		}
		
		non_scope_target_y = possible_new_target_y//target.y-25*obj_player.on_ground+target.ysp*target_speed_factor
	}
	prev_on_ground = obj_player.on_ground
	
	target_y = non_scope_target_y
	
	if follow_camera{
		target_y = (target.y+target.ysp*target_speed_factor)
	}
}else{
	if obj_player.gun_scope = true{
		var gun_scope_power_divisor = 0.03546113 + 5.304387*power(2.7183,(-0.08925988*obj_player.gun_scope_power))
		if obj_player.gamepad{
			target_x = ((target.x+(face_offset*obj_player.face)+target.xsp*target_speed_factor)+obj_player.x+lengthdir_x(75,obj_player.aim_dir))/2
			target_y = ((target.y+target.ysp*target_speed_factor)+obj_player.y+lengthdir_y(75,obj_player.aim_dir))/2
		}else{
			target_x = ((target.x+(face_offset*obj_player.face)+target.xsp*target_speed_factor)+mouse_x/gun_scope_power_divisor)/(1+1/gun_scope_power_divisor)
			target_y = ((target.y+target.ysp*target_speed_factor)+mouse_y/gun_scope_power_divisor)/(1+1/gun_scope_power_divisor)
		}
	}else{
		if obj_player.gamepad{
			target_x = ((target.x+(face_offset*obj_player.face)+target.xsp*target_speed_factor)+obj_player.x+lengthdir_x(75,obj_player.aim_dir))/2
			target_y = ((target.y+target.ysp*target_speed_factor)+obj_player.y+lengthdir_y(75,obj_player.aim_dir))/2
		}else{
			target_x = ((target.x+(face_offset*obj_player.face)+target.xsp*target_speed_factor)+mouse_x/5)/1.2
			target_y = ((target.y+target.ysp*target_speed_factor)+mouse_y/5)/1.2
		}
	}
}

if shake > 0{
	shake_offset_x = choose(-1,1)*((irandom(shake)+1)*4)
	shake_offset_y = choose(-1,1)*((irandom(shake)+1)*4)
	shake_offset_r = 0//choose(-1,1)
	shake--
}else{
	shake_offset_x = 0
	shake_offset_y = 0
	shake_offset_r = 0
}

x += spd_factor*(target_x-x+shake_offset_x)
y += spd_factor*(target_y-y+shake_offset_y)

camera_set_view_pos(camera, (x-zoom_width/2), (y-zoom_height/2))
camera_set_view_angle(camera,shake_offset_r)
camera_set_view_size(camera,zoom_width,zoom_height)