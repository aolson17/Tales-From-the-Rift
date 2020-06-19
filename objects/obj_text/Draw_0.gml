

draw_set_font(global.font)
for (var i = 0;i < ds_list_size(text);i++){
	var str = ds_list_find_value(text,i)
	var pos_x = ds_list_find_value(text_x,i)
	var pos_y = ds_list_find_value(text_y,i)
	var life = ds_list_find_value(text_life,i)
	var dir = ds_list_find_value(text_dir,i)
	var color = ds_list_find_value(text_color,i)
	
	var life_offset = (7.105427*2.718281828-15 + 0.4642857*life + 0.005059524*power(life,2) - 0.00007440476*power(life,3))
	
	if life > 90{
		var alpha = (140-life)/50
	}else{
		var alpha = 1
	}
	
	
	scr_draw_outline(pos_x,pos_y-life_offset,str,color,global.dark,alpha)
	
	if life < max_life{
		ds_list_replace(text_life,i,life+2)
		
		ds_list_replace(text_x,i,pos_x+dir)
		
		
	}else{
		ds_list_delete(text,i)
		ds_list_delete(text_x,i)
		ds_list_delete(text_y,i)
		ds_list_delete(text_life,i)
		ds_list_delete(text_dir,i)
		ds_list_delete(text_color,i)
	}
}



