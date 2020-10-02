if(oGame.checkpoint != other) 
{ 
	if(oGame.c) { 
		if(other.p == 0 || other.p != oGame.checkpoint.p)
		{
			other.image_speed = 1; sound(snd_checkpoint); 
			while(!ds_stack_empty(oPersistent.collectedCoins))
			{
				var c = ds_stack_pop(oPersistent.collectedCoins);
				if(global.loaded) ds_map_add(oPersistent.levelData, c.key, true);
				if(c.object_index == oSpecial)
				{
					ds_map_replace(oPersistent.saveData, "sp" + string(room-1), true);	
					ds_map_secure_save(oPersistent.saveData, oPersistent.fileName);
				}
			}
		}
		if(global.loaded)
		{
			ds_map_replace(oPersistent.levelData, "x", other.rx);
			ds_map_replace(oPersistent.levelData, "y", other.ry);
			save_level();
		}
	}
	else oGame.c = true;
	oGame.checkpoint = other;
}
else if(!ds_stack_empty(oPersistent.collectedCoins))
{
	other.image_speed = 1; sound(snd_checkpoint); 
	while(!ds_stack_empty(oPersistent.collectedCoins))
	{
		var c = ds_stack_pop(oPersistent.collectedCoins);
		if(global.loaded) ds_map_add(oPersistent.levelData, c.key, true);
		if(c.object_index == oSpecial)
		{
			ds_map_replace(oPersistent.saveData, "sp" + string(room-1), true);	
			ds_map_secure_save(oPersistent.saveData, oPersistent.fileName);
		}
	}
	if(global.loaded) save_level();
}