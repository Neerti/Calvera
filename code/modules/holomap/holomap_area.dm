/*
** Holomap vars and procs on /area
*/

/area
	var/holomap_color = null // Color of this area on station holomap

/area/rnd
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/server
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/assembly
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/bridge
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/teleporter
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/security
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/medical
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/engineering
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/maintenance/substation/engineering
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/storage/tech
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/quartermaster
	holomap_color = HOLOMAP_AREACOLOR_CARGO

/area/hallway
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS

/area/crew_quarters/sleep
	holomap_color = HOLOMAP_AREACOLOR_DORMS


// ### PROCS ###
// Whether the turfs in the area should be drawn onto the "base" holomap.
/area/proc/holomapAlwaysDraw()
	return TRUE
/area/shuttle/holomapAlwaysDraw()
	return FALSE