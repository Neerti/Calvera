/// Materials used to make clothing and some kinds of furniture, like leather or cloth. Generally unprotective.
/decl/material/solid/textile
	classification = "Textile"
	construction_difficulty = MATERIAL_DIFFICULTY_EASY
	reflectiveness = MATERIAL_REFLECTIVITY_DULL
	weight = MATERIAL_WEIGHT_EXTREMELY_LIGHT
	hardness = MATERIAL_HARDNESS_SOFT
	default_solid_form = /obj/item/stack/legacy_material/bolt
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "ripped", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "torn", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "shredded", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "tattered"
	)