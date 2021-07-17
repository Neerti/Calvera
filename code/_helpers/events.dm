/proc/get_station_areas(var/list/area/excluded_areas)
	. = list()
	var/list/subtypes = subtypesof(/area)
	for(var/thing in subtypes)
		var/area/A = locate(thing)
		if(istype(A) && (A.z in using_map.station_levels))
			// Check its not excluded
			var/bad_area = FALSE
			for(var/excluded_path in excluded_areas)
				if(istype(A, excluded_path))
					bad_area = TRUE
					break
			if(!bad_area)
				. += A

/** Checks if any living humans are in a given area! */
/proc/is_area_occupied(var/area/myarea)
	// Testing suggests looping over human_mob_list is quicker than looping over area contents
	for(var/mob/living/carbon/human/H in human_mob_list)
		if(H.stat >= DEAD) //Conditions for exclusion here, like if disconnected people start blocking it.
			continue
		var/area/A = get_area(H)
		if(A == myarea) //The loc of a turf is the area it is in.
			return 1
	return 0

// Returns a list of area instances, or a subtypes of them, that are mapped in somewhere.
// Avoid feeding it `/area`, as it will likely cause a lot of lag as it evaluates every single area coded in.
/proc/get_all_existing_areas_of_types(list/area_types)
	. = list()
	for(var/area_type in area_types)
		var/list/types = typesof(area_type)
		for(var/T in types)
			// Test for existance.
			var/area/A = locate(T)
			if(!istype(A) || !A.contents.len) // Empty contents list means it's not on the map.
				continue
			. += A