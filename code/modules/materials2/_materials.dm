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

	/** The element symbol, or formula for this material, with no frills, such as CO2.*/
	/** If null, and `symbol_html` is defined, it will be populated with `symbol_html`, with the html stripped out, instead.*/
	var/symbol = null

	/** The element symbol, or formula for this material, with html elements allowed, such as "CO<sub>2</sub>".*/
	/** If null, and `symbol` is defined, it will be populated with `symbol`'s string instead.*/
	var/symbol_html = null

	/// What color the material is, which things made out of that material will generally adopt the color of. Note that some objects can choose to not use this.
	var/color = null

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

	/** J/°K. Amount of energy that one gram of the material must absorb or lose to change its temperature by one degree kelvin/celcius.
	A high heat capacity makes a material able to 'hold onto' more heat, and thus slower to change temperature.*/
	var/specific_heat_capacity = null

	/** W/(m*K). Higher numbers make heat transfer happen faster between two objects.
	Note that, generally, conductivity on both objects is taken into account.*/
	var/thermal_conductivity = null

	/** MJ/Kg. How much heat is released when this material is burned.
	Note that this uses higher heating value (or gross heat) as opposed 
	to lower heating value (or net heat).*/
	var/heat_of_combustion = null

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


/*
// Material definition and procs follow.
/decl/material
	var/name                      // Prettier name for display.
	var/adjective_name
	var/solid_name
	var/gas_name
	var/liquid_name
	var/use_name
	var/wall_name = "wall"                // Name given to walls of this material
	var/flags = 0                         // Various status modifiers.
	var/hidden_from_codex
	var/lore_text
	var/mechanics_text
	var/antag_text
	var/default_solid_form = /obj/item/stack/legacy_material/sheet
	var/affect_blood_on_ingest = TRUE
	var/narcosis = 0 // Not a great word for it. Constant for causing mild confusion when ingested.
	var/toxicity = 0 // Organ damage from ingestion.
	var/toxicity_targets_organ // Bypass liver/kidneys when ingested, harm this organ directly (using BP_FOO defines).
	// Shards/tables/structures
	var/shard_type = SHARD_SHRAPNEL       // Path of debris object.
	var/shard_icon                        // Related to above.
	var/shard_can_repair = 1              // Can shards be turned into sheets with a welder?
	var/list/recipes                      // Holder for all recipes usable with a sheet of this material.
	var/destruction_desc = "breaks apart" // Fancy string for barricades/tables/objects exploding.
	// Icons
	var/icon_base = 'icons/turf/walls/solid.dmi'
	var/icon_stripe = 'icons/turf/walls/stripes.dmi'
	var/icon_base_natural = 'icons/turf/walls/natural.dmi'
	var/icon_reinf = 'icons/turf/walls/reinforced_metal.dmi'
	var/use_reinf_state = "full"
	var/door_icon_base = "metal"                         // Door base icon tag. See header.
	var/table_icon_base = "metal"
	var/table_reinf = "reinf_metal"
	var/list/stack_origin_tech = "{'materials':1}" // Research level for stacks.
	// Attributes
	var/cut_delay = 0            // Delay in ticks when cutting through this wall.
	var/radioactivity            // Radiation var. Used in wall and object processing to irradiate surroundings.
	var/ignition_point           // K, point at which the material catches on fire.
	var/melting_point = 1800     // K, walls will take damage if they're next to a fire hotter than this
	var/boiling_point = 3000     // K, point that material will become a gas.
	var/brute_armor = 2	 		 // Brute damage to a wall is divided by this value if the wall is reinforced by this material.
	var/burn_armor				 // Same as above, but for Burn damage type. If blank brute_armor's value is used.
	var/integrity = 150          // General-use HP value for products.
	var/opacity = 1              // Is the material transparent? 0.5< makes transparent walls/doors.
	var/explosion_resistance = 5 // Only used by walls currently.
	var/conductive = 1           // Objects with this var add CONDUCTS to flags on spawn.
	var/luminescence
	var/wall_support_value = 30
	var/sparse_material_weight
	var/rich_material_weight
	var/min_fluid_opacity = FLUID_MIN_ALPHA
	var/max_fluid_opacity = FLUID_MAX_ALPHA
	// Damage values.
	var/hardness = MAT_VALUE_HARD            // Prob of wall destruction by hulk, used for edge damage in weapons.
	var/reflectiveness = MAT_VALUE_DULL
	var/weight = MAT_VALUE_NORMAL             // Determines blunt damage/throwforce for weapons.
	// Noise when someone is faceplanted onto a table made of this material.
	var/tableslam_noise = 'sound/weapons/tablehit1.ogg'
	// Noise made when a simple door made of this material opens or closes.
	var/dooropen_noise = 'sound/effects/stonedoor_openclose.ogg'
	// Noise made when you hit structure made of this material.
	var/hitsound = 'sound/weapons/genhit.ogg'
	// Wallrot crumble message.
	var/rotting_touch_message = "crumbles under your touch"
	// Modifies skill checks when constructing with this material.
	var/construction_difficulty = MAT_VALUE_EASY_DIY
	// Determines what is used to remove or dismantle this material.
	var/removed_by_welder
	// Mining behavior.
	var/ore_name
	var/ore_desc
	var/ore_smelts_to
	var/ore_compresses_to
	var/ore_result_amount
	var/ore_spread_chance
	var/ore_scan_icon
	var/ore_icon_overlay
	var/ore_type_value
	var/ore_data_value
	var/value = 1
	// Xenoarch behavior.
	var/xarch_source_mineral = /decl/material/solid/metal/iron
	// Gas behavior.
	var/gas_overlay_limit
	var/gas_specific_heat
	var/gas_molar_mass
	var/gas_symbol_html
	var/gas_symbol
	var/gas_flags = 0
	var/gas_tile_overlay = "generic"
	var/gas_condensation_point = 0
	var/gas_metabolically_inert = FALSE // If false, material will move into the bloodstream when breathed.
	// Armor values generated from properties
	var/list/basic_armor
	var/armor_degradation_speed
	// Copied reagent values. Todo: integrate.
	var/taste_description = "old rotten bandaids"
	var/taste_mult = 1 //how this taste compares to others. Higher values means it is more noticable
	var/metabolism = REM // This would be 0.2 normally
	var/ingest_met = 0
	var/touch_met = 0
	var/overdose = 0
	var/scannable = 0 // Shows up on health analyzers.
	var/color = COLOR_BEIGE
	var/color_weight = 1
	var/cocktail_ingredient
	var/defoliant
	var/fruit_descriptor // String added to fruit desc if this chemical is present.
	var/dirtiness = DIRTINESS_NEUTRAL // How dirty turfs are after being exposed to this material. Negative values cause a cleaning/sterilizing effect.
	var/solvent_power = MAT_SOLVENT_NONE
	var/solvent_melt_dose = 0
	var/solvent_max_damage  = 0
	var/slipperiness
	var/euphoriant // If set, ingesting/injecting this material will cause the rainbow high overlay/behavior.
	var/glass_icon = DRINK_ICON_DEFAULT
	var/glass_name = "something"
	var/glass_desc = "It's a glass of... what, exactly?"
	var/list/glass_special = null // null equivalent to list()
	// Matter state data.
	var/dissolve_message = "dissolves in"
	var/dissolve_sound = 'sound/effects/bubbles.ogg'
	var/dissolves_in = MAT_SOLVENT_STRONG
	var/list/dissolves_into	// Used with the grinder and a solvent to extract other materials.
	var/chilling_point
	var/chilling_message = "crackles and freezes!"
	var/chilling_sound = 'sound/effects/bubbles.ogg'
	var/list/chilling_products
	var/bypass_cooling_products_for_root_type
	var/heating_point
	var/heating_message = "begins to boil!"
	var/heating_sound = 'sound/effects/bubbles.ogg'
	var/list/heating_products
	var/bypass_heating_products_for_root_type
	var/fuel_value = 0
	var/burn_product
	var/list/vapor_products // If splashed, releases these gasses in these proportions. // TODO add to unit test after solvent PR is merged
	var/scent //refer to _scent.dm
	var/scent_intensity = /decl/scent_intensity/normal
	var/scent_descriptor = SCENT_DESC_SMELL
	var/scent_range = 1
*/