/datum/modifier/unit_test


/datum/unit_test/modifier_field_many
	template = /datum/unit_test/modifier_field_many
	var/list/subject_types = list(
		/mob/living/simple_animal,
		/mob/living/carbon/human
	)
	var/list/inputs = null
	var/list/outputs = null

/datum/unit_test/modifier_field_many/start_test()
	var/fails = 0
	
	for(var/subject_type in subject_types)
		for(var/i = 1 to inputs.len)
			var/mob/living/L = new subject_type(get_safe_turf())
			var/datum/modifier/modifier = L.add_modifier(/datum/modifier/unit_test)
			modifier.overwrite_fields(inputs[i])
			apply_effect(L)

			if(real_value(L) != outputs[i])
				log_bad("--- Expected value ([outputs[1]]) did not match actual value ([real_value()]) on [subject_type].")
				fails++
		
			qdel(L)
	
	if(fails)
		fail("Modifier field produced unexpected values.")
	else
		pass("Modifier field satisfied all requirements.")
	return TRUE

/datum/unit_test/modifier_field_many/proc/apply_effect(mob/living/L)
	return

/datum/unit_test/modifier_field_many/proc/real_value(mob/living/L)
	return

/datum/unit_test/modifier_field_many/incoming_fireloss
	name = "MODIFIER MANY: Incoming Fireloss"
	inputs = list(
		list(/decl/modifier_field/incoming_fireloss = 2),
		list(/decl/modifier_field/incoming_fireloss = 1),
		list(/decl/modifier_field/incoming_fireloss = 0.5),
		list(/decl/modifier_field/incoming_fireloss = 0)
		)
	outputs = list(20, 10, 5, 0)

/datum/unit_test/modifier_field_many/incoming_fireloss/real_value(mob/living/L)
	L.getFireLoss()

/datum/unit_test/modifier_field_many/incoming_fireloss/apply_effect(mob/living/L)
	L.adjustFireLoss(10)
	

/datum/unit_test/modifier_field
	template = /datum/unit_test/modifier_field
	var/list/modifications_to_test = null
	var/mob/living/subject = null
	var/subject_type = /mob/living/carbon/human

/datum/unit_test/modifier_field/start_test()
	subject = new subject_type(get_safe_turf())
	var/datum/modifier/modifier = subject.add_modifier(/datum/modifier/unit_test)
	modifier.overwrite_fields(modifications_to_test)
	apply_effect()
	if(check_modifier(real_value(), expected_value()))
		pass("No issues found.")
	else
		fail("Modifier field did not produce expected outcome. Expected value was [expected_value()], but instead it was [real_value()].")
	return TRUE

/datum/unit_test/modifier_field/teardown_test()
	QDEL_NULL(subject)
	..()

/datum/unit_test/modifier_field/proc/check_modifier(real_value, expected_value)
	return real_value == expected_value

/datum/unit_test/modifier_field/proc/expected_value()
	return

/datum/unit_test/modifier_field/proc/real_value()
	return

/datum/unit_test/modifier_field/proc/apply_effect()
	return

// Max Health Flat
/datum/unit_test/modifier_field/max_health_flat
	name = "MODIFIER: Max Health Flat"
	modifications_to_test = list(/decl/modifier_field/max_health_flat = 20)

/datum/unit_test/modifier_field/max_health_flat/real_value()
	return subject.getMaxHealth()

/datum/unit_test/modifier_field/max_health_flat/expected_value()
	return subject.maxHealth + 20

// Max Health %
/datum/unit_test/modifier_field/max_health_percent
	name = "MODIFIER: Max Health Percent"
	modifications_to_test = list(/decl/modifier_field/max_health_percent = 2)

/datum/unit_test/modifier_field/max_health_percent/real_value()
	return subject.getMaxHealth()

/datum/unit_test/modifier_field/max_health_percent/expected_value()
	return subject.maxHealth * 2

// Disable Duration
// Weaken
/datum/unit_test/modifier_field/disable_duration_weaken
	name = "MODIFIER: Disable Duration - Weaken Doubled"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 2)

/datum/unit_test/modifier_field/disable_duration_weaken/apply_effect()
	subject.Weaken(10)

