/datum/codex_entry/bodyscanner
	associated_paths = list(/obj/machinery/bodyscanner)
	mechanics_text = "The advanced scanner detects and reports internal injuries such as bone fractures, \
	internal bleeding, and organ damage. This is useful if you are about to perform surgery.<br>\
	<br>\
	Click your target with Grab intent, then click on the scanner to place them in it.\
	You can also click-drag their sprite onto the table. Click the red terminal to operate. \
	Right-click the scanner and click 'Eject Occupant' to remove them. You can enter the scanner yourself in a similar way, using the 'Enter Body Scanner' \
	verb, however you'll need someone else to help you actually perform the scan."

/datum/codex_entry/optable
	associated_paths = list(/obj/machinery/optable)
	mechanics_text = "Operation tables are the ideal surface for performing surgery. \
	Other surfaces are liable to cause the surgeon to accidentally harm their patient. \
	To place someone on the table, click your target with Grab intent, then click on the table with an empty hand, \
	to place them on it. You can also click-drag their sprite onto the table."

/datum/codex_entry/operating
	associated_paths = list(/obj/machinery/computer/operating)
	mechanics_text = "This console gives information on the status of the patient on the adjacent operating table, notably their consciousness."

/datum/codex_entry/sleeper
	associated_paths = list(/obj/machinery/sleeper)
	mechanics_text = "The sleeper allows you to clean the blood by means of dialysis, \
	and to administer medication in a controlled environment.<br>\
	<br>\
	Click your target with Grab intent, then click on the sleeper to place them in it, or you can click-drag their sprite onto it. \
	Click the green console, with an empty hand, to open the menu. \
	Click 'Start Dialysis' to begin filtering unwanted chemicals from the occupant's blood. The beaker contained will begin to fill with their \
	contaminated blood, and will need to be emptied when full.<br>\
	There's similar function for ingested reagents, 'Stomach Pump'.<br>\
	<br>\
	You can also inject common medicines directly into their bloodstream.\
	<br>\
	Right-click the cell and click 'Eject Occupant' to remove them. You can enter the cell yourself by right clicking and selecting 'Enter Sleeper'. \
	Note that you cannot control the sleeper while inside of it."

/datum/codex_entry/cryobag
	name = "stasis bag"
	associated_strings = list("cryo bag", "cryobag")
	associated_paths = list(/obj/item/bodybag/cryobag, /obj/structure/closet/body_bag/cryobag)
	mechanics_text = "Stasis bags, sometimes called cryo bags, are excellent for transporting critically injured patients.<br>\
	<br>\
	The bag protects the patient in two different ways. First, the bag itself isolates the patient from their environment, \
	with an air-tight seal and integrated oxygen supply. This will even protect them from vacuum exposure or toxic gases. \
	Second, the stasis bag, as the name implies, will apply a " + CODEX_LINK("stasis", "stasis") + " effect onto the patient inside, \
	slowing their bodily processes, and buying more time for them. A stasis bag slows the occupent's physiology by approximately \
	%STASIS_PERCENT percent.<br>\
	<br>\
	Stasis bags can only be used once, and it is fairly difficult to get ahold of more, so use them well. \
	They are ideal for situations where someone may die before being able to bring them back to safety, \
	or if they are in a hostile enviroment, such as in vacuum or in a toxins leak, as \
	the bag will protect the occupant from most outside enviromental hazards.<br>\
	<br>\
	If you open a bag by mistake, so long as nobody is placed inside of it, you can close the bag without using it up, \
	and you can pick it back up.<br>\
	<br>\
	You can use a health analyzer to scan the occupant's vitals without opening the bag by clicking the occupied bag with the analyzer.<br>\
	<br>\
	Stasis bags can accept a syringe, which will be used to automatically inject the occupant when entering the bag. \
	To remove an unused syringe, use a " + CODEX_LINK("screwdriver", "screwdriver") + "."

/datum/codex_entry/cryobag/New()
	..()
	var/obj/structure/closet/body_bag/cryobag/cryobag = /obj/structure/closet/body_bag/cryobag
	var/stasis_divisor = initial(cryobag.stasis_level)
	mechanics_text = replacetext(mechanics_text, "%STASIS_PERCENT", "[round(100 / stasis_divisor, 1)]")

/datum/codex_entry/stasis
	name = "stasis"
	mechanics_text = "When a living thing is under the effects of stasis, most of their bodily processes are slowed down. \
	This is generally done in a medical context in order to extend how much time someone has before they die to their injuries. \
	Even dead bodies can benefit from this, as a corpse under stasis will extend how much time is left before the body can \
	no longer be revived via a defib."