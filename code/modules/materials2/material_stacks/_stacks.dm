// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	icon = 'icons/obj/stacks/materials.dmi'
	w_class = ITEMSIZE_NORMAL
	max_amount = 50
	force = 5
	throwforce = 5
	throw_speed = 3
	throw_range = 3
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_material.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_material.dmi',
		)
	drop_sound = 'sound/items/drop/axe.ogg'
	pickup_sound = 'sound/items/pickup/axe.ogg'
	var/decl/material/reinf_material

/obj/item/stack/material/Initialize(mapload, var/amount, var/_material, var/_reinf_material)
	base_state = icon_state // This needs to go before the super call, unlike on Nebula code.
	. = ..(mapload, amount, _material)
	if(!istype(material))
		return INITIALIZE_HINT_QDEL
	if(!_reinf_material)
		_reinf_material = reinf_material
	if(_reinf_material)
		reinf_material = GET_DECL(_reinf_material)
		if(!istype(reinf_material))
			reinf_material = null
//	base_state = icon_state
//	if(material.conductive)
//		obj_flags |= OBJ_FLAG_CONDUCTIBLE
//	else
//		obj_flags &= (~OBJ_FLAG_CONDUCTIBLE)
	update_strings()
/*
// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	force = 5.0
	throwforce = 5
	w_class = ITEM_SIZE_LARGE
	throw_speed = 3
	throw_range = 3
	max_amount = 60
	randpixel = 3
	icon = 'icons/obj/materials.dmi'
	matter = null
	pickup_sound = 'sound/foley/tooldrop3.ogg'
	drop_sound = 'sound/foley/tooldrop2.ogg'
	singular_name = "sheet"
	plural_name = "sheets"
	var/decl/material/reinf_material

/obj/item/stack/material/get_recipes()
	return material.get_recipes(reinf_material && reinf_material.type)

/obj/item/stack/material/get_codex_value()
	return (material && !material.hidden_from_codex) ? "[lowertext(material.solid_name)] (material)" : ..()
*/
/obj/item/stack/material/get_material()
	return material
/*
/obj/item/stack/material/update_matter()
	create_matter()

/obj/item/stack/material/create_matter()
	matter = list()
	if(istype(material))
		matter[material.type] = MATTER_AMOUNT_PRIMARY * get_matter_amount_modifier()
	if(istype(reinf_material))
		matter[reinf_material.type] = MATTER_AMOUNT_REINFORCEMENT * get_matter_amount_modifier()
*/
/obj/item/stack/material/proc/update_strings()
	if(amount > 1)
		set_name("[material.use_name] [plural_name]")
		desc = "A stack of [material.use_name] [plural_name]."
		gender = PLURAL
	else
		set_name("[material.use_name] [singular_name]")
		desc = "A [singular_name] of [material.use_name]."
		gender = NEUTER
	if(reinf_material)
		set_name("reinforced [name]")
		desc = "[desc]\nIt is reinforced with the [reinf_material.use_name] lattice."

/obj/item/stack/material/on_update_icon()
	color = material.color
	alpha = 100 + max(1, amount/25) * (material.opacity * 255)
	update_state_from_amount()

/obj/item/stack/material/proc/update_state_from_amount()
	if(max_icon_state && amount == max_amount)
		icon_state = max_icon_state
	else if(high_icon_state && amount >= (max_amount * 0.66))
		icon_state = high_icon_state
	else if(medium_icon_state && amount >= (max_amount * 0.33))
		icon_state = medium_icon_state
	else
		icon_state = base_state

