if(room == 1)
{
	ha(fa_left); va(fa_bottom); clr(c_black); fnt(fnt_small);
	txt(20, 1440-20, "Try Not to Die " + version);
}
if(global.paused)
{
	ha(fa_center); va(fa_middle); clr(c_black);	fnt(fnt_title);
	txt(1280, wave(240-6, 240+6, 2.5, 0), "Game Paused");
}