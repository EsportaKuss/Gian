if layer_sequence_is_paused(global.CurrentCutscene) && !instance_exists(obj_textbox) && !global.GamePaused{
layer_sequence_play(global.CurrentCutscene);
}
if layer_sequence_is_finished(global.CurrentCutscene)
{
layer_sequence_destroy(global.CurrentCutscene)
global.CurrentCutscene = noone;	
dissipate = false;
with (obj_camera) follow = obj_neco;
}

