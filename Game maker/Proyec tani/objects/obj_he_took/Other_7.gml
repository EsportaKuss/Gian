global.animation = false;
instance_create_depth(286,232,0,obj_neco);
obj_neco.face = UP;
with (instance_create_depth(x,y,-1000,obj_textbox) )
	{
				if global.Language == true {
	scr_text("HEY.", "niky - angry");
	scr_text("SE ROBO MI PESO.", "niky - angry");}
		else {
	scr_text("HEY.", "niky - angry");
	scr_text("HE TOOK MY PESO.", "niky - angry");}
	}
	with (obj_camera) {follow = obj_neco;}
instance_destroy();	
