/decl/material
	/// Unique identifier that's used for some reason in Nebula's implementation.
	var/uid = null

	/// A 'pretty' name for the material, such as "wood".
	var/name = null

	/** A name applied as a prefix to some objects, such as "wooden" resulting in "wooden table"
	If null, it will default to the base name, e.g. "steel table".*/
	var/adjective_name = null

	/** Not sure why this is a different var from name but neb has it so here you go.
	If null, it will default to the base name.*/
	var/use_name = null

	/// Optional text that describes roughly what kind of thing the material is, e.g. Metal, Wood, Gemstone, etc. Used in UIs and tooltips.
	var/classification = "Material"

	/// Optional text based on ingame lore for this material.
	var/lore_text = null

	/// Optional text based on informing the player on what this material does.
	var/mechanics_text = null

	/// Optional text based on what bad and evil things players could do with stuff made out of this material.
	var/antag_text = null

	/// If `TRUE`, this material won't be searchable in the Codex.
	var/hidden_from_codex = FALSE

	/** The element symbol, or formula for this material, with no frills, such as CO2.*/
	/** If null, and `symbol_html` is defined, it will be populated with `symbol_html`, with the html stripped out, instead.*/
	var/symbol = null

	/** The element symbol, or formula for this material, with html elements allowed, such as "CO<sub>2</sub>".*/
	/** If null, and `symbol` is defined, it will be populated with `symbol`'s string instead.*/
	var/symbol_html = null

	/// What color the material is, which things made out of that material will generally adopt the color of. Note that some objects can choose to not use this.
	var/color = null

	/// Some materials can glow. If so, this determines what color it will glow at.
	var/glow_color = "#ffffff"

	/// If ingested, this describes how the material tastes. Leave null if it is tasteless.
	var/taste_description = null

	/// General use health value for things made out of this material.
	var/integrity = 150

	/// Determines damage in bladed/edged weapons.
	var/hardness = MATERIAL_HARDNESS_NORMAL

	/// Determines damage in blunt weapons. This is not tied to a material's `density` value, for balance reasons.
	var/weight = MATERIAL_HARDNESS_NORMAL

	/// High levels of reflectiveness reflect lasers.
	var/reflectiveness = MATERIAL_REFLECTIVITY_DULL

	/// If above 0, the material is radioactive, and things made out of it will emit radiation, proportional to the object's mass.
	var/radioactivity = 0

	/// If true, magnets can attrach things made out of this material.
	var/ferromagnetic = FALSE

	/// If `FALSE`, objects made from this material should not conduct electricity.
	var/conductive = TRUE

	/** How much light can get through this material.
	If less than or equal to 0.5, structures and such will not be `opaque`.
	Lasers traveling through imperfectly transparent material will absorb 
	a certain amount of energy from the laser, taking damage as a result 
	and reducing the damage of the projectile coming out of the structure.*/
	var/opacity = 1

	/** How much this material is worth economically, relative to other materials.
	Cheaper materials should be below 1, while more expensive ones should be above 1.*/
	var/value = 1

	/// How difficult it is to work with this material. Mostly a placeholder at the moment.
	var/construction_difficulty = MATERIAL_DIFFICULTY_EASY

	/// What stack type this material should generally be by default.
	var/default_solid_form = /obj/item/stack/material/sheet

	/** When an object made from a material is damaged, it can be described with one of these strings as an adjective. 
	Pending a unified object health system refactor.
	Taken from Cata DDA's material system.*/
	var/list/damaged_adjectives = list(
		MATERIAL_DAMAGE_ADJ_LIGHT    = "lightly damaged", 
		MATERIAL_DAMAGE_ADJ_MEDIUM   = "damaged", 
		MATERIAL_DAMAGE_ADJ_HEAVY    = "very damaged", 
		MATERIAL_DAMAGE_ADJ_CRITICAL = "thoroughly damaged"
	)

	// Physics values

	/** g/cm^3. How dense the material is. Used for volume calculations. 
	Distinct from the weight variable to make weapon damage balancing less of a headache.*/
	var/density = 1

	// (Simplified) Thermodynamics.
	// Pressure is not taken into account, so no triple point or boiling in space, sorry.

	/** What material something made from this material will turn into if made too hot, if any.
	If no material is defined, but a temperature is defined, then the object is destroyed. Yes, that is not realistic.*/
	var/high_energy_transition_material = null

	/** °K. Point which the material turns into another material due to getting too hot, acting as the melting or vaporization point.
	If no material is defined, but a temperature is defined, then the object is destroyed. Yes, that is not realistic.*/
	var/high_energy_transition_temperature = null

	/// What material something made from this material will turn into if made too cold, if any.
	var/low_energy_transition_material = null

	/// °K. Point which the material turns into another material due to getting too cold, acting as the solidification or condensation point.
	var/low_energy_transition_temperature


	/// °K. Used to artificially prevent the material from oscillating between two phases constantly.
	var/thermodynamic_hysteresis = 2

	/** J/(g*°K). Amount of energy that one gram of the material must absorb or lose to change its temperature by one degree kelvin/celcius.
	A high heat capacity makes a material able to 'hold onto' more heat, and thus slower to change temperature.*/
	var/specific_heat_capacity = null

	/** W/(m*K). Higher numbers make heat transfer happen faster between two objects.
	Note that, generally, conductivity on both objects is taken into account.*/
	var/thermal_conductivity = null

	/** MJ/Kg. How much heat is released when this material is burned.
	Note that this uses higher heating value (or gross heat) as opposed 
	to lower heating value (or net heat).*/
	var/heat_of_combustion = null

	/// When burned, some materials may create other matter
	var/list/combustion_products = null

