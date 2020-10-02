image_angle -= 4; 
if(image_alpha < alpha) image_alpha += alpha/10;

if(visible)
{
	if(random(1) <= 0.05)
	{
		var e = part_type_create();
		part_type_shape(e, pt_shape_smoke);
		part_type_size(e, 0.2, 0.3, -0.01, 0);
		part_type_color1(e, c_purple);
		part_type_speed(e, 6, 6, -0.2, 0);
		part_type_direction(e, 0, 360, 0, 0);
		part_type_alpha2(e, 1, 0);
		part_particles_create(global.ps_above, x, y, e, 1);
	}
}