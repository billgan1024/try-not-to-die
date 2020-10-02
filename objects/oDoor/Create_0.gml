key = save_key(); required = 0;
if(global.loaded)
{
	var v = ds_map_find_value(oPersistent.levelData, key);
	if(!is_undefined(v)) { visible = false; mask_index = sNull; }
}