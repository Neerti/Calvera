// A simple HUD element of a bar that visually shrinks as time goes on.
/obj/screen/modifier_duration_bar
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "modifier_duration_bar"
	screen_loc = "LEFT+7,BOTTOM+2:16" // TODO
	color = "#FF0000"
	var/client/my_client = null

	/// How many pixels the bar will be, vertically.
	var/bar_height = 2

	/// How many pixels the bar will be, horizontally.
	var/bar_width = (WORLD_ICON_SIZE * 7) / 2

/obj/screen/modifier_duration_bar/Initialize(mapload, mob/living/new_mob, duration)
	if(!istype(new_mob) || !new_mob.client)
		qdel(src)
		return
	
	my_client = new_mob.client

	adjust_scale(bar_width, bar_height)

	my_client.screen += src

	var/matrix/M = matrix()
	M.Scale(0, bar_height)
	animate(src, transform = M, time = duration)
	QDEL_IN_CLIENT_TIME(src, duration)
	return ..()


/obj/screen/modifier_duration_bar/Destroy()
	my_client = null
	return ..()