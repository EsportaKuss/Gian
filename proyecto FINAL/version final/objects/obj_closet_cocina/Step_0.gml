
	if instance_exists(obj_neco)
	{
	
		if place_meeting(x-2, y, obj_neco) && obj_neco.face == RIGHT 
		or place_meeting(x+2, y, obj_neco) && obj_neco.face == LEFT
		or place_meeting(x, y + 2, obj_neco) && obj_neco.face == UP
		or place_meeting(x, y - 2, obj_neco) && obj_neco.face == DOWN

	{

		if keyboard_check_pressed(ord("C")) && !instance_exists(obj_textbox) && text_id != noone
		{
		create_textbox(text_id);
		}
	}
}

if obj_progress.key_cook = false
{
	text_id ="closet_cocina";
}

if obj_progress.key_cook = true
{
	text_id = "closet_cocina_key";
}

if obj_progress.cookie = true
{
text_id = "closet_cocina_empty";	
}