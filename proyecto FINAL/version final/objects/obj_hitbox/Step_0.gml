if instance_exists(obj_neco)
{
	if place_meeting(x, y + 2, obj_neco) && obj_neco.face == UP
	{
		if keyboard_check_pressed(ord("C")) && !instance_exists(obj_textbox)
		{
		create_textbox(text_id);
		}
	}
}