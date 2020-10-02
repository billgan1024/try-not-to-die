function menuview() {
	camera_set_view_pos(view_camera[0], global.gs*2560, 0);
	instance_deactivate_layer("Menu");
	instance_activate_region(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 2560, 1440, true);


}
