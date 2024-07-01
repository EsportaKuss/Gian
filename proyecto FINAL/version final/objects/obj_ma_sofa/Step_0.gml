

//INTERACT???

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
	
	current_text = obj_progress.mama_progress;
	text_id = text_array[current_text];
	
	
	
	if current_text>2 && current_text <6
	{
	if !instance_exists(obj_textbox)
	{
	create_textbox(text_id); //Se crea dialogo
	}
	}
	
	if obj_progress.mama_progress == 2 && !instance_exists(obj_textbox)
	{
	create_textbox(text_id);	
	}