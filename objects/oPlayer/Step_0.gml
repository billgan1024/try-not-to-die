followX = x; followY = y;
image_alpha = approach(image_alpha, 1, 0.1);
yscale = approach(yscale, 1, 0.05);
if(canMove) input();

move = key_right-key_left;

if(move != 0)
{
	if(onGround) 
	{
		if(key_shift) hsp = lerp(hsp, move*runSpeed*3/2, runAccel/2);
		else hsp = lerp(hsp, move*runSpeed, runAccel);
	}
	else
	{
		if(key_shift) hsp = lerp(hsp, move*runSpeed*3/2, runAccel*3/16);
		else hsp = lerp(hsp, move*runSpeed, runAccel*3/8);
	}
}
else
{
	if(onGround) 
	{
		hsp = lerp(hsp, 0, runDecel);
	}
	else
	{
		hsp = lerp(hsp, 0, runDecel*3/8);
	}
}

if(!onGround)
{
	if(key_down && vsp >= -jumpSpeed) { vsp = min(vsp+2*grav, maxGrav+10); }
	else vsp = min(vsp+grav, maxGrav); 
}

if(vsp < 0 && !key_up && !boosted) vsp += grav;

if(jumpBuffer > 0)
{
	jumpBuffer--;
	if(key_jump && vsp > -jumpSpeed)
	{
		//if(!collision_line(x, y, x, y-160, oGround, false, false)) yscale = jumpScale;
		sound(snd_jump);
		boosted = false;
		jumpBuffer = 0;
		vsp = -(jumpSpeed + bonusJump);
		vsp_frac = 0;
	}
}
else if(extraJump)
{
	if(key_jump && vsp >= -jumpSpeed)
	{
		//if(!collision_line(x, y, x, y-160, oGround, false, false)) yscale = jumpScale;
		sound(snd_jump);
		boosted = false;
		if(!place_meeting(x, y+10, oGround)) extraJump = false;
		vsp = -jumpSpeed;
		vsp_frac = 0;
	}
}

hsp += hsp_frac; 
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

/*if(onGround)
{
	extraJump = true; 
	if(place_meeting(x, y+1, oSpring))
	{
		sound(snd_bounce); boosted = true; 
		var s = instance_nearest(x, y+1, oSpring); 
		vsp = -s.bounce; s.image_index = 1; s.alarm[0] = 15;
	}
	if(move != 0) { 
		if(key_shift) hsp = approach(hsp, dashSpeed*move, runAccel); 
		else hsp = approach(hsp, runSpeed*move, runAccel); 
	}
	else { hsp = approach(hsp, 0, runDecel); }
	if(key_jump) { onGround = false; sound(snd_jump); vsp = -jumpSpeed; }
}
else 
{
	//variable jump height
	if(vsp < 0 && !key_up && !boosted) vsp += grav;
	if(move != 0) { 
		if(key_shift) hsp = smooth_approach(hsp, dashSpeed*move, airAccel/2); 
		else hsp = smooth_approach(hsp, runSpeed*move, airAccel); 
	}
	else hsp = approach(hsp, 0, airDecel); 
	if(extraJump && key_jump) { sound(snd_jump); vsp = -jumpSpeed; boosted = false; extraJump = false; }
}*/

jumpThroughCollisions(oPlatform1);

if(place_meeting(x+hsp, y, oGround))
{
	var p = sign(hsp);
	while(!place_meeting(x+p, y, oGround)) x += p;
	hsp = 0; hsp_frac = 0;
}

x += hsp;

if(place_meeting(x, y+vsp, oGround))
{
	var p = sign(vsp);
	while(!place_meeting(x, y+p, oGround)) y += p;
	//animation if you collide with the ground at a high velocity
	if(vsp >= 38) yscale = landScale;
	vsp = 0; vsp_frac = 0;
}

y += vsp;

onGround = place_meeting(x, y+1, oGround) || (place_meeting(x, y+1, oPlatform1) && !place_meeting(x, y, oPlatform1));
if(onGround) { extraJump = true; bonusJump = 0; boosted = false; jumpBuffer = 5; }

var g = instance_place(x, y+1, oGround);
if(g != noone && g.object_index == oSpring)
{
	//yscale = jumpScale;
	sound(snd_bounce); vsp = -g.bounce; boosted = true;
	g.image_index = 1; g.alarm[0] = 15;
}