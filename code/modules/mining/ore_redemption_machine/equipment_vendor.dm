/**********************Mining Equipment Locker**************************/

/obj/machinery/mineral/equipment_vendor
	name = "mining equipment vendor"
	desc = "An equipment vendor for miners, points collected at an ore redemption machine can be spent here."
	icon = 'icons/obj/vending.dmi'
	icon_state = "adh-tool"
	density = TRUE
	anchored = TRUE
	var/icon_deny = "adh-tool-deny"
	var/icon_vend = "adh-tool-vend"
	circuit = /obj/item/weapon/circuitboard/mining_equipment_vendor
	var/obj/item/weapon/card/id/inserted_id
	var/list/prize_list = list(
		new /datum/data/mining_equipment("1 Marker Beacon",				/obj/item/stack/marker_beacon,										10),
		new /datum/data/mining_equipment("10 Marker Beacons",			/obj/item/stack/marker_beacon/ten,									100),
		new /datum/data/mining_equipment("30 Marker Beacons",			/obj/item/stack/marker_beacon/thirty,								300),
		new /datum/data/mining_equipment("Whiskey",						/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey,		125),
		new /datum/data/mining_equipment("Absinthe",					/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe,	125),
		new /datum/data/mining_equipment("Cigar",						/obj/item/clothing/mask/smokable/cigarette/cigar/havana,			150),
		new /datum/data/mining_equipment("Soap",						/obj/item/weapon/soap/nanotrasen,									200),
		new /datum/data/mining_equipment("Laser Pointer",				/obj/item/device/laser_pointer,										900),
		new /datum/data/mining_equipment("Geiger Counter",				/obj/item/device/geiger,											750),
		new /datum/data/mining_equipment("Plush Toy",					/obj/random/plushie,												300),
		new /datum/data/mining_equipment("Umbrella",					/obj/item/weapon/melee/umbrella/random,								200),
//		new /datum/data/mining_equipment("Fulton Beacon",				/obj/item/fulton_core,												500),
		new /datum/data/mining_equipment("Point Transfer Card",			/obj/item/weapon/card/mining_point_card,							500),
//		new /datum/data/mining_equipment("Fulton Pack",					/obj/item/extraction_pack,											1200),
//		new /datum/data/mining_equipment("Silver Pickaxe",				/obj/item/weapon/pickaxe/silver,									1200),
//		new /datum/data/mining_equipment("Diamond Pickaxe",				/obj/item/weapon/pickaxe/diamond,									2000),
		new /datum/data/mining_equipment("Fishing Net",					/obj/item/weapon/material/fishing_net,								500),
		new /datum/data/mining_equipment("Titanium Fishing Rod",		/obj/item/weapon/material/fishing_rod/modern,						1000),
//		new /datum/data/mining_equipment("Space Cash",					/obj/item/weapon/spacecash/c1000,									2000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Control Module",	/obj/item/weapon/rig/industrial,						10000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Plasma Cutter",		/obj/item/rig_module/device/plasmacutter,				800),
		new /datum/data/mining_equipment("Industrial Hardsuit - Drill",				/obj/item/rig_module/device/drill,						5000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Ore Scanner",		/obj/item/rig_module/device/orescanner,					1000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Advanced Optics",	/obj/item/rig_module/vision/mining,						1250),
		new /datum/data/mining_equipment("Industrial Hardsuit - Maneuvering Jets",	/obj/item/rig_module/maneuvering_jets,					1250),
		new /datum/data/mining_equipment("Hardsuit - Intelligence Storage",	/obj/item/rig_module/ai_container,								2500),
		new /datum/data/mining_equipment("Hardsuit - Smoke Bomb Deployer",	/obj/item/rig_module/grenade_launcher/smoke,					2000),
		new /datum/data/mining_equipment("Industrial Equipment - Phoron Bore",	/obj/item/weapon/gun/magnetic/matfed/phoronbore/loaded,		3000),
		new /datum/data/mining_equipment("Industrial Equipment - Sheet-Snatcher",/obj/item/weapon/storage/bag/sheetsnatcher,					500),		new /datum/data/mining_equipment("Digital Tablet - Standard",	/obj/item/modular_computer/tablet/preset/custom_loadout/standard,	500),
		new /datum/data/mining_equipment("Digital Tablet - Advanced",	/obj/item/modular_computer/tablet/preset/custom_loadout/advanced,	1000),
		new /datum/data/mining_equipment("Fine Excavation Kit - Chisels",/obj/item/weapon/storage/excavation,								500),
		new /datum/data/mining_equipment("Fine Excavation Kit - Measuring Tape",/obj/item/device/measuring_tape,							125),
		new /datum/data/mining_equipment("Fine Excavation Kit - Hand Pick",/obj/item/weapon/pickaxe/hand,									375),
		new /datum/data/mining_equipment("Explosive Excavation Kit - Plastic Charge",/obj/item/weapon/plastique/seismic,					1500),
		new /datum/data/mining_equipment("Injector (L) - Glucose",/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/glucose,	500),
		new /datum/data/mining_equipment("Injector (L) - Panacea",/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/purity,	500),
		new /datum/data/mining_equipment("Injector (L) - Trauma",/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/brute,	500),
		new /datum/data/mining_equipment("Nanopaste Tube",				/obj/item/stack/nanopaste,											1000),
		new /datum/data/mining_equipment("Defense Equipment - Phase Pistol",/obj/item/weapon/gun/energy/phasegun/pistol,					400),
		new /datum/data/mining_equipment("Defense Equipment - Smoke Bomb",/obj/item/weapon/grenade/smokebomb,								100),
		new /datum/data/mining_equipment("Defense Equipment - Razor Drone Deployer",/obj/item/weapon/grenade/spawnergrenade/manhacks/station,	1000),
		new /datum/data/mining_equipment("Defense Equipment - Sentry Drone Deployer",/obj/item/weapon/grenade/spawnergrenade/ward,			1500),
		new /datum/data/mining_equipment("Defense Equipment - Steel Machete",	/obj/item/weapon/material/knife/machete,					500)
		)

