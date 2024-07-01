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

current_text = obj_progress.mateo_progress;
text_array = ["mateo_i1","mateo_i1_alt","mateo_i2","mateo_i3","mateo_i4","mateo_i5","mateo_i6","mateo_sin_galleta","mateo_recieve","mateo_give","mateo_done"];
text_id = text_array[current_text];