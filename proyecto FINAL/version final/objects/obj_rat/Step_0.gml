x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if spin == 1
{
	if direction < 360 {direction += spin_force;}	
	else if direction >= 360 {direction = spin_force}
}

if spin == 2
{
	if direction > 0 {direction -= spin_force;}	
	else if direction <= 0 {direction = spin_force}
}

if (place_meeting(x,y,obj_neco))
{
	if obj_neco.z <= 5{
	Hurt_Player(0,0,1);
	instance_destroy();}	
}

if place_meeting(x,y,obj_wall)
{
instance_destroy();	
}

if direction >= 45 && direction <= 135
{
	sprite_index = spr_up;	
}

if direction >= 225 && direction <= 315
{
	sprite_index = spr_down;	
}

if (stop_step){
	if spd > 0
	{
		spd -= 0.04;
	}
	else if spd <= 0
	{
		spd = og_spd;
	}
}