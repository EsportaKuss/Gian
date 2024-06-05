function scr_set_defaults_for_text() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variables for every letter
	for (var c = 0; c < 500; c++) 
	{
	col_1[c, page_number] = c_white;
	col_2[c, page_number] = c_white;
	col_3[c, page_number] = c_white;
	col_4[c, page_number] = c_white;
			
	float_text [c, page_number] = 0;
	float_dir [c,page_number] = c*20;
	
	shake_text[c, page_number] = 0;
	shake_dir[c, page_number] = irandom(360);
	shake_timer[c, page_number] = irandom(4);
	}
	
	txtb_spr[page_number] = spr_menu_box;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = snd_narrator;
	
	event[page_number] = noone;
}



//--------------------------------------text vfx------------------------------------------//
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4) {

	for (var c = _start; c <= _end; c++)
	{
		col_1[c, page_number-1] = _col1;
		col_2[c, page_number-1] = _col2;
		col_3[c, page_number-1] = _col3;
		col_4[c, page_number-1] = _col4;
	}

}

///@param 1st_char
///@param last_char
function scr_text_float(_start, _end) 
{
		for (var c = _start; c <= _end; c++)
	{
		float_text[c, page_number-1] = true;
	}

	
}

///@param 1st_char
///@param last_char
function scr_text_shake(_start, _end) 
{
		for (var c = _start; c <= _end; c++)
	{
		shake_text[c, page_number-1] = true;
	}

	
}

/// @param string
/// @param [character]
/// @param [side]
function scr_text(_string){

	scr_set_defaults_for_text();

	text[page_number] = _string;
	
	
	//get character info
	if argument_count > 1 {
		switch(argument[1])
		{
		case "niky":
			speaker_sprite[page_number] = spr_nyki_tired;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - smug":
			speaker_sprite[page_number] = spr_niky_smug;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - surprised":
			speaker_sprite[page_number] = spr_niky_surprised;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - angry":
			speaker_sprite[page_number] = spr_niky_angry;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - shocked":
			speaker_sprite[page_number] = spr_niky_shocked;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - ultra shocked":
			speaker_sprite[page_number] = spr_niky_u_shocked;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - uwu":
			speaker_sprite[page_number] = spr_niky_uwu;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - peso":
			speaker_sprite[page_number] = spr_niky_peso;
			snd[page_number] = snd_niky_voice;
		break;
		case "niky - sad":
			speaker_sprite[page_number] = spr_niky_sad;
			snd[page_number] = snd_niky_voice;
		break;
		case "owner":
			snd[page_number] = snd_owner;
		break;
		case "mystery frank":
			snd[page_number] = snd_mystery_frank;
		break;
		case "Frank":
			speaker_sprite[page_number] = spr_Frank_talk;
			snd[page_number] = snd_frank_voice;
		break;
		
		case "Andrea":
		speaker_sprite[page_number] = spr_retrato_andrea;
		snd[page_number] = snd_niky_voice;
		break;
		}
	}
	
	//side
	if argument_count > 2 {
	speaker_side[page_number] = argument[2];
	}
	
	page_number++;

}







/// @param option
/// @param link_id
function scr_option(_option, _link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

// @param text_id
function create_textbox(_text_id) {
		with (instance_create_depth(0,0,-99999, obj_textbox) )
		{
		script_game_text(_text_id);
		}
}