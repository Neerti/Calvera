/atom/proc/get_codex_value()
	return src

/atom/proc/get_specific_codex_entry()
	if(SScodex.entries_by_path[type])
		return SScodex.entries_by_path[type]

	var/lore = get_lore_info()
	var/mechanics = get_mechanics_info()
	var/antag = get_antag_info()
	if(!lore && !mechanics && !antag)
		return FALSE
		
	var/datum/codex_entry/entry = new(name, list(type), _lore_text = lore, _mechanics_text = mechanics, _antag_text = antag)
	return entry

/atom/proc/get_mechanics_info()
	return

/atom/proc/get_antag_info()
	return

/atom/proc/get_lore_info()
	return

/atom/examine(mob/user, distance, infix = "", suffix = "")
	. = ..()
//	if(user?.get_preference_value(/datum/client_preference/inquisitive_examine) == PREF_ON && user.can_use_codex() && SScodex.get_codex_entry(get_codex_value(user)))
	if(user?.client?.is_preference_enabled(/datum/client_preference/inquisitive_examine))
		if(user.can_use_codex() && SScodex.get_codex_entry(get_codex_value(user)))
		//	to_chat(user, "<span class='notice'>The codex has <b><a href='?src=\ref[SScodex];show_examined_info=\ref[src];show_to=\ref[user]'>relevant information</a></b> available.</span>")
			var/href_text = href(SScodex, list("show_examined_info" = src, "show_to" = user), "relevant information")
			. += SPAN_NOTICE("The codex has <b>[href_text]</b> available.")