/datum/data/mining_equipment
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0

/datum/data/mining_equipment/New(name, path, cost)
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost

/obj/machinery/power/quantumpad/Initialize()
	. = ..()
	default_apply_parts()

/obj/machinery/mineral/equipment_vendor/power_change()
	var/old_stat = stat
	..()
	if(old_stat != stat)
		update_icon()
	if(inserted_id && !powered())
		visible_message("<span class='notice'>The ID slot indicator light flickers on \the [src] as it spits out a card before powering down.</span>")
		inserted_id.forceMove(get_turf(src))

/obj/machinery/mineral/equipment_vendor/on_update_icon()
	if(panel_open)
		add_overlay("[initial(icon_state)]-panel")
	else
		cut_overlay("[initial(icon_state)]-panel")

	if(stat & BROKEN)
		icon_state = "[initial(icon_state)]-broken"
	else if(powered())
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-off"

/obj/machinery/mineral/equipment_vendor/attack_hand(mob/user)
	if(..())
		return
	interact(user)

/obj/machinery/mineral/equipment_vendor/attack_ghost(mob/user)
	interact(user)

/obj/machinery/mineral/equipment_vendor/interact(mob/user)
	user.set_machine(src)

	var/dat
	dat +="<div class='statusDisplay'>"
	if(istype(inserted_id))
		dat += "You have [inserted_id.mining_points] mining points collected. <A href='?src=\ref[src];choice=eject'>Eject ID.</A><br>"
	else
		dat += "No ID inserted.  <A href='?src=\ref[src];choice=insert'>Insert ID.</A><br>"
	dat += "</div>"
	dat += "<br><b>Equipment point cost list:</b><BR><table border='0' width='100%'>"
	for(var/datum/data/mining_equipment/prize in prize_list)
		dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Purchase</A></td></tr>"
	dat += "</table>"
	var/datum/browser/popup = new(user, "miningvendor", "Mining Equipment Vendor", 400, 600)
	popup.set_content(dat)
	popup.open()

