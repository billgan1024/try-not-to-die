saveData = ds_map_create(); levelData = ds_map_create();
fileName = "settings.sav"; lvlName = "level.sav";

collectedCoins = ds_stack_create(); 

//automatically load a previous ds map if it exists
if(file_exists(fileName))
{
	ds_map_destroy(saveData);
	saveData = ds_map_secure_load(fileName);
}
else
{
	//default values for all possible data
	init();
}

if(file_exists(lvlName))
{
	ds_map_destroy(levelData);
	levelData = ds_map_secure_load(lvlName);
}
else
{
	//only one save file
	ds_map_add(levelData, "lvl", 0);
	ds_map_add(levelData, "deaths", 0);
	ds_map_secure_save(levelData, "level.sav");
}

//update values
update();
window_set_size(display_get_height()/3*4, display_get_height()/4*3);
alarm[1] = 1;

global.ps_above = part_system_create();
global.ps_below = part_system_create();
//whether this player is playing on the save file or not
global.loaded = false;
part_system_depth(global.ps_above, -9999);
part_system_depth(global.ps_below, 550);
global.deaths = 0; prev = -1;
global.debug = false;
version = "v0.2";

button1 = noone; 
button2 = noone; 
button3 = noone;

enum state
{
	menu,
	select,
	options,
	game,
	length
}

global.gs = state.menu;
global.time = 0;
global.paused = false;
room_goto_next();