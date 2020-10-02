instance_deactivate_layer("Menu");
instance_activate_region(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 2560, 1440, true);
audio_stop_sound(mus_game); music(mus_menu);
