/obj/structure/table/rack
	name = "rack"
	desc = "Different from the Middle Ages version."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put

/obj/structure/table/rack/update_connections()
	return

/obj/structure/table/rack/update_desc()
	return

/obj/structure/table/rack/on_update_icon()
	return

/obj/structure/table/rack/holorack/dismantle(obj/item/weapon/tool/wrench/W, mob/user)
	to_chat(user, "<span class='warning'>You cannot dismantle \the [src].</span>")
	return
