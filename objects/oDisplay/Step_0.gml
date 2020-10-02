t += 1/60;
if(isWaving) y = wave2(ystart-6, ystart+6, 2.5, 0, t);

if(fade)
{
	alpha -= 0.05;
	if(alpha == 0) instance_destroy();
}