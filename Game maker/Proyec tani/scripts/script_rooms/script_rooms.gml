// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function script_rooms(_room,_follow,_x,_y){

		
	if wait_time <= 0 
	{
		wait_time = 5;
		with (obj_camera) {follow = _follow;}
		room_goto(_room)
		obj_neco.x = _x;
		obj_neco.y = _y;
		
		room_change = false;
	}
	}

