
width = camera_get_view_width(view_get_camera(0))
height = camera_get_view_height(view_get_camera(0))

global.font = font_add_sprite_ext(spr_font_2,"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.?!-() ",true,1)

global.dark = make_color_rgb(40,40,40)

draw_set_font(global.font)

shader_enabled = true

uni_resolution = shader_get_uniform(shd_emboss,"resolution");
var_resolution_x = view_wport[0];
var_resolution_y = view_hport[0];

shown_innacuracy = 0 // Used to make smooth accuracy indicator
indicator_spd_factor = .2

max_cases = 30

#region Scope Effect

scope_surface = surface_create(width,height)

scope_alpha = 0
target_scope_alpha = 0
scope_alpha_spd_factor = .2

mouse_dis = 0
scope_draw_dis = 0
scope_min_size = 0
scope_size = 0
pos_x = 0
pos_y = 0

#endregion
//surf = surface_create(var_resolution_x, var_resolution_y);

//view_set_surface_id(0, surf);


