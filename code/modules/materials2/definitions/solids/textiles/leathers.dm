/** Note that this is for 'cured' leathers that are ready to be used, not the raw animal hide.*/
/** Leathers are not actually textiles, but in this context 'textile' will serve 
as an umbrella term for materials that are generally used to make clothing, bags, or upholstry.*/
/decl/material/solid/textile/leather
	name = "leather"
	classification = "Leather"
	color = "#5c4831"
	hardness = MATERIAL_HARDNESS_FLEXIBLE
	reflectiveness = MATERIAL_REFLECTIVITY_MATTE
	default_solid_form = /obj/item/stack/material/skin

/decl/material/solid/textile/leather/synth
	name = "synthleather"
	color = "#1f1f20"
	lore_text = "An artificially created material that closely resembles leather sourced from an animal."

/decl/material/solid/textile/leather/heavy
	name = "heavy leather"
	color = "#36291b"
	lore_text = "A stronger, sturdier variant of leather, made from a hardy animal."
	hardness = MATERIAL_HARDNESS_RIGID

/decl/material/solid/textile/leather/reptile
	name = "scaled hide"
	color = "#434b31"
	lore_text = "This used to belong to some form of reptile, now it is fairly durable hide."
	integrity = 75
	hardness = MATERIAL_HARDNESS_RIGID
	weight = MATERIAL_WEIGHT_LIGHT
	reflectiveness = MATERIAL_REFLECTIVITY_SHINY

/decl/material/solid/leather/fur
	name = "tanned pelt"

/decl/material/solid/leather/chitin
	name = "treated chitin"
	lore_text = ""
	integrity = 100
	color = "#5c5a54"
	hardness = MATERIAL_HARDNESS_HARD
	weight = MATERIAL_WEIGHT_NORMAL
