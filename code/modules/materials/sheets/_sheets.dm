// Stacked resources. They use a material datum for a lot of inherited values.
// If you're adding something here, make sure to add it to fifty_spawner_mats.dm as well
/obj/item/stack/legacy_material
	force = 5.0
	throwforce = 5
	w_class = ITEMSIZE_NORMAL
	throw_speed = 3
	throw_range = 3
	center_of_mass = null
	max_amount = 50
	item_icons = list(
		slot_l_hand_str = 'icons/mob/items/lefthand_material.dmi',
		slot_r_hand_str = 'icons/mob/items/righthand_material.dmi',
		)

	var/default_type = DEFAULT_WALL_MATERIAL
	var/datum/legacy_material/legacy_material
	var/perunit = SHEET_MATERIAL_AMOUNT
	var/apply_colour //temp pending icon rewrite
	drop_sound = 'sound/items/drop/axe.ogg'
	pickup_sound = 'sound/items/pickup/axe.ogg'

/obj/item/stack/legacy_material/Initialize()
	. = ..()

	randpixel_xy()

	if(!default_type)
		default_type = DEFAULT_WALL_MATERIAL
	legacy_material = get_material_by_name("[default_type]")
	if(!legacy_material)
		return INITIALIZE_HINT_QDEL

	recipes = legacy_material.get_recipes()
	stack_merge_type = legacy_material.stack_type
	if(islist(legacy_material.stack_origin_tech))
		origin_tech = legacy_material.stack_origin_tech.Copy()

	if(apply_colour)
		color = legacy_material.icon_colour

	if(!legacy_material.conductive)
		flags |= NOCONDUCT

	matter_legacy = legacy_material.get_matter_legacy()
	update_strings()

/obj/item/stack/legacy_material/get_material()
	return legacy_material

/obj/item/stack/legacy_material/proc/update_strings()
	// Update from material datum.
	singular_name = legacy_material.sheet_singular_name

	if(amount>1)
		name = "[legacy_material.use_name] [legacy_material.sheet_plural_name]"
		desc = "A stack of [legacy_material.use_name] [legacy_material.sheet_plural_name]."
		gender = PLURAL
	else
		name = "[legacy_material.use_name] [legacy_material.sheet_singular_name]"
		desc = "A [legacy_material.sheet_singular_name] of [legacy_material.use_name]."
		gender = NEUTER

/obj/item/stack/legacy_material/use(var/used)
	. = ..()
	update_strings()
	return

/obj/item/stack/legacy_material/transfer_to(obj/item/stack/S, var/tamount=null, var/type_verified)
	var/obj/item/stack/legacy_material/M = S
	if(!istype(M) || legacy_material.name != M.legacy_material.name)
		return 0
	var/transfer = ..(S,tamount,1)
	if(src) update_strings()
	if(M) M.update_strings()
	return transfer

/obj/item/stack/legacy_material/attack_self(var/mob/user)
	if(!legacy_material.build_windows(user, src))
		..()

/obj/item/stack/legacy_material/attackby(var/obj/item/W, var/mob/user)
	if(istype(W,/obj/item/stack/cable_coil))
		legacy_material.build_wired_product(user, W, src)
		return
	else if(istype(W, /obj/item/stack/rods))
		legacy_material.build_rod_product(user, W, src)
		return
	return ..()