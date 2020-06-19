

state = executioner_stand

dead_state = executioner_die
stagger_state = executioner_stagger

crit_mask = spr_executioner_mask_crit
hit_mask = spr_executioner_mask_hit

event_inherited()

xsp = 0
ysp = 0

max_hp = 10
hp = max_hp

hp_width = 25

attack_distance = 35

run_speed = .05
max_run_speed = 2

air_move_factor = .2

max_stair_speed = max_run_speed*.5

step_size = 4

grav_speed = .3

move_friction = .1

run_image_speed_factor = .4

invincibility_frames = 15

sight_range = 500
sight_up = 110
sight_down = 20

invincible = false

damaged_time = 200 // How many frames to have an opaque bar
damaged = false // Make hp bar opaque when damaged

face = -1

target = noone

hp_alpha = 0

prev_state = state
prev_face = face