/datum/unit_test/modifier_field/disable_duration_weaken/real_value()
	return subject.weakened

/datum/unit_test/modifier_field/disable_duration_weaken/expected_value()
	return 20


/datum/unit_test/modifier_field/disable_duration_weaken/halved
	name = "MODIFIER: Disable Duration - Weaken Halved"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0.5)

/datum/unit_test/modifier_field/disable_duration_weaken/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/disable_duration_weaken/negated
	name = "MODIFIER: Disable Duration - Weaken Negated"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0)

/datum/unit_test/modifier_field/disable_duration_weaken/negated/expected_value()
	return 0

// Stunned
/datum/unit_test/modifier_field/disable_duration_stun
	name = "MODIFIER: Disable Duration - Stun Doubled"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 2)

/datum/unit_test/modifier_field/disable_duration_stun/apply_effect()
	subject.Stun(10)

/datum/unit_test/modifier_field/disable_duration_stun/real_value()
	return subject.stunned

/datum/unit_test/modifier_field/disable_duration_stun/expected_value()
	return 20


/datum/unit_test/modifier_field/disable_duration_stun/halved
	name = "MODIFIER: Disable Duration - Stun Halved"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0.5)

/datum/unit_test/modifier_field/disable_duration_stun/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/disable_duration_stun/negated
	name = "MODIFIER: Disable Duration - Stun Negated"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0)

/datum/unit_test/modifier_field/disable_duration_stun/negated/expected_value()
	return 0


// Paralysis
/datum/unit_test/modifier_field/disable_duration_paralyse
	name = "MODIFIER: Disable Duration - Paralyse Doubled"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 2)

/datum/unit_test/modifier_field/disable_duration_paralyse/apply_effect()
	subject.Paralyse(10)

/datum/unit_test/modifier_field/disable_duration_paralyse/real_value()
	return subject.paralysis

/datum/unit_test/modifier_field/disable_duration_paralyse/expected_value()
	return 20


/datum/unit_test/modifier_field/disable_duration_paralyse/halved
	name = "MODIFIER: Disable Duration - Paralyse Halved"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0.5)

/datum/unit_test/modifier_field/disable_duration_paralyse/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/disable_duration_paralyse/negated
	name = "MODIFIER: Disable Duration - Paralyse Negated"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0)

/datum/unit_test/modifier_field/disable_duration_paralyse/negated/expected_value()
	return 0


// Confusion
/datum/unit_test/modifier_field/disable_duration_confuse
	name = "MODIFIER: Disable Duration - Confuse Doubled"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 2)

/datum/unit_test/modifier_field/disable_duration_confuse/apply_effect()
	subject.Confuse(10)

/datum/unit_test/modifier_field/disable_duration_confuse/real_value()
	return subject.confused

/datum/unit_test/modifier_field/disable_duration_confuse/expected_value()
	return 20


/datum/unit_test/modifier_field/disable_duration_confuse/halved
	name = "MODIFIER: Disable Duration - Confuse Halved"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0.5)

/datum/unit_test/modifier_field/disable_duration_confuse/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/disable_duration_confuse/negated
	name = "MODIFIER: Disable Duration - Confuse Negated"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0)

/datum/unit_test/modifier_field/disable_duration_confuse/negated/expected_value()
	return 0


// Sleeping
/datum/unit_test/modifier_field/disable_duration_sleep
	name = "MODIFIER: Disable Duration - Sleep Doubled"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 2)

/datum/unit_test/modifier_field/disable_duration_sleep/apply_effect()
	subject.Sleeping(10)

/datum/unit_test/modifier_field/disable_duration_sleep/real_value()
	return subject.sleeping

/datum/unit_test/modifier_field/disable_duration_sleep/expected_value()
	return 20


/datum/unit_test/modifier_field/disable_duration_sleep/halved
	name = "MODIFIER: Disable Duration - Sleep Halved"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0.5)

/datum/unit_test/modifier_field/disable_duration_sleep/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/disable_duration_sleep/negated
	name = "MODIFIER: Disable Duration - Sleep Negated"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0)

/datum/unit_test/modifier_field/disable_duration_sleep/negated/expected_value()
	return 0


// Blinded
/datum/unit_test/modifier_field/disable_duration_blind
	name = "MODIFIER: Disable Duration - Blind Doubled"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 2)

