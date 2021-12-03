/obj
	var/list/matter = null

/obj/Initialize(mapload)
	. = ..()
	create_matter()

/obj/proc/create_matter()
	if(length(matter))
		for(var/mat in matter)
			matter[mat] = round(matter[mat] * get_matter_amount_modifier())
	UNSETEMPTY(matter)

/obj/item/create_matter()
	..()
	LAZYINITLIST(matter)
	if(istype(material))
		matter[material.type] = max(matter[material.type], round(MATTER_AMOUNT_PRIMARY * get_matter_amount_modifier()))
	UNSETEMPTY(matter)

/obj/proc/get_matter_amount_modifier()
	. = CEILING(w_class * BASE_OBJECT_MATTER_MULTPLIER, 1)

/*
/obj/structure/create_matter()
	..()
	if(material || reinf_material)
		LAZYINITLIST(matter)
		var/matter_mult = get_matter_amount_modifier()
		if(material)
			matter[material.type] = max(matter[material.type], round(MATTER_AMOUNT_PRIMARY * matter_mult))
		if(reinf_material)
			matter[reinf_material.type] = max(matter[reinf_material.type], round(MATTER_AMOUNT_REINFORCEMENT * matter_mult))
		UNSETEMPTY(matter)
*/
/// Returns an object's estimated mass, in grams.
/atom/proc/get_mass()
	return 0

/obj/get_mass()
	. = 0
	for(var/mat in matter)
		var/decl/material/M = GET_DECL(mat)
		. += matter[mat] * M.density