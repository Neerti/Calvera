// This is a datum that tells the mob that something is affecting them.
// The advantage of using this datum verses just setting a variable on the mob directly, is that there is no risk of two different procs overwriting
// each other, or other weirdness.  An excellent example is adjusting max health.

/datum/modifier
	/// The mob that the modifier is affecting.
	var/mob/living/holder = null

	/// If TRUE, the modifier is not shown on the HUD to players.
	var/hidden = FALSE
	
	/// The name of the modifier, shown on the HUD to players.
	var/name = null

	/// A short string to describe the modifier, whether that be fluff text or mechanical effects.
	var/desc = null

	/// Determines which icon file is used, to display on the HUD.
	var/icon = null

	/// Determines which icon_state is used, along with `icon`, to display on the HUD.
	var/icon_state = null

//	var/expire_at = null	// world.time when holder's Life() will remove the datum.  If null, it lasts forever or until it gets deleted by something else.
	
	/// The ID used for the timer that tracks when the modifier ends. If null, the modifier lasts until it is manually removed.
	var/timer_id = null

	/// Text to show to holder upon the mob receiving the modifier.
	var/on_given_text = null

	// Text to show to holder when the mob loses the modifier.
	var/on_removed_text = null
	
	/// Determines how duplicate modifiers are handled.
	var/stacks = MODIFIER_STACKING_FORBID

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


/datum/modifier/proc/update_cache()
	return

/mob/living
	/// A list of modifier instances that the mob has active.
	var/list/modifiers = list()

	/// When a modifier is added or removed, a value is calculated and stored in this cache, which avoids future unneeded calculations.
	var/list/modifier_cache = list()

/mob/living/proc


/// Adds values to the modifier cache. Called when a modifier is given to a mob.
/mob/living/proc/add_to_modifier_cache(datum/modifier/M)
	for(var/key in M.modifications)
		var/value = modifier_cache[key]
		if(isnull(value))
			modifier_cache[key] = M.modifications[key]
		else
			modifier_cache[key] += M.modifications[key]

/// Removes values to the modifier cache. Called when a modifier is removed from a mob.
/mob/living/proc/remove_from_modifier_cache(datum/modifier/M)
	for(var/key in M.modifications)
		var/value = modifier_cache[key]
		if(isnull(value))
			modifier_cache[key] = M.modifications[key]
		else
			modifier_cache[key] -= M.modifications[key]


/// Recalculates the modifier cache based on the values the supplied modifier has.
/mob/living/proc/update_modifier_cache(datum/modifier/M)
	// Iterate every modification that the supplied modifier would affect.
	for(var/key in M.modifications)
		var/new_value = null
		// Check all active modifiers to see if they have the same modification.
		for(var/thing in modifiers)
			var/datum/modifier/other_modifier = thing
			var/other_value = other_modifier.modifications[key]

			// Some modifications are assoc lists, and need to be handled differently.
			if(islist(other_value))
				new_value = sum_assoc(
					islist(new_value) ? new_value : list(),
					other_value
				)
			else
				new_value += other_value
		
		if(isnull(new_value))
			// No other modifiers that modify the value exist, so remove it from the cache.
			modifier_cache -= key // BAD
		else
			modifier_cache[key] = new_value

/datum/modifier/testing
	name = "Test Modifier"
	desc = "This should be readable in the HUD hopefully."
	modifications = list("health_flat" = 50)