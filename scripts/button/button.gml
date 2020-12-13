function button() {
	switch(global.gs)
	{
		case state.menu:
		switch(text)
		{
			case "New Game":
			if(ds_map_find_value(oPersistent.levelData, "lvl") == 0)
			{
				global.gs = state.game;
				global.loaded = true; global.deaths = 0;
				ds_map_clear(oPersistent.levelData);
				ds_map_add(oPersistent.levelData, "lvl", 1);
				ds_map_add(oPersistent.levelData, "deaths", 0);
				save_level();
				room_goto(asset_get_index("level1")); 
				audio_stop_sound(mus_menu); music(mus_game);
			}
			else
			{
				if(!instance_exists(warning))
				{
					warning = instance_create_layer(1280, 1280, "Menu", oDisplay);
					warning.text = "Warning: Your previous save will be overwritten. Click again to proceed."; 
					warning.alarm[0] = 240;
				}
				else
				{
					global.gs = state.game;
					global.loaded = true; global.deaths = 0;
					ds_map_clear(oPersistent.levelData);
					ds_map_add(oPersistent.levelData, "lvl", 1);
					ds_map_add(oPersistent.levelData, "deaths", 0);
					save_level();
					room_goto(asset_get_index("level1")); 
					audio_stop_sound(mus_menu); music(mus_game);
				}
			}
			break;
		
			case "Load Game": global.gs = state.game;
			global.loaded = true; 
			global.deaths = ds_map_find_value(oPersistent.levelData, "deaths");
			room_goto(asset_get_index("level"+string(ds_map_find_value(oPersistent.levelData, "lvl"))));
			audio_stop_sound(mus_menu); music(mus_game);
			break;
		
			case "Level Select": global.gs = state.select; menuview();
			break;
		
			case "Options": global.gs = state.options; menuview();
			break;
		
			case "Quit": audio_stop_sound(snd_release); game_end();
			break;
		}
		break;
	
		case state.select:
		if(lvl != 0) 
		{
			global.gs = state.game; 
			room_goto(asset_get_index("level"+string(lvl))); 
			global.deaths = 0;
			global.loaded = false;
			audio_stop_sound(mus_menu); music(mus_game);
		}
		else
		{
			switch(text)
			{
				case "Back": global.gs = state.menu; menuview();
				break;
			}
		}
		break;
	
		case state.options:
		if(showSfx) global.sfx = !global.sfx;
		else if(showMus) 
		{
			global.mus = !global.mus;
			if(!global.mus) audio_stop_sound(mus_menu);
			else audio_play_sound(mus_menu, 0, true);
		}
		else if(showFs) 
		{ 
			with(oPersistent)
			{
				if(alarm[0] == -1)
				{
					window_set_fullscreen(!window_get_fullscreen());
					ds_map_replace(saveData, "fs", window_get_fullscreen());
					ds_map_secure_save(saveData, fileName);
				}
			}
		}
		else if(showShift) global.shift = !global.shift;
		else
		{
			switch(text)
			{
				case "Back": global.gs = state.menu; menuview();
				break;
			}
		}
		break;
	
		case state.game:
			switch(text)
			{
				case "Back to Game": with(oPersistent) { global.paused = false; unpause(); } 
				break;
			
				case "Restart Level": with(oPersistent) { global.paused = false; unpause(); } 
				while(!ds_stack_empty(oPersistent.collectedCoins)) ds_stack_pop(oPersistent.collectedCoins);
				room_restart();
				break;
			
				case "Next Level": 
				{
					room_goto(asset_get_index("level"+string(oPersistent.prev+1)));
				}
				break;
			
				case "Retry Level": room_goto(asset_get_index("level"+string(oPersistent.prev)));
				break;
			
				case "Main Menu": with(oPersistent) { global.paused = false; unpause(); } 
				while(!ds_stack_empty(oPersistent.collectedCoins)) ds_stack_pop(oPersistent.collectedCoins);
				global.gs = state.menu; room_goto(menu);
				break;
			}
		break;
	}


}
