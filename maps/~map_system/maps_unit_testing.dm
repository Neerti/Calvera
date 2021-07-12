/datum/map
	/// Flag to designate that no APC should exist in an area.
	var/const/NO_APC = 1
	/// Flag to designate that no air vents should exist in an area.
	var/const/NO_VENT = 2
	/// Flag to designate that no scrubbers should exist in an area.
	var/const/NO_SCRUBBER = 4

	/// Combines NO_VENT, and NO_SCRUBBER.
	var/const/NO_ATMOS = NO_VENT|NO_SCRUBBER

	/// Combines NO_APC, NO_VENT, and NO_SCRUBBER.
	var/const/NO_MACHINES = NO_APC|NO_VENT|NO_SCRUBBER

	/**
	Assoc list of areas that are exempt from having certain machines, such as APCs, air vents, or scrubbers. 
	Format is `/area/foo = NO_SCRUBBER|NO_VENT|NO_APC`.
	*/
	var/list/machinery_test_exempt_areas = list(
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC
	)

	var/list/area_coherency_test_exempt_areas = list(
		/area/space
	)
	var/list/area_coherency_test_exempted_root_areas = list()
	var/list/area_coherency_test_subarea_count = list()

	// These areas are used specifically by code and need to be broken out somehow
	var/list/area_usage_test_exempted_areas = list(
//		/area/ship,
//		/area/hallway,
//		/area/maintenance,
		/area/overmap,
		/area/shuttle,
		/area/turbolift,
		/area/template_noop
	)

	var/list/area_usage_test_exempted_root_areas = list(
//		/area/map_template,
//		/area/exoplanet,
		/area/submap
	)

	var/list/area_purity_test_exempt_areas = list()