/area/test_area/general
	icon_state = "blue"

/area/test_area/powered_non_dynamic_lighting
	name = "\improper Test Area - Powered - Non-Dynamic Lighting"
	icon_state = "green"
	requires_power = FALSE
	dynamic_lighting = FALSE

/area/test_area/requires_power_non_dynamic_lighting
	name = "\improper Test Area - Requires Power - Non-Dynamic Lighting"
	icon_state = "red"
	requires_power = TRUE
	dynamic_lighting = FALSE

/area/test_area/powered_dynamic_lighting
	name = "\improper Test Area - Powered - Dynamic Lighting"
	icon_state = "yellow"
	requires_power = FALSE
	dynamic_lighting = TRUE

/area/test_area/requires_power_dynamic_lighting
	name = "\improper Test Area - Requires Power - Dynamic Lighting"
	icon_state = "purple"
	requires_power = TRUE
	dynamic_lighting = TRUE

/area/test_area/edge_of_map
	name = "Edge of Map - Only map space turfs here"