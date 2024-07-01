draw_sprite(spr_shadow,0,x,y);

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


