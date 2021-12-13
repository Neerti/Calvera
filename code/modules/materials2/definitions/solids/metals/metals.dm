/// Materials that involve metals, such as steel, gold, silver, etc.
/decl/material/solid/metal
	classification = "Metal"
	construction_difficulty = MATERIAL_DIFFICULTY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY
	weight = MATERIAL_WEIGHT_HEAVY
	hardness = MATERIAL_HARDNESS_RIGID
	default_solid_form = /obj/item/stack/material/ingot
	damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "marked", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "dented", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "smashed", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "shattered"
	)

/decl/material/solid/metal/iron
	name = "iron"
	symbol = "Fe"
	lore_text = "A ubiquitous, very common metal. The epitaph of stars and the primary ingredient in Earth's core."
	color = "#5c5454"
	construction_difficulty = MATERIAL_DIFFICULTY_EASY
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	ferromagnetic = TRUE
	taste_description = "metal"
	density = 7.874
	specific_heat_capacity = 0.449

/decl/material/solid/metal/gold
	name = "gold"
	adjective_name = "golden"
	symbol = "Au"
	lore_text = "A heavy, soft, ductile metal. \
	Once considered valuable enough to back entire currencies, now predominantly used in corrosion-resistant electronics."
	mechanics_text = "Gold is used in the fabrication of advanced electronics."
	color = "#edd12f"
	integrity = 100
	value = 1.6
	hardness = MATERIAL_HARDNESS_NORMAL
	high_energy_transition_temperature = 1337 // This is really what it is.
	density = 19.30
	specific_heat_capacity = 0.129

/decl/material/solid/metal/silver
	name = "silver"
	uid = "solid_silver"
	symbol = "Ag"
	lore_text = "A soft, white, lustrous transition metal. Has many and varied industrial uses in electronics, solar panels and mirrors."
	color = "#d1e6e3"
	hardness = MATERIAL_HARDNESS_FLEXIBLE + 10
	value = 1.2
	density = 10.49

/decl/material/solid/metal/radium
	name = "radium"
	uid = "solid_radium"
	symbol = "Ra"
	lore_text = "Radium is an alkaline earth metal. It is extremely radioactive."
//	mechanics_text = "Radium can be used as a neutron source in fission reactors."
	taste_description = "the color blue, and regret"
	color = "#c7c7c7"
	value = 0.5
	radioactivity = 18
	density = 5.5
	high_energy_transition_temperature = 973

/decl/material/solid/metal/titanium
	name = "titanium"
	symbol = "Ti"
	uid = "solid_titanium"
//	lore_text = "A light, strong, corrosion-resistant metal. Perfect for cladding high-velocity ballistic supply pods."
	lore_text = "A light, strong, corrosion-resistant metal. A very useful material for aerospace applications, where every gram counts."
//	brute_armor = 10
//	burn_armor = 8
	integrity = 200
//	melting_point = 3000
	high_energy_transition_temperature = 1941
//	high_energy_transition_material = /decl/material/liquid/titanium
	specific_heat_capacity = 0.523
	weight = MATERIAL_WEIGHT_LIGHT
	hardness = MATERIAL_HARDNESS_VERY_HARD
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	color = "#d1e6e3"
	construction_difficulty = MATERIAL_DIFFICULTY_HARD
	value = 1.5
	default_solid_form = /obj/item/stack/material/reinforced
	density = 4.506
