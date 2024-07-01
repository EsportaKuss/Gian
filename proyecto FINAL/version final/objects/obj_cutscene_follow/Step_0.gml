if global.CurrentCutscene = noone
{
	instance_destroy();	
}


if c_camera_moving == true
{
	_distance = point_distance(x, y, xTo, yTo);
	move_towards_point(xTo, yTo, spd);	
	if _distance <= spd {spd = 0;}
}