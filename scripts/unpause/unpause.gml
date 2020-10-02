function unpause() {
	with(button1) { instance_destroy(); } button1 = noone;
	with(button2) { instance_destroy(); } button2 = noone;
	with(button3) { instance_destroy(); } button3 = noone;

	instance_activate_all(); layer_set_visible("Tiles", true);
	part_system_automatic_draw(global.ps_above, true); part_system_automatic_update(global.ps_above, true);
	part_system_automatic_draw(global.ps_below, true); part_system_automatic_update(global.ps_below, true);
	part_system_automatic_draw(0, true); part_system_automatic_update(0, true);
	part_system_automatic_draw(1, true); part_system_automatic_update(1, true);


}
