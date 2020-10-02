if(group == global.gs)
{
	if(isImage)
	{
		draw_sprite(spr, 0, x, y);	
	}
	else
	{
		fnt(font); ha(halign); va(valign); clr(c_black); ap(alpha);
		txt(x, y, text); ap(1);
	}
}