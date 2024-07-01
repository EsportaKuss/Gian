//draw_sprite(spr_shadow,0,x,y);
//if obj_progress.cut2_done == true
//{
draw_sprite_ext( spr_shadow, 0, x, y, 1, 1, image_angle, image_blend, 1);
//}
//else 
//{
//draw_sprite_ext( spr_shadow, 0, x, y, 1, 1, image_angle, image_blend, 0);
//}
if invulnerable != 0 && (invulnerable mod 10 < 2) == 0 
{
//skip draw	
	
}
else
{
draw_sprite_ext(
sprite_index,
image_index,
x,
y - z,
image_xscale,
image_yscale,
image_angle,
image_blend,
image_alpha
)
}


