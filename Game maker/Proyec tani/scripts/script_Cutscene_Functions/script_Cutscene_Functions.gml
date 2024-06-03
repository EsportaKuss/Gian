//PAUSE
function stop_cutscene(){
if instance_exists(obj_textbox) or global.GamePaused == true
				{
				layer_sequence_pause(global.CurrentCutscene);
				}
}

///@param acutscene
function Cutscene(_cutscene) {
	if global.CutscenePlaying == true {
	switch(_cutscene) {
		
	case "Frank Fight": global.CutscenePlaying = false
				 layer_create(1, "Sequence");
				 global.CurrentCutscene = layer_sequence_create("Sequence", 320, 256, sq_Frank_Encounter);
				 instance_create_depth(322,254,1,obj_cutscene_follow);
				 with (obj_camera) follow = obj_cutscene_follow;
			break;
			
	case "test 2": global.CutscenePlaying = false
				 layer_create(1, "Sequence");
				 global.CurrentCutscene = layer_sequence_create("Sequence", 50, 50, test);
			break;
		}
	}
}

//CUTSCENE TEXT

function Frank_Encounter(){
	with (instance_create_depth(1,1,-1000,obj_textbox) ) 
	{
	scr_text("Frank.", "mystery frank");
	scr_text("what", "niky - shocked")
	}
}

function Frank_Encounter_2(){
	with (instance_create_depth(1,1,-1000,obj_textbox) ) 
	{
	scr_text("Frank.", "Frank", 1);
	scr_text("?????????", "niky - ultra shocked")
	}
}

function Frank_Encounter_3(){
	with (instance_create_depth(1,1,-1000,obj_textbox) ) 
	{
	scr_text("?!?!?!?!??!?", "niky - ultra shocked")
	}
}

function Frank_End_Step(){
instance_create_layer(290, 240, "Instances_1", obj_Frank);
instance_create_layer(290, 428, "Instances_1", obj_neco);
obj_neco.face = UP;
}

//CAMERA
function Frank_Encounter_Camera() {
with obj_cutscene_follow {
	c_camera_moving = true;
	yTo = 375;
	spd = 5;
	}
}


//SPECIAL EFFECTS

function Mist_fade() {
	with obj_mist{
	dissipate = true;
	}
}