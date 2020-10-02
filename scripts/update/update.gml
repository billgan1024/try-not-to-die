function update() {
	if(ds_map_find_value(saveData, "fs")) window_set_fullscreen(true);
	global.sfx = ds_map_find_value(saveData, "sfx");
	global.mus = ds_map_find_value(saveData, "mus");
	global.shift = ds_map_find_value(saveData, "shift");
	global.isShifting = false;


}
