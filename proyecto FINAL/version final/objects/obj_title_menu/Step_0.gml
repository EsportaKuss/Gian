// options
if global.Language == false {
menu_option[0, 0] = "Start Game";
menu_option[0, 1] = "Settings";
menu_option[0, 2] = "Quit";

menu_option[1, 0] = "Language";
menu_option[1, 1] = "Fullscreen";
menu_option[1, 2] = "Back";
}
else {
menu_option[0, 0] = "Comenzar";
menu_option[0, 1] = "Configuración";
menu_option[0, 2] = "Salir";

menu_option[1, 0] = "Idioma";
menu_option[1, 1] = "Pantalla Completa";
menu_option[1, 2] = "Atrás ";
menu_option[1, 3] = "Cargar";
}

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(ord("C"))

op_length = array_length(menu_option[menu_level]);

pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length - 1}

if accept_key {
switch (menu_level){
	case 0:
	switch(pos)	{
		case 0: room_goto_next(); break;

		case 1: pos = 0; menu_level = 1; break;

		case 2: game_end(); break;
		}
	break;
	
	case 1: 
	switch(pos){
		
		case 0 :
		global.Language = !global.Language 
		break;
		
		case 1:
		
		check = !check;
		window_set_fullscreen(check)
		break;
		
		case 2:
		pos = 0; menu_level = 0;
		break;
		
		case 3:
		with (obj_progress) instance_destroy();
		if (file_exists("savedgame.save"))
		{
			var _buffer = buffer_load("savedgame.save");
			var _string = buffer_read(_buffer,buffer_string);
			buffer_delete(_buffer);
			var _loaddata = json_parse(_string);
			
			while (array_length(_loaddata)>0)
			{
				var _loadentity = array_pop(_loaddata);
				with (instance_create_layer(0,0,layer,asset_get_index(_loadentity.obj)))
				{
					x = _loadentity.x;
					y = _loadentity.y;
					introdone = _loadentity.introdone;
					rm = _loadentity.rm;
				}
			}
		show_debug_message("game loaded!" + _string);	
		}
		break;
		
		}
	break;
	
	}
op_length = array_length(menu_option[menu_level]);
}