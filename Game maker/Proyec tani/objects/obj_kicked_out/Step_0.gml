if image_index >= 20 {
image_speed = 0;
anim_timer--;
}
if anim_timer = 140 {instance_create_depth(271,108,0,obj_eviction_note);}

if (anim_timer = 100) with (obj_st_door) {audio_play_sound(snd_st_door_shut, 8, false); image_speed = 1;};

if anim_timer = 0
{
global.animation = false;
instance_create_depth(286,232,0,obj_neco);

with (instance_create_depth(x,y,-1000,obj_textbox) )
	{
				if global.Language == true {
	scr_text("mierda.", "niky");}
		else {
	scr_text("goddamit.", "niky");}
	}
	with (obj_camera) {follow = obj_neco;}
instance_destroy();	
}