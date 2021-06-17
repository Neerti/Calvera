PROCESSING_SUBSYSTEM_DEF(thermodynamics)
	name = "Thermodynamics"
//	priority = FIRE_PRIORITY_OBJ
	flags = SS_NO_INIT
	wait = 20

/*
/atom/proc/ProcessAtomTemperature()
	SHOULD_NOT_SLEEP(TRUE)

	// Get our location temperature if possible.
	// Nullspace is room temperature, clearly.
	var/adjust_temp
	if(loc)
		if(!istype(loc, /turf/simulated))
			adjust_temp = loc.temperature
		else
			var/turf/simulated/T = loc
			if(T.zone && T.zone.air)
				adjust_temp = T.zone.air.temperature
			else
				adjust_temp = T20C
	else
		adjust_temp = T20C

	var/diff_temp = adjust_temp - temperature
	if(abs(diff_temp) >= ATOM_TEMPERATURE_EQUILIBRIUM_THRESHOLD)
		var/altered_temp = max(temperature + (ATOM_TEMPERATURE_EQUILIBRIUM_CONSTANT * temperature_coefficient * diff_temp), 0)
		ADJUST_ATOM_TEMPERATURE(src, (diff_temp > 0) ? min(adjust_temp, altered_temp) : max(adjust_temp, altered_temp))
	else
		temperature = adjust_temp
		return PROCESS_KILL
*/