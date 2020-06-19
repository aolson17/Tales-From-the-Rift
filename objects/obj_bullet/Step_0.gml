



x += xsp
y += ysp

var collided = false
if place_meeting(x+xsp,y,par_solid){
	while(!place_meeting(x+sign(xsp),y,par_solid) && abs(xsp) > 1){
		x += sign(xsp)
		xsp--
	}
	xsp = 0
	collided = true
}

if place_meeting(x,y+ysp,par_solid){
	while(!place_meeting(x,y+sign(ysp),par_solid) && abs(ysp) > 1){
		y += sign(ysp)
		ysp--
	}
	ysp = 0
	collided = true
}

if collided{
	xsp = 0
	ysp = 0
	sprite_index = spr_spark
}