/*
// Make sure we have a use name and shard icon even if they aren't explicitly set.
/decl/material/Initialize()
	. = ..()
	if(!use_name)
		use_name = name
	if(!liquid_name)
		liquid_name = name
	if(!solid_name)
		solid_name = name
	if(!gas_name)
		gas_name = name
	if(!adjective_name)
		adjective_name = name
	if(!shard_icon)
		shard_icon = shard_type
	if(!burn_armor)
		burn_armor = brute_armor
	if(!gas_symbol)
		gas_symbol = "[name]_[sequential_id(abstract_type)]"
	if(!gas_symbol_html)
		gas_symbol_html = gas_symbol
	global.materials_by_gas_symbol[gas_symbol] = type
	generate_armor_values()

	var/list/cocktails = decls_repository.get_decls_of_subtype(/decl/cocktail)
	for(var/ctype in cocktails)
		var/decl/cocktail/cocktail = cocktails[ctype]
		if(type in cocktail.ratios)
			cocktail_ingredient = TRUE
			break

*/

/decl/material/Initialize()
	. = ..()
	if(!adjective_name)
		adjective_name = name
	if(!use_name)
		use_name = name

	// If one symbol var is set but the other isn't, automatically fill out the other.
	if(!symbol_html && symbol)
		symbol_html = symbol
	else if(!symbol && symbol_html)
		symbol = strip_html_properly(symbol_html)

// Currently used for weapons and objects made of uranium to irradiate things.
/decl/material/proc/products_need_process()
	if(radioactivity > 0)
		return TRUE
	// TODO
	if(reflectiveness >= MATERIAL_REFLECTIVITY_SHINY)
		return TRUE
	return FALSE

/decl/material/process(atom/holder)
	if(radioactivity > 0)
		// TODO: Calculate mass and scale radiation from that?
		SSradiation.radiate(holder, radioactivity * 0.1)
//		holder.get_mass()
	// TODO maybe use an overlay instead
	/*
	if(reflectiveness >= MATERIAL_REFLECTIVITY_SHINY && prob(20))
		if(holder.loc == get_turf(holder))
			var/sparkle_amount = rand(1, 2)
			for(var/i = 1 to sparkle_amount)
				var/obj/effect/temporary_effect/sparkle/S = new(get_turf(holder))
				S.color = color
	*/

// Weapons handle applying a divisor for this value locally.
/decl/material/proc/get_blunt_damage()
	return weight //todo

// As above.
/decl/material/proc/get_edge_damage()
	return hardness //todo

// Generic material product (sheets, bricks, etc). Used ALL THE TIME.
// May return an instance list, a single instance, or nothing if there is no instance produced.
/decl/material/proc/create_object(var/atom/target, var/amount = 1, var/object_type, var/reinf_type)
	if(!object_type)
		object_type = default_solid_form

	if(!ispath(object_type, /atom/movable))
		CRASH("Non-movable path '[object_type || "NULL"]' supplied to [type] create_object()")

	if(ispath(object_type, /obj/item/stack))
		var/obj/item/stack/stack_type = object_type
		var/divisor = initial(stack_type.max_amount)
		while(amount >= divisor)
			LAZYADD(., new object_type(target, divisor, type, reinf_type))
			amount -= divisor
		if(amount >= 1)
			LAZYADD(., new object_type(target, amount, type, reinf_type))
	else
		for(var/i = 1 to amount)
			var/atom/movable/placed = new object_type(target, type, reinf_type)
			if(istype(placed))
				LAZYADD(., placed)

	if(istype(target) && LAZYLEN(.))
		for(var/atom/movable/placed in .)
			placed.dropInto(target)