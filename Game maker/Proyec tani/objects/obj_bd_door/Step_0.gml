if global.GamePaused {exit}
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

if pause_time <= 0 && image_index == 0{
audio_play_sound(snd_door, 1, false);
pause_time = 1000;
} else {pause_time--;}