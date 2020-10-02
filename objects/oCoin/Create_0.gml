key = save_key(); 
if(global.loaded)
{
	var v = ds_map_find_value(oPersistent.levelData, key);
	if(!is_undefined(v)) { oGame.cnt++; visible = false; }
}