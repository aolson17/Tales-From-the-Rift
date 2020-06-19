

if shader_enabled{
	shader_set(shd_border)
	shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y)
}

//draw_surface_ext(surf,0,0,.5,.5,0,c_white,1)

draw_surface(application_surface,0,0)

shader_reset()

draw_set_font(-1)
draw_set_color(c_black)
//scr_draw_outline(10,10,"xsp: "+string(obj_player.xsp),c_white,global.dark,1)
scr_draw_outline(10,30,"gun_damage: "+string(obj_player.gun_damage),c_white,global.dark,1)
scr_draw_outline(10,50,"gun_shots: "+string(obj_player.gun_shots),c_white,global.dark,1)
scr_draw_outline(10,70,"gun_auto: "+string(obj_player.gun_auto),c_white,global.dark,1)
scr_draw_outline(10,90,"gun_fire_rate: "+string(obj_player.gun_fire_rate),c_white,global.dark,1)
scr_draw_outline(10,110,"gun_accuracy: "+string(obj_player.gun_accuracy),c_white,global.dark,1)
scr_draw_outline(10,130,"gun_recoil: "+string(obj_player.gun_recoil),c_white,global.dark,1)
scr_draw_outline(10,150,"gun_max_recoil: "+string(obj_player.gun_max_recoil),c_white,global.dark,1)
scr_draw_outline(10,170,"gun_recoil_recovery: "+string(obj_player.gun_recoil_recovery),c_white,global.dark,1)
scr_draw_outline(10,190,"gun_knockback: "+string(obj_player.gun_knockback),c_white,global.dark,1)
scr_draw_outline(10,210,"gun_scope: "+string(obj_player.gun_scope),c_white,global.dark,1)
scr_draw_outline(10,230,"gun_scope_power: "+string(obj_player.gun_scope_power),c_white,global.dark,1)
scr_draw_outline(10,250,"gun_backwards_accuracy_offset: "+string(obj_player.gun_backwards_accuracy_offset),c_white,global.dark,1)