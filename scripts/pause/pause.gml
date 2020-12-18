function pause() {
	instance_deactivate_all(true); layer_set_visible("Tiles", false); instance_activate_layer("Pause");
	part_system_automatic_draw(global.ps_above, false); part_system_automatic_update(global.ps_above, false);
	part_system_automatic_draw(global.ps_below, false); part_system_automatic_update(global.ps_below, false);
	part_system_automatic_draw(0, false); part_system_automatic_update(0, false);
	part_system_automatic_draw(1, false); part_system_automatic_update(1, false);

	if(global.loaded)
	{
		button1 = instance_create_layer(vx+1120, vy+480, "Pause", oButton);
		button1.text = "Back to Game"; button1.group = state.game;
		//button2 = instance_create_layer(vx+1120, vy+9999, "Pause", oButton);
		//button2.text = "Restart Level"; button2.sprite_index = bGreen; button2.group = state.game;
		button3 = instance_create_layer(vx+1120, vy+640, "Pause", oButton);
		button3.text = "Main Menu"; button3.sprite_index = bRed; button3.group = state.game;
	}
	else
	{
		button1 = instance_create_layer(vx+1120, vy+480, "Pause", oButton);
		button1.text = "Back to Game"; button1.group = state.game;
		button2 = instance_create_layer(vx+1120, vy+640, "Pause", oButton);
		button2.text = "Restart Level"; button2.sprite_index = bGreen; button2.group = state.game;
		button3 = instance_create_layer(vx+1120, vy+800, "Pause", oButton);
		button3.text = "Main Menu"; button3.sprite_index = bRed; button3.group = state.game;
	}
}

function unpause() {
	with(button1) { instance_destroy(); } button1 = noone;
	with(button2) { instance_destroy(); } button2 = noone;
	with(button3) { instance_destroy(); } button3 = noone;

	instance_activate_all(); layer_set_visible("Tiles", true);
	with(oGame)
	{
		updateActiveRegion(xleft*2560, ytop*1440, (xright-xleft+1)*2560, (ybot-ytop+1)*1440, false);
	}
	part_system_automatic_draw(global.ps_above, true); part_system_automatic_update(global.ps_above, true);
	part_system_automatic_draw(global.ps_below, true); part_system_automatic_update(global.ps_below, true);
	part_system_automatic_draw(0, true); part_system_automatic_update(0, true);
	part_system_automatic_draw(1, true); part_system_automatic_update(1, true);
}
