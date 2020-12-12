if(alarm[0] == -1 && alarm[1] == -1)
{
	window_set_fullscreen(!window_get_fullscreen());
	//alarm[0] = 30;

	ds_map_replace(saveData, "fs", window_get_fullscreen());
	ds_map_secure_save(saveData, fileName);
}