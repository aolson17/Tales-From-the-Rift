



if distance_to_object(obj_bullet) < 30{
	var temp_mask = mask_index
	mask_index = crit_mask
	ds_list_clear(list)
	instance_place_list(x,y,obj_bullet,list,false)
	if ds_list_size(list) > 0{
		for(var i = 0;i < ds_list_size(list);i++){
			var bullet = ds_list_find_value(list,i)
			if bullet.sprite_index = spr_bullet{
				ds_list_add(obj_text.text,string(obj_player.gun_damage*1.5))
				ds_list_add(obj_text.text_x,bullet.x)
				ds_list_add(obj_text.text_y,bullet.y)
				ds_list_add(obj_text.text_life,0)
				ds_list_add(obj_text.text_color,c_red)
				ds_list_add(obj_text.text_dir,sign(bullet.xsp)*random(1))
				bullet.sprite_index = spr_blood
				bullet.xsp = 0
				bullet.ysp = 0
			}
		}
	}
	mask_index = temp_mask
	
	var temp_mask = mask_index
	mask_index = mask
	ds_list_clear(list)
	instance_place_list(x,y,obj_bullet,list,false)
	if ds_list_size(list) > 0{
		for(var i = 0;i < ds_list_size(list);i++){
			var bullet = ds_list_find_value(list,i)
			if bullet.sprite_index = spr_bullet{
				ds_list_add(obj_text.text,obj_player.gun_damage)
				ds_list_add(obj_text.text_x,bullet.x)
				ds_list_add(obj_text.text_y,bullet.y)
				ds_list_add(obj_text.text_life,0)
				ds_list_add(obj_text.text_color,c_white)
				ds_list_add(obj_text.text_dir,sign(bullet.xsp)*random(1))
				bullet.sprite_index = spr_blood
				bullet.xsp = 0
				bullet.ysp = 0
			}
		}
	}
	mask_index = temp_mask
}