/datum/unit_test/modifier_field/disable_duration_blind/apply_effect()
	subject.Blind(10)

/datum/unit_test/modifier_field/disable_duration_blind/real_value()
	return subject.eye_blind

/datum/unit_test/modifier_field/disable_duration_blind/expected_value()
	return 20


/datum/unit_test/modifier_field/disable_duration_blind/halved
	name = "MODIFIER: Disable Duration - Blind Halved"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0.5)

/datum/unit_test/modifier_field/disable_duration_blind/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/disable_duration_blind/negated
	name = "MODIFIER: Disable Duration - Blind Negated"
	modifications_to_test = list(/decl/modifier_field/disable_duration = 0)

/datum/unit_test/modifier_field/disable_duration_blind/negated/expected_value()
	return 0


// Incoming Damage
/datum/unit_test/modifier_field/incoming_damage
	name = "MODIFIER: Incoming Damage - Doubled"
	modifications_to_test = list(/decl/modifier_field/incoming_damage = 2)

/datum/unit_test/modifier_field/incoming_damage/apply_effect()
	subject.adjustBruteLoss(10)

/datum/unit_test/modifier_field/incoming_damage/real_value()
	return subject.getBruteLoss()

/datum/unit_test/modifier_field/incoming_damage/expected_value()
	return 20


/datum/unit_test/modifier_field/incoming_damage/halved
	name = "MODIFIER: Incoming Damage - Halved"
	modifications_to_test = list(/decl/modifier_field/incoming_damage = 0.5)

/datum/unit_test/modifier_field/incoming_damage/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/incoming_damage/negated
	name = "MODIFIER: Incoming Damage - Negated"
	modifications_to_test = list(/decl/modifier_field/incoming_damage = 0)

/datum/unit_test/modifier_field/incoming_damage/negated/expected_value()
	return 0


// Incoming Bruteloss
/datum/unit_test/modifier_field/incoming_bruteloss
	name = "MODIFIER: Incoming Bruteloss - Doubled"
	modifications_to_test = list(/decl/modifier_field/incoming_bruteloss = 2)

/datum/unit_test/modifier_field/incoming_bruteloss/apply_effect()
	subject.adjustBruteLoss(10)

/datum/unit_test/modifier_field/incoming_bruteloss/real_value()
	return subject.getBruteLoss()

/datum/unit_test/modifier_field/incoming_bruteloss/expected_value()
	return 20


/datum/unit_test/modifier_field/incoming_bruteloss/halved
	name = "MODIFIER: Incoming Bruteloss - Halved"
	modifications_to_test = list(/decl/modifier_field/incoming_bruteloss = 0.5)

/datum/unit_test/modifier_field/incoming_bruteloss/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/incoming_bruteloss/negated
	name = "MODIFIER: Incoming Bruteloss - Negated"
	modifications_to_test = list(/decl/modifier_field/incoming_bruteloss = 0)

/datum/unit_test/modifier_field/incoming_bruteloss/negated/expected_value()
	return 0


// Incoming Fireloss
/datum/unit_test/modifier_field/incoming_fireloss
	name = "MODIFIER: Incoming Fireloss - Doubled"
	modifications_to_test = list(/decl/modifier_field/incoming_fireloss = 2)

/datum/unit_test/modifier_field/incoming_fireloss/apply_effect()
	subject.adjustFireLoss(10)

/datum/unit_test/modifier_field/incoming_fireloss/real_value()
	return subject.getFireLoss()

/datum/unit_test/modifier_field/incoming_fireloss/expected_value()
	return 20


/datum/unit_test/modifier_field/incoming_fireloss/halved
	name = "MODIFIER: Incoming Fireloss - Halved"
	modifications_to_test = list(/decl/modifier_field/incoming_fireloss = 0.5)

/datum/unit_test/modifier_field/incoming_fireloss/halved/expected_value()
	return 5


/datum/unit_test/modifier_field/incoming_fireloss/negated
	name = "MODIFIER: Incoming Fireloss - Negated"
	modifications_to_test = list(/decl/modifier_field/incoming_fireloss = 0)

/datum/unit_test/modifier_field/incoming_fireloss/negated/expected_value()
	return 0