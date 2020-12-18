if(visible)
{
	visible = false; 
	ds_stack_push(oPersistent.collectedCoins, id); oGame.cnt++;
	audio_stop_sound(snd_coin); sound(snd_coin); 
	var e = part_type_create();
	part_type_sprite(e, sCoin, false, false, false);
	part_type_alpha2(e, 1, 0);
	part_type_speed(e, 10, 10, -0.5, 0);
	part_type_orientation(e, image_angle, image_angle, -2, 0, false);
	part_type_life(e, 15, 15);
	part_type_direction(e, 90, 90, 0, false);
	part_particles_create(global.ps_above, x, y, e, 1);
}