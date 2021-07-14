// This is a datum that tells the mob that something is affecting them.
// The advantage of using this datum verses just setting a variable on the mob directly, is that there is no risk of two different procs overwriting
// each other, or other weirdness.  An excellent example is adjusting max health.

/datum/modifier
	/// The mob that the modifier is affecting.
	var/mob/living/holder = null

	/// If TRUE, the modifier is not shown on the HUD to players.
	var/hidden = FALSE

	/// If TRUE, the modifier will be visible to players as a HUD alert.
	var/show_alert = TRUE

	/// If TRUE, a shrinking bar element is placed on the player's HUD, to visually display how long the modifier lasts for. Recommended for short-term modifiers.
	var/show_duration_bar = FALSE

	/// Instance of the duration bar HUD element.
	var/obj/screen/modifier_duration_bar/bar = null

	/// If TRUE, players can find out how long the modifier will last, if `show_alert` is also TRUE.
	var/show_time_left = TRUE
	
	/// The name of the modifier, shown on the HUD to players.
	var/name = null

	/// A short string to describe the modifier, whether that be fluff text or mechanical effects.
	var/desc = null

	/// Determines which icon file is used, to display on the HUD.
	var/icon = 'icons/mob/screen_alert.dmi'

	/// Determines which icon_state is used, along with `icon`, to display on the HUD.
	var/icon_state = "default"

	/// Icon state for an overlay to be applied to the mob while the modifier exists.
	var/mob_overlay_state = null

//	var/expire_at = null	// world.time when holder's Life() will remove the datum.  If null, it lasts forever or until it gets deleted by something else.
	
	/// world.time that the modifier was attached to the mob.
	var/time_added = null

	/// Approximately the world.time that the modifier will expire, assuming it does expire. This will update if the expiration is postponed or canceled.
	var/predicted_time_to_remove = null

	/// The ID used for the timer that tracks when the modifier ends. If null, the modifier lasts until it is manually removed.
	var/expire_timer_id = null

	/// Text to show to holder upon the mob receiving the modifier unconditionally.
	var/on_attached_text = null

	// Text to show to holder when the mob loses the modifier unconditionally.
	var/on_detached_text = null
	
	/// Determines how duplicate modifiers are handled.
	var/stacks = MODIFIER_STACKING_FORBID

	/// If stacking is allowed, the number of stacks can be capped to this value. If zero, there is no limit.
	var/stack_limit = 0

	/// Blocks additional instances entirely.
	var/const/MODIFIER_STACKING_FORBID = 1

	/// Blocks additional instances, but extends the existing instance to what the next instance would have been.
	var/const/MODIFIER_STACKING_EXTEND = 2

	/// Removes the first instance, before the second instance is applied.
	var/const/MODIFIER_STACKING_OVERWRITE = 3

	/// Multiple instances can exist concurrently.
	var/const/MODIFIER_STACKING_ALLOWED = 4

//	var/flags = 0						// Flags for the modifier, see mobs.dm defines for more details.

	/// A list of all modifications to apply to the mob. Note that if this is altered, you need to rebuild the cache.
	var/list/modifications = list()


/datum/modifier/New(new_holder)
	holder = new_holder

/datum/modifier/Destroy()
	detach_modifier()
	return ..()

/// Adds the modifier to its mob.
/datum/modifier/proc/attach_modifier()
	holder.modifiers += src
	holder.update_modifier_cache(src)

	time_added = world.time

	if(on_attached_text)
		to_chat(holder, on_attached_text)
	
	if(!hidden && show_alert)
		var/obj/screen/alert/modifier/A = holder.throw_alert("modifier_[REF(src)]", /obj/screen/alert/modifier)
		A.modifier = src
		A.name = name
		A.desc = desc
		A.icon = icon
		A.icon_state = icon_state
	
	if(mob_overlay_state)
		holder.update_modifier_visuals()
	
	if(modifications[MODIFIER_SCALE_X] || modifications[MODIFIER_SCALE_Y])
		holder.update_transform()

	on_attached()

/*
	if(mod.mob_overlay_state)
		update_modifier_visuals()
	if(mod.icon_scale_x_percent || mod.icon_scale_y_percent)
		update_transform()
	if(mod.client_color)
		update_client_color()
	if(LAZYLEN(mod.filter_parameters))
		add_filter(REF(mod), mod.filter_priority, mod.filter_parameters)
		mod.filter_instance = get_filter(REF(mod))
*/

