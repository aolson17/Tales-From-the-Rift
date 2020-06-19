





draw_set_color(c_dkgray)
draw_set_alpha(hp_alpha)
draw_rectangle(x-hp_width/2-1,y + sprite_get_height(mask_index)/3 + 5,x+hp_width/2+1,y + sprite_get_height(mask_index)/3+8,false)

if hp > 0{
	draw_set_color(c_red)
	draw_rectangle(x-hp_width/2,y + sprite_get_height(mask_index)/3 + 6,x-hp_width/2 + hp_width*(hp/max_hp),y + sprite_get_height(mask_index)/3+7,false)
}

draw_set_alpha(1)
