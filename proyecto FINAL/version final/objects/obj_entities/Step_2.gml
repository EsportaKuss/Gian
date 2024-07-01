if (lifted == true && instance_exists(obj_neco))
{
	if (obj_neco.sprite_index != spr_nyko_lift)
	{
		x = obj_neco.x;
		y = obj_neco.y;
		z = obj_neco.z + 28;
		depth = obj_neco.depth - 1;
	}
	if obj_neco.invulnerable > 0 {global.iLifted = noone; lifted = false;}
}

if lifted == false{
	
	if (thrown)
	{
		throwDistanceTravelled = min(throwDistanceTravelled+3, entityThrowDistance);	
		x = xstart + lengthdir_x(throwDistanceTravelled, direction);
		y = ystart + lengthdir_y(throwDistanceTravelled, direction);
		if place_meeting (x,y, obj_wall) {direction = direction - 180;}
		throwPercent = throwStartPercent + lerp(0, 1- throwStartPercent, throwDistanceTravelled/entityThrowDistance);
		z = throwPeakHeight * sin(throwPercent * pi);
		if (entityThrowDistance == throwDistanceTravelled)
		{
			thrown = false;
		}
	}
	else
	{
		if z  > 0 
		{
		
		grav += 0.1;
		z -= grav
		if z <= 0 {grav = 0; z = 0;}
		}	
	}
	
}