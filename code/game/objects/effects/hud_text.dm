// Text that is shown to a specific player on their HUD.

/obj/effect/overlay/text
	layer = LAYER_HUD_ABOVE
	plane = PLANE_PLAYER_HUD
	appearance_flags = APPEARANCE_UI_IGNORE_ALPHA
	alpha = 0
//	maptext_height = 64
//	maptext_width = 512
	maptext_height = WORLD_ICON_SIZE * 2
	maptext_width = WORLD_ICON_SIZE * 13
	screen_loc = "LEFT+1,BOTTOM+2" // TODO

	/// Holds a reference to the client that this object is showing to. Used for cleanup.
	var/client/my_client = null

	/// Stylesheet to apply to the text.
	var/style = "font-family: 'Fixedsys'; -dm-text-outline: 1 black; font-size: 11px;"

	/// Holds the text that will be shown to the client. Use `set_text()` to modify this.
	var/text_to_display = null
	
	/// If true, the text inputted will be ALL UPPERCASE.
	var/force_uppercase = FALSE

	/// How long to have the text remain after the animations are done. If zero, it lasts until manually deleted.
	var/text_duration = 3 SECONDS

	var/fade_in_delay = 0.5 SECONDS
	var/fade_out_delay = 0.5 SECONDS

/obj/effect/overlay/text/Initialize(mapload, client/C, new_text)
	if(!C)
		return INITIALIZE_HINT_QDEL
	my_client = C
	my_client.screen += src
	if(fade_in_delay)
		animate(src, alpha = 255, time = fade_in_delay)
	if(new_text)
		set_text(new_text)
	if(text_duration)
		addtimer(CALLBACK(src, .proc/fade_away, fade_out_delay), text_duration)
	return ..()

/obj/effect/overlay/text/Destroy()
	if(my_client)
		my_client.screen -= src
		my_client = null
	return ..()

/obj/effect/overlay/text/proc/fade_away(fade_time = 1 SECOND)
	animate(src, alpha = 0, time = fade_time)
	sleep(fade_time)
	qdel(src)

/obj/effect/overlay/text/proc/set_text(new_text)
	text_to_display = new_text
	if(force_uppercase)
		text_to_display = uppertext(text_to_display)
	update_maptext()

/obj/effect/overlay/text/proc/update_maptext()
	maptext = "<span style=\"[style]\">[text_to_display] </span>"

/obj/effect/overlay/text/typing
	var/typing_delay = 1

/obj/effect/overlay/text/typing/update_maptext()
	for(var/i = 1 to length(text_to_display)+1)
		maptext = "<span style=\"[style]\">[copytext(text_to_display,1,i)] </span>"
		sleep(typing_delay)

/obj/effect/overlay/text/per_line
	maptext_height = WORLD_ICON_SIZE * 15
	var/line_delay = 0.2 SECONDS

/obj/effect/overlay/text/set_text(new_text)
	new_text = replacetext(new_text, "\n", "<br>")
	..()

/obj/effect/overlay/text/per_line/update_maptext()
	var/list/lines = splittext(text_to_display, "<br>")
	for(var/i = 1 to lines.len)
		maptext = "<span style=\"[style]\">[lines.Join("<br>",1, i + 1)] </span>"
	//	maptext_y += 15
//		maptext_height += 16
		sleep(line_delay)

/client/verb/test_text(new_text as text)
	set name = "Test HUD Text"
	var/obj/effect/overlay/text/T = new(null, src, new_text)

/client/verb/test_typing_text(new_text as text)
	set name = "Test Typing HUD Text"
	var/obj/effect/overlay/text/typing/T = new(null, src, new_text)

/client/verb/test_per_line_text(new_text as message)
	set name = "Test Per Line HUD Text"
	var/obj/effect/overlay/text/per_line/T = new(null, src, new_text)

/*

/proc/show_location_blurb(client/C, duration)
	set waitfor = 0

	if(!C)
		return

	var/location_name = station_name()

//	var/obj/effect/overmap/visitable/V = C.mob.get_owning_overmap_object()
//	if(istype(V))
//		location_name = V.name

	var/style = "font-family: 'Fixedsys'; -dm-text-outline: 1 black; font-size: 11px;"
	var/area/A = get_area(C.mob)
	var/text = "[stationdate2text()], [stationtime2text()]\n[location_name], [A.name]"
	text = uppertext(text)

	var/obj/effect/overlay/T = new()
	T.maptext_height = 64
	T.maptext_width = 512
	T.layer = LAYER_HUD_ABOVE
	T.plane = PLANE_PLAYER_HUD

	T.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA
	T.screen_loc = "LEFT+1,BOTTOM+2"

	C.screen += T
	animate(T, alpha = 255, time = 10)
	for(var/i = 1 to length(text)+1)
		T.maptext = "<span style=\"[style]\">[copytext(text,1,i)] </span>"
		sleep(1)

	addtimer(CALLBACK(GLOBAL_PROC, .proc/fade_location_blurb, C, T), duration)

/proc/fade_location_blurb(client/C, obj/T)
	animate(T, alpha = 0, time = 5)
	sleep(5)
	C.screen -= T
	qdel(T)

/client/verb/show_location_blurb()
	set name = "Test Location Blurb"
	set desc = "Makes the location blurb effect show up any time."

	INVOKE_ASYNC(GLOBAL_PROC, .proc/show_location_blurb, src, 30)
*/