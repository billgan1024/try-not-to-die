ap(0.5);
draw_rectangle(xx, yy, xx+2560, yy+80, false);
ap(1);
ha(fa_left); clr(c_white); va(fa_middle); fnt(fnt_small);
txt(xx+20, yy+40, "Level " + roomName);

ha(fa_center);
if(cnt == tot) clr(c_yellow); else clr(c_white);
var str = string(cnt)+"/"+string(tot);
txt(xx+1280, yy+40, str);

clr(c_white); ha(fa_right);
txt(xx+2560-20, yy+40, "Deaths: " + string(global.deaths));

draw_sprite_ext(sCoin, 0, xx+1280-string_width(str)/2-40, yy+40, 1, 1, 0, c_white, 1);

clr(c_black);