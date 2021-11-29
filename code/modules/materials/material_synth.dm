// These objects are used by cyborgs to get around a lot of the limitations on stacks
// and the weird bugs that crop up when expecting borg module code to behave sanely.
/obj/item/stack/legacy_material/cyborg
	uses_charge = 1
	charge_costs = list(1000)
	gender = NEUTER
	matter_legacy = null // Don't shove it in the autholathe.

/obj/item/stack/legacy_material/cyborg/Initialize()
	. = ..()
	name = "[legacy_material.display_name] synthesiser"
	desc = "A device that synthesises [legacy_material.display_name]."
	matter_legacy = null

/obj/item/stack/legacy_material/cyborg/update_strings()
	return

/obj/item/stack/legacy_material/cyborg/plastic
	icon_state = "sheet-plastic"
	default_type = "plastic"

/obj/item/stack/legacy_material/cyborg/steel
	icon_state = "sheet-metal"
	default_type = "steel"

/obj/item/stack/legacy_material/cyborg/plasteel
	icon_state = "sheet-plasteel"
	default_type = "plasteel"

/obj/item/stack/legacy_material/cyborg/wood
	icon_state = "sheet-wood"
	default_type = "wood"

/obj/item/stack/legacy_material/cyborg/glass
	icon_state = "sheet-glass"
	default_type = "glass"

/obj/item/stack/legacy_material/cyborg/glass/reinforced
	icon_state = "sheet-rglass"
	default_type = "rglass"
	charge_costs = list(500, 1000)