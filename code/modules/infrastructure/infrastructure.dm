// A generic infrastructure object.
// Stuff like cables and pipes can inherit from this.
/obj/structure/utilities
	var/datum/node/physical/grid_node = null
	var/end_a = 0
	var/end_b = 0

/obj/structure/utilities/Initialize()
	..()
	grid_node = new(src)
	grid_node.graph = new(list(grid_node))
	return INITIALIZE_HINT_LATELOAD

/obj/structure/utilities/LateInitialize()
	. = ..()
	update_grid()

/obj/structure/utilities/Destroy()
	QDEL_NULL(grid_node)
	return ..()

/obj/structure/utilities/update_grid()
	var/list/graphs = list() // Associative list of graphs->list of nodes to add as neighbors.
	for(var/direction in GLOB.cardinal)
		var/turf/T = get_step(get_turf(src), dir)

/*
/obj/structure/network_cable/proc/update_network()
	var/list/graphs = list() // Associative list of graphs->list of nodes to add as neighbors.
	for(var/dir in global.cardinal)
		var/turf/T = get_step(get_turf(src), dir)
		for(var/obj/structure/network_cable/cable in T)
			var/datum/graph/G = cable.network_node.graph
			if(G)
				LAZYADD(graphs[G], cable.network_node)
			cable.update_icon()
	var/turf/T = get_turf(src)
	if(T.is_open())
		for(var/obj/structure/network_cable/cable in GetBelow(src))
			var/datum/graph/G = cable.network_node.graph
			if(G)
				LAZYADD(graphs[G], cable.network_node)
			cable.update_icon()
	var/turf/U = GetAbove(src)
	if(U?.is_open())
		for(var/obj/structure/network_cable/cable in U)
			var/datum/graph/G = cable.network_node.graph
			if(G)
				LAZYADD(graphs[G], cable.network_node)
			cable.update_icon()
	
	for(var/datum/graph/G in graphs)
		G.Connect(network_node, graphs[G])
	update_icon()
*/


// Base object for a power network.
/obj/structure/utilities/electrical
	var/datum/electrical_grid = null
	var/ampacity = null			// Will be damaged if too much current flows through this cable, for too long.
	var/voltage_limit = null	// Will also be damaged if the voltage exceeds this value.
	var/overcurrent = 0			// Incremented when too much current passes through. This allows cables to be damaged after a period of time.
	var/max_overcurrent = 10	// When `overcurrent` reaches this value, the cable will suffer damage.


/datum/electrical_grid
	var/voltage = 0
	var/list/producers = list()
	var/list/consumers = list()
