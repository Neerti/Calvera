/// Used in things like (some) holograms or perhaps energy melee weapon blades.
/decl/material/solid/hard_light
	name = "hard light"
	color = "#7db4e1"
	hidden_from_codex = TRUE
	integrity = 200
	value = 0
	hardness = MATERIAL_HARDNESS_VERY_HARD
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT
	reflectiveness = MATERIAL_REFLECTIVITY_DULL


/decl/material/solid/paper
	name = "paper"
	uid = "solid_paper"
	color = "#ffffff"
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT - 5
	hardness = MATERIAL_HARDNESS_SOFT
	reflectiveness = MATERIAL_REFLECTIVITY_DULL
	integrity = 5
	value = 0.3
	high_energy_transition_material = /decl/material/solid/ash
	high_energy_transition_temperature = T0C+232
	default_solid_form = /obj/item/stack/material/cardstock
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "ripped", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "torn", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "shredded", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "tattered"
	)

/decl/material/solid/paper/cardboard
	name = "cardboard"
	uid = "solid_cardboard"
//	lore_text = "What with the difficulties presented by growing plants in orbit, a stock of cardboard in space is probably more valuable than gold."
//	flags = MAT_FLAG_BRITTLE
	integrity = 10
	color = "#aaaaaa"
	value = 0.5

/decl/material/solid/salt
	name = "salt"
	symbol = "NaCl"


/decl/material/solid/coal
	name = "coal"
	symbol = "C"
	classification = "Solid Fuel"
	lore_text = "Coal is a combustable rock, mostly made from carbon. Coal was important to humans \
	for technological progress and industry, leading to the creation of steel, coal-fired steam engines, \
	and global warming of planet Earth."
	mechanics_text = "Coal is an energy dense fuel, and is used to create steel."
	color = "#333333"
	heat_of_combustion = 32.50 // We're gonna assume the coal in the game is a high grade coal since its used to make steel.
	specific_heat_capacity = 0.709
	thermal_conductivity = 142

/decl/material/solid/coal/charcoal
	name = "charcoal"
	lore_text = "Charcoal is the remnants of burned wood, reduced to a chunk of carbon through pyrolysis."
	mechanics_text = "Charcoal is an energy dense fuel, giving off more heat when burned compared to wood."
	color = "#222222"

/decl/material/solid/ash
	name = "ash"
	lore_text = "The remnants of something that was burned. Flammable objects such as wood, paper, and coal create ash when combusted. \
	It is generally considered a waste product."