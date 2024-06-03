//the real ones
	
function Enemy_Hurt(){
	sprite_index = spr_hurt;
	var _distanceToGo = point_distance(x,y, xTo, yTo);
	if _distanceToGo > spd
	{	
		move_towards_point(xTo, yTo, spd);
		spd -= 0.1;
	}
	
	if _distanceToGo < spd {spd = 0;}
	if spd <= 0 {spd = 0;}
	timer -= 1;
	if timer <= 0
	{
		timer = 50;
		spd = og_speed;
		if (statePrevious != attack) {state = statePrevious;} else {state = idle;}
	}
}


function SpawnBullet(_bullet, _direction, _speed, _stopstep, _spin, _spinforce){
	with (instance_create_layer(x,y,"Instances_1", _bullet))
	{
	direction = _direction;
	spd = _speed;
	og_spd = _speed;
	stop_step = _stopstep;
	spin = _spin;
	spin_force = _spinforce;
	}
}

// --------------TEST ENEMY ONES THAT MAYBE I CAN USE AS BASE------------- //

function Test_Follow(){
sprite_index = spr_enemy;
var _dist = point_distance(x,y, target.x, target.y);
move_towards_point(target.x, target.y, spd);
	if _dist <= 50
	{
		spd = 4;
		state = ENEMY.PUNCH	
	}
spd = 2;
}

function Test_Punch(){
	if spd > 0 
	{
	spd -= 0.2;	
	}
	sprite_index = spr_enemy_punch;
	move_towards_point(target.x, target.y, spd);
	if spd <= 0
	{
	sprite_index = spr_enemy;
	state = ENEMY.FOLLOW;
	}
	spd = 2;
}

function Test_Die(){
	sprite_index = spr_enemy_DECKED;
	var _distanceToGo = point_distance(x,y, xTo, yTo);
	if _distanceToGo > spd
	{	
		move_towards_point(xTo, yTo, spd);
		spd -= 0.1;
	}
	
	if _distanceToGo < spd {spd = 0;}
	if spd <= 0 {spd = 0;}
	timer -= 1;
	if timer <= 0
	{
		timer = 50;
		spd = 2;
		state = statePrevious;
		instance_destroy();	
	}
}