/obj/machinery/mineral/equipment_vendor/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["choice"])
		if(istype(inserted_id))
			if(href_list["choice"] == "eject")
				to_chat(usr, "<span class='notice'>You eject the ID from [src]'s card slot.</span>")
				usr.put_in_hands(inserted_id)
				inserted_id = null
		else if(href_list["choice"] == "insert")
			var/obj/item/weapon/card/id/I = usr.get_active_hand()
			if(istype(I) && !inserted_id && usr.unEquip(I))
				I.forceMove(src)
				inserted_id = I
				interact(usr)
				to_chat(usr, "<span class='notice'>You insert the ID into [src]'s card slot.</span>")
			else
				to_chat(usr, "<span class='warning'>No valid ID.</span>")
				flick(icon_deny, src)

	if(href_list["purchase"])
		if(istype(inserted_id))
			var/datum/data/mining_equipment/prize = locate(href_list["purchase"])
			if (!prize || !(prize in prize_list))
				to_chat(usr, "<span class='warning'>Error: Invalid choice!</span>")
				flick(icon_deny, src)
				return
			if(prize.cost > inserted_id.mining_points)
				to_chat(usr, "<span class='warning'>Error: Insufficent points for [prize.equipment_name]!</span>")
				flick(icon_deny, src)
			else
				inserted_id.mining_points -= prize.cost
				to_chat(usr, "<span class='notice'>[src] clanks to life briefly before vending [prize.equipment_name]!</span>")
				new prize.equipment_path(drop_location())
				flick(icon_vend, src)
		else
			to_chat(usr, "<span class='warning'>Error: Please insert a valid ID!</span>")
			flick(icon_deny, src)
	updateUsrDialog()

/obj/machinery/mineral/equipment_vendor/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction_screwdriver(user, I))
		updateUsrDialog()
		return
	if(default_part_replacement(user, I))
		return
	if(default_deconstruction_crowbar(user, I))
		return
	if(istype(I, /obj/item/mining_voucher))
		if(!powered())
			return
		RedeemVoucher(I, user)
		return
	if(istype(I,/obj/item/weapon/card/id))
		if(!powered())
			return
		else if(!inserted_id && user.unEquip(I))
			I.forceMove(src)
			inserted_id = I
			interact(user)
		return
	..()

/obj/machinery/mineral/equipment_vendor/dismantle()
	if(inserted_id)
		inserted_id.forceMove(loc) //Prevents deconstructing the ORM from deleting whatever ID was inside it.
	. = ..()

/obj/machinery/mineral/equipment_vendor/proc/RedeemVoucher(obj/item/mining_voucher/voucher, mob/redeemer)
	var/selection = input(redeemer, "Pick your equipment", "Mining Voucher Redemption") as null|anything in list("Kinetic Accelerator", "Resonator", "Mining Drone", "Advanced Scanner", "Crusher")
	if(!selection || !Adjacent(redeemer) || voucher.loc != redeemer)
		return
//	var/drop_location = drop_location()
//	switch(selection)
//		if("Kinetic Accelerator")
//			new /obj/item/weapon/gun/energy/kinetic_accelerator(drop_location)
//		if("Resonator")
//			new /obj/item/resonator(drop_location)
		// if("Mining Drone")
		// 	new /obj/item/storage/box/drone_kit(drop_location)
		// if("Advanced Scanner")
		// 	new /obj/item/device/t_scanner/adv_mining_scanner(drop_location)
		// if("Crusher")
		// 	new /obj/item/twohanded/required/mining_hammer(drop_location)
	qdel(voucher)

/obj/machinery/mineral/equipment_vendor/proc/new_prize(var/name, var/path, var/cost) // Generic proc for adding new entries. Good for abusing for FUN and PROFIT.
	if(!cost)
		cost = 100
	if(!path)
		path = /obj/item/stack/marker_beacon
	if(!name)
		name = "Generic Entry"
	prize_list += new /datum/data/mining_equipment(name, path, cost)

/obj/machinery/mineral/equipment_vendor/ex_act(severity, target)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()
	if(prob(50 / severity) && severity < 3)
		qdel(src)
