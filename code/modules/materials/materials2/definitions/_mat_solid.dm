/// Materials that default to the solid phase.
/decl/material/solid
	// Filler values.
	melting_point = 1000
	vaporization_point = 30000
	//default_solid_form = /obj/item/stack/material2/brick

/decl/material/solid/Initialize()
	. = ..()
	if(!liquid_name)
		liquid_name = "molten [name]"
	if(!gas_name)
		gas_name = "vaporized [name]"
//	if(!ore_compresses_to)
//		ore_compresses_to = type

/*
/decl/material/solid
	name = null
	melting_point = 1000
	boiling_point = 30000
	door_icon_base = "stone"
	icon_base = 'icons/turf/walls/stone.dmi'
	table_icon_base = "stone"
	icon_reinf = 'icons/turf/walls/reinforced_stone.dmi'
	default_solid_form = /obj/item/stack/material/brick
*/