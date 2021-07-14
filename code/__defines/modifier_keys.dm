#define MODIFIER_MAX_HEALTH_FLAT		"max health flat"
#define MODIFIER_MAX_HEALTH_PERCENT		"max health percentage"
#define MODIFIER_SCALE_X				"scale x"
#define MODIFIER_SCALE_Y				"scale y"

/*
	// Now for all the different effects.
	// Percentage modifiers are expressed as a multipler. (e.g. +25% damage should be written as 1.25)
	var/max_health_flat					// Adjusts max health by a flat (e.g. +20) amount.  Note this is added to base health.
	var/max_health_percent				// Adjusts max health by a percentage (e.g. -30%).
	var/disable_duration_percent		// Adjusts duration of 'disables' (stun, weaken, paralyze, confusion, sleep, halloss, etc)  Setting to 0 will grant immunity.
	var/incoming_damage_percent			// Adjusts all incoming damage.
	var/incoming_brute_damage_percent	// Only affects bruteloss.
	var/incoming_fire_damage_percent	// Only affects fireloss.
	var/incoming_tox_damage_percent		// Only affects toxloss.
	var/incoming_oxy_damage_percent		// Only affects oxyloss.
	var/incoming_clone_damage_percent	// Only affects cloneloss.
	var/incoming_hal_damage_percent		// Only affects halloss.
	var/incoming_healing_percent		// Adjusts amount of healing received.
	var/outgoing_melee_damage_percent	// Adjusts melee damage inflicted by holder by a percentage.  Affects attacks by melee weapons and hand-to-hand.
	var/slowdown						// Negative numbers speed up, positive numbers slow down movement.
	var/haste							// If set to 1, the mob will be 'hasted', which makes it ignore slowdown and go really fast.
	var/evasion							// Positive numbers reduce the odds of being hit. Negative numbers increase the odds.
	var/bleeding_rate_percent			// Adjusts amount of blood lost when bleeding.
	var/accuracy						// Positive numbers makes hitting things with guns easier, negatives make it harder.
	var/accuracy_dispersion				// Positive numbers make gun firing cover a wider tile range, and therefore more inaccurate.  Negatives help negate dispersion penalties.
	var/metabolism_percent				// Adjusts the mob's metabolic rate, which affects reagent processing.  Won't affect mobs without reagent processing.
	var/icon_scale_x_percent			// Makes the holder's icon get scaled wider or thinner.
	var/icon_scale_y_percent			// Makes the holder's icon get scaled taller or shorter.
	var/attack_speed_percent			// Makes the holder's 'attack speed' (click delay) shorter or longer.
	var/pain_immunity					// Makes the holder not care about pain while this is on. Only really useful to human mobs.
	var/pulse_modifier					// Modifier for pulse, will be rounded on application, then added to the normal 'pulse' multiplier which ranges between 0 and 5 normally. Only applied if they're living.
	var/pulse_set_level					// Positive number. If this is non-null, it will hard-set the pulse level to this. Pulse ranges from 0 to 5 normally.
	var/emp_modifier					// Added to the EMP strength, which is an inverse scale from 1 to 4, with 1 being the strongest EMP. 5 is a nullification.
	var/explosion_modifier				// Added to the bomb strength, which is an inverse scale from 1 to 3, with 1 being gibstrength. 4 is a nullification.

	// Note that these are combined with the mob's real armor values additatively. You can also omit specific armor types.
	var/list/armor_percent = null		// List of armor values to add to the holder when doing armor calculations. This is for percentage based armor. E.g. 50 = half damage.
	var/list/armor_flat = null			// Same as above but only for flat armor calculations. E.g. 5 = 5 less damage (this comes after percentage).
	// Unlike armor, this is multiplicative. Two 50% protection modifiers will be combined into 75% protection (assuming no base protection on the mob).
	var/heat_protection = null			// Modifies how 'heat' protection is calculated, like wearing a firesuit. 1 = full protection.
	var/cold_protection = null			// Ditto, but for cold, like wearing a winter coat.
	var/siemens_coefficient = null		// Similar to above two vars but 0 = full protection, to be consistant with siemens numbers everywhere else.

	var/vision_flags					// Vision flags to add to the mob. SEE_MOB, SEE_OBJ, etc.
*/