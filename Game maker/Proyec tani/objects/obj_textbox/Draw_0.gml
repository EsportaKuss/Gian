depth = -99999

accept_key = keyboard_check_pressed(ord("Z"));

textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 174;

//-------------------------------------setup--------------------------
if setup == false
	{
	
	setup = true;
	draw_set_font(Font_Main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for(var p = 0; p < page_number; p++)
		{
		text_length[p] = string_length(text[p]);
		txt_x_offset[p] =19;
		
		//on left
		speaker_x_offset[p] = 0;
		//on right
		if speaker_side[p] == -1{
		speaker_x_offset[p] = 182;
		}
		
		
		//setting individual characters and finding where lines should break
		for (var c = 0; c < text_length[p]; c++)
			{
				
			var _char_pos = c+1;
			
			//store individual characters in the char array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			//get current width of line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
			
			//get the last free space
			if char[c, p] = " " {last_free_space = _char_pos+1};
			
			//get the line breaks 
			if _current_txt_w - line_break_offset[p] > line_width
				{
				line_break_pos[ line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy( text[p], 1, last_free_space - 1);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
				}
				
			}
			
		//getting each chars coords
		for (var c = 0; c < text_length[p]; c++) 
			{
				
			var _char_pos = c+1;
			var _txt_x = textbox_x + txt_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			//get current width of line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c, p]);			
			var _txt_line = 0;
			
			//compensate for manual stringbreaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
				{
				//if a current looping character is after a line break 
				if _char_pos >= line_break_pos[lb, p]
					{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p]);
					_current_txt_w = string_width(_str_copy);
					
					_txt_line = lb + 1;
					}
				}
				
			//add to the x and y coords based on new info
			char_x[c, p] = _txt_x + _current_txt_w;
			char_y[c, p] = _txt_y + _txt_line*line_sep;
			}
			
		}
	
	}


//-------------------------------------typin--------------------------

if text_pause_timer <= 0 
{
if draw_char < text_length[page]
	{
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
	var _check_char = string_char_at(text[page], draw_char);
	if _check_char == "."
		{
		text_pause_timer = text_pause_time;
		}
	if _check_char == ","
		{
		text_pause_timer = text_pause_time - 6;
		} 
	if _check_char == "?" or _check_char == "!"
		{
		text_pause_timer = text_pause_time - 11;
		} 
		else  
			{
			if snd_count < snd_delay {snd_count++} else 
				{if audio_is_playing(snd_frank_voice) {audio_stop_sound(snd_frank_voice)}
				snd_count = 0;
				audio_play_sound(snd[page],8, false)}
			}
	}
} 

else {
	text_pause_timer--;
}
//---------------------cambiar de page-------------------------	
if accept_key 
	{
	
	//si ya termino de escribir
	if draw_char == text_length[page]
	{
		if page < page_number-1
			{
			page++;
			draw_char = 0;
			}
		else
			{
			//link to text for options
			if option_number > 0 {
				create_textbox(option_link_id[option_pos]);
				}
			
			if global.room_to != noone && wait_time < 0 
			{
				script_rooms(global.room_to,obj_neco,go_to_x,go_to_y)
			}
			
			if layer_sequence_is_paused(global.CurrentCutscene) {layer_sequence_play(global.CurrentCutscene);}
			alpha = 0;
			instance_destroy(); //borra textbox :3
			}
		}
		
	//if not done typing
	else 
		{
			if draw_char > 1
			{draw_char = text_length[page];}
		}
	}

if room_change == true {wait_time--;}

//---------------------draw textbox------------------------	
var _txtb_x = textbox_x + txt_x_offset[page];
var _txtb_y =  textbox_y;
txtb_img += txtb_img_speed;
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);
//draw speaker
if speaker_sprite[page] != noone 
	{
	var _view_y = camera_get_view_y(camera_get_active());
	var _check_char = string_char_at(text[page], draw_char);
	sprite_index = speaker_sprite[page];
	if draw_char == text_length[page] or _check_char == "." or _check_char == "?" or _check_char == "!" or _check_char = "," {image_index = 0}
	var _speaker_x = textbox_x + speaker_x_offset[page];
	if speaker_side[page] == -1 {_speaker_x += sprite_width};
	//draw speaker
	draw_sprite_ext(sprite_index, image_index, _speaker_x, 0 + _view_y, speaker_side[page], 1, 0, c_white, alpha);
	if alpha < 1 {alpha += 0.2};
	}

//back of textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);



//--------------------opciones-----------------------------
if draw_char = text_length[page] && page == page_number - 1
	{
	
	//select
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number-1);
	
	var _op_space = 25;
	var _op_bord = 8;
	for (var op = 0; op < option_number; op++)
		{
		//var _o_w = string_width(option[op]) + _op_bord*2;
		// xscale si alguna vez me arrepiento de hacerlo largo: _o_w/txtb_spr_w
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 150, _txtb_y - _op_space *option_number + _op_space*op, 100, (_op_space - 1)/txtb_spr_h, 0, c_white, 1);
	
		
		//arrow
		if option_pos == op
			{
			draw_sprite(spr_arrow, 0, _txtb_x + 130, _txtb_y - _op_space *option_number + _op_space*op)
			}
		
		//option text
		draw_text(_txtb_x + 150 + _op_bord, _txtb_y - _op_space *option_number + _op_space*op + 4, option[op])
		}
	}


//------------------------------EL TEXTOO----------------------
for(var c = 0; c < draw_char ; c++)
	{
	//---------efects---------//
	//waving
	var _float_y = 0;
	if float_text[c, page] == true
		{
		float_dir[c, page] += -6;
		_float_y = dsin( float_dir[c, page])*1;
		}
	//shake
	var _shake_x = 0;
	var _shake_y = 0;
	if shake_text[c, page] == true 
	{
		shake_timer[c, page] -= 1;
		if shake_timer[c, page] <= 0
		{
			shake_timer[c, page] = irandom_range(4, 8);
			shake_dir[c, page] = irandom(360);
		}
		if shake_timer[c, page] <= 2
		{
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}
	//the text
	draw_text_color(char_x[c, page]+ _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], col_1[c, page], col_2[c, page], col_3[c, page], col_4[c, page], 1)
	}