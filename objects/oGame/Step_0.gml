//cameraX, cameraY: the camera position if the standard (static) camera was used
//xleft, xright, ytop, ybot: the clamping of the camera view
if(instance_exists(oPlayer))
{
	cameraX = floor(oPlayer.x/2560)*2560;
	cameraY = floor(oPlayer.y/1440)*1440;
	//update and clamp camera
}

if(lx != cameraX || ly != cameraY)
{
	//xx, yy = grid representation of current view in room
	//update bounding rectangle if necessary (no bound = fixed view, bounded = view can move around)
	
	var oldBounded = (xright-xleft) > 0 || (ybot-ytop) > 0;
	var xx = cameraX/2560, yy = cameraY/1440;
	xleft = xx; xright = xx; ytop = yy; ybot = yy;
	if(global.cameraData[roomName][yy][xx])
	{
		while(xleft-1 >= 0 && global.cameraData[roomName][yy][xleft-1]) xleft--;
		while(xright+1 < xMax && global.cameraData[roomName][yy][xright+1]) xright++;
		//while(ytop-1 >= 0 && global.cameraData[roomName][ytop-1][xx]) ytop--;
		//while(ybot+1 < yMax && global.cameraData[roomName][ybot+1][xx]) ybot++;
	}
	var newBounded = (xright-xleft) > 0 || (ybot-ytop) > 0;
	//show_debug_message(string(xleft) + sp + string(xright) + sp + string(ytop) + sp + string(ybot));
	//update camera and active instances if the view type changes from static to dynamic, or vice versa
	if((oldBounded ^ newBounded) || (!oldBounded && !newBounded) || cameraY != ly) 
	{
		//shift the camera in the direction of the new view region
		var hShift = cameraX-lx, vShift = cameraY-ly;
		updateActiveRegion(xleft*2560, ytop*1440, (xright-xleft+1)*2560, (ybot-ytop+1)*1440, true);
		if(lx != -1) camera_set_view_pos(view_camera[0], vx+hShift, vy+vShift);
		else camera_set_view_pos(view_camera[0], cameraX, cameraY);
	}
	lx = cameraX;
	ly = cameraY;
}
if(instance_exists(oPlayer))
{
	targetX = clamp(oPlayer.followX - 1280, xleft*2560, xright*2560);
	targetY = clamp(oPlayer.followY - 720, ytop*1440, ybot*1440)
}
camera_set_view_pos(view_camera[0], smooth_approach(vx, targetX, cameraSpd), smooth_approach(vy, targetY, cameraSpd));