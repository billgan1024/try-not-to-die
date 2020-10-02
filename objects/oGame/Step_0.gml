if(instance_exists(oPlayer))
{
	xx = floor((oPlayer.x+40)/2560)*2560;
	yy = floor((oPlayer.y+40)/1440)*1440;
	/*if(oPlayer.collided)
	{
		alpha1 = approach(alpha1, 0.25, 0.1);
		alpha2 = approach(alpha2, 0.5, 0.2);
	}
	else
	{
		alpha1 = approach(alpha1, 0.5, 0.1);
		alpha2 = approach(alpha2, 1, 0.2);
	}*/
}
/*else
{
	alpha1 = approach(alpha1, 0.5, 0.1);
	alpha2 = approach(alpha2, 1, 0.2);
}*/
camera_set_view_pos(view_camera[0], xx, yy);

if(lx != xx || ly != yy)
{
	instance_deactivate_layer("Enemies");
	instance_deactivate_layer("Ground");
	instance_activate_region(xx, yy, 2560, 1440, true);
	with(oSpike) path_position = 0;
	with(oSpikeBig) { path_position = 0; }
	with(oHmovingPlatform) { x = xstart; y = ystart; platDir = platDirStart; }
	with(oVmovingPlatform) { x = xstart; y = ystart; platDir = platDirStart; }
	with(oUnstablePlatform)
	{ 
		unstable = false; image_xscale = 1; image_alpha = 1; 
		image_index = 0; mask_index = sPlatform2; 
	}
	//with(oPlayer) { vsp = min(vsp, 0); }
}
lx = xx;
ly = yy;