///@param range
///@param up_range
///@param down_range
///@param player
///@param needs_line_of_sight

var range = argument0
var up_range = argument1
var down_range = argument2
var player = argument3
var needs_line_of_sight = argument4

if distance_to_object(player) > range{
	return false
}

if player.y - y > down_range{
	return false
}

if y - player.y > up_range{
	return false
}

if x > player.x{
	var target_x = player.bbox_right+1
}else{
	var target_x = player.bbox_left-1
}

if needs_line_of_sight{
	if collision_line(x,y,target_x,player.y,par_solid,true,true){
		return false
	}
}

return true