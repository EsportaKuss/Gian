/// @description direction test

spr_hurt = spr_enemy_hurt;

switch(state)
{
case ENEMY.FOLLOW: Test_Follow() break;	
case ENEMY.PUNCH: Test_Punch() break;	
case ENEMY.HURT: Enemy_Hurt() break;	
case ENEMY.HOLYSHITHEDIED: Test_Die() break;
}