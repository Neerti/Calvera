/*
/decl/codex_category/solid_matter
	name = "Solid Matter"
	desc = "A collection of materials in the solid phase."

/decl/codex_category/solid_matter/Initialize()
	var/list/classifications = list()
	for(var/thing in SSmaterials.materials)
		var/decl/material/mat= thing
		if(mat.hidden_from_codex)
			continue
		
		var/list/inner_list = LAZYFIND(classifications, mat.classification)
		if(!inner_list)
			LAZYADD(classifications, list(mat.type))
		else
			inner_list += mat.type
	
	for(var/thing in classifications)
		var/list/class_list = thing

		for(var/decl_path in class_list)
			var/decl/material/mat = GET_DECL(decl_path)

			var/datum/codex_entry/entry = new(_display_name = "[mat.name] (matter)", _associated_strings = list("[mat.name] pill"))
			var/new_lore_text = initial(mat.lore_text)
			if(mat.taste_description)
				new_lore_text = "[new_lore_text]<br>It apparently tastes of [mat.taste_description]."
			entry.lore_text = new_lore_text
			entry.antag_text = mat.antag_text

	
	. = ..()
*/

/datum/codex_entry/solid_materials
	name = "Solid Matter"
	associated_strings = list("solids")

/datum/codex_entry/solid_materials/New()
	var/list/classifications = list()
	for(var/thing in SSmaterials.materials)
		var/decl/material/mat = thing
		if(mat.hidden_from_codex)
			continue
		if(!istype(mat, /decl/material/solid))
			continue
		
		var/list/inner_list = classifications[mat.classification]
		if(!inner_list)
			classifications[mat.classification] = list(mat.type)
		else
			inner_list.Add(mat.type)
	
	for(var/thing in classifications)
		var/list/decl_types = classifications[thing]
		mechanics_text += "<h2>[thing]</h2>"
		for(var/decl_type in decl_types)
			var/decl/material/mat = GET_DECL(decl_type)

			var/datum/codex_entry/entry = new(_display_name = "[mat.name] (solid)", _associated_strings = list("[mat.name] pill"))
			var/new_lore_text = initial(mat.lore_text)

			if(mat.taste_description)
				new_lore_text = "[new_lore_text]<br>It apparently tastes of [mat.taste_description]."
			entry.lore_text = new_lore_text
			entry.antag_text = mat.antag_text
			
			var/list/material_info = list(mat.mechanics_text)

			if(mat.symbol_html)
				material_info += "([mat.symbol_html])"
			else if(mat.symbol)
				material_info += "([mat.symbol])"

			material_info += "<br>This substance has the following properties in standard temperature and pressure:<ul>"

			if(mat.high_energy_transition_temperature)
				if(mat.high_energy_transition_material)
					var/decl/material/hot_material = GET_DECL(mat.high_energy_transition_material)
					material_info += "<li>It will become [hot_material.name] at a temperature of <b>[mat.high_energy_transition_temperature]</b> K or higher.</li>"
				else
					material_info += "<li>It will be destroyed at a temperature of <b>[mat.high_energy_transition_temperature]</b> K or higher.</li>"
			
			if(mat.low_energy_transition_temperature)
				if(mat.low_energy_transition_material)
					var/decl/material/cold_material = GET_DECL(mat.low_energy_transition_material)
					material_info += "<li>It will become [cold_material.name] at a temperature of <b>[mat.high_energy_transition_temperature]</b> K or lower.</li>"
				else
					material_info += "<li>It will be destroyed at a temperature of <b>[mat.high_energy_transition_temperature]</b> K or lower.</li>"

			if(mat.density)
				material_info += "<li>It has a density of <b>[mat.density]</b> g/cm<super>3</super>.</li>"
			
			if(mat.specific_heat_capacity)
				material_info += "<li>It has a [CODEX_LINK("specific heat capacity")] of <b>[mat.specific_heat_capacity]</b> J/(g*K).</li>"
			
			if(mat.thermal_conductivity)
				material_info += "<li>It has a [CODEX_LINK("thermal conductivity")] of <b>[mat.thermal_conductivity]</b> W/(m*K).</li>"
			
			if(mat.heat_of_combustion)
				material_info += "<li>It has a [CODEX_LINK("heat of combustion")] of <b>[mat.heat_of_combustion]</b> MJ/Kg.</li>"

			if(mat.radioactivity)
				material_info += "<li>It is radioactive.</li>"
			
			if(mat.ferromagnetic)
				material_info += "<li>It is ferromagnetic.</li>"

			material_info += "</ul>"

			material_info += "As a building or crafting material, it has the following properties:<ul>"

			if(mat.conductive)
				material_info += "<li>It conducts electricity.</li>"
			else
				material_info += "<li>It does not conduct electricity.</li>"
			
			if(mat.opacity < 0.5)
				material_info += "<li>It is transparent.</li>"
			
			if(mat.weight <= MATERIAL_WEIGHT_LIGHT)
				material_info += "<li>It is very light.</li>"
			else if(mat.weight >= MATERIAL_WEIGHT_HEAVY)
				material_info += "<li>It is very heavy.</li>"
			else
				material_info += "<li>It is of average weight.</li>"
			
			var/decl/material/steel = SSmaterials.materials_by_name[/decl/material/solid/metal/steel]
			var/comparison = round(mat.hardness / steel.hardness, 0.1)
			if(comparison >= 0.9 && comparison <= 1.1)
				material_info += "<li>It is as hard as steel.</li>"
			else if (comparison < 0.9)
				comparison = round(1/max(comparison,0.01),0.1)
				material_info += "<li>It is ~[comparison] times softer than steel.</li>"
			else
				material_info += "<li>It is ~[comparison] times harder than steel.</li>"
			
			comparison = round(mat.integrity / steel.integrity, 0.1)
			if(comparison >= 0.9 && comparison <= 1.1)
				material_info += "<li>It is as durable as steel.</li>"
			else if (comparison < 0.9)
				comparison = round(1/comparison,0.1)
				material_info += "<li>It is ~[comparison] times structurally weaker than steel.</li>"
			else
				material_info += "<li>It is ~[comparison] times more durable than steel.</li>"
			
	//		if(mat.flags & MAT_FLAG_UNMELTABLE)
	//			material_info += "<li>It is impossible to dissolve.</li>"
	//		if(mat.flags & MAT_FLAG_BRITTLE)
	//			material_info += "<li>It is brittle and can shatter under strain.</li>"
	//		if(mat.flags & MAT_FLAG_PADDING)
	//			material_info += "<li>It can be used to pad furniture.</li>"
			material_info += "</ul>"

			entry.lore_text = new_lore_text
			entry.antag_text = mat.antag_text
			entry.mechanics_text = jointext(material_info, null)

			SScodex.add_entry_by_string(entry.name, entry)

			mechanics_text += "[CODEX_LINK(entry.name)]<br>"