/datum/codex_entry/specific_heat_capacity
	name = "Specific Heat Capacity"
	mechanics_text = "In thermodynamics, specific heat capacity quantifies how much an \
	object's temperature changes if one adds or removes an amount of heat energy, per unit mass. \
	In simpler terms, when an object is heated (or cooled), the object's temperature will change accordingly. \
	Less intuitively, what actually happens is that heat energy is being added or removed from the object. \
	Objects made from different materials will require different amounts of heat energy to be shifted in order to reach a desired temperature.<br>\
	<br>\
	For example, water has a high specific heat capacity, at 4.181 J/(g*K). This means that to heat up a kilogram of water, \
	by 60 degrees kelvin, it would require around 250 kJ of heat energy. \
	If instead that same amount of heat energy was applied to a kilogram of copper, the temperature of it would \
	increase by roughly 649 degrees kelvin, because copper has a lower heat capacity (0.385 J/(g*K)) compared to water.<br>\
	<br>\
	Note that in real life, a material's properties, including specific heat capacity, can change when it gets hotter or colder, \
	however that is not represented in the game.<br>\
	<br>\
	The equation for specific heat is;<br>\
	c = Q / (m dT)<br>\
	Where;<br>\
	c  - Specific heat capacity.<br>\
	Q  - Energy<br>\
	m  - Mass<br>\
	dT - Change in temperature."

/datum/codex_entry/thermal_conductivity

/datum/codex_entry/heat_of_combustion

/datum/codex_entry/periodic_table
	name = "Periodic Table of the Elements"
	associated_paths = list(/obj/structure/sign/periodic)
	var/list/element_group = list(list())

/datum/codex_entry/periodic_table/New()
	var/list/elements[9][18]
	elements[1][1] = "Hydrogen<br>H"
	elements[1][18] = "Helium<br>He"

	elements[2][1] = "Lithium<br>Li"
	elements[2][2] = "Beryllium<br>Be"
	elements[2][13] = "Boron<br>B"
	elements[2][14] = "Carbon<br>C"
	elements[2][15] = "Nitrogen<br>N"
	elements[2][16] = "Oxygen<br>O"
	elements[2][17] = "Fluorine<br>F"
	elements[2][18] = "Neon<br>Ne"

	elements[3][1] = "Sodium<br>Na"
	elements[3][2] = "Magnesium<br>Mg"
	elements[3][13] = "Aluminum<br>Al"
	elements[3][14] = "Silicon<br>Si"
	elements[3][15] = "Phosphorus<br>P"
	elements[3][16] = "Sulfer<br>S"
	elements[3][17] = "Chlorine<br>Cl"
	elements[3][18] = "Argon<br>Ar"

	elements[4][1] = "Potassium<br>K"
	elements[4][2] = "Calcium<br>Ca"
	elements[4][3] = "Scandium<br>Sc"
	elements[4][4] = CODEX_LINK_ADV("titanium (solid)", "Titanium<br>Ti")
	elements[4][5] = "Vanadium<br>V"
	elements[4][6] = CODEX_LINK_ADV("chromium (solid)", "Chromium<br>Cr")
	elements[4][7] = "Manganese<br>Mn"
	elements[4][8] = CODEX_LINK_ADV("iron (solid)", "Iron<br>Fe")
	elements[4][9] = "Cobalt<br>Co"
	elements[4][10] = "Nickel<br>Ni"
	elements[4][11] = CODEX_LINK_ADV("copper (solid)", "Copper<br>Cu")
	elements[4][12] = CODEX_LINK_ADV("zinc (solid)", "Zinc<br>Zn")
	elements[4][13] = "Gallium<br>Ga"
	elements[4][14] = "Germanium<br>Ge"
	elements[4][15] = "Arsenic<br>As"
	elements[4][16] = "Selenium<br>Se"
	elements[4][17] = "Bromine<br>Br"
	elements[4][18] = "Krypton<br>Kr"

	var/list/dat = list()
	dat += "<table border = '1px'>"
	// First row on the table lists the group numbers.
	dat += "<tr>"
	dat += "<td><b>Group</b></td>"
	for(var/i = 1 to 18)
		dat += "<td><b>[i]</b></td>"
	dat += "</tr>"

	// All other rows will actually have elements.
	// However the first column has the period number.
	for(var/row = 1 to 9)
		dat += "<tr>"
		for(var/column = 1 to 19)
			dat += "<td>"
			if(column == 1)
				switch(row)
					if(8)
						dat += "*"
					if(9)
						dat += "**"
					else
						dat += "[row]"
			else
				var/text = elements[row][column - 1]
				dat += text
			dat += "</td>"

		dat += "</tr>"
	dat += "</table>"

	mechanics_text = dat.Join(null)


/*
	guide_html = {"
		<h1>Chemistry Basics</h1>
		<p>
		Some basic tips for being an effective chemist:
		<ul>
			<li>Use a dropper for precise reagent measurements.</li>
			<li>Grind solid sheets of materials, pills, or other reagent-bearing objects in the grinder to convert them into a usable form.</li>
			<li>Chem grenades make use of a variety of reactions that produce effects like smoke or foam rather than a new chemical.</li>
		</ul>
		</p>
		<h3>Reactions</h3>
		<table border = '1px'>
		<tr>
			<td>
				<b>Product name</b>
			</td>
			<td>
				<b>Product amount</b>
			</td>
			<td>
				<b>Required reagents</b>
			</td>
			<td>
				<b>Catalysts</b>
			</td>
			<td>
				<b>Inhibitors</b>
			</td>
			<td>
				<b>Notes</b>
			</td>
		</tr>"}
*/
