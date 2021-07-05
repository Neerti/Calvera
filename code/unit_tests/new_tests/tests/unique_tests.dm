/datum/unit_test/proc/number_of_issues(var/list/entries, var/type, var/feedback = /decl/noi_feedback)
	var/issues = 0
	for(var/key in entries)
		var/list/values = entries[key]
		if(values.len > 1)
			var/decl/noi_feedback/noif = GET_DECL(feedback)
			noif.print(src, type, key, values)
			issues++

	return issues

/decl/noi_feedback/proc/priv_print(var/datum/unit_test/ut, var/type, var/key, var/output_text)
	ut.log_bad("[type] - [key] - The following entries have the same value: [output_text]")

/decl/noi_feedback/proc/print(var/datum/unit_test/ut, var/type, var/key, var/list/entries)
	priv_print(ut, type, key, english_list(entries))

/decl/noi_feedback/detailed/print(var/datum/unit_test/ut, var/type, var/key, var/list/entries)
	var/list/pretty_print = list()
	pretty_print += ""
	for(var/entry in entries)
		pretty_print += log_info_line(entry)
	priv_print(ut, type, key, jointext(pretty_print, "\n"))
