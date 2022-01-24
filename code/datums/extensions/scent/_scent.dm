#define SCENT_DESC_ODOR        "odor"
#define SCENT_DESC_SMELL       "smell"
#define SCENT_DESC_FRAGRANCE   "fragrance"

/*****
Scent intensity
*****/
/decl/scent_intensity
	var/cooldown = 5 MINUTES 
	var/intensity = 1

/decl/scent_intensity/proc/PrintMessage(var/mob/user, var/descriptor, var/scent)
	to_chat(user, SPAN_SUBTLE("The subtle [descriptor] of [scent] tickles your nose..."))

/decl/scent_intensity/normal
	cooldown = 4 MINUTES
	intensity = 2

/decl/scent_intensity/normal/PrintMessage(var/mob/user, var/descriptor, var/scent)
	to_chat(user, SPAN_NOTICE("The [descriptor] of [scent] fills the air."))

/decl/scent_intensity/strong
	cooldown = 3 MINUTES
	intensity = 3

/decl/scent_intensity/strong/PrintMessage(var/mob/user, var/descriptor, var/scent)
	to_chat(user, SPAN_WARNING("The unmistakable [descriptor] of [scent] bombards your nostrils."))

/*****
 Scent extensions
 Usage:
	To add:
		set_extension(atom, /datum/extension/scent/PATH/TO/SPECIFIC/SCENT)
		This will set up the extension and will make it begin to emit_scent.
	To remove:
		remove_extension(atom, /datum/extension/scent)
*****/

/datum/extension/scent
	base_type = /datum/extension/scent
	expected_type = /atom
	flags = EXTENSION_FLAG_IMMEDIATE

	var/scent = "something"
	var/decl/scent_intensity/intensity = /decl/scent_intensity
	var/descriptor = SCENT_DESC_SMELL //unambiguous descriptor of smell; food is generally good, sewage is generally bad. how 'nice' the scent is
	var/range = 1 //range in tiles

/datum/extension/scent/New()
	..()
	if(ispath(intensity))
		intensity = GET_DECL(intensity)
	START_PROCESSING(SSprocessing, src)

/datum/extension/scent/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	. = ..()

/datum/extension/scent/process()
	if(!holder)
		PRINT_STACK_TRACE("Scent extension with scent '[scent]', intensity '[intensity]', descriptor '[descriptor]' and range of '[range]' attempted to emit_scent() without a holder.")
		qdel(src)
		return PROCESS_KILL
	emit_scent()

/datum/extension/scent/proc/emit_scent()
//	for(var/mob/living/M in all_hearers(holder, range))
	for(var/mob/living/M in hearers(holder, range))
		var/turf/T = get_turf(M.loc)
		if(!T)
			continue
		if(!M.can_smell() || !T.return_air())
			continue
		show_smell(M)

/datum/extension/scent/proc/show_smell(var/mob/living/carbon/human/smeller)
	if(LAZYACCESS(smeller.smell_cooldown, scent) < world.time)
		intensity.PrintMessage(smeller, descriptor, scent)
		LAZYSET(smeller.smell_cooldown, scent, world.time + intensity.cooldown)

/*****
Custom subtype
	set_extension(atom, /datum/extension/scent/custom, scent = "scent", intensity = SCENT_INTENSITY_, ... etc)
This will let you set an extension without needing to define it beforehand. Note that all vars are required if generating.
*****/
/datum/extension/scent/custom/New(var/datum/holder, var/provided_scent, var/provided_intensity, var/provided_descriptor, var/provided_range)
	..()
	ASSERT(provided_scent && provided_intensity && provided_descriptor && provided_range)
	scent = provided_scent
	if(ispath(provided_intensity))
		intensity = GET_DECL(provided_intensity)
	descriptor = provided_descriptor
	range = provided_range

/*****
Reagents have the following vars, which coorelate to the vars on the standard scent extension:
	scent,
	scent_intensity,
	scent_descriptor,
	scent_range
To add a scent extension to an atom using a reagent's info, where R. is the reagent, use set_scent_by_reagents().
*****/
/*
/proc/set_scent_by_reagents(var/atom/smelly_atom)
	var/decl/material/smelliest
	var/decl/material/scent_intensity
	if(!smelly_atom.reagents || !smelly_atom.reagents.total_volume)
		return
	for(var/reagent_type in smelly_atom.reagents.reagent_volumes)
		var/decl/material/R = GET_DECL(reagent_type)
		if(!R.scent)
			continue
		var/decl/scent_intensity/SI = GET_DECL(R.scent_intensity)
		var/r_scent_intensity = REAGENT_VOLUME(smelly_atom.reagents, reagent_type) * SI.intensity
		if(r_scent_intensity > scent_intensity)
			smelliest = R
			scent_intensity = r_scent_intensity 
	if(smelliest)
		set_extension(smelly_atom, /datum/extension/scent/custom, smelliest.scent, smelliest.scent_intensity, smelliest.scent_descriptor, smelliest.scent_range)
*/

/mob/living/carbon/human
	var/list/smell_cooldown = null

/mob/living/carbon/human/Destroy()
	LAZYCLEARLIST(smell_cooldown)
	. = ..()

/mob/living/carbon/human/verb/sniff_verb()
	set name = "Sniff"
	set desc = "Smell the local area."
	set category = "IC"
	set src = usr
	if(!incapacitated())
		if(species.sniff_message_3p && species.sniff_message_1p)
			visible_message(SPAN_NOTICE("\The [src] [species.sniff_message_3p]."), SPAN_NOTICE(species.sniff_message_1p))
		LAZYCLEARLIST(smell_cooldown)


/datum/species
	var/can_smell = TRUE
	var/sniff_message_3p = "sniffs the air."
	var/sniff_message_1p = "You sniff the air."

/// Returns whether or not a mob could smell.
/mob/living/proc/can_smell()
	if(!stat != CONSCIOUS || failed_last_breath)
		return FALSE
	if(isSynthetic())
		return FALSE
	return TRUE

/mob/living/carbon/human/can_smell()
	if(!species.can_smell)
		return FALSE
	// Airtight helmets and masks block smells.
	// Technically they shouldn't if internals aren't on, but that's probably too much effort for a minor fluff feature.
	var/obj/item/mask = get_equipped_item(slot_wear_mask)
	if(mask && (mask.flags & AIRTIGHT))
		return FALSE
	var/obj/item/head = get_equipped_item(slot_head)
	if(head && (head.flags & AIRTIGHT))
		return FALSE
	return ..()