/decl/material/solid/metal/plasteel
	name = "plasteel"
	uid = "solid_plasteel"
//	lore_text = "An alloy of steel and platinum. When regular high-tensile steel isn't tough enough to get the job done, the smart consumer turns to frankly absurd alloys of steel and platinum."
	lore_text = "An alloy of steel and platinum. At the cost of increased weight, the alloy is much more resilient compared to steel or titanium individually."
	integrity = 400
	hardness = MATERIAL_HARDNESS_VERY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
//	melting_point = 6000
//	icon_base = 'icons/turf/walls/solid.dmi'
//	icon_reinf = 'icons/turf/walls/reinforced.dmi'
//	wall_flags = PAINT_PAINTABLE|PAINT_STRIPABLE|WALL_HAS_EDGES
//	use_reinf_state = null
	color = "#a8a9b2"
//	explosion_resistance = 25
//	brute_armor = 8
//	burn_armor = 10

	value = 1.4
	default_solid_form = /obj/item/stack/material/reinforced

/// Very rare alloy that is reflective, should be used sparingly.
/decl/material/solid/metal/durasteel
	name = "durasteel"
	lore_text = "Durasteel is a combination of steel, platinum, and diamond. \
	The result is an alloy that is very strong, very reflective, and very expensive."
	integrity = 600
	hardness = MATERIAL_HARDNESS_EXTREMELY_HARD
	weight = MATERIAL_WEIGHT_VERY_HEAVY
	reflectiveness = MATERIAL_REFLECTIVITY_MIRROR // Not a perfect mirror, but close.
	color = "#6ea7be"
	value = 1.8

/*
// Very rare alloy that is reflective, should be used sparingly.
/datum/legacy_material/durasteel
	name = "durasteel"
	stack_type = /obj/item/stack/legacy_material/durasteel
	integrity = 600
	melting_point = 7000
	icon_base = "metal"
	icon_reinf = "reinf_metal"
	icon_colour = "#6EA7BE"
	explosion_resistance = 75
	hardness = 100
	weight = 28
	protectiveness = 60 // 75%
	reflectivity = 0.7 // Not a perfect mirror, but close.
	stack_origin_tech = list(TECH_MATERIAL = 8)
	composite_material = list("plasteel" = SHEET_MATERIAL_AMOUNT, "diamond" = SHEET_MATERIAL_AMOUNT) //shrug
	supply_conversion_value = 9
*/


/decl/material/solid/metal/bronze
	name = "bronze"
	uid = "solid_bronze"
//	lore_text = "An alloy of copper and tin. Once used in weapons and laboring tools."
	lore_text = "An alloy of copper and tin. The first alloy to be used by humanity."
	symbol = "CuSn"
	color = "#ccbc63"
	hardness = MATERIAL_HARDNESS_RIGID + 10
	value = 1.2
	default_solid_form = /obj/item/stack/material/sheet

/decl/material/solid/metal/blackbronze
	name = "black bronze"
	uid = "solid_black_bronze"
	symbol = "CuAg"
	lore_text = "An alloy of copper and silver. Used in ancient ceremonial gear."
	color = "#3f352a"
	hardness = MATERIAL_HARDNESS_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	value = 1.4

/decl/material/solid/metal/redgold
	name = "red gold"
	uid = "solid_red_gold"
	symbol = "AuCu"
	lore_text = "An alloy of copper and gold. A soft metal used for its ornamental properties."
	color = "#ff7a59"
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
	value = 1.4

/decl/material/solid/metal/brass
	name = "brass"
	uid = "solid_brass"
	symbol = "CuZn"
	lore_text = "An alloy of copper and zinc. Renowned for its golden color."
	color = "#dab900"
	reflectiveness = MATERIAL_REFLECTIVITY_VERY_SHINY
	value = 1.2
	default_solid_form = /obj/item/stack/material/sheet

/decl/material/solid/metal/stainlesssteel
	name = "stainless steel"
	uid = "solid_stainless_steel"
	lore_text = "A reflective alloy of steel and chromium. Used for its reflective and sturdy properties."
	integrity = 175
	color = "#a5a5a5"
	construction_difficulty = MATERIAL_DIFFICULTY_VERY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_MIRROR
	value = 1.3