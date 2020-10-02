function explode(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
	ww = sprite_get_width(sprite_index);
	hh = sprite_get_height(sprite_index);


	/* Get sprite offset
	This is used to make sure that the particles being
	created are ALWAYS aligned with the the sprite
	*/
	xoff = sprite_get_xoffset(sprite_index);
	yoff = sprite_get_yoffset(sprite_index);


	// Create the particle
	for (i = 0; i < ww; i += argument4) {
	    for (j = 0; j < hh; j += argument4) {
	        particle = instance_create_layer((x - xoff) + i, (y - yoff) + j, "Player", obj_particle);  // Create the particle
	        particle.spr = sprite_index;                                                    // Set the sprite
	        particle.size = irandom_range(argument4, argument5);                            // Give it a random size inside a range
	        particle.max_life = argument0;                                                  // Setup life variables
	        particle.min_life = argument1;                                                  // Determines how long the particle is alive
	        particle.min_speed = argument2;                                                 // Setup speed variable
	        particle.max_speed = argument3;                                                 // Determines how fast the particle moves
	        particle.spin = argument6;                                                      // Rotate the sprite
	        particle.fade = argument7;                                                      // TRUE OR FALSE! to fade or not to fade, that is the question.
	        particle.fade_amt = argument8;                                                  // How fast to fade the particle
	        particle.fade_to_color = argument9;                                             // TRUE OR FALSE! fade to a different color
	        particle.end_color = argument10;                                                // What color do you want to fade to?
	        particle.color_fader = argument11;                                              // How fast do you want to fade
	        particle.implode = argument12;                                                  // TRUE OR FALSE! 
	        particle.center_x = x;                                                          // Center of sprite
	        particle.center_y = y;                                                          // Center of sprite
	        particle.xx = i;                                                                // X
	        particle.yy = j;                                                                // Y
	    }
	}



}
