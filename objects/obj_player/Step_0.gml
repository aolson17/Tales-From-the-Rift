
move = right_key-left_key

if sheathe_key{
	drawn = !drawn
}

on_ground = place_meeting(x,y+1,par_solid)

// Don't sprint while scoped
if scope_key{
	sprint_key = false
}

if on_ground{
	if state = crouch || state = crouch_walk{
		move_speed = crouch_walk_speed
		max_move_speed = max_crouch_walk_speed
	}else if state = slide || state = roll{
		move = image_xscale
		move_speed = 0
		max_move_speed = max_run_speed
	}else if state = knocked || state = sheath || state = draw{
		move = 0
		move_speed = 0
		max_move_speed = 0
	}else if state = sprint{
		move_speed = sprint_speed
		max_move_speed = max_sprint_speed
	}else{
		if !sprint_key{
			move_speed = run_speed
			max_move_speed = max_run_speed
		}else{
			move_speed = sprint_speed
			max_move_speed = max_sprint_speed
		}
	}
}else{
	if state = sprint{
		move_speed = air_move_factor*sprint_speed
		max_move_speed = max_sprint_speed
	}else{
		move_speed = air_move_factor*run_speed
		max_move_speed = max_run_speed
	}
}

if move = sign(xsp){ // If trying to move in the same direction as momentum
	if abs(xsp) <= max_move_speed{ // If not already over limit
		xsp += move * move_speed
		if abs(xsp) > max_move_speed{ // Don't let xsp go over max
			xsp = move * max_move_speed
		}
	}
}else{
	xsp += move * move_speed
}

if !on_ground{ // Apply gravity
	ysp += grav_speed
}else{ // If on ground
	coyote_jump = true // Reset coyote jump ability
	
	if (move != sign(xsp) || abs(xsp) > max_move_speed) && state != roll && state != slide{ // Apply friction
		var prev_xsp = xsp
		if xsp > 0{
			if xsp - move_friction > 0{
				xsp -= move_friction
			}else{
				xsp = 0
			}
		}else if xsp < 0{
			if xsp + move_friction < 0{
				xsp += move_friction
			}else{
				xsp = 0
			}
		}
		if move = 1 && xsp > 0 && abs(prev_xsp) <= max_move_speed{
			xsp = max_move_speed
		}else if move = -1 && xsp < 0 && abs(prev_xsp) <= max_move_speed{
			xsp = -max_move_speed
		}
	}
	if state = slide{
		var fric = slide_friction
	}else if state = roll{
		var fric = roll_friction
	}
	if state = slide || state = roll{
		if xsp > 0{
			if xsp - fric > 0{
				xsp -= fric
			}else{
				xsp = 0
			}
		}else if xsp < 0{
			if xsp + fric < 0{
				xsp += fric
			}else{
				xsp = 0
			}
		}
	}
}

if on_ground || coyote_jump{
	jumping = false
	if state != knocked && state != hurt && state != sheath && state != draw && state != roll && state != get_up{
		if jump_key || queue_jump{ // Jump
			ysp = -jump_speed
			jumping = true
			coyote_jump = false
			queue_jump = false
		}
		
		if face = 1{
			if move < 0{
				face = -1
			}
		}else{
			if move > 0{
				face = 1
			}
		}
	}
}else{
	if state = fall{
		if jump_key{ // Queue Jump
			queue_jump = true
			alarm[9] = queue_jump_frames
		}
	}
}

if ysp > 0{
	jumping = false
}
if jump_key_released && jumping{ // Variable jumping
	ysp *= variable_jump_factor
	jumping = false
}
if jump_key_released{ // Cancel queued jump
	queue_jump = false
}

/*if (state != sheath && state != draw) && state = stand || state = sprint || state = run{
	if sheathe_key{
		if !sheathed{
			state = sheath
			image_index = 0
		}else{
			state = draw
			image_index = 0
		}
	}
}*/
if (state != sheath && state != draw) && state = stand || state = sprint || state = run{
	if sheathe_key{
		drawn = !drawn
	}
}

// Recoil Recovery
if current_recoil > 0{
	current_recoil-=gun_recoil_recovery
}else{
	current_recoil = 0
}

// Face aim direction when scoped
if scope_key{
	if abs(angle_difference(aim_dir,0)) > 90{
		face = -1
	}else{
		face = 1
	}
}

// Increase innacuracy when shooting backward
if face = 1 && (abs(angle_difference(aim_dir,0)) > 90){
	current_gun_backwards_accuracy_offset = ((abs(angle_difference(aim_dir,0))-90)/90)*gun_backwards_accuracy_offset
}else if face = -1 && (abs(angle_difference(aim_dir,180)) > 90){
	current_gun_backwards_accuracy_offset = ((abs(angle_difference(aim_dir,180))-90)/90)*gun_backwards_accuracy_offset
}else{
	current_gun_backwards_accuracy_offset = 0
}

if can_shoot > 0{
	can_shoot--
}

if state = run || state = stand || state = jump || state = fall{
	if ((attack_key&&gun_auto)||(attack_key_pressed&&!gun_auto)) && can_shoot = 0{
		can_shoot += gun_fire_rate
		obj_camera.shake += 3
		repeat(gun_shots){ // Shoot multple times if it should
			var bullet = instance_create_layer(x+lengthdir_x(gun_length,aim_dir),y-2+lengthdir_y(gun_length,aim_dir),"Bullets",obj_bullet)
			var dir_range = gun_accuracy+current_recoil+current_gun_backwards_accuracy_offset
			var dir_offset = random(dir_range)-(dir_range)/2
			bullet.xsp = lengthdir_x(15,aim_dir+dir_offset)+xsp
			bullet.ysp = lengthdir_y(15,aim_dir+dir_offset)+ysp
			bullet.image_angle = aim_dir+dir_offset
		}
		if on_ground{
			xsp += lengthdir_x(-gun_knockback,aim_dir+dir_offset)
		}else{
			xsp += lengthdir_x(-gun_knockback*.25,aim_dir+dir_offset)
		}
		ysp += lengthdir_y(-gun_knockback*.25,aim_dir+dir_offset)
		flash = true
		alarm[1] = muzzle_flash_frames
		
		// Apply recoil
		current_recoil+=gun_recoil
		if current_recoil > gun_max_recoil{
			current_recoil = gun_max_recoil
		}
		
		// Create case
		var new_case = instance_create_layer(x,y-1,"Bullets",obj_case)
		if face = 1{
			new_case.xsp = lengthdir_x(1,aim_dir+dir_offset+90)
			new_case.ysp = lengthdir_y(1.5,aim_dir+dir_offset+90)
		}else{
			new_case.xsp = lengthdir_x(-1,aim_dir+dir_offset+90)
			new_case.ysp = lengthdir_y(-1.5,aim_dir+dir_offset+90)
		}
	}
}

script_execute(state) // Manage which state is active

applied_knockback = false
scr_collision()
