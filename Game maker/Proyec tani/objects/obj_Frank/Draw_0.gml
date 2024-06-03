draw_self();
view_x = camera_get_view_x(camera_get_active());
view_y = camera_get_view_y(camera_get_active());
draw_healthbar(100 + view_x, 200 + view_y, 200 + view_x, 220 + view_y, enemyHP, c_black, c_red, c_green, 0, true, false)