xspd = 0;
yspd = 0;
move_spd = 1.5;
hsp = 1;

sprite[RIGHT] = spr_nyko_right;
sprite[UP] = spr_nyko_up;
sprite[LEFT] = spr_nyko_left;
sprite[DOWN] = spr_nyko_down;

face = DOWN;

//jumping 
z = 0;
curvy = animcurve_get_channel(curves,"curve2");
percent = 0;
jump = false;
hop = false;
jump_cooldown = 0;
wj_x = 0;
wj_y = 0;
key = false;
invulnerable = 0;

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

animationEndScript = -1;

