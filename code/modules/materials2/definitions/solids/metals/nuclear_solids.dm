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
	default_solid_form = /obj/item/stack/material/puck

/decl/material/solid/metal/uranium/depleted
	name = "depleted uranium"
	uid = "solid_depleted_uranium"
//	lore_text = "Uranium that does not posess a significant amount of radioactive isotopes. Extremely dense, and can be enriched to produce more fission fuel."
	lore_text = "Uranium that does not posess a significant amount of radioactive isotopes. Extremely dense."
//	mechanics_text = "Depleted uranium can be enriched in fission reactors for use as fuel."
	taste_description = "the outside of a reactor"
	value = 1.4
	color = "#005a00"


/decl/material/solid/metal/nuclear_waste
	name = "nuclear waste"
	uid = "solid_nuclear_waste"
//	lore_text = "An unfortunate byproduct of nuclear fission. Extremely radioactive, can be recycled into various useful materials."
	lore_text = "An unfortunate byproduct of nuclear fission. Extremely radioactive."
//	mechanics_text = "Nuclear waste can be processed into various exotic chemicals."
	mechanics_text = "Nuclear waste is very radioactive and dangerous."
	taste_description = "paprika"
	radioactivity = 30
	color = "#98be30"
	value = 0.5
	default_solid_form = /obj/item/stack/material/lump