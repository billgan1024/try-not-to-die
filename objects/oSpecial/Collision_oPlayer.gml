if(visible)
{
	visible = false; 
	sound(snd_special); 
	ds_stack_push(oPersistent.collectedCoins, id);
	var e = part_type_create();
	part_type_shape(e, pt_shape_ring);
	part_type_colour1(e, make_colour_rgb(85, 0, 102));
	part_type_alpha2(e, 1, 0);
	part_type_size(e, 0, 0, 0.2, 0);
	part_type_life(e, 15, 15);
	part_particles_create(global.ps_above, x, y, e, 1);
}