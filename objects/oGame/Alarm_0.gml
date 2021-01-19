sound(snd_respawn); global.deaths++;
while(!ds_stack_empty(oPersistent.collectedCoins))
{
	var c = ds_stack_pop(oPersistent.collectedCoins); 
	if(c.object_index == oCoin) cnt--;
	with(c) 
	{ 
		visible = true; image_alpha = 0;
		if(object_index == oDoor) mask_index = sDoor;
	} 
}
with(oUnstablePlatform)
{
	if(image_xscale == 0) image_alpha = 0; 
	image_xscale = 1; mask_index = sPlatform2; image_index = 0; unstable = false; 
	alarm[0] = -1;
}
instance_create_layer(checkpoint.rx, checkpoint.ry, "Player", oPlayer);
with(oPlayer) image_alpha = 0;