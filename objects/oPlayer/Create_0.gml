extraJump = true; 
runSpeed = 16; 
runAccel = 0.5; 
runDecel = 0.8;
jumpSpeed = 26;
bonusJump = 0;

hsp = 0;
vsp = 0;
hsp_frac = 0; 
vsp_frac = 0; 

grav = 1.2; 
maxGrav = 35; 
canMove = false; 
alarm[1] = 10;
immune = false; 
boosted = false;

onGround = false;
jumpBuffer = 0;
key_left = false;
key_right = false;
key_jump = false;
key_down = false;
key_up = false;
key_shift = global.isShifting;

yscale = 1;

if(global.loaded)
{
	var xx = ds_map_find_value(oPersistent.levelData, "x");
	var yy = ds_map_find_value(oPersistent.levelData, "y");
	if(!is_undefined(xx)) 
	{
		x = xx; y = yy; 
	}
}