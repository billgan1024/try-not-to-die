if(global.gs == state.game && room != complete)
{
	global.paused = !global.paused;
	if(global.paused) { sound(snd_pause); pause(); }
	else { sound(snd_unpause); unpause(); }
}