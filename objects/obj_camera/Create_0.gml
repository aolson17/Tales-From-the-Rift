width = camera_get_view_width(view_get_camera(0))
height = camera_get_view_height(view_get_camera(0))

spd_factor = .08

target = obj_player

face_offset = 20

target_speed_factor = 16 // How far forward to put camera based on speed

zoom_width = width
zoom_height = height

x = target.x
y = target.y
target_x = x
target_y = y
possible_new_target_y = target_y
non_scope_target_y = target_y

prev_on_ground = false

follow_camera = false // If the camera should focus on the player or platform

shake = 0
camera = camera_create_view(x,y,width,height)

view_set_camera(0,camera)