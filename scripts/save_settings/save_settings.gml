function save_settings() {
	ds_map_replace(saveData, "fs", window_get_fullscreen());
	ds_map_replace(saveData, "sfx", global.sfx);
	ds_map_replace(saveData, "mus", global.mus);
	ds_map_replace(saveData, "shift", global.shift);

	ds_map_secure_save(saveData, fileName);


}
