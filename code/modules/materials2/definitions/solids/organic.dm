/decl/material/solid/plastic
	name = "plastic"
	uid = "solid_plastic"
	lore_text = "A generic polymeric material. Probably the most flexible and useful substance ever created by human science; mostly used to make disposable cutlery."
//	flags = MAT_FLAG_BRITTLE
//	icon_base = 'icons/turf/walls/plastic.dmi'
//	icon_reinf = 'icons/turf/walls/reinforced.dmi'
//	wall_flags = 0
//	use_reinf_state = null
	color = COLOR_EGGSHELL
//	door_icon_base = "plastic"
	hardness = MATERIAL_HARDNESS_FLEXIBLE
	weight = MATERIAL_WEIGHT_LIGHT
//	melting_point = T0C+371 //assuming heat resistant plastic
//	stack_origin_tech = "{'materials':3}"
//	conductive = 0
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
//	wall_support_value = MAT_VALUE_EXTREMELY_LIGHT
	taste_description = "plastic"
//	fuel_value = 0.6
//	burn_product = /decl/material/gas/carbon_monoxide // placeholder for more appropriate toxins
//	dooropen_noise = 'sound/effects/doorcreaky.ogg'
	default_solid_form = /obj/item/stack/material/sheet

/decl/material/solid/meat
	name = "meat"
	classification = "Organic"
	color = "#aa0000"
	integrity = 60
	value = 0.8
	hardness = MATERIAL_HARDNESS_SOFT
	weight = MATERIAL_WEIGHT_NORMAL
	reflectiveness = MATERIAL_REFLECTIVITY_DULL
	high_energy_transition_temperature = T0C+300
	default_solid_form = /obj/item/stack/material/slab

/decl/material/solid/meat/cooked
	name = "cooked meat"
	color = "#552d00"

/decl/material/solid/cellulose
	name = "cellulose"

/decl/material/solid/slime
	name = "slime"
	hardness = MATERIAL_HARDNESS_SOFT
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT
	color = "#88aa88"
	heat_of_combustion = 35
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "squished", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "squashed", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "mashed", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "mushed"
	)



/*
// Nebula
/decl/material/solid/meat
	name = "meat"
	uid = "solid_meat"
	color = COLOR_DARK_RED
	flags = MAT_FLAG_PADDING
	ignition_point = T0C+300
	melting_point = T0C+300
	conductive = 1
	hidden_from_codex = TRUE
	construction_difficulty = MAT_VALUE_NORMAL_DIY
	integrity = 60
	hardness = MAT_VALUE_SOFT
	weight = MAT_VALUE_NORMAL
	explosion_resistance = 1
	reflectiveness = MAT_VALUE_DULL
	wall_support_value = MAT_VALUE_LIGHT
	value = 0.8
	default_solid_form = /obj/item/stack/legacy_material/slab
*/

/// Skins are the precursors to leathers, generally obtained by butchering wildlife.
/decl/material/solid/skin
	name = "skin"
	uid = "solid_skin"
	color = "#9e8c72"
//	ignition_point = T0C+300
//	melting_point = T0C+300
//	conductive = 0
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	integrity = 50
	hardness = MATERIAL_HARDNESS_SOFT
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT
	reflectiveness = MATERIAL_REFLECTIVITY_DULL
	value = 1.2
	default_solid_form = /obj/item/stack/material/skin
//	var/tans_to = /decl/material/solid/leather

/decl/material/solid/skin/lizard
	name = "lizardskin"
	uid = "solid_lizardskin"
	color = "#626952"
//	tans_to = /decl/material/solid/leather/lizard
	hardness = MATERIAL_HARDNESS_FLEXIBLE
	weight = MATERIAL_WEIGHT_VERY_LIGHT

/decl/material/solid/skin/insect
	name = "chitin"
	uid = "solid_chitin"
	color = "#7a776d"
//	tans_to = /decl/material/solid/leather/chitin
	integrity = 75
	hardness = MATERIAL_HARDNESS_RIGID
	weight = MATERIAL_WEIGHT_VERY_LIGHT
//	brute_armor = 2

/decl/material/solid/skin/fur
	name = "fur"
	uid = "solid_fur"
	color = "#7a726d"
//	tans_to = /decl/material/solid/leather/fur
	default_solid_form = /obj/item/stack/material/skin/pelt

/decl/material/solid/skin/fur/gray
	uid = "solid_fur_gray"

/decl/material/solid/skin/fur/white
	uid = "solid_fur_white"

/decl/material/solid/skin/fur/orange
	color = COLOR_ORANGE
	uid = "solid_fur_orange"

/decl/material/solid/skin/fur/black
	color = COLOR_GRAY20
	uid = "solid_fur_black"

/decl/material/solid/skin/fur/heavy
	color = COLOR_GUNMETAL
	uid = "solid_fur_heavy"

/decl/material/solid/skin/goat
	color = COLOR_SILVER
	uid = "solid_skin_goat"

/decl/material/solid/skin/cow
	color = COLOR_GRAY40
	uid = "solid_skin_cow"

/decl/material/solid/skin/shark
	name = "sharkskin"
	color = COLOR_PURPLE_GRAY
	uid = "solid_skin_shark"

/decl/material/solid/skin/fish
	color = COLOR_BOTTLE_GREEN
	name = "fishskin"
	uid = "solid_skin_fish"

/decl/material/solid/skin/fish/purple
	color = COLOR_PALE_PURPLE_GRAY
	uid = "solid_skin_carp"

/decl/material/solid/skin/feathers
	name = "feathers"
	uid = "solid_feathers"
	color = COLOR_SILVER
	default_solid_form = /obj/item/stack/material/skin/feathers

/decl/material/solid/skin/feathers/purple
	color = COLOR_PALE_PURPLE_GRAY
	uid = "solid_feathers_purple"

/decl/material/solid/skin/feathers/blue
	color = COLOR_SKY_BLUE
	uid = "solid_feathers_blue"

/decl/material/solid/skin/feathers/green
	color = COLOR_BOTTLE_GREEN
	uid = "solid_feathers_green"

/decl/material/solid/skin/feathers/brown
	color = COLOR_BEASTY_BROWN
	uid = "solid_feathers_brown"

/decl/material/solid/skin/feathers/red
	color = COLOR_RED
	uid = "solid_feathers_red"

/decl/material/solid/skin/feathers/black
	color = COLOR_GRAY15
	uid = "solid_feathers_black"

/decl/material/solid/bone
	name = "bone"
	uid = "solid_bone"
	symbol_html = "Ca<sub>5</sub>(PO<sub>4</sub>)<sub>3</sub>(OH)"
	color = "#f0edc7"
//	ignition_point = T0C+1100
//	melting_point = T0C+1800
//	conductive = 0
//	hidden_from_codex = TRUE
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	integrity = 75
	hardness = MATERIAL_HARDNESS_RIGID
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	weight = MATERIAL_WEIGHT_NORMAL
	default_solid_form = /obj/item/stack/material/bone

/decl/material/solid/bone/fish
	name = "fishbone"
	uid = "solid_fishbone"
	hardness = MATERIAL_HARDNESS_FLEXIBLE
	weight = MATERIAL_WEIGHT_VERY_LIGHT

/decl/material/solid/bone/cartilage
	name = "cartilage"
	uid = "solid_cartilage"
	hardness = 0
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT


