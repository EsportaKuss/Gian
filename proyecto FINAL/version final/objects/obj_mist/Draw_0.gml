if instance_exists(obj_neco) depth = -99998; else depth = 1;
if instance_exists(obj_neco){
image_alpha = 1/(obj_neco.y/1000);
}
draw_sprite_ext(spr_mist,0,x,y,image_xscale, image_yscale, 0, c_white, image_alpha);

if dissipate == true && image_alpha > 0 {image_alpha -= 0.05}
if (image_alpha <= 0) instance_destroy();