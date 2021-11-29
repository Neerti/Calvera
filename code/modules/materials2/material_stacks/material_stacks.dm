/obj/item/stack/material/ingot
	name = "ingots"
	singular_name = "ingot"
	plural_name = "ingots"
	icon_state = "ingot"
	medium_icon_state = "ingot-mult"
	high_icon_state = "ingot-max"
	stack_merge_type = /obj/item/stack/material/ingot


/obj/item/stack/material/sheet
	name = "sheets"
	icon_state = "sheet"
	medium_icon_state = "sheet-mult"
	high_icon_state = "sheet-max"
	stack_merge_type = /obj/item/stack/material/sheet

/obj/item/stack/material/panel
	name = "panels"
	icon_state = "sheet-plastic"
	medium_icon_state = "sheet-plastic-mult"
	high_icon_state = "sheet-plastic-max"
	singular_name = "panel"
	plural_name = "panels"
	stack_merge_type = /obj/item/stack/material/panel

/obj/item/stack/material/skin
	name = "skin"
	icon_state = "skin"
	medium_icon_state = "skin-mult"
	high_icon_state = "skin-max"
	singular_name = "length"
	plural_name = "lengths"
	stack_merge_type = /obj/item/stack/material/skin

/obj/item/stack/material/skin/pelt
	name = "pelts"
	singular_name = "pelt"
	plural_name = "pelts"
	stack_merge_type = /obj/item/stack/material/skin/pelt

/obj/item/stack/material/skin/feathers
	name = "feathers"
	singular_name = "feather"
	plural_name = "feathers"
	stack_merge_type = /obj/item/stack/material/skin/feathers

/obj/item/stack/material/bone
	name = "bones"
	icon_state = "bone"
	medium_icon_state = "bone-mult"
	high_icon_state = "bone-max"
	singular_name = "length"
	plural_name = "lengths"
	stack_merge_type = /obj/item/stack/material/bone

/obj/item/stack/material/brick
	name = "bricks"
	singular_name = "brick"
	plural_name = "bricks"
	icon_state = "brick"
	medium_icon_state = "brick-mult"
	high_icon_state = "brick-max"
	stack_merge_type = /obj/item/stack/material/brick

/obj/item/stack/material/bolt
	name = "bolts"
	icon_state = "sheet-cloth"
	medium_icon_state = "sheet-cloth-mult"
	high_icon_state = "sheet-cloth-max"
	singular_name = "bolt"
	plural_name = "bolts"
	stack_merge_type = /obj/item/stack/material/bolt

/obj/item/stack/material/pane
	name = "panes"
	singular_name = "pane"
	plural_name = "panes"
	icon_state = "sheet-clear"
	medium_icon_state = "sheet-clear-mult"
	high_icon_state = "sheet-clear-max"
	stack_merge_type = /obj/item/stack/material/pane

/obj/item/stack/material/pane/update_state_from_amount()
	if(reinf_material) 
		icon_state = "sheet-glass-reinf"
		base_state = icon_state
		medium_icon_state = "sheet-glass-reinf-mult"
		high_icon_state = "sheet-glass-reinf-max"
	else
		icon_state = "sheet-clear"
		base_state = icon_state
		medium_icon_state = "sheet-clear-mult"
		high_icon_state = "sheet-clear-max"
	..()

/obj/item/stack/material/cardstock
	icon_state = "sheet-card"
	medium_icon_state = "sheet-card-mult"
	high_icon_state = "sheet-card-max"
	stack_merge_type = /obj/item/stack/material/cardstock

/obj/item/stack/material/gemstone
	name = "gems"
	singular_name = "gem"
	plural_name = "gems"
	icon_state = "diamond"
	medium_icon_state = "diamond-mult"
	high_icon_state = "diamond-max"
	stack_merge_type = /obj/item/stack/material/gemstone
	pickup_sound = 'sound/items/pickup/glass.ogg'
	drop_sound = 'sound/items/drop/glass.ogg'

