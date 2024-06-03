if global.GamePaused {exit}
if y < 148 
{
	y += 0.3;
}

if y >= 148
{
	image_speed = 0;
}

if instance_exists(obj_neco)
{
	if place_meeting(x-2, y, obj_neco) && obj_neco.face == RIGHT 
	or place_meeting(x, y + 2, obj_neco) && obj_neco.face == UP
	or place_meeting(x, y - 2, obj_neco) && obj_neco.face == DOWN
	or place_meeting(x + 2, y, obj_neco) && obj_neco.face == LEFT
	{
		if keyboard_check_pressed(ord("Z")) && !instance_exists(obj_textbox)
		{
		create_textbox(text_id);
		}
	}
}
