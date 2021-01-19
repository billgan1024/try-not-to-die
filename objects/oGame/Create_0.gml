cameraX = 0; cameraY = 0; checkpoint = -1; c = false;
cameraSpd = 0.04;
targetX = 0; targetY = 0;
cnt = 0; tot = instance_number(oCoin);
//music(mus_game);
lx = -1; ly = -1; roomName = string_digits(room_get_name(room));

//camera control
xMax = room_width/2560; yMax = room_height/1440;

//this is stored for updating purposes
xleft = -1; ytop = -1; xright = -1; ybot = -1;

//player death explosion
max_life = 20;
min_life = 15;
max_speed = 9;
min_speed = 7;
max_piece_size = 25;
min_piece_size = 10;
spin = 5;
fade = 1;
fade_amt = 0.07;
fade_to_color = 0;
end_color = 0;
end_color_display = c_white;
color_fade_speed = 0;
implode = -1;

global.isShifting = false;