//VAR MOVIMIENTO
randomize()
_idle = 0
_walk = 1
_timer = room_speed
_wait_timer = room_speed

status = _idle
alarm[0] = _timer

//INTRACT???
coll = true;
depth = -bbox_bottom;
text_id = noone;