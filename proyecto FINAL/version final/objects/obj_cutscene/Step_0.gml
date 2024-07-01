if place_meeting(x, y, obj_neco) && global.CutscenePlaying == false
{
	global.CutscenePlaying = true;
	Cutscene(acutscene);
	if (KILL_player == true) instance_destroy(obj_neco);
	instance_destroy();
}
