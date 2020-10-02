function input() {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W")) || keyboard_check(vk_space);
	key_down = keyboard_check(vk_down) || keyboard_check_pressed(ord("S"));

	if(global.shift)
	{
		if(keyboard_check_pressed(vk_shift)) 
		{
			global.isShifting = !global.isShifting;
			key_shift = global.isShifting;
		}
	}
	else key_shift = keyboard_check(vk_shift);


}