/*
// Stacked resources. They use a material datum for a lot of inherited values.
/obj/item/stack/material
	force = 5.0
	throwforce = 5
	w_class = ITEM_SIZE_LARGE
	throw_speed = 3
	throw_range = 3
	max_amount = 60
	randpixel = 3
	icon = 'icons/obj/materials.dmi'
	matter = null
	pickup_sound = 'sound/foley/tooldrop3.ogg'
	drop_sound = 'sound/foley/tooldrop2.ogg'
	singular_name = "sheet"
	plural_name = "sheets"
	var/decl/material/reinf_material

/obj/item/stack/material/Initialize(mapload, var/amount, var/_material, var/_reinf_material)
	. = ..(mapload, amount, _material)
	if(!istype(material))
		return INITIALIZE_HINT_QDEL
	if(!_reinf_material)
		_reinf_material = reinf_material
	if(_reinf_material)
		reinf_material = GET_DECL(_reinf_material)
		if(!istype(reinf_material))
			reinf_material = null
	base_state = icon_state
	if(material.conductive)
		obj_flags |= OBJ_FLAG_CONDUCTIBLE
	else
		obj_flags &= (~OBJ_FLAG_CONDUCTIBLE)
	update_strings()

/obj/item/stack/material/get_recipes()
	return material.get_recipes(reinf_material && reinf_material.type)

/obj/item/stack/material/get_codex_value()
	return (material && !material.hidden_from_codex) ? "[lowertext(material.solid_name)] (material)" : ..()

/obj/item/stack/material/get_material()
	return material

/obj/item/stack/material/update_matter()
	create_matter()

/obj/item/stack/material/create_matter()
	matter = list()
	if(istype(material))
		matter[material.type] = MATTER_AMOUNT_PRIMARY * get_matter_amount_modifier()
	if(istype(reinf_material))
		matter[reinf_material.type] = MATTER_AMOUNT_REINFORCEMENT * get_matter_amount_modifier()

/obj/item/stack/material/proc/update_strings()
	if(amount>1)
		SetName("[material.use_name] [plural_name]")
		desc = "A stack of [material.use_name] [plural_name]."
		gender = PLURAL
	else
		SetName("[material.use_name] [singular_name]")
		desc = "A [singular_name] of [material.use_name]."
		gender = NEUTER
	if(reinf_material)
		SetName("reinforced [name]")
		desc = "[desc]\nIt is reinforced with the [reinf_material.use_name] lattice."

/obj/item/stack/material/use(var/used)
	. = ..()
	update_strings()

/obj/item/stack/material/proc/is_same(obj/item/stack/material/M)
	if(!istype(M))
		return FALSE
	if(matter_multiplier != M.matter_multiplier)
		return FALSE
	if(material.type != M.material.type)
		return FALSE
	if((reinf_material && reinf_material.type) != (M.reinf_material && M.reinf_material.type))
		return FALSE
	return TRUE

/obj/item/stack/material/update_strings()
	. = ..()
	if(material.stack_origin_tech)
		origin_tech = material.stack_origin_tech
	else if(reinf_material && reinf_material.stack_origin_tech)
		origin_tech = reinf_material.stack_origin_tech
	else
		origin_tech = initial(origin_tech)

/obj/item/stack/material/transfer_to(obj/item/stack/material/M, var/tamount=null)
	if(!is_same(M))
		return 0
	. = ..(M,tamount,1)
	if(!QDELETED(src))
		update_strings()
	if(!QDELETED(M))
		M.update_strings()

/obj/item/stack/material/copy_from(var/obj/item/stack/material/other)
	..()
	if(istype(other))
		material = other.material
		reinf_material = other.reinf_material
		update_strings()
		update_icon()

/obj/item/stack/material/attackby(var/obj/item/W, var/mob/user)

	if(istype(W, /obj/item/stack/material))
		if(is_same(W))
			return ..()
		if(!reinf_material)
			material.reinforce(user, W, src)
		return TRUE

	if(reinf_material && reinf_material.default_solid_form && isWelder(W))
		var/obj/item/weldingtool/WT = W
		if(WT.isOn() && WT.get_fuel() > 2 && use(2))
			WT.remove_fuel(2, user)
			to_chat(user, SPAN_NOTICE("You recover some [reinf_material.use_name] from \the [src]."))
			reinf_material.create_object(get_turf(user), 1)
			return TRUE

	return ..()

/obj/item/stack/material/on_update_icon()
	color = material.color
	alpha = 100 + max(1, amount/25)*(material.opacity * 255)
	update_state_from_amount()

/obj/item/stack/material/proc/update_state_from_amount()
	if(max_icon_state && amount == max_amount)
		icon_state = max_icon_state
	else if(plural_icon_state && amount > 2)
		icon_state = plural_icon_state
	else
		icon_state = base_state
*/