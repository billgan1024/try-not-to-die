function updateActiveRegion(cx, cy, w, h, reset) 
{
	//activates a certain region of the level
	instance_deactivate_layer("Enemies");
	instance_deactivate_layer("Ground");
	instance_activate_region(cx, cy, w, h, true);
	if(reset)
	{
		with(oBullet) instance_destroy();
		with(oSpike) path_position = 0;
		with(oSpikeBig) { path_position = 0; }
		with(oHmovingPlatform) { x = xstart; y = ystart; platDir = platDirStart; }
		with(oVmovingPlatform) { x = xstart; y = ystart; platDir = platDirStart; }
		//initial delay is constant
		with(oBulletCannon) { alarm[0] = 30; alarm[1] = -1; image_index = 0; }
		with(oLaserCannon) { alarm[0] = 30; image_index = 0; image_angle = angle; cannonState = 0; }
		with(oUnstablePlatform)
		{ 
			unstable = false; image_xscale = 1; image_alpha = 1; 
			image_index = 0; mask_index = sPlatform2; 
		}
	}
}