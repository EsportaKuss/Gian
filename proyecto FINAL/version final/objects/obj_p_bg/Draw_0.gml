var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);

var _p = .5;

draw_sprite_tiled(spr_bg, 0, _camx*1,_camy*_p);
draw_sprite_tiled(spr_bg, 1, _camx*_p,_camy*_p);
draw_sprite_tiled(spr_bg, 2, _camx*.25,_camy*.25);