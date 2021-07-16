/mob/living
	/// When a modifier is added or removed, a value is calculated and stored in this cache, which avoids future unneeded calculations.
	var/list/modifier_cache = list()

/// Recalculates the modifier cache based on the values the supplied modifier has.
/mob/living/proc/update_modifier_cache(datum/modifier/M)
	// Iterate every modification that the supplied modifier would affect.
	for(var/key in M.modifications)
		var/new_value = null
		// Check all active modifiers to see if they have the same modification.
		for(var/thing in modifiers)
			var/datum/modifier/other_modifier = thing
			var/other_value = other_modifier.modifications[key]
			var/decl/modifier_field/field = GET_DECL(key)
			new_value = field.sum(new_value, other_value)

			// Some modifications are assoc lists, and need to be handled differently.
			/*
			if(islist(other_value))
				new_value = sum_assoc(
					islist(new_value) ? new_value : list(),
					other_value
				)
			else
				new_value += other_value
			*/
		
		if(isnull(new_value))
			// No other modifiers that modify the value exist, so remove it from the cache.
			modifier_cache -= key // BAD?
		else
			modifier_cache[key] = new_value