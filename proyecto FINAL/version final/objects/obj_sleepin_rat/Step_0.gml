if instance_exists(obj_neco)
{
	if place_meeting(x-2, y, obj_neco) && obj_neco.face == RIGHT 
	or place_meeting(x, y + 2, obj_neco) && obj_neco.face == UP
	or place_meeting(x, y - 2, obj_neco) && obj_neco.face == DOWN
	or place_meeting(x + 2, y, obj_neco) && obj_neco.face == LEFT
	{
		if keyboard_check_pressed(ord("C")) && !instance_exists(obj_textbox) && global.iLifted == noone
		{
		lifted = true;
		global.iLifted = id;
		}
	}
}