if global.GamePaused {exit}

invulnerable = max(invulnerable - 1, 0);

right_key = keyboard_check(vk_right); 
left_key = keyboard_check(vk_left); 
up_key = keyboard_check(vk_up); 
down_key = keyboard_check(vk_down); 

attack_key = keyboard_check_released(ord("Z"))

if(keyboard_check_pressed(ord("R")))
{
	game_restart()
}


switch (state) {
	case PLAYERSTATE.FREE: PlayerState_Free();
	break;
	case PLAYERSTATE.ATTACK_SLASH: AttackSlash();
	break;
	case PLAYERSTATE.HURT: 
	break;
}
//depth nya
depth = -bbox_bottom;

//events
if global.Peso == true && room = rm_streets && !instance_exists(obj_textbox) {
global.Peso = false;
instance_create_depth(286,232, -5, obj_he_took)
with (obj_camera) {follow = obj_he_took;}
instance_destroy()
}