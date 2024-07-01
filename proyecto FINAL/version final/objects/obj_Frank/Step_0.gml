if global.GamePaused {exit}



depth = -bbox_bottom;
if (obj_neco.z > 0) depth = 1
switch(state) 
{
	case FRANKSTATE.PHASE_1: Frank_Free_One() break;
	case FRANKSTATE.ATTACKING_1: Frank_Attacking_One() break;
	case FRANKSTATE.CHARGIN: Frank_Charge() break;
	case FRANKSTATE.JUMPIN: Frank_Jumping() break;
	case FRANKSTATE.PROJECTILE_1: Frank_Projectile() break;
	case FRANKSTATE.ATTACK_2: break;
	case FRANKSTATE.FREE_2: break;
	case FRANKSTATE.PROJECTILE_2: break;
	case FRANKSTATE.FULL_NELSON: break;
	case FRANKSTATE.DIZZY: break;
	case ENEMY.HURT: Frank_Hurt() break;
}

