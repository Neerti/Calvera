// Very WIP, needs to be seen by only the user.
/obj/effect/highlight_test
	icon = 'icons/turf/space.dmi'
	icon_state = "white"
	mouse_opacity = 0
	plane = PLANE_LIGHTING_ABOVE

/client
	var/list/highlights = list()

/client/verb/test_highlight()
	QDEL_LIST(highlights)
	
	for(var/thing in RANGE_TURFS(src.view, mob))
		var/turf/T = thing
		var/radiation = SSradiation.get_rads_at_turf(T)
		if(!radiation)
			continue
		var/G = LERP(50, 255, radiation / RAD_LEVEL_HIGH)
		var/A = LERP(64, 128, radiation / RAD_LEVEL_HIGH)
		A = min(A, 128)
		var/obj/effect/highlight_test/H = new(T)
		highlights += H
		H.color = rgb(0, G, 0, A)


/client/verb/test_highlight_temperature()
	for(var/highlight in highlights)
		qdel(highlight)
	
	for(var/thing in RANGE_TURFS(src.view, mob))
		var/turf/T = thing
		var/real_temperature = T.temperature
		var/datum/gas_mixture/atmos = T.return_air()
		if(T)
			real_temperature = atmos.temperature
/*
//		if(istype(T, /turf/simulated))
//			var/turf/simulated/sim = T
//			real_temperature = sim.zone.air.temperature
//		else if(istype(T, /turf/space))
//			real_temperature = TCMB
		var/H = 0
		var/S = 255
		var/V = 255
		var/high_H = 0
		var/low_H = 0
		switch(real_temperature)
			if(0 to T0C)
				//low_H = 200
				//high_H = 185
				low_H = ReadHSV(RGBtoHSV("#0077ff"))[1]
				high_H = ReadHSV(RGBtoHSV("#00eaff"))[1]
				var/lerp_value = MAP(real_temperature, 0, T0C, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T0C to T0C+10)
				//low_H = 185
				//high_H = 170
				low_H = ReadHSV(RGBtoHSV("#00eaff"))[1]
				high_H = ReadHSV(RGBtoHSV("#00ffd4"))[1]
				var/lerp_value = MAP(real_temperature, T0C, T0C+10, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T0C+10 to T20C)
				//low_H = 170
				//high_H = 120
				low_H = ReadHSV(RGBtoHSV("#00ffd4"))[1]
				high_H = ReadHSV(RGBtoHSV("#00ff00"))[1]
				var/lerp_value = MAP(real_temperature, T0C+10, T20C, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T20C to T0C+30)
				//low_H = 120
				//high_H = 70
				low_H = ReadHSV(RGBtoHSV("#00ff00"))[1]
				high_H = ReadHSV(RGBtoHSV("#d4ff00"))[1]
				var/lerp_value = MAP(real_temperature, T20C, T0C+30, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T0C+30 to T0C+40)
				//low_H = 70
				//high_H = 50
				low_H = ReadHSV(RGBtoHSV("#d4ff00"))[1]
				high_H = ReadHSV(RGBtoHSV("#ffd500"))[1]
				var/lerp_value = MAP(real_temperature, T0C+30, T0C+40, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T0C+40 to T0C+100)
				//low_H = 50
				//high_H = 25
				low_H = ReadHSV(RGBtoHSV("#ffd500"))[1]
				high_H = ReadHSV(RGBtoHSV("#ff6a00"))[1]
				var/lerp_value = MAP(real_temperature, T0C+40, T0C+100, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T0C+100 to T0C+1000)
				//low_H = 25
				//high_H = 0
				low_H = ReadHSV(RGBtoHSV("#ff6a00"))[1]
				high_H = ReadHSV(RGBtoHSV("#ff0000"))[1]
				var/lerp_value = MAP(real_temperature, T0C+100, T0C+1000, 0, 1)
				H = LERP(low_H, high_H, lerp_value)
			if(T0C+1000 to INFINITY)
				H = ReadHSV(RGBtoHSV("#ff0000"))[1]
*/
		var/decl/color_spectrum/spectrum = GET_DECL(/decl/color_spectrum/temperature_scanner)
		spectrum.interpolate_color(real_temperature)
		var/obj/effect/highlight_test/highlight = new(T)
		highlights += highlight
	//	highlight.color = HSVtoRGB(hsv(H, S, V, 128))
		highlight.color = spectrum.interpolate_color(real_temperature)
	//	world << "[real_temperature] = [H]"

/*
// A neat little helper to convert the value X, that's between imin and imax, into a value
// that's proportionally scaled and in range of omin and omax.
#define MAP(x, imin, imax, omin, omax) ((x - imin) * (omax - omin) / (imax - imin) + omin)
*/

/decl/atom_property_overlay

/decl/atom_property_overlay/temperature

/decl/color_spectrum
	var/list/colors = list(
		"#000000" = 0,
		"#ffffff" = 1
	)
	// Automatically generated on init based on colors.
	var/list/keys = list()
	var/list/values = list()

/decl/color_spectrum/Initialize()
	. = ..()
	for(var/color in colors)
		keys += color
		values += colors[color]

/decl/color_spectrum/proc/interpolate_color(value)
	// First, find which two colors to use.
	var/target_index = 0
	for(var/i = 1 to colors.len)
		var/current_number = colors[i]
		if(value < current_number)
			break
		target_index = i
	// Now interpolate between (usually) two colors.
	// But first check for out of bounds.

	// If the value provided is lower than the lowest point, use the lowest color.
	if(target_index == 0)
		return keys[1]

	// Likewise for if it goes above, use the highest color.
	else if(target_index == keys.len)
		return keys[keys.len]
	
	// Now to do actual interpolation.
	var/list/low_rgb = ReadRGB(keys[target_index])
	var/list/high_rgb = ReadRGB(keys[target_index+1])

	var/interpolate_position = MAP(value, values[target_index], values[target_index+1], 0, 1)
	var/R = LERP(low_rgb[1], high_rgb[1], interpolate_position)
	var/G = LERP(low_rgb[2], high_rgb[2], interpolate_position)
	var/B = LERP(low_rgb[3], high_rgb[3], interpolate_position)
	var/A = 255 // If alpha is not specified, default to full alpha.
	if(low_rgb.len > 3 && high_rgb.len > 3)
		A = LERP(low_rgb[4], high_rgb[4], interpolate_position)
	return rgb(R, G, B, A)

/decl/color_spectrum/temperature_scanner
	colors = list(
		"#ffffff" = 0,
		"#0077ff" = TCMB,
		"#00eaff" = T0C,
		"#00ffd4" = T0C+10,
		"#00ff00" = T20C,
		"#d4ff00" = T0C+30,
		"#ffd500" = T0C+40,
		"#ff6a00" = T0C+100,
		"#ff0000" = T0C+1000
	)
		