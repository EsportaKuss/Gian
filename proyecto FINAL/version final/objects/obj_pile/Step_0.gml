
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
detected = collision_circle(x, y, 100, obj_neco, false, true);
	current_text = obj_progress.crow_progress;
	text_id = text_array[current_text];
if current_text>0 && current_text <9 && detected !=noone
	{
	if !instance_exists(obj_textbox)
	{
	create_textbox(text_id); //Se crea dialogo
	}
	}

if obj_progress.crowbar = true && obj_progress.crowbar_sala = false
{
text_id = "cuervo_12";	
}


if obj_progress.crowbar_sala = true
{
	coll = false;
image_index = 1;
text_id = noone;	
}