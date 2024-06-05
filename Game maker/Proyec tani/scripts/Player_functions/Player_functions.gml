function PlayerState_Free() {
mask_index = sprite_index;
//schmoving nya
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;
var _using_inventory = global.using_inventory;
//jump
if (keyboard_check_pressed(ord("X")) && !_using_inventory == true && !jump == true && jump_cooldown == 0 && move_spd = 2.5 && !instance_exists(obj_textbox)) jump = true;
if (keyboard_check_pressed(ord("X")) && !_using_inventory == true && !jump == true && jump_cooldown == 0 && move_spd = 1.5 && !instance_exists(obj_textbox)) hop = true;
if jump == true && !instance_exists(obj_textbox)
{
	percent += 1/30; var _start = 0; var _end = 25;
	if (percent > 1) {jump_cooldown = 10; percent = 0; z = 0; jump = false;} 
	position = animcurve_channel_evaluate(curvy, percent)
	var _distance = _end - _start;
	z = _start + (_distance * position);
}
if hop == true && !instance_exists(obj_textbox)
{
	percent += 1/15; var _start = 0; var _end = 10;
	if (percent > 1) {jump_cooldown = 5; percent = 0; z = 0; hop = false;} 
	position = animcurve_channel_evaluate(curvy, percent)
	var _distance = _end - _start;
	z = _start + (_distance * position);
}

if jump_cooldown > 0 {
jump_cooldown-= 1	
}

if z > 0
{
	image_index = 1;
}

//fast schmoving nya
if(keyboard_check_pressed(vk_shift) && jump == false) 
	{
		move_spd = 2.5;
		image_speed = 1.65;
	}
if(keyboard_check_released(vk_shift))
	{
		move_spd = 1.5;
		image_speed = 1;
	}

//pause nya
if instance_exists(obj_pause)
	{
	xspd = 0;
	yspd = 0;
	}
	if instance_exists(obj_textbox)
	{
	xspd = 0;
	yspd = 0;
	}
	if _using_inventory == true
	{
	xspd = 0;
	yspd = 0;
	}

//sprite set nya
if yspd == 0 
	{
	if xspd > 0 {face = RIGHT};
	if xspd < 0 {face = LEFT};
	}
if xspd > 0 && face == LEFT{face = RIGHT};
if xspd < 0 && face == RIGHT{face = LEFT};
if xspd == 0
	{
	if yspd > 0 {face = DOWN};
	if yspd < 0 {face = UP};
	}
if yspd > 0 && face == UP{face = DOWN};
if yspd < 0 && face == DOWN{face = UP};
sprite_index = sprite[face];



//interact obj coll

var _coll = instance_place(x + xspd, y,  obj_interect_par);
if instance_place(x + xspd, y, obj_interect_par) != noone && _coll.coll = true
	{
	xspd = 0; 
	}
	
var _coll = instance_place(x, y + yspd,  obj_interect_par);
if instance_place(x, y + yspd, obj_interect_par) != noone && _coll.coll = true
	{
	yspd = 0; 
	}
	
	//wall coll
	if place_meeting(x + xspd, y, obj_wall) == true 
	{
	xspd = 0; 
	}
if place_meeting(x, y + yspd, obj_wall) == true 
	{
	yspd = 0; 
	}
	
if place_meeting(x + xspd, y, obj_j_wall) == true && z < 11
	{
	xspd = 0; 
	}
if place_meeting(x, y + yspd, obj_j_wall) == true && z < 11
	{
	yspd = 0; 
	}
if place_meeting(x, y, obj_j_wall) == true && z = 0
{
	jump = true;
}
	
x += xspd;
y += yspd;



if xspd == 0 && yspd == 0
	{
	image_index = 0;
	}
	
	if attack_key {
		if ( invulnerable < 30) {
				if global.iLifted == noone
				{
					if  jump == false {
					state = PLAYERSTATE.ATTACK_SLASH;}
				}
				else
				{
					if invulnerable == 0 {
					Player_throw();}
				}
			}
		}
}

function AttackSlash() {
	if z = 0 {
	xspd = 0;
	yspd = 0;}
	move_spd = 1.5;
	image_speed = 1;
	if face == LEFT {sprite_index = spr_slash_left; mask_index = spr_h_slash_left}
	if face == RIGHT {sprite_index = spr_slash_right; mask_index = spr_h_slash_right}
	if face == UP {sprite_index = spr_slash_up; mask_index = spr_h_slash_up}
	if face == DOWN {sprite_index = spr_slash_down;  mask_index = spr_h_slash_down}
	ds_list_clear(hitByAttack);
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,obj_enemy,hitByAttackNow,false);
	if hits > 0
	{
		for (var i = 0; i < hits; i++) 
		{
			//if not hit yet
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with hitID
				{
				if (object_is_ancestor(object_index, obj_enemy))
					{
						if (attacking = false) HurtEnemy(id, 1, other.id, 15);	
					}
				else if (EntityHitScript != -1) script_execute(EntityHitScript);
				}
			}
		}	
	}
	
	ds_list_destroy(hitByAttackNow);
	
	
	if image_index > image_number - 1 or image_index = -1 {
		if(keyboard_check(vk_shift)) 
		{
		move_spd = 2.5;
		image_speed = 2;
		}
		state = PLAYERSTATE.FREE
		}
}

function AttackCombo() {
	if face == LEFT {sprite_index = spr_slash_left}
	if face == RIGHT {sprite_index = spr_slash_right}
	if face == UP {sprite_index = spr_slash_up}
	if face == DOWN {sprite_index = spr_slash_down}
}

function HurtEnemy(_enemy, _damage, _source, _knockback)
{
	with (_enemy)
	{
		if (state != ENEMY.HOLYSHITHEDIED)
		{
			
			if (state != ENEMY.HURT) {enemyHP -= _damage; Screenshake(0.5, 10);}
			
			//Hurt or dead?
			if (enemyHP <= 0)
			{
				state = ENEMY.HOLYSHITHEDIED;	
			}
			else 
			{
				if (state != ENEMY.HURT) statePrevious = state;
				state = ENEMY.HURT;
			}

			image_index = 0;
			if _knockback != 0 && boss != true
			{
				var _knockDirection = point_direction(x,y, (_source.x), (_source.y));
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}

function Hurt_Player(_direction,_force,_damage){
	if obj_neco.invulnerable <= 0
	{
			global.NikyHealth = max(0, global.NikyHealth - _damage);
			
			if global.NikyHealth > 0
			{
				with (obj_neco)
				{
					Screenshake(2, 30);
					invulnerable = 60;
				}
			}
			else
			{
				//KILL
			}
	}
}

function Player_throw(){
with global.iLifted 
	{
		lifted = false;
		persistent = false;
		thrown = true;
		z = 28;
		throwPeakHeight = z + 10;
		throwDistanceTravelled = 0;
		throwStartPercent = (28/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		if obj_neco.face = RIGHT {direction = 0;}
		if obj_neco.face = DOWN {direction = 270;}
		if obj_neco.face = LEFT {direction = 180;}
		if obj_neco.face = UP {direction = 90;}
		xstart = x;
		ystart = y;
		
	}
	global.iLifted = noone;
}