/obj/item/stack/material/puck
	name = "pucks"
	singular_name = "puck"
	plural_name = "pucks"
	icon_state = "puck"
	medium_icon_state = "puck-mult"
	high_icon_state = "puck-max"
	stack_merge_type = /obj/item/stack/material/puck

/obj/item/stack/material/aerogel
	name = "aerogel"
	singular_name = "gel block"
	plural_name = "gel blocks"
	icon_state = "puck"
	medium_icon_state = "puck-mult"
	high_icon_state = "puck-max"
//	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE
	stack_merge_type = /obj/item/stack/material/aerogel

/obj/item/stack/material/plank
	name = "planks"
	singular_name = "plank"
	plural_name = "planks"
	icon_state = "sheet-wood"
	medium_icon_state = "sheet-wood-mult"
	high_icon_state = "sheet-wood-max"
	stack_merge_type = /obj/item/stack/material/plank
	pickup_sound = 'sound/items/pickup/wooden.ogg'
	drop_sound = 'sound/items/drop/wooden.ogg'

/obj/item/stack/material/log
	name = "logs"
	singular_name = "log"
	plural_name = "logs"
	icon_state = "log"
	medium_icon_state = "log-mult"
	high_icon_state = "log-max"
	stack_merge_type = /obj/item/stack/material/log
	pickup_sound = 'sound/items/pickup/wooden.ogg'
	drop_sound = 'sound/items/drop/wooden.ogg'

/obj/item/stack/material/segment
	name = "segments"
	singular_name = "segment"
	plural_name = "segments"
	icon_state = "sheet-mythril"
	stack_merge_type = /obj/item/stack/material/segment

/obj/item/stack/material/reinforced
	icon_state = "sheet-reinf"
	item_state = "sheet-metal"
	medium_icon_state = "sheet-reinf-mult"
	high_icon_state = "sheet-reinf-max"
	stack_merge_type = /obj/item/stack/material/reinforced

/obj/item/stack/material/shiny
	icon_state = "sheet-sheen"
	item_state = "sheet-shiny"
	medium_icon_state = "sheet-sheen-mult"
	high_icon_state = "sheet-sheen-max"
	stack_merge_type = /obj/item/stack/material/shiny

/obj/item/stack/material/cubes
	name = "cube"
	desc = "Some featureless cubes."
	singular_name = "cube"
	plural_name = "cubes"
	icon_state = "cube"
	medium_icon_state = "cube-mult"
	high_icon_state = "cube-max"
	max_amount = 100
	attack_verb = list("cubed")
	stack_merge_type = /obj/item/stack/material/cubes

/obj/item/stack/material/lump
	name = "lumps"
	singular_name = "lump"
	plural_name = "lumps"
	icon_state = "lump"
	medium_icon_state = "lump-mult"
	high_icon_state = "lump-max"
	stack_merge_type = /obj/item/stack/material/lump

/obj/item/stack/material/slab
	name = "slabs"
	singular_name = "slab"
	plural_name = "slabs"
	icon_state = "puck"
	medium_icon_state = "puck-mult"
	high_icon_state = "puck-max"
	stack_merge_type = /obj/item/stack/material/slab

/obj/item/stack/material/strut
	name = "struts"
	singular_name = "strut"
	plural_name = "struts"
	icon_state = "sheet-strut"
	medium_icon_state = "sheet-strut-mult"
	high_icon_state = "sheet-strut-max"
	stack_merge_type = /obj/item/stack/material/strut
/*
/obj/item/stack/material/strut/cyborg
	name = "metal strut synthesizer"
	desc = "A device that makes metal strut."
	gender = NEUTER
	matter_legacy = null
	uses_charge = 1
	charge_costs = list(500)
	material = /decl/material/solid/metal/steel

/obj/item/stack/material/strut/get_recipes()
	return material.get_strut_recipes(reinf_material && reinf_material.type)
*/