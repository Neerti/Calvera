/datum/event2/meta/prison_break/brig
	name = "prison break - brig"
	departments = list(DEPARTMENT_SECURITY, DEPARTMENT_SYNTHETIC)
	event_type = /datum/event2/event/prison_break/brig

/datum/event2/meta/prison_break/brig/get_odds_from_trapped_mobs()
	. = 0
	for(var/mob/living/L in player_list)
		if(is_mob_in_relevant_area(L))
			// Don't count them if they're in security.
			if(!(L in metric.count_people_in_department(DEPARTMENT_SECURITY)))
				. += 40


/datum/event2/meta/prison_break/armory
	name = "prison break - armory"
	departments = list(DEPARTMENT_SECURITY, DEPARTMENT_SYNTHETIC)
	chaos = 40 // Potentially free guns.
	chaotic_threshold = EVENT_CHAOS_THRESHOLD_MEDIUM_IMPACT
	event_type = /datum/event2/event/prison_break/armory

/datum/event2/meta/prison_break/bridge
	name = "prison break - bridge"
	departments = list(DEPARTMENT_COMMAND, DEPARTMENT_SYNTHETIC)
	chaos = 40 // Potentially free spare ID.
	chaotic_threshold = EVENT_CHAOS_THRESHOLD_MEDIUM_IMPACT
	event_type = /datum/event2/event/prison_break/bridge

/datum/event2/event/prison_break/bridge
	area_types_to_break = list(
		/area/bridge,
		/area/crew_quarters/heads/sc/sd
	)

/datum/event2/meta/prison_break/xenobio
	name = "prison break - xenobio"
	departments = list(DEPARTMENT_RESEARCH, DEPARTMENT_SYNTHETIC)
	chaos = 20 // This one is more likely to actually kill someone.
	chaotic_threshold = EVENT_CHAOS_THRESHOLD_MEDIUM_IMPACT
	event_type = /datum/event2/event/prison_break/xenobio
	relevant_areas = list(/area/rnd/xenobiology)
	irrelevant_areas = list(
		/area/rnd/xenobiology/xenoflora,
		/area/rnd/xenobiology/xenoflora_isolation
	)


/datum/event2/meta/prison_break/xenobio/get_odds_from_trapped_mobs()
	. = 0
	for(var/mob/living/simple_mob/slime/xenobio/X in living_mob_list)
		if(is_mob_in_relevant_area(X))
			. += 5


/datum/event2/event/prison_break/xenobio
	area_types_to_ignore = list(
		/area/rnd/xenobiology/xenoflora,
		/area/rnd/xenobiology/xenoflora_isolation
	)
	ignore_blast_doors = TRUE // Needed to avoid a breach.
	

/datum/event2/meta/prison_break/brig
	relevant_areas = list(
		/area/security/prison,
		/area/security/security_cell_hallway,
		/area/security/security_processing
	)


/datum/event2/meta/prison_break/virology
	name = "prison break - virology"
	departments = list(DEPARTMENT_MEDICAL, DEPARTMENT_SYNTHETIC)
	event_type = /datum/event2/event/prison_break/virology
	relevant_areas = list(
		/area/medical/virology
	)

/datum/event2/meta/prison_break/virology/get_odds_from_trapped_mobs()
	. = 0
	for(var/mob/living/L in player_list)
		if(is_mob_in_relevant_area(L))
			// Don't count them if they're in medical.
			if(!(L in metric.count_people_in_department(DEPARTMENT_MEDICAL)))
				. += 40

/datum/event2/event/blob
	excluded = list(
		/area/submap,
		/area/shuttle,
		/area/crew_quarters,
		/area/holodeck,
		/area/engineering/engine_room
	)