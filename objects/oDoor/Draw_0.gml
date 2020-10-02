draw_self();
ap(image_alpha);
draw_sprite(sCoin, 0, x, y-30);
clr(make_colour_rgb(32, 32, 32)); 
ha(fa_center); va(fa_middle); fnt(fnt_small); clr(c_black);
if(required == 0) txt(x, y+30, string(oGame.tot-oGame.cnt));
else txt(x, y+30, string(required-oGame.cnt));
ap(1);