
if place_meeting((x+xsp),(y),par_solid){
	var col = instance_place((x+xsp),(y),par_solid)
	if object_is_ancestor(object_index, par_player){
		if !applied_knockback{
			if object_is_ancestor(col.object_index, par_character){
				applied_knockback = true
				xsp = sign(x-col.x)*touch_knockback
				//show_message("rev x")
				scr_collision()
				exit
			}
		}else{
			//x += sign(x-col.x)
		}
	}
	if col.xsp != 0 || col.ysp != 0{
		col.xsp = 0
		col.ysp = 0
		//xsp = 0
		//ysp = 0
	}
	var limit = abs(xsp)
	while(!place_meeting((x+sign(xsp)*.01),(y),par_solid) && limit > 0){
		x += sign(xsp)*.01
		limit -= abs(sign(xsp)*.01)
	}
	if object_is_ancestor(object_index, par_player){
		if abs(xsp) > 0 && move = sign(xsp) && (state = run || state = sprint){
			if !place_meeting((x+sign(xsp)*.01),(y-step_size),par_solid){
				y -= step_size
				ysp = 0
				while(!place_meeting((x+sign(xsp)*.01),(y),par_solid) && limit > 0){
					x += sign(xsp)*.01
					limit -= abs(sign(xsp)*.01)
				}
			
				xsp = clamp(xsp,-max_stair_speed,max_stair_speed)
			}else{
				xsp = 0
			}
		}else{
			xsp = 0
		}
	}else{
		xsp = 0
	}
}else{
	x += xsp
}
if place_meeting((x),(y+ysp),par_solid){
	var col = instance_place((x),(y+ysp),par_solid)
	if object_is_ancestor(object_index, par_player){
		if !applied_knockback{
			if object_is_ancestor(col.object_index, par_character){
				applied_knockback = true
				ysp = sign(y-col.y)*touch_knockback
				//show_message("rev y")
				scr_collision()
				exit
			}
		}
	}
	if col.xsp != 0 || col.ysp != 0{
		col.xsp = 0
		col.ysp = 0
		//xsp = 0
		//ysp = 0
	}
	var limit = abs(ysp)
	while(!place_meeting((x),(y+sign(ysp)),par_solid) && limit > 0){
		//show_debug_message("while y")
		y += sign(ysp)
		limit -= abs(sign(ysp))
	}
	if ysp > 0{ // If landing on ground
		y = round(y)
	}
	if place_meeting(x,y,par_solid){
		y--
	}
	ysp = 0
}else{
	y += ysp
}





