/datum/unit_test/codex_shall_have_no_dead_links
	name = "CODEX: Codex entries shall not have dead links"

/datum/unit_test/codex_shall_have_no_dead_links/start_test()
	var/mob/living/codex_mob = new(locate(1, 1, 1))
	for(var/entry_string in SScodex.entries_by_string)
		var/datum/codex_entry/entry = SScodex.entries_by_string[entry_string]
		var/content = entry.get_text(codex_mob)
		SScodex.parse_links(content, codex_mob) // If a link fails to resolve to a real page, it will be noted by `SScodex`.

	QDEL_NULL(codex_mob)

	if(SScodex.dead_links.len)
		fail("The following codex links reference nonexistant pages:\n [SScodex.dead_links.Join("\n")]")
	else
		pass("All codex links lead to pages that exist")

	return 1