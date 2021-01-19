function death() {
	sound(snd_explosion);
	//effect_create_above(ef_firework, x+40, y+40, 1, make_colour_rgb(0, 51, 102));
	explode(oGame.max_life, oGame.min_life, oGame.max_speed, oGame.min_speed, oGame.max_piece_size, oGame.min_piece_size, oGame.spin, oGame.fade, oGame.fade_amt, oGame.fade_to_color, oGame.end_color_display, oGame.color_fade_speed, oGame.implode);
	instance_destroy(); oGame.alarm[0] = 30;

	if(global.loaded)
	{
		ds_map_replace(oPersistent.levelData, "deaths", ds_map_find_value(oPersistent.levelData, "deaths") + 1);
		save_level();
	}


}
