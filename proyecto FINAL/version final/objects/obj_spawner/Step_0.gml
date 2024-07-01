if triggered == false 
{
	triggered = true;
	
	total_waves = -1;
	for (var i = 0; i < ds_list_size(waves);i++)
	{
		var thisentry =	ds_list_find_value(waves,i);
		if (thisentry[_WAVE] > total_waves)
		{
			total_waves++;
			remaining[total_waves] = 0;
		}
		remaining[total_waves]++;
	}
}

if (triggered) 
{
	//Check list for enemies that are ready to spawn and if they are the right wave/time spawn them
	for (var i = 0; i < ds_list_size(waves); i++)
	{
		var next = ds_list_find_value(waves, i)
		if (next[_WAVE] == current_wave) && (next[_DELAY] == timer) 
		{
			
			var spawnpoint = next[_SPAWN];
			instance_create_layer(spawn[spawnpoint,0], spawn[spawnpoint,1], "Instances_1", next[_TYPE]);
		
			
		}
	}
	
	//Increase Timer
	timer++;
	
	//Next wave or end spawner
	if (remaining[current_wave] <= 0)
	{
		if (current_wave == total_waves)
		{
			instance_destroy();
		}
		else 
		{
			current_wave++;
			timer = 0;
		}
	}
}