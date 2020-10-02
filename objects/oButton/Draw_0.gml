if(group == global.gs)
{
	draw_self();
	ha(fa_center); va(fa_middle); fnt(fnt_small); clr(c_black); ap(image_alpha);
	draw_text(x+sprite_width/2, y+sprite_height/2, text); 
	if(load) 
	{
		ha(fa_left); ap(alpha);
		txt(x+sprite_width+20, y+sprite_height/2, "Level: " + string(l) + ", Deaths: " + string(d));
	}
	ap(1);
	if(lvl != 0 && mouse_over())
	{
		var sp = ds_map_find_value(oPersistent.saveData, "sp" + string(lvl));
		draw_text(vx()+1280, vy()+1080, "Level " + string(lvl) + "\nSpecial Coin: " + (sp ? "Collected" : "Not collected"));
	}
}