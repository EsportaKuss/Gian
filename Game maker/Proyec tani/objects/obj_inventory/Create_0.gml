depth = -99999;
#macro INVENTORY_SLOTS 6
row_length = 1;
inventory = array_create(INVENTORY_SLOTS, -1);
global.using_inventory = false;
inventory [0] = -1;

curvy = animcurve_get_channel(curves,"curve1");
percent = 0;