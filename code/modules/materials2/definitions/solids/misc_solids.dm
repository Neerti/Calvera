/// Used in things like (some) holograms or perhaps energy melee weapon blades.
/decl/material/solid/hard_light
	name = "hard light"
	color = "#7db4e1"
	integrity = 200
	value = 0
	hardness = MATERIAL_HARDNESS_VERY_HARD
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT
	reflectiveness = MATERIAL_REFLECTIVITY_DULL

/decl/material/solid/cardboard
	name = "cardboard"
	uid = "solid_cardboard"
//	lore_text = "What with the difficulties presented by growing plants in orbit, a stock of cardboard in space is probably more valuable than gold."
//	flags = MAT_FLAG_BRITTLE
	integrity = 10
	color = "#aaaaaa"
	hardness = MATERIAL_HARDNESS_SOFT
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT - 5
//	ignition_point = T0C+232 //"the temperature at which book-paper catches fire, and burns." close enough
//	melting_point = T0C+232 //temperature at which cardboard walls would be destroyed
	value = 0.5
	reflectiveness = MATERIAL_REFLECTIVITY_DULL
	default_solid_form = /obj/item/stack/material/cardstock

/decl/material/solid/paper
	name = "paper"
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "ripped", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "torn", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "shredded", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "tattered"
	)


/decl/material/solid/salt
	name = "salt"
	symbol = "NaCl"


/decl/material/solid/coal
	name = "coal"
	symbol = "C"
	lore_text = "Coal is a"
	color = "#333333"
	heat_of_combustion = 32.50 // We're gonna assume the coal in the game is a high grade coal since its used to make steel.

/decl/material/solid/coal/charcoal
	name = "charcoal"
	lore_text = "Charcoal is the remnants of burned wood, reduced to a chunk of carbon through pyrolysis."
