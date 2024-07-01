if global.GamePaused {global.using_inventory = false; x = 335; percent = 0; exit;}
draw_set_font(Font_Main);

//view position
view_x = camera_get_view_x(camera_get_active());
view_y = camera_get_view_y(camera_get_active());

//player interaction
if keyboard_check_pressed(ord("I")) && !instance_exists(obj_textbox) {global.using_inventory = true;}
if keyboard_check_pressed(ord("X")) or instance_exists(obj_textbox) {global.using_inventory = false; x = 335; percent = 0;} 

if global.using_inventory == true {
//draw back box
draw_sprite_stretched(
spr_menu_box,
0, 
x + view_x-35, 
y + view_y-100, 
12+row_length*36, 
12+(((INVENTORY_SLOTS-1) div row_length)+1)*36
); 

if (global.fight == false) draw_sprite(spr_player_hearts, global.NikyHealth, 8 + view_x, 8 + view_y);

//draw grid boxes
for (var i = 0; i < INVENTORY_SLOTS; i += 1){
	var xx = x + view_x + (i mod row_length) *36 -27;
	var yy = y + view_y + (i div row_length) *36 -91;
	draw_sprite(spr_inv_box,0,xx,yy)
	if (inventory[i] != -1) 
		{
		draw_sprite(spr_items,inventory[i],xx,yy);
		}
	}
	if global.Language == true {draw_text_color(15 + view_x, 223 + view_y, "[X] Atrás", c_white, c_white, c_white, c_white, 0.5);}
	else {draw_text_color(15 + view_x, 223 + view_y, "[X] Back", c_white, c_white, c_white, c_white, 0.5);}
	
	//-------------ANIMATION--------------//
	if (percent >1) percent = 1;
	percent += 1/60;
	position = animcurve_channel_evaluate(curvy, percent)
	var _start = 335;
	var _end = 271;
	var _distance = _end - _start;
	
	x = _start + (_distance * position);
}
else {
	if !instance_exists(obj_textbox) && !instance_exists(obj_jump) && room == rm_bedroom {
		if global.Language == true{draw_text_color(15, 223, "[C] Inspeccionar", c_white, c_white, c_white, c_white, 0.5);
	draw_text_color(180, 223, "[I] Inventario", c_white, c_white, c_white, c_white, 0.5);}
		else{
	draw_text_color(15, 223, "[C] Inspect", c_white, c_white, c_white, c_white, 0.5);
	draw_text_color(180, 223, "[I] Inventory", c_white, c_white, c_white, c_white, 0.5);}
	}
}