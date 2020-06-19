
if state = executioner_attack{
	var mask = mask_index
	if !(image_index >= 2 && image_index <= 3){
		exit
	}
	damage = 4
	knockback = 10
	stagger = true
	shake = 3
	mask_index = spr_executioner_attack
	var list = ds_list_create()
	instance_place_list(x,y,par_player,list,false)
	
	if ds_list_size(list)>0{
		
		var success = false
		for (var i = 0; i < ds_list_size(list);i++){
			var col = ds_list_find_value(list,i)
			if !col.invincible{
				if col.state = hurt{
					col.face = face
					col.state = hurt
					col.image_index = 0
					col.xsp += sign(-face)*1
					if instance_number(obj_dust_wave)=0{
						var dust = instance_create_layer(col.x+face*-20,col.y+15,"Effects",obj_dust_wave)
						dust.image_xscale = -col.face
					}
				}else{
					col.invincible = true
					col.alarm[0] = col.invincibility_frames
					col.xsp += sign(-face)*knockback
					var success = true
					if stagger{
						if col.state != knocked{
							col.face = face
							//col.state = knocked
							col.image_index = 0
						}
					}
				}
			}
		}
		if success{
			obj_camera.shake += shake
		}
	}
	
	mask_index = mask
	ds_list_destroy(list)
}