/// Removes the modifier from its mob. Called prior to it being deleted.
/datum/modifier/proc/detach_modifier()
	holder.modifiers -= src
	holder.update_modifier_cache(src)

	if(on_detached_text)
		to_chat(holder, on_detached_text)

	if(expire_timer_id)
		deltimer(expire_timer_id)
	
	if(!hidden)
		holder.clear_alert("modifier_[REF(src)]")
	
	if(bar)
		QDEL_NULL(bar)
	
	if(mob_overlay_state)
		holder.update_modifier_visuals()
	
	if(modifications[MODIFIER_SCALE_X] || modifications[MODIFIER_SCALE_Y])
		holder.update_transform()
	
	on_detached()

/**
Makes a modifier have a limited lifespan, after which it will delete itself. 
Can be called multiple times to postpone expiration, or cancel it entirely by supplying `0`.
*/
/datum/modifier/proc/expire_in(delay)
	if(expire_timer_id)
		deltimer(expire_timer_id)
		expire_timer_id = null
		predicted_time_to_remove = null
	if(delay)
		expire_timer_id = addtimer(CALLBACK(src, .proc/expire), delay, TIMER_STOPPABLE)
		predicted_time_to_remove = world.time + delay

		// TODO
		if(!hidden && show_duration_bar)
			bar = new(null, holder, delay)

/// Called when a modifier has a pre-set time limit, and it runs out.
/datum/modifier/proc/expire()
	on_expired()
	qdel(src)

/datum/modifier/proc/on_attached()

/datum/modifier/proc/on_detached()

/// Called when a modifier expires due to running out of time. Place custom logic here.
/datum/modifier/proc/on_expired()

/mob/living
	/// A list of modifier instances that the mob has active.
	var/list/modifiers = list()

/mob/living/proc/add_modifier(modifier_type, duration)
	// First, check if we need to consider stacking.
	var/number_of_stacks = 0
	for(var/thing in modifiers)
		var/datum/modifier/M = thing
		if(ispath(modifier_type, M))
			// At this point, there's a duplicate modifier.
			switch(M.stacks)
				if(M.MODIFIER_STACKING_FORBID)
					return FALSE
				
				if(M.MODIFIER_STACKING_EXTEND)
					if(duration && world.time + duration > M.predicted_time_to_remove)
						M.expire_in(duration) // This will reset the current timer.
					return
				
				if(M.MODIFIER_STACKING_OVERWRITE)
					qdel(M)
					break
				
				if(M.MODIFIER_STACKING_ALLOWED)
					number_of_stacks++
					break
	
	// At this point, the mob doesn't already have it, or it does but stacking is allowed.
	var/datum/modifier/new_modifier = new modifier_type(src)
	
	// Now check if it'll go over the stack cap.
	if(new_modifier.stack_limit && (number_of_stacks + 1 > new_modifier.stack_limit))
		qdel(new_modifier)
		return FALSE
	
	new_modifier.attach_modifier()

	if(duration)
		new_modifier.expire_in(duration)

	return new_modifier

/mob/living/get_modification(key)
	return modifier_cache[key]

// Removes one modifier of a type
/mob/living/proc/remove_a_modifier_of_type(var/modifier_type, var/silent = FALSE)
	for(var/datum/modifier/M in modifiers)
		if(ispath(M.type, modifier_type))
			qdel(M)
			break

// Removes all modifiers of a type
/mob/living/proc/remove_modifiers_of_type(var/modifier_type)
	for(var/datum/modifier/M in modifiers)
		if(ispath(M.type, modifier_type))
			qdel(M)

// Removes all modifiers, useful if the mob's being deleted
/mob/living/proc/remove_all_modifiers()
	QDEL_LIST_NULL(modifiers)

// Checks if the mob has a modifier type.
/mob/living/proc/has_modifier_of_type(var/modifier_type)
	return get_modifier_of_type(modifier_type) ? TRUE : FALSE

// Gets the first instance of a specific modifier type or subtype.
/mob/living/proc/get_modifier_of_type(var/modifier_type)
	for(var/datum/modifier/M in modifiers)
		if(istype(M, modifier_type))
			return M
	return null

/datum/modifier/testing
	name = "Test Modifier"
	desc = "This should be readable in the HUD hopefully."
	modifications = list(MODIFIER_MAX_HEALTH_FLAT = 50)
	stacks = MODIFIER_STACKING_ALLOWED
	on_attached_text = "You got the modifier!"
	on_detached_text = "You lost the modifier..."

/mob/living/verb/test_modifier_adding()
	add_modifier(/datum/modifier/testing, 10 SECONDS)


/datum/modifier/stun
	name = "Stunned"
	desc = "You're stunned, and cannot act!"
	modifications = list("stun" = 1)
	stacks = MODIFIER_STACKING_EXTEND

// TESTING
/datum/modifier/stun/on_attached()
	holder.SetWeakened(20)

/datum/modifier/stun/on_detached()
	holder.SetWeakened(0)

/mob/living/verb/test_modifier_stun()
	add_modifier(/datum/modifier/stun, 1.5 SECONDS)