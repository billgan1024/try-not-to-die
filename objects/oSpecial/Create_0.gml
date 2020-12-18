key = "lvl"+string(room-1)+"coin"; alpha = 1;
if(global.loaded)
{
	var v = ds_map_find_value(oPersistent.levelData, key);
	if(!is_undefined(v)) { visible = false; }
}

var special = ds_map_find_value(oPersistent.saveData, "sp" + string(room-1));
if(special) { image_alpha = 0.5; alpha = 0.5; }