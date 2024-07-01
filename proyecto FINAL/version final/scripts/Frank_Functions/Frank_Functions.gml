
function Frank_Free_One(){
	spd = 1.5;
	hurt_timer = 10;
	var _distance = point_distance(x, y, target.x, target.y);
	mp_potential_step_object(target.x, target.y, spd, obj_wall);
	if (_distance < 45) {timer = 14; speed = 0; state = FRANKSTATE.CHARGIN;}
	sprite_index = spr_frank_down;
	if enemyHP <= 45 {spd = 0; state = FRANKSTATE.JUMPIN;}
	//if place_meeting (x,y, obj_wall) {Wall_Collide()}
}

function Frank_Charge(){
	image_speed = 0;
	hurt_timer = 10;
	if timer = 14 {xTo = target.x; yTo = target.y;}
	timer--;
	if timer <= 0 {
	image_speed = 1;
	spd = 5;
	move_towards_point(xTo, yTo, spd);
	state = FRANKSTATE.ATTACKING_1;
	timer = 25;}
}

function Frank_Attacking_One(){
	if place_meeting (x,y, obj_wall) {direction = direction - 180;}
	sprite_index = spr_frank_punch;
	hurt_timer = 10;
	spd -= friction;
	if abs(spd) > 0
	{
	attacking = true;
	friction = 0.1;	
	}
	else 
	{
		sprite_index = spr_frank_punch_rest;
		attacking = false;
		friction = 0;
		timer--;
		if timer <= 0
		{timer = 45;
		state = FRANKSTATE.PHASE_1;}
	}
}

function Frank_Hurt(){
	image_blend = c_red;
	if (hurt_timer > 0) hurt_timer -= 1;
	else {image_blend = c_white; state = statePrevious;}
}


function Frank_Jumping(){
	sprite_index = spr_frank_jump;
	if image_index > 7 && image_index < 10 {spd = 6;}
	move_towards_point(337, 320, spd);
	if point_distance(x,y,337,320) < spd {spd = 0; with (obj_camera_1) {follow = obj_Frank;}}
	if image_index > 66 {image_speed = 0; with(obj_camera_1) {follow = obj_neco;} timer = 20; state = FRANKSTATE.PROJECTILE_1; }
}

function Frank_Projectile(){
sprite_index = spr_frank_projectile;
hurt_timer = 10;
timer--;
//BULLET PATTERNS
if timer == 0 {
	switch(pattern){
	case BULLETPATTERN.PATTERN_1:
		SpawnBullet(obj_rat, 180, 3, true, 0, 0);
		SpawnBullet(obj_rat, 90, 3, true, 0, 0);
		SpawnBullet(obj_rat, 270, 3, true, 0, 0);
		SpawnBullet(obj_rat, 0, 3, true, 0, 0);
		timer = 45;
		pattern = BULLETPATTERN.PATTERN_2;
		break;
	case BULLETPATTERN.PATTERN_2:
		SpawnBullet(obj_rat, 135, 3, true, 0, 0);
		SpawnBullet(obj_rat, 45, 3, true, 0, 0);
		SpawnBullet(obj_rat, 315, 3, true, 0, 0);
		SpawnBullet(obj_rat, 225, 3, true, 0, 0);
		timer = 45;
		pattern = BULLETPATTERN.PATTERN_3;
		break;
	case BULLETPATTERN.PATTERN_3:
		SpawnBullet(obj_rat, 135, 3, true, 0, 0);
		SpawnBullet(obj_rat, 45, 3, true, 0, 0);
		SpawnBullet(obj_rat, 315, 3, true, 0, 0);
		SpawnBullet(obj_rat, 225, 3, true, 0, 0);
		SpawnBullet(obj_rat, 180, 3, true, 0, 0);
		SpawnBullet(obj_rat, 90, 3, true, 0, 0);
		SpawnBullet(obj_rat, 270, 3, true, 0, 0);
		SpawnBullet(obj_rat, 0, 3, true, 0, 0);
		SpawnBullet(obj_rat, 202, 3, true, 0, 0);
		SpawnBullet(obj_rat, 112, 3, true, 0, 0);
		SpawnBullet(obj_rat, 292, 3, true, 0, 0);
		SpawnBullet(obj_rat, 22, 3, true, 0, 0);
		SpawnBullet(obj_rat, 157, 3, true, 0, 0);
		SpawnBullet(obj_rat, 67, 3, true, 0, 0);
		SpawnBullet(obj_rat, 337, 3, true, 0, 0);
		SpawnBullet(obj_rat, 247, 3, true, 0, 0);
		timer = 45;
		pattern = BULLETPATTERN.PATTERN_1;
		break;
		}
	
	}
}

