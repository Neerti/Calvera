/**
These are used by modifier instances to specify what is being modified, e.g. max health as a percentage.
Generally they're used as assoc list keys and also hold some strings for players to see what the modifier actually does.
*/
/decl/modifier_field
	var/name = null
	var/desc = null

	/// If a value is above the neutral value, this word is used to describe it.
	var/positive_word = "gain"

	/// If a value is below the neutral value, this word is used to describe it.
	var/negative_word = "lose"

	/**
	Template for what the field will do when inside of a modifier, e.g. 'Gain 20 maximum health.' 
	Tags that can be used are; 
	%WORD, for whether it's a positive or negative change, 
	%VALUE, for the number, 
	%VALUE_PERCENT, for a percentage formatted number, e.g. 1.2 will be shown as +20%.
	*/
	var/effect_desc = null // TODO: Vague version?
	
	/// Determines how modifier values should stack.
	var/summation_strategy = SUMMATION_ADDITIVE

	/// Stacks are combined with addition.
	var/const/SUMMATION_ADDITIVE = 1

	/// Stacks are combined with multiplication.
	var/const/SUMMATION_MULTIPLICITIVE = 2

/**
By default, modifiers stack additively.
For example, two +20 melee armor modifiers would combine to +40 melee armor. 20 + 20 = 40

Some modifiers instead stack multiplicitively.
For example, two +20% outgoing damage modifiers would stack to produce +44% outgoing damage, instead of +40%. 1.2 * 1.2 = 1.44
*/
/decl/modifier_field/proc/sum(A, B)
	switch(summation_strategy)
		if(SUMMATION_ADDITIVE)
			return A + B
		if(SUMMATION_MULTIPLICITIVE)
			return A * B

/decl/modifier_field/proc/describe_effect(value)
	var/word = value > get_neutral_value() ? positive_word : negative_word
	. = effect_desc
	. = replacetext(., "%WORD", word)
	. = replacetext(., "%VALUE_PERCENT", "[abs(((value - 1) * 100))]%")
	. = replacetext(., "%VALUE", abs(value))


// "[abs( ((multi - 1) * 100) )]%"

/decl/modifier_field/proc/get_neutral_value()
	switch(summation_strategy)
		if(SUMMATION_ADDITIVE)
			return 0
		if(SUMMATION_MULTIPLICITIVE)
			return 1


/decl/modifier_field/list_based/sum(list/A, list/B)
	switch(summation_strategy)
		if(SUMMATION_ADDITIVE)
			return sum_assoc(
				islist(A) ? A : list(),
				islist(B) ? B : list()
				)
		if(SUMMATION_MULTIPLICITIVE)
			return multiply_assoc(
				islist(A) ? A : list(),
				islist(B) ? B : list()
				)

/decl/modifier_field/max_health_flat
	desc = "Modifies the maximum health of something by a flat amount."
	effect_desc = "You %WORD %VALUE maximum health."

/decl/modifier_field/max_health_percent
	desc = "Modifies the maximum health of something by a percentage."
	effect_desc = "You %WORD %VALUE_PERCENT maximum health."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/disable_duration
	desc = "Modifies the duration of effects that inhibit control, such as stuns."
	positive_word = "longer"
	negative_word = "shorter"
	effect_desc = "Disabling effects on you will be %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/incoming_damage
	desc = "Modifies the damage received by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You take %VALUE_PERCENT %WORD damage."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/incoming_bruteloss
	desc = "Modifies brute damage received by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You take %VALUE_PERCENT %WORD brute damage."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/incoming_fireloss
	desc = "Modifies burn damage received by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You take %VALUE_PERCENT %WORD burn damage."

/decl/modifier_field/incoming_toxloss
	desc = "Modifies toxin damage received by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You take %VALUE_PERCENT %WORD toxin damage."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/incoming_oxyloss
	desc = "Modifies oxygen damage received by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You take %VALUE_PERCENT %WORD oxy damage."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/incoming_halloss
	desc = "Modifies holo damage received by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You take %VALUE_PERCENT %WORD pain damage."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/incoming_healing
	desc = "Modifies healing received by a percentage."
	positive_word = "stronger"
	negative_word = "weaker"
	effect_desc = "Healing applied to you is %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/outgoing_melee_damage
	desc = "Modifies melee damage inflicted by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You inflict %VALUE_PERCENT %WORD damage with melee attacks."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/slowdown
	desc = "Modifies movement speed."
	positive_word = "slower"
	negative_word = "faster"
	effect_desc = "You move %WORD by %VALUE." // This is really weird to describe.

