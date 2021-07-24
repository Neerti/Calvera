/obj/item/weapon/spell/modifier
	name = "modifier template"
	desc = "Tell a coder if you can read this in-game."
	icon_state = "purify"
	cast_methods = CAST_MELEE
	var/modifier_type = null
	var/modifier_duration = null // Will last forever by default.  Final duration may differ due to 'spell power'
//	var/spell_color = "#03A728"
	var/spell_light_intensity = 2
	var/spell_light_range = 3

/obj/item/weapon/spell/modifier/Initialize(mapload)
	set_light(spell_light_range, spell_light_intensity, l_color = light_color)
	return ..()

/obj/item/weapon/spell/modifier/on_melee_cast(atom/hit_atom, mob/user)
	if(istype(hit_atom, /mob/living))
		return on_add_modifier(hit_atom)
	return FALSE

/obj/item/weapon/spell/modifier/on_ranged_cast(atom/hit_atom, mob/user)
	if(istype(hit_atom, /mob/living))
		return on_add_modifier(hit_atom)
	return FALSE


/obj/item/weapon/spell/modifier/proc/on_add_modifier(var/mob/living/L)
	var/duration = modifier_duration
	if(duration)
		duration = round(duration * calculate_spell_power(1.0), 1)
	var/datum/legacy_modifier/M = L.add_legacy_modifier(modifier_type, duration, owner)
	if(istype(M, /datum/legacy_modifier/technomancer))
		var/datum/legacy_modifier/technomancer/MT = M
		MT.spell_power = calculate_spell_power(1)
	log_and_message_admins("has casted [src] on [L].")
	qdel(src)
	return TRUE

// Technomancer specific subtype which keeps track of spell power and gets targeted specificially by Dispel.
/datum/legacy_modifier/technomancer
	var/spell_power = null // Set by on_add_modifier.