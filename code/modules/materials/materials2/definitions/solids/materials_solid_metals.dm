/// Materials that involve metals, such as steel, gold, silver, etc.
/decl/material/solid/metal
	construction_difficulty = MATERIAL_DIFFICULTY_HARD
	reflectiveness = MAT_VALUE_SHINY
//	removed_by_welder = TRUE
//	wall_name = "bulkhead"
	weight = MATERIAL_WEIGHT_HEAVY
	hardness = MATERIAL_HARDNESS_RIGID
//	wall_support_value = MATERIAL_WEIGHT_HEAVY
//	default_solid_form = /obj/item/stack/material2/ingot

/decl/material/solid/metal/uranium
	name = "uranium"
	lore_text = "A silvery-white metallic chemical element in the actinide series, weakly radioactive. \
	Commonly used as fuel in fission reactors."
	mechanics_text = "Uranium ingots are used as fuel in some forms of portable generators."
	symbol = "U"
	taste_description = "the inside of a reactor"
	radioactivity = 12
	color = "#007a00" // In real life it's a silvery gray color but it's been green forever ingame.
	
	reflectiveness = MAT_VALUE_MATTE
	value = 1.5
	density = 19.1
	melting_point = 1405
	vaporization_point = 4404
//	default_solid_form = /obj/item/stack/material2/puck

/*
// Nebula
/decl/material/solid/metal/uranium
	name = "uranium"
	lore_text = "A silvery-white metallic chemical element in the actinide series, weakly radioactive. Commonly used as fuel in fission reactors."
	mechanics_text = "Uranium ingots are used as fuel in some forms of portable generator."
	taste_description = "the inside of a reactor"
	radioactivity = 12
	icon_base = 'icons/turf/walls/stone.dmi'
	table_icon_base = "stone"
	icon_reinf = 'icons/turf/walls/reinforced_stone.dmi'
	color = "#007a00"
	stack_origin_tech = "{'materials':5}"
	reflectiveness = MAT_VALUE_MATTE
	value = 1.5
	default_solid_form = /obj/item/stack/material/puck

// Polaris
/datum/material/uranium
	name = "uranium"
	stack_type = /obj/item/stack/material/uranium
	radioactivity = 12
	icon_base = "stone"
	icon_reinf = "reinf_stone"
	icon_colour = "#007A00"
	weight = 22
	stack_origin_tech = list(TECH_MATERIAL = 5)
	door_icon_base = "stone"
	supply_conversion_value = 2
*/