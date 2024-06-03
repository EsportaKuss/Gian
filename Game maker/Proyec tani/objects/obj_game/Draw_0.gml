draw_set_font(Font_Main);
view_x = camera_get_view_x(camera_get_active());
view_y = camera_get_view_y(camera_get_active());
if (global.fight == true) draw_sprite(spr_player_hearts, global.NikyHealth, 8 + view_x, 8 + view_y);
if (global.GamePaused) { draw_text(view_x + 92, view_y + 106, "- Game Paused -")}