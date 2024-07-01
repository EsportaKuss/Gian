//Crea el save array
var _savedata = array_create(0);

//Idk man, creo que x cada instance crea un struct y lo añade al array
with (obj_progress)
{
	var _progress_struct = 
	{
		intro_done : false,
		x : current_x,
		y: current_y,
		rm : room,
	}
	array_push(_savedata,_progress_struct);
}

//Graba la info en un JSON string y la graba via buffer
var _string = json_stringify(_savedata); 
var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
buffer_write(_buffer,buffer_string,_string);
buffer_save(_buffer,"savedgame.save");
buffer_delete(_buffer);

show_debug_message("Game saved! " + _string);