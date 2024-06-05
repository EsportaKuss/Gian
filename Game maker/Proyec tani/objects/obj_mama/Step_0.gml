//MOVIMIENTO
var _detect = noone;
_detect = collision_circle(x, y, 50, obj_neco, false,true);
if !instance_exists(obj_textbox) && _detect == noone
{
if( status == _idle)
{
	image_index = 0;
	image_speed = 0;
   if(alarm[0] <=0)
   {
        speed=1
        status = _walk
        direction= irandom_range(0,360)
       alarm[0] = _timer
   }
   else
   {
        //nothing
    }
}

if ( status == _walk)
{
	image_speed = 1;
	
     speed = clamp( speed - 0.1 , 0 , 10) //reducing speed to 0 progresivly
   if(alarm[0] <= 0)
   {
    alarm[0] = _wait_timer
    status = _idle
    speed=0
  }
}
}
else speed = 0;

//INTERACT???

	if instance_exists(obj_neco)
	{
	
		if place_meeting(x-2, y, obj_neco) && obj_neco.face == RIGHT 
		or place_meeting(x+2, y, obj_neco) && obj_neco.face == LEFT
		or place_meeting(x, y + 2, obj_neco) && obj_neco.face == UP
		or place_meeting(x, y - 2, obj_neco) && obj_neco.face == DOWN

	{

		if keyboard_check_pressed(ord("C")) && !instance_exists(obj_textbox) && text_id != noone
		{
		create_textbox(text_id);
		}
	}
}