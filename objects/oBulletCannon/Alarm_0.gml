sound(snd_shoot);
image_index = 1;
var b = instance_create_layer(x, y, "Ground", oBullet);
b.speed = bspd;
b.image_angle = image_angle;
b.direction = image_angle;
alarm[1] = 12;