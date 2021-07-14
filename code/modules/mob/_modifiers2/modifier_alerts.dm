/obj/screen/alert/modifier
	name = "Modifier Name"
	desc = "Modifier Desc"
	var/datum/modifier/modifier = null

/obj/screen/alert/modifier/Destroy()
	modifier = null
	return ..()

/obj/screen/alert/modifier/Click(location, control, params)
	var/list/better_params = params2list(params)
	if(better_params.Find("right")) // Right clicked.
		var/mob/living/L = usr
		if(istype(L))
			L.clear_alert("modifier_[REF(src)]")

	else if(modifier)
		to_chat(usr, SPAN_NOTICE("<b>[modifier.name]</b>"))
		to_chat(usr, SPAN_NOTICE(modifier.desc))
		if(modifier.show_time_left && modifier.predicted_time_to_remove)
			var/time_left = modifier.predicted_time_to_remove - world.time
			to_chat(usr, SPAN_NOTICE(DisplayTimeText(time_left, 1)))