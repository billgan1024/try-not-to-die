window_set_fullscreen(!window_get_fullscreen());
center();

ds_map_replace(saveData, "fs", window_get_fullscreen());
ds_map_secure_save(saveData, fileName);