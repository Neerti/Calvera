/datum/legacy_material/steel/hull
	name = MAT_STEELHULL
	stack_type = /obj/item/stack/legacy_material/steel/hull
	integrity = 250
	explosion_resistance = 10
	icon_base = "hull"
	icon_reinf = "reinf_mesh"
	icon_colour = "#666677"

/datum/legacy_material/steel/hull/place_sheet(var/turf/target) //Deconstructed into normal steel sheets.
	new /obj/item/stack/legacy_material/steel(target)

/datum/legacy_material/plasteel/hull
	name = MAT_PLASTEELHULL
	stack_type = /obj/item/stack/legacy_material/plasteel/hull
	integrity = 600
	icon_base = "hull"
	icon_reinf = "reinf_mesh"
	icon_colour = "#777788"
	explosion_resistance = 40

/datum/legacy_material/plasteel/hull/place_sheet(var/turf/target) //Deconstructed into normal plasteel sheets.
	new /obj/item/stack/legacy_material/plasteel(target)

/datum/legacy_material/durasteel/hull //The 'Hardball' of starship hulls.
	name = MAT_DURASTEELHULL
	stack_type = /obj/item/stack/legacy_material/durasteel/hull
	icon_base = "hull"
	icon_reinf = "reinf_mesh"
	icon_colour = "#45829a"
	explosion_resistance = 90
	reflectivity = 0.9

/datum/legacy_material/durasteel/hull/place_sheet(var/turf/target) //Deconstructed into normal durasteel sheets.
	new /obj/item/stack/legacy_material/durasteel(target)

/datum/legacy_material/titanium/hull
	name = MAT_TITANIUMHULL
	stack_type = /obj/item/stack/legacy_material/titanium/hull
	icon_base = "hull"
	icon_reinf = "reinf_mesh"

/datum/legacy_material/titanium/hull/place_sheet(var/turf/target) //Deconstructed into normal titanium sheets.
	new /obj/item/stack/legacy_material/titanium(target)

/datum/legacy_material/morphium/hull
	name = MAT_MORPHIUMHULL
	stack_type = /obj/item/stack/legacy_material/morphium/hull
	icon_base = "hull"
	icon_reinf = "reinf_mesh"

/datum/legacy_material/morphium/hull/place_sheet(var/turf/target)
	new /obj/item/stack/legacy_material/morphium(target)