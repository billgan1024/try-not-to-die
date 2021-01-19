if(!immune)
{
	sound(snd_bells); other.image_speed = 1; immune = true; 
	oGame.alarm[1] = 45; oPersistent.prev = real(string_digits(room_get_name(room)));
	while(!ds_stack_empty(oPersistent.collectedCoins)) 
	{
		var c = ds_stack_pop(oPersistent.collectedCoins);
		if(c.object_index == oSpecial)
		{
			ds_map_replace(oPersistent.saveData, "sp" + string(room-1), true);	
			ds_map_secure_save(oPersistent.saveData, oPersistent.fileName);
		}
	}
	if(global.loaded)
	{
		ds_map_replace(oPersistent.levelData, "lvl", ds_map_find_value(oPersistent.levelData, "lvl")+1);
		ds_map_delete(oPersistent.levelData, "x"); 
		ds_map_delete(oPersistent.levelData, "y");
		save_level();
	}
}