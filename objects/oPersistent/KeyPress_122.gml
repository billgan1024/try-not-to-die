if(alarm[0] == -1)
{
	window_set_fullscreen(!window_get_fullscreen());
	window_set_size(display_get_height()/3*4, display_get_height()/4*3);
	alarm[1] = 5;
	//alarm[0] = 30;

	ds_map_replace(saveData, "fs", window_get_fullscreen());
	ds_map_secure_save(saveData, fileName);
}