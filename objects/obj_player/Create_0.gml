
max_hp = 100
hp = max_hp

drawn = true

run_speed = .08
sprint_speed = .1
max_run_speed = 1
max_sprint_speed = 2
crouch_walk_speed = .08
max_crouch_walk_speed = 1

move_friction = .5
slide_friction = .05
roll_friction = .25

step_size = 1 // How many pixels tall of steps the player can walk up

touch_knockback = 2

air_move_factor = .2

max_stair_speed = max_run_speed*.5

grav_speed = .25

roll_speed = 5 // How much speed gained from roll

jump_speed = 4
variable_jump_factor = .5

run_image_speed_factor = .4 // How much run speed effects the animation speed
crouch_image_speed_factor = .2 // How much crouch speed effects the animation speed
sprint_image_speed_factor = .1 // How much run speed effects the animation speed

invincibility_frames = 15
invincible = false

slide_cooldown_frames = 60
slide_cooldown = false

coyote_jump_frames = 5 // How many frames after falling off ground player can still jump
coyote_jump = false // If the player can jump despite not being on ground

queue_jump_frames = 5 // How many frames before landing can the player press the jump key and still jump after landing
queue_jump = false // If the player will jump after landing

muzzle_flash_frames = 1 // How many frames to show muzzle flash
flash = false

// Gun Stats
gun_length = 4
gun_damage = 1
gun_shots = 1
gun_auto = true
gun_fire_rate = 10
gun_accuracy = 1//20
gun_max_recoil = 20
gun_recoil = 5
gun_recoil_recovery = .3
gun_knockback = 2
gun_scope = true
gun_scope_power = 18
gun_backwards_accuracy_offset = 60
//gun_laser_sight = false


current_gun_backwards_accuracy_offset = 0

can_shoot = 0
current_recoil = 0

sheathed = true

state = stand

xsp = 0
ysp = 0

aim_dir = 0

face = 1 // 1 for right, -1 for left

prev_face = face
prev_ysp = ysp
prev_state = state

gamepad = false
down_pressed = false
up_pressed = false

arm_surf = surface_create(40,40)