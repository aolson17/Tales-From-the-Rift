
event_inherited()

if hp_alpha != .3 && hp > 0 && damaged{
	hp_alpha += .01
}else if (hp <= 0 || !damaged) && hp_alpha != 0{
	hp_alpha -= .01
}

if hp <= 0{
	state = executioner_die
}

target = noone
if instance_number(obj_player)>0{
	if scr_target(sight_range,sight_up,sight_down,obj_player,true){
		target = obj_player
	}
}

if state != executioner_attack && state != executioner_stagger && state != executioner_die && target != noone{
	if target.x < x{
		move = -1
	}else if target.x > x{
		move = 1
	}else{
		move = 0
	}
	if distance_to_object(target) < attack_distance{
		if state = executioner_stand{
			if target.x < x{
				face = 1
			}else if target.x > x{
				face = -1
			}
		}
		if target.state != knocked{
			state = executioner_attack
			image_index = 0
		}else{
			move = 0
		}
	}
}else{
	move = 0
}

if place_meeting(x,y+1,par_solid){
	if state = executioner_attack{
		move = 0
		move_speed = 0
		max_move_speed = 0
	}else{
		move_speed = run_speed
		max_move_speed = max_run_speed
	}
}else{
	move_speed = air_move_factor*run_speed
	max_move_speed = max_run_speed
}

if move = sign(xsp){ // If trying to move in the same direction as momentum
	if abs(xsp) <= max_move_speed{ // If not already over limit
		xsp += move * move_speed
	}
}else{
	xsp += move * move_speed
}



if !place_meeting(x,y+1,par_solid) && state != executioner_die{ // Apply gravity
	ysp += grav_speed
}else{ // If on ground
	if move != sign(xsp) || abs(xsp) > max_move_speed{ // Apply friction
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
		if move = 1 && xsp > 0{
			xsp = max_move_speed
		}else if move = -1 && xsp < 0{
			xsp = -max_move_speed
		}
	}
}

script_execute(state) // Manage which state is active

if move != 0 && place_meeting(x,y+1,par_solid){
	face = -move
}

scr_collision()
scr_executioner_attacks()




