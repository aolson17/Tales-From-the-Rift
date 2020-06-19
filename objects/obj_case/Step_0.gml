
if !place_meeting(x,y+1,par_solid){ // Apply gravity
	if !place_meeting(x,y+1,obj_player){
		ysp += grav_speed
	}
	falling = true
}else{ // Apply Friction
	if falling { // If previously falling
		//var sound = audio_play_sound(snd_box_fall,0,0)
		//audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
	}
	falling = false
	xsp *= .9
}
y = round(y)
scr_collision()
