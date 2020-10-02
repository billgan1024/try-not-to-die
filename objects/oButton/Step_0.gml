if(lvl != 0) text = "Level " + string(lvl);

if(showSfx) text = global.sfx ? "Sound FX: On" : "Sound FX: Off";
if(showMus) text = global.mus ? "Music: On" : "Music: Off";
if(showFs) text = window_get_fullscreen() ? "Fullscreen: On" : "Fullscreen: Off";
if(showShift) text = global.shift ? "Toggle Dash: On" : "Toggle Dash: Off";

if(locked) image_alpha = 0.5; 
else 
{
	image_alpha = 1;

	if(mouse_over())
	{
		if(!held) image_index = 1;
		if(mouse_check_button_pressed(mb_left)) { held = true; image_index = 2; }
		if(mouse_check_button_released(mb_left) && held)
		{
			held = false; sound(snd_release);
			button();
		}
		if(load) alpha = approach(alpha, 1, 0.1);
	}
	else
	{
		held = false; image_index = 0; alpha = approach(alpha, 0, 0.1);
	}
}