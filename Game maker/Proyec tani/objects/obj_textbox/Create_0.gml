textbox_width = 280;
textbox_height = 58;
border = 6;
line_sep = 16;
line_width = textbox_width - border*2;
txtb_spr[0] = spr_menu_box;
txtb_img = 0;
txtb_img_speed = 5/60;

page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_spd = 0.7;
//options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

alpha = 0;

//sound
snd_delay = 4;
snd_count = snd_delay;


//effects
scr_set_defaults_for_text();
last_free_space = 0;

//pauses
text_pause_timer = 0;
text_pause_time = 12;

//events
wait_time = 5;
room_change = false;
blank = false;

//imagen
x_displacement_spr = 0;
y_displacement_spr = 0;
xscale_displacement_spr = 1;
yscale_displacement_spr = 1;