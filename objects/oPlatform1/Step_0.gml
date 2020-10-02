if(image_alpha < 1) image_alpha += 0.1;
switch(object_index)
{
	case oHmovingPlatform:
		hsp = platDir * moveSpeed;
		if(place_meeting(x+hsp, y, oInvis))
		{
			var p = sign(hsp);
			while(!place_meeting(x+p, y, oInvis)) x += p;
			platDir *= -1;
		}
		
		with(oPlayer)
		{
			if(place_meeting(x, y+1, other) && !place_meeting(x, y, other))
			{
				/*if(place_meeting(x+other.hsp, y, oGround))
				{
					var p = sign(other.hsp);
					while(!place_meeting(x+p, y, oGround)) x += p;
				}
				else */x += other.hsp;
				//other.image_index = 1;
			}
			//else other.image_index = 0;
		}
		x += hsp;
	break;
	
	case oVmovingPlatform:
		vsp = platDir * moveSpeed;
		if(place_meeting(x, y+vsp, oInvis))
		{
			var p = sign(vsp);
			while(!place_meeting(x, y+p, oInvis)) y += p;
			platDir *= -1;
		}
		
		with(oPlayer)
		{
			if(place_meeting(x, y+abs(other.vsp), other) && !place_meeting(x, y, other))
			{
				/*if(place_meeting(x, y+other.vsp, oGround))
				{
					var p = sign(other.vsp);
					while(!place_meeting(x, y+p, oGround)) y += p;
					if(p == -1) death();
				}
				else */y += other.vsp; bonusJump = max(-other.vsp/2, 0);
			}
		}
		
		y += vsp;
	break;
	
	case oUnstablePlatform:
		with(oPlayer)
		{
			if(place_meeting(x, y+1, other) && !place_meeting(x, y, other))
			{
				if(other.image_index == 0)
				{
					sound(snd_unstable);
					other.image_index = 1; other.alarm[0] = 30;
				}
			}
			//else other.image_index = 0;
		}
	break;
}