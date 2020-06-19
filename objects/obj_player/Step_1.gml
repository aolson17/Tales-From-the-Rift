/// @description Controls

if !gamepad{
	left_key = keyboard_check(vk_left) || keyboard_check(ord("A"))
	right_key = keyboard_check(vk_right) || keyboard_check(ord("D"))
	down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
	up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
	jump_key = keyboard_check_pressed(vk_space)
	jump_key_released = keyboard_check_released(vk_space)
	attack_key_pressed = keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left)
	attack_key = mouse_check_button(mb_left)
	scope_key = mouse_check_button(mb_right)
	sprint_key = keyboard_check(vk_shift)
	sheathe_key = keyboard_check_pressed(ord("E"))
	
	aim_dir = point_direction(x,y,mouse_x,mouse_y)
}else{
	device_number = 0
	
	if abs(gamepad_axis_value(device_number,gp_axisrh))+abs(gamepad_axis_value(device_number,gp_axisrv)) > .4{
		aim_dir = point_direction(0,0,gamepad_axis_value(device_number,gp_axisrh),gamepad_axis_value(device_number,gp_axisrv))
	}

	left_key = gamepad_axis_value(device_number,gp_axislh)<-.4
	right_key = gamepad_axis_value(device_number,gp_axislh)>.4
	
	if gamepad_button_check_pressed(device_number,gp_stickl){
		sprint_key = !sprint_key
	}

	jump_key = gamepad_button_check_pressed(device_number,gp_face1)
	jump_key_released = gamepad_button_check_released(device_number,gp_face1)
	
	attack_key_pressed = false
	if gamepad_button_value(device_number, gp_shoulderrb) > .2{
		if attack_key = false{
			attack_key_pressed = true
		}
		attack_key = true
	}else{
		attack_key = false
	}
	
	if gamepad_button_check_pressed(device_number,gp_stickr){
		scope_key = !scope_key
	}

	sheathe_key = gamepad_button_check_released(device_number,gp_face4)
	
	down_key = gamepad_button_check_pressed(device_number,gp_shoulderr)
	
	if !down_key{
		down_key = gamepad_axis_value(device_number,gp_axislv)>.6
		up_key = gamepad_axis_value(device_number,gp_axislv)<-.6

		if !down_pressed{ // Make down and up keys only true when pressed
			if down_key{
				down_pressed = true
			}
		}else{
			if !down_key{
				down_pressed = false
			}else{
				down_key = false
			}
		}
		if !up_pressed{
			if up_key{
				up_pressed = true
			}
		}else{
			if !up_key{
				up_pressed = false
			}else{
				up_key = false
			}
		}
	}
}