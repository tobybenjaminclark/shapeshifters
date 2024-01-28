
/* If there is a queued room */
if(global.queued_room != -1)
{
	room_goto(global.queued_room);
	global.queued_room = -1;
}

/* If transitioning to a new room */
if(transitioning)
{
	step += 1;
	
	shake_fx = layer_get_fx("ShakeLayer");
	fx_set_parameter(shake_fx, "g_TwistBlurIntensity", 0.2 * modified_logistic_curve(step / 20));
	
	if(step >= 20)
	{
		room_goto(next_room);
		transitioning = false;
		slowing = true;
	}
}

/* If transitioned to a new room, and slowing effect */
else if(slowing)
{
	shake_fx = layer_get_fx("ShakeLayer");
	step -= 1;

	fx_set_parameter(shake_fx, "g_TwistBlurIntensity", 0.2 * (modified_logistic_curve(step / 20)));

	if(step <= 0)
	{
		transitioning = false;
		slowing = false;
	}
}

/* If not transitioning, ensure ShakeLayer isn't acting */
else
{
	step = 0;
	transitioning = false;
	slowing = false;
	fx_set_parameter(shake_fx, "g_TwistBlurIntensity", 0);
}


