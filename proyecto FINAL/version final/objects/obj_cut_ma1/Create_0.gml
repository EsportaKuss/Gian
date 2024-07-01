//VAR MOVIMIENTO
randomize()
_idle = 0
_walk = 1
_timer = room_speed
_wait_timer = room_speed

status = _idle
alarm[0] = _timer
image_speed = 1;

//INTRACT???
coll = true;
depth = -bbox_bottom;


//DIALOGOS
text_id = noone;
text_array = ["ma1","and1","ma2","and2"];
current_text = 0;

//FADE
image_alpha = 0;
rgb1 = 0
rgb2 = 0;
rgb3 = 0;

//ANIMACION Y TIMER
enter_done = false;
x_enter=0;
y_enter=0;
x_out=0;
y_out=0;
timer_warp = 0;
timer_warp_out = 0;


fxdone = false;
