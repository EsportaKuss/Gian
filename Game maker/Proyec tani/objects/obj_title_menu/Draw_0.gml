/// @description draw menu
draw_set_font(Font_Main);
draw_sprite_ext(sprite_index, image_index, x, y, (width/sprite_width) + 4, height/sprite_height, 0, c_white, 1);

draw_set_valign(fa_top);
draw_set_halign(fa_center);

for (var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if pos == i{_c = c_yellow};
	if global.Language == false {
	draw_text_color(x+op_border + 110, y+op_border + 4 + op_space*i, menu_option[menu_level, i], _c, _c, _c,_c, 1);}
	else {draw_text_color(x+op_border + 110, y+op_border + 4 + op_space*i, menu_option[menu_level, i], _c, _c, _c,_c, 1);}
}