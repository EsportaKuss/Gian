/// @description Pause
if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_textbox))
	{
		global.GamePaused = !global.GamePaused;
		
		if (global.GamePaused)
		{
			with (all)
			{
				gamePausedImageSpeed = image_speed;
				image_speed = 0;
			}
		}
		else
		{
			with (all)
			{
				image_speed = gamePausedImageSpeed;
			}
		}
		
	}

