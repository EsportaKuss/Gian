global.fight = true;

enemyHP = 50;
boss = true;
state = FRANKSTATE.PHASE_1;
attacking = false;
spd = 1.5;
target = obj_neco;
xTo = xstart;
yTo = ystart;
timer = 45;
og_speed = spd;
attack = FRANKSTATE.ATTACKING_1;
idle = state;
pattern = BULLETPATTERN.PATTERN_3;