/decl/modifier_field/haste
	desc = "Moves at maximum speed, and cannot be slowed by any means."
	effect_desc = "You move at maximum speed, and cannot be slowed by any means."

/decl/modifier_field/evasion
	desc = "Modifies the chance of an incoming attack automatically missing."
	positive_word = "harder"
	negative_word = "easier"
	effect_desc = "It is %VALUE% %WORD for attacks to hit you."

/decl/modifier_field/bleeding_rate
	desc = "Modifies the rate of bleeding from wounds by a percentage."
	positive_word = "faster"
	negative_word = "slower"
	effect_desc = "You bleed %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/gun_accuracy
	desc = "Modifies the chance of an outgoing projectile attack successfully connecting."
	positive_word = "easier"
	negative_word = "harder"
	effect_desc = "It is %VALUE% %WORD for you to hit someone."

/decl/modifier_field/gun_dispersion
	desc = "Modifies the spread of projectiles fired."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "Projectiles you fire will spread %VALUE degrees %WORD."

/decl/modifier_field/metabolism
	desc = "Modifies the rate that reagents are processed, by a percentage."
	positive_word = "faster"
	negative_word = "slower"
	effect_desc = "Your metabolism is %WORD, causing reagents in your body to process, \
	and hunger to occur %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/scale_x
	desc = "Modifies how wide or thin something appears as."
	positive_word = "wider"
	negative_word = "thinner"
	effect_desc = "Your appearance is %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/scale_y
	desc = "Modifies how tall or short something appears as."
	positive_word = "taller"
	negative_word = "shorter"
	effect_desc = "Your appearance is %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/attack_speed_percent
	desc = "Modifies click cooldown from attacking."
	positive_word = "longer"
	negative_word = "shorter"
	effect_desc = "The delay between attacking is %VALUE_PERCENT %WORD."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/pain_immunity
	desc = "Pain is not applied."
	effect_desc = "You do not suffer from the effects of pain."

/decl/modifier_field/emp_suspectibility
	desc = "Modifies the received severity of received EM pulses."
	positive_word = "less"
	negative_word = "more"
	effect_desc = "You are %WORD vulnerable to electromagnetic pulses."

/decl/modifier_field/explosion_suspectibility
	desc = "Modifies the received severity of received explosions."
	positive_word = "less"
	negative_word = "more"
	effect_desc = "You are %WORD vulnerable to explosions."

// Note that these are combined with the mob's real armor values additatively. You can also omit specific armor types.
/decl/modifier_field/list_based/armor_percentage
	desc = "Modifies the calculated percentage-based armor value of something."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/list_based/armor_flat
	desc = "Modifies the calculated flat damage-based armor value of something."

/decl/modifier_field/heat_protection
	desc = "Modifies how insulated a thing is from the heat, by a percentage."
	positive_word = "less"
	negative_word = "more"
	effect_desc = "You are %VALUE_PERCENT %WORD vulnerable to high temperatures."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/cold_protection
	desc = "Modifies how insulated a thing is from the cold, by a percentage."
	positive_word = "less"
	negative_word = "more"
	effect_desc = "You are %VALUE_PERCENT %WORD vulnerable to low temperatures."
	summation_strategy = SUMMATION_MULTIPLICITIVE

/decl/modifier_field/siemens_coefficient
	desc = "Modifies how electrically insulated somthing is, by a percentage."
	positive_word = "more"
	negative_word = "less"
	effect_desc = "You are %VALUE_PERCENT %WORD vulnerable to electricity."
	summation_strategy = SUMMATION_MULTIPLICITIVE


/decl/modifier_field/stun
	desc = "Causes something to not be able to take any voluntary actions."
	effect_desc = "You are unable to take any actions."

/decl/modifier_field/weaken
	desc = "Causes something to not be able to take any voluntary actions, \
	as well as fall over, dropping anything in their hands."
	effect_desc = "You are unable to stand up or take any actions."

/decl/modifier_field/unconscious
	desc = "Causes something to not be able to take any voluntary actions, \
	as well as become unconscious."
	effect_desc = "You are unconscious, and cannot act."