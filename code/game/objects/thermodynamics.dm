#define ATOM_TEMPERATURE_EQUILIBRIUM_THRESHOLD 2

/obj
	var/temperature = T20C
	// These are placeholders, to be removed when material decls are finished.
	// They're so placeholder that they default to water numbers.
	var/thermal_mass = 1000 // g
	var/thermal_conductivity = 0.6065 // J/°K.
	var/specific_heat_capacity = 4.1868 // W/(m*K)

// Returns how much the temperature changed with the addition or subtraction of thermal energy.
// Actually applying that to the current temperature and making sure it doesn't go below absolute zero is the responsibility of the caller.
/obj/proc/add_thermal_energy(joules)
	return joules / (specific_heat_capacity * thermal_mass)
/*
/datum/thermodynamics/proc/add_thermal_energy(datum/element/E, grams, joules)
	return joules / (E.specific_heat_capacity * grams)
*/

// Exchanges heat with the air.
/obj/proc/process_thermodynamic_convection()
	// Stolen from Nebula.
	SHOULD_NOT_SLEEP(TRUE)

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
		world << "todo"

// Exchanges heat with objects touching it.
/obj/proc/process_thermodynamic_conduction(obj/O)
	var/temperature_delta = temperature - O.temperature

