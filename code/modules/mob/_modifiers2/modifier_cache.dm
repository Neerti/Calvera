/mob/living
	/// When a modifier is added or removed, a value is calculated and stored in this cache, which avoids future unneeded calculations.
	var/list/modifier_cache = list()

/// Recalculates the modifier cache based on the values the supplied modifier has.
/mob/living/proc/update_modifier_cache(datum/modifier/M)
	// Iterate every modification that the supplied modifier would affect.
	for(var/key in M.fields)
		var/new_value = null
		// Check all active modifiers to see if they have the same modification.
		for(var/thing in modifiers)
			var/datum/modifier/other_modifier = thing
			var/other_value = other_modifier.fields[key]
			var/decl/modifier_field/field = GET_DECL(key)
			// Avoid multiplying by null (which acts like 0).
			if(isnull(new_value) && field.summation_strategy == field.SUMMATION_MULTIPLICITIVE)
				new_value = 1
			new_value = field.sum(new_value, other_value)
		
		if(isnull(new_value))
			// No other modifiers that modify the value exist, so remove it from the cache.
			modifier_cache -= key // BAD?
		else
			modifier_cache[key] = new_value