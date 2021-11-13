/// Materials that involve metals, such as steel, gold, silver, etc.
/decl/material/solid/metal
	construction_difficulty = MATERIAL_DIFFICULTY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
//	removed_by_welder = TRUE
//	wall_name = "bulkhead"
	weight = MATERIAL_WEIGHT_HEAVY
	hardness = MATERIAL_HARDNESS_RIGID
//	wall_support_value = MATERIAL_WEIGHT_HEAVY
//	default_solid_form = /obj/item/stack/legacy_material2/ingot

/// Generally the 'default' material.
/decl/material/solid/metal/steel
	name = "steel"
	lore_text = "A strong, flexible alloy of iron and carbon, it has become a ubiquitous substance in human space."
	mechanics_text = "Steel is commonly used for building solid structures and objects."
	weight = DEFAULT_MATERIAL_WEIGHT
	hardness = DEFAULT_MATERIAL_HARDNESS
	construction_difficulty = MATERIAL_DIFFICULTY_EASY
	integrity = 150
	color = COLOR_STEEL
	value = 1.1
	//default_solid_form = /obj/item/stack/legacy_material/sheet

/*
/decl/material/solid/metal/steel
	name = "steel"
	uid = "solid_steel"
	lore_text = "A strong, flexible alloy of iron and carbon. Probably the single most fundamentally useful and ubiquitous substance in human space."
	weight = MAT_VALUE_NORMAL
	wall_support_value = MAT_VALUE_VERY_HEAVY // Ideal construction material.
	integrity = 150
	brute_armor = 5
	icon_base = 'icons/turf/walls/solid.dmi'
	icon_reinf = 'icons/turf/walls/reinforced.dmi'
	wall_flags = PAINT_PAINTABLE|PAINT_STRIPABLE|WALL_HAS_EDGES
	use_reinf_state = null
	color = COLOR_STEEL
	hitsound = 'sound/weapons/smash.ogg'
	construction_difficulty = MAT_VALUE_NORMAL_DIY
	value = 1.1
	dissolves_into = list(
		/decl/material/solid/metal/iron = 0.98,
		/decl/material/solid/carbon = 0.02
	)
	default_solid_form = /obj/item/stack/legacy_material/sheet
*/

/decl/material/solid/metal/iron
	name = "iron"
	symbol = "Fe"
	lore_text = "A ubiquitous, very common metal. The epitaph of stars and the primary ingredient in Earth's core."
	color = "#5c5454"
	construction_difficulty = MATERIAL_DIFFICULTY_EASY
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	taste_description = "metal"
/*
/decl/material/solid/metal/iron
	name = "iron"
	uid = "solid_iron"
	lore_text = "A ubiquitous, very common metal. The epitaph of stars and the primary ingredient in Earth's core."
	color = "#5c5454"
	hitsound = 'sound/weapons/smash.ogg'
	construction_difficulty = MAT_VALUE_NORMAL_DIY
	reflectiveness = MAT_VALUE_MATTE
	taste_description = "metal"
*/

/decl/material/solid/metal/uranium
	name = "uranium"
	lore_text = "A silvery-white metallic chemical element in the actinide series, weakly radioactive. \
	Commonly used as fuel in fission reactors."
	mechanics_text = "Uranium ingots are used as fuel in some forms of portable generators.\
	Objects made from uranium will also be radioactive."
	antag_text = "Most things made from this will emit radiation, proportional to its mass."
	symbol = "U"
	taste_description = "the inside of a reactor"
	radioactivity = 12
	color = "#007A00" // In real life it's a silvery gray color but it's been green forever ingame.

	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	value = 1.5
	density = 19.1
	high_energy_transition_temperature = 1405
//	high_energy_transition_material = /decl/material/liquid/uranium
//	default_solid_form = /obj/item/stack/legacy_material2/puck

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
	default_solid_form = /obj/item/stack/legacy_material/puck
// Polaris
/datum/material/uranium
	name = "uranium"
	stack_type = /obj/item/stack/legacy_material/uranium
	radioactivity = 12
	icon_base = "stone"
	icon_reinf = "reinf_stone"
	icon_colour = "#007A00"
	weight = 22
	stack_origin_tech = list(TECH_MATERIAL = 5)
	door_icon_base = "stone"
	supply_conversion_value = 2
*/


/decl/material/solid/metal/gold
	name = "gold"
	adjective_name = "golden"
	symbol = "Au"
	lore_text = "A heavy, soft, ductile metal. \
	Once considered valuable enough to back entire currencies, now predominantly used in corrosion-resistant electronics."
	mechanics_text = "Gold is used in the fabrication of advanced electronics."
	color = "#EDD12F"
	integrity = 100
	value = 1.6
	hardness = MATERIAL_HARDNESS_NORMAL
	high_energy_transition_temperature = 1337 // This is really what it is.
	density = 19.30

/*
// Nebula
/decl/material/solid/metal/gold
	name = "gold"
	uid = "solid_gold"
	lore_text = "A heavy, soft, ductile metal. Once considered valuable enough to back entire currencies, now predominantly used in corrosion-resistant electronics."
	color = COLOR_GOLD
	hardness = MAT_VALUE_FLEXIBLE + 5
	integrity = 100
	stack_origin_tech = "{'materials':4}"
	ore_result_amount = 5
	ore_name = "native gold"
	ore_spread_chance = 10
	ore_scan_icon = "mineral_uncommon"
	ore_icon_overlay = "nugget"
	value = 1.6
	sparse_material_weight = 8
	rich_material_weight = 10
	ore_type_value = ORE_PRECIOUS
	ore_data_value = 2

// Polaris
/datum/legacy_material/gold
	name = "gold"
	stack_type = /obj/item/stack/legacy_material/gold
	icon_colour = "#EDD12F"
	weight = 24
	hardness = 40
	conductivity = 41
	stack_origin_tech = list(TECH_MATERIAL = 4)
	sheet_singular_name = "ingot"
	sheet_plural_name = "ingots"
	supply_conversion_value = 2
*/
