if(image_alpha < 1) image_alpha += 0.1;
if(visible)
{
	if(instance_exists(oPlayer) && point_distance(x, y, oPlayer.x, oPlayer.y) <= 320)
	{
		if(required == 0)
		{
			if(oGame.tot-oGame.cnt == 0)
			{
				sound(snd_doorbreak); 
				ds_stack_push(oPersistent.collectedCoins, id);
				visible = false; mask_index = sNull;
				var e = part_type_create();
				part_type_sprite(e, sDoor, false, false, false);
				part_type_alpha2(e, 1, 0);
				part_type_life(e, 15, 15);
				part_type_size(e, 1, 1, 0.01, 0);
				part_particles_create(global.ps_above, x, y, e, 1);
			}
		}
		else
		{
			if(required-oGame.cnt == 0)
			{
				sound(snd_doorbreak); 
				ds_stack_push(oPersistent.collectedCoins, id);
				visible = false; mask_index = sNull;
				var e = part_type_create();
				part_type_sprite(e, sDoor, false, false, false);
				part_type_alpha2(e, 1, 0);
				part_type_life(e, 15, 15);
				part_type_size(e, 1, 1, 0.01, 0);
				part_particles_create(global.ps_above, x, y, e, 1);
			}	
		}
	}
}