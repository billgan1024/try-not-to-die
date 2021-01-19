function update() {
	if(ds_map_find_value(saveData, "fs")) window_set_fullscreen(true);
	global.sfx = ds_map_find_value(saveData, "sfx");
	global.mus = ds_map_find_value(saveData, "mus");
	global.shift = ds_map_find_value(saveData, "shift");
	global.isShifting = false;
	
	//set up the camera data to determine if the camera is static or bounded by a rectangle
	global.cameraData = 
	[
		[],
		[[0, 0, 0], [0, 0, 0]],
		[[0, 0, 0], [0, 0, 0]],
		[[0, 0, 0], [0, 0, 0]],
		[[0, 0, 0], [0, 0, 0], [0, 0, 0]],
		[[1, 1, 0], [1, 1, 0], [0, 0, 0]]
	];
}
