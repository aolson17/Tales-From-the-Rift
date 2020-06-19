/// @description Randomize Gun

gun_damage = 1+irandom(1)
gun_shots = choose(1,1+irandom(4))
gun_auto = choose(true,false)
gun_fire_rate = irandom_range(5,40)
gun_accuracy = irandom_range(1,30)
gun_recoil = irandom_range(1,8)
gun_max_recoil = irandom_range(10,40)
gun_recoil_recovery = random_range(.1,.8)
gun_knockback = irandom_range(1,3)/gun_shots
gun_scope = choose(true,false)
gun_scope_power = irandom_range(4,18)
gun_backwards_accuracy_offset = irandom_range(40,80)
