// Minor, in this case, means the materials aren't required in any recipes, I.E. miners don't need to care about them.
/decl/material/solid/metal/copper
	name = "copper"
	uid = "solid_copper"
	symbol = "Cu"
	lore_text = "A metal used in some components and many alloys. Known for its color-shifting properties when oxidized."
	color = "#b87333"
	weight = MATERIAL_WEIGHT_NORMAL
	hardness = MATERIAL_HARDNESS_FLEXIBLE + 10
	density = 8.96

/decl/material/solid/metal/aluminium
	name = "aluminium"
	uid = "solid_aluminium"
	symbol = "Al"
	lore_text = "A low-density ductile metal with a silvery-white sheen."
	integrity = 125
	weight = MATERIAL_WEIGHT_LIGHT
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
	color = "#cccdcc"
	taste_description = "metal"
	default_solid_form = /obj/item/stack/material/shiny
	density = 2.70

/decl/material/solid/metal/osmium
	name = "osmium"
	uid = "solid_osmium"
	symbol = "Os"
	lore_text = "An extremely hard form of platinum."
	color = "#9999ff"
	construction_difficulty = MATERIAL_DIFFICULTY_VERY_HARD
	density = 22.59
	value = 1.3

/decl/material/solid/metal/platinum
	name = "platinum"
	uid = "solid_platinum"
	symbol = "Pt"
	lore_text = "A very dense, unreactive, precious metal. Has many industrial uses, particularly as a catalyst."
	color = "#deddff"
	weight = MATERIAL_WEIGHT_VERY_HEAVY
	density = 21.45
	value = 1.5

/decl/material/solid/metal/tin
	name = "tin"
	uid = "solid_tin"
	symbol = "Sn"
	lore_text = "A soft metal that can be cut without much force. Used in many alloys."
	color = "#c5c5a8"
	hardness = MATERIAL_HARDNESS_SOFT + 10
	construction_difficulty = MATERIAL_DIFFICULTY_EASY
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	density = 7.265

/decl/material/solid/metal/lead
	name = "lead"
	uid = "solid_lead"
	symbol = "Pb"
	lore_text = "A very soft, heavy and poisonous metal. You probably shouldn't lick it."
	color = "#3f3f4d"
	hardness = MATERIAL_HARDNESS_SOFT
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	taste_description = "metallic sugar"
//	toxicity = 1
	density = 11.34

/decl/material/solid/metal/zinc
	name = "zinc"
	uid = "solid_zinc"
	symbol = "Zn"
	lore_text = "A dull-looking metal with some use in alloying."
	color = "#92aae4"
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	density = 7.14

/decl/material/solid/metal/chromium
	name = "chromium"
	uid = "solid_chromium"
	symbol = "Cr"
	lore_text = "A heavy metal with near perfect reflectiveness. Used in stainless alloys."
	color = "#dadada"
	integrity = 200
//	melting_point = 6000
	value = 1.5
	weight = MATERIAL_WEIGHT_VERY_HEAVY
	hardness = MATERIAL_HARDNESS_HARD + 10
	construction_difficulty = MATERIAL_DIFFICULTY_VERY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_MIRROR
	density = 7.19

/decl/material/solid/metal/tungsten
	name = "tungsten"
	uid = "solid_tungsten"
	symbol = "W"
	lore_text = "A chemical element, and a strong oxidising agent."
	weight = MATERIAL_WEIGHT_VERY_HEAVY
//	taste_mult = 0 //no taste
	color = "#dcdcdc"
	density = 19.3
	value = 0.5

// Adminspawn only, do not let anyone get this.
/decl/material/solid/metal/alienalloy
	name = "dense alloy"
	uid = "solid_alienalloy"
	color = "#6c7364"
	integrity = 1200
//	melting_point = 6000       // Hull plating.
//	explosion_resistance = 200 // Hull plating.
	hardness = MATERIAL_HARDNESS_EXTREMELY_HARD * 5
	weight = MATERIAL_WEIGHT_VERY_HEAVY
//	hidden_from_codex = TRUE
	value = 3
	default_solid_form = /obj/item/stack/material/cubes

// Likewise.
/decl/material/solid/metal/alienalloy/elevatorium
	name = "elevator panelling"
	uid = "solid_elevator"
	color = "#666666"
	default_solid_form = /obj/item/stack/material/sheet
