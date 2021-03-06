// Note that this is contained inside an actual implant subtype.
// See code/game/objects/items/weapons/implants/implantcircuits.dm for where this gets held.

/obj/item/device/electronic_assembly/implant
	name = "electronic implant"
	icon_state = "setup_implant"
	desc = "It's a case, for building very tiny electronics with."
	w_class = ITEMSIZE_TINY
	max_components = IC_COMPONENTS_BASE / 2
	max_complexity = IC_COMPLEXITY_BASE / 2
	var/obj/item/weapon/implant/integrated_circuit/implant = null

/obj/item/device/electronic_assembly/implant/nano_host()
	return implant

/obj/item/device/electronic_assembly/implant/resolve_nano_host()
	return implant

/obj/item/device/electronic_assembly/implant/on_update_icon()
	..()
	implant.icon_state = icon_state