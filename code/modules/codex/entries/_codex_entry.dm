/datum/codex_entry
	var/name = null
	var/list/associated_strings = null
	var/list/associated_paths = null
	var/lore_text = null
	var/mechanics_text = null
	var/antag_text = null

/datum/codex_entry/dd_SortValue()
	return name

/datum/codex_entry/New(var/_display_name, var/list/_associated_paths, var/list/_associated_strings, var/_lore_text, var/_mechanics_text, var/_antag_text)

	if(_display_name)       name =               _display_name
	if(_associated_paths)   associated_paths =   _associated_paths
	if(_associated_strings) associated_strings = _associated_strings
	if(_lore_text)          lore_text =          _lore_text
	if(_mechanics_text)     mechanics_text =     _mechanics_text
	if(_antag_text)         antag_text =         _antag_text

	if(associated_paths && associated_paths.len)
		for(var/tpath in associated_paths)
			var/atom/thing = tpath
			LAZYADD(associated_strings, sanitize(lowertext(initial(thing.name))))
	if(name)
		LAZYADD(associated_strings, name)
	else if(associated_strings && associated_strings.len)
		name = associated_strings[1]
	..()

/datum/codex_entry/proc/get_header(var/mob/presenting_to)
	var/list/dat = list()
	var/datum/codex_entry/linked_entry = SScodex.get_entry_by_string("nexus")
	dat += href(SScodex, list("show_examined_info" = linked_entry, "show_to" = presenting_to), "Home")
	dat += href(presenting_to?.client, list("codex_search" = 1), "Search Codex")
	dat += href(presenting_to?.client, list("codex_index" = 1), "List All Entries")
	dat += "<hr><h2>[capitalize(name)]</h2>"
	return jointext(dat, null)

/datum/codex_entry/proc/get_text(var/mob/presenting_to)
	var/list/dat = list(get_header(presenting_to))
	if(mechanics_text)
		dat += "<font color='[CODEX_COLOR_MECHANICS]'>[mechanics_text]</font>"
//	if(antag_text && presenting_to?.mind && player_is_antag(presenting_to.mind))
	if(antag_text) // If the Codex is to replace an external wiki, all of its information needs to be accessible to anyone at any time, or it is a downgrade.
		dat += "<h3>Antagonist Information</h3>"
		dat += "<font color='[CODEX_COLOR_ANTAG]'>[antag_text]</font>"
	if(lore_text)
		dat += "<h3>Lore Information</h3>"
		dat += "<font color='[CODEX_COLOR_LORE]'>[lore_text]</font>"
	return jointext(dat, null)
