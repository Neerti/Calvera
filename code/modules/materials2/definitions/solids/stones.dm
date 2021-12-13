/// Rock and stone.
/decl/material/solid/stone
	name = null
	classification = "Stone"
	color = "#d9c179"
	weight = MATERIAL_WEIGHT_HEAVY
	hardness = MATERIAL_HARDNESS_HARD - 5
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "scratched", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "cut", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "cracked", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "shattered"
	)

/decl/material/solid/stone/sandstone
	name = "sandstone"
	uid = "solid_sandstone"
	lore_text = "A clastic sedimentary rock. The cost of boosting it to orbit is almost universally much higher than the actual value of the material."
//	value = 1.5

/decl/material/solid/stone/ceramic
	name = "ceramic"
	uid = "solid_ceramic"
	lore_text = "A hard substance produced by firing clay in a kiln."
	color = COLOR_OFF_WHITE

/decl/material/solid/stone/marble
	name = "marble"
	uid = "solid_marble"
	lore_text = "A metamorphic rock largely sourced from Earth. Prized for use in extremely expensive decorative surfaces."
	color = "#aaaaaa"
	weight = MATERIAL_WEIGHT_VERY_HEAVY
	hardness = MATERIAL_HARDNESS_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
	construction_difficulty = MATERIAL_DIFFICULTY_HARD

/decl/material/solid/stone/basalt
	name = "basalt"
	uid = "solid_basalt"
	lore_text = "A ubiquitous volcanic stone."
	color = COLOR_DARK_GRAY
	weight = MATERIAL_WEIGHT_VERY_HEAVY
	hardness = MATERIAL_HARDNESS_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
	construction_difficulty = MATERIAL_DIFFICULTY_HARD

/decl/material/solid/stone/concrete
	name = "concrete"
	uid = "solid_concrete"
	lore_text = "The most ubiquitous building material of old Earth, now in space. Consists of mineral aggregate bound with some sort of cementing solution."
	color = COLOR_GRAY
	value = 0.9

/decl/material/solid/stone/cult
	name = "disturbing stone"
	uid = "solid_stone_cult"
	color = "#402821"
	construction_difficulty = MATERIAL_DIFFICULTY_NORMAL
	hidden_from_codex = TRUE
	reflectiveness = MATERIAL_REFLECTIVITY_DULL

/decl/material/solid/stone/cult/reinforced
	name = "runic inscriptions"
	uid = "solid_runes_cult"