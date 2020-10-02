function center() {
	if(!window_get_fullscreen())
	{
		window_set_size(display_get_height()/3*4, display_get_height()/4*3);
		window_center();
	}


}
