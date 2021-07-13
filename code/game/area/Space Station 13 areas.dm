/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = "ICON FILENAME" 			(defaults to areas.dmi)
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = 0 				(defaults to 1)
	music = "music/music.ogg"		(defaults to "music/music.ogg")

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/

/*-----------------------------------------------------------------------------*/

/////////
//SPACE//
/////////

/area/space
	name = "\improper Space"
	icon_state = "space"
	requires_power = 1
	always_unpowered = 1
	dynamic_lighting = 0
	has_gravity = 0
	power_light = 0
	power_equip = 0
	power_environ = 0
	base_turf = /turf/space
	ambience = AMBIENCE_SPACE
	flags = AREA_FLAG_IS_NOT_PERSISTENT

/area/space/atmosalert()
	return

/area/space/fire_alert()
	return

/area/space/fire_reset()
	return

/area/space/readyalert()
	return

/area/space/partyalert()
	return

////////////
//SHUTTLES//
////////////
//Shuttles only need starting area, movement is handled by landmarks
//All shuttles should now be under shuttle since we have smooth-wall code.

/area/shuttle
	requires_power = 0
	flags = RAD_SHIELDED | AREA_FLAG_IS_NOT_PERSISTENT
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/space
	forbid_events = TRUE

/area/shuttle/arrival
	name = "\improper Arrival Shuttle"
	ambience = AMBIENCE_ARRIVALS

/area/shuttle/supply
	name = "\improper Supply Shuttle"
	icon_state = "shuttle2"

/area/shuttle/escape
	name = "\improper Emergency Shuttle"
	music = "music/escape.ogg"
