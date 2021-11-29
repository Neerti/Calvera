/decl/material/solid/gemstone
	name = null
	classification = "Gemstone"
//	flags = MAT_FLAG_UNMELTABLE
//	cut_delay = 60
	opacity = 0.4
//	shard_type = SHARD_SHARD
//	tableslam_noise = 'sound/effects/Glasshit.ogg'
	reflectiveness = MATERIAL_REFLECTIVITY_MIRROR
//	conductive = 0
//	ore_icon_overlay = "gems"
	default_solid_form = /obj/item/stack/material/gemstone
//	abstract_type = /decl/material/solid/gemstone
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "marked", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "chipped", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "cracked", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "shattered"
	)


/decl/material/solid/gemstone/diamond
	name = "diamond"
	uid = "solid_diamond"
	symbol = "C"
	lore_text = "An extremely hard allotrope of carbon. Valued for its use in industrial tools."
	color = COLOR_DIAMOND
//	brute_armor = 10
//	burn_armor = 50		// Diamond walls are immune to fire, therefore it makes sense for them to be almost undamageable by burn damage type.
//	stack_origin_tech = "{'materials':6}"
	hardness = MATERIAL_HARDNESS_EXTREMELY_HARD
	construction_difficulty = MATERIAL_DIFFICULTY_VERY_HARD
//	ore_name = "rough diamonds"
//	ore_result_amount = 5
//	ore_spread_chance = 10
//	ore_scan_icon = "mineral_rare"
//	xarch_source_mineral = /decl/material/gas/ammonia
	value = 1.8
//	sparse_material_weight = 5
//	rich_material_weight = 5
//	ore_type_value = ORE_PRECIOUS
//	ore_data_value = 2
//	exoplanet_rarity = MAT_RARITY_UNCOMMON

/decl/material/solid/gemstone/crystal
	name = "crystal"
	uid = "solid_crystal"
	hardness = MATERIAL_HARDNESS_VERY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_VERY_SHINY
	value = 2

// The other cardinal gems.

// Sapphires and rubies are actually the same thing.
/decl/material/solid/gemstone/corundum
	symbol = "Al2O3"
	symbol_html = "Al<sub>2</sub>O<sub>3</sub>"
	hardness = MATERIAL_HARDNESS_VERY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_VERY_SHINY
	value = 1.5

/decl/material/solid/gemstone/corundum/ruby
	name = "ruby"
	uid = "solid_ruby"
	color = "#993333"
	lore_text = "Rubies are a precious gemstone. Rubies are a variant of the mineral corundum, \
	with trace amounts of chromium giving it its red color. \
	Other varieties of corumdum gemstones are called sapphires."


/decl/material/solid/gemstone/corundum/sapphire
	name = "sapphire"
	uid = "solid_sapphire"
	color = "#333399"
	lore_text = "Sapphires are a precious gemstone. Sapphires are a variant of of the mineral corundum, and are typically blue, \
	but other colors can also exist naturally. A red sapphire is classified as a ruby."

/decl/material/solid/gemstone/amethyst
	name = "amethyst"
	uid = "solid_amethyst"
	symbol = "SiO2"
	symbol_html = "SiO<sub>2</sub>"
	color = "#993399"
	lore_text = "Amethysts are a semi-precious gemstone, and is a violet colored variant of quartz. \
	In human antiquity, it was believed that this gemstone protected from intoxication."


/decl/material/solid/gemstone/emerald
	name = "emerald"
	uid = "solid_emerald"
	symbol = "Be3Al2(SiO3)6"
	symbol_html = "Be<sub>3</sub>Al<sub>2</sub>(SiO<sub>3</sub>)<sub>6</sub>"
	color = "#339933"
	lore_text = "Emeralds are a precious gemstone. A variant of beryl, it is colored green by trace amounts of chromium."
