function init() {
	ds_map_add(saveData, "sfx", true);
	ds_map_add(saveData, "mus", true);
	ds_map_add(saveData, "fs", true);
	ds_map_add(saveData, "shift", false);

	for(var i = 1; i <= 16; i++)
	{
		ds_map_add(saveData, "sp" + string(i), false);	
	}


}
