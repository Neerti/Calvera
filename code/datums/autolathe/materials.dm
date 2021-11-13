/datum/category_item/autolathe/materials
	is_stack = TRUE
	no_scale = TRUE // Prevents material duplaction exploits

/datum/category_item/autolathe/materials/New(var/loc, var/mat)
	if(istype(mat, /obj/item/stack/legacy_material))
		var/obj/item/stack/legacy_material/M = mat
		name = M.name
		resources = M.matter.Copy()
		max_stack = M.max_amount
		path = M.type
	else if(istype(mat, /datum/legacy_material))
		var/datum/legacy_material/M = mat
		var/obj/item/stack/legacy_material/S = M.stack_type
		name = initial(S.name)
		resources = M.get_matter()
		max_stack = initial(S.max_amount)
		path = S
	. = ..()

/datum/category_item/autolathe/materials/rods // Not strictly a material, so they need their own define
	name = "metal rods"
	path =/obj/item/stack/rods