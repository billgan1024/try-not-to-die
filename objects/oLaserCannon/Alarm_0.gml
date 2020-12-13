cannonState = (cannonState + 1) % 3;
if(cannonState == 2) { sound(snd_laser); image_index = 1; }
else image_index = 0;
alarm[0] = delay;