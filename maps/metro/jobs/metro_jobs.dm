

/datum/map/metro
	allowed_jobs = list(
	/datum/job/station,
	/datum/job/station/proprietor,
	/datum/job/station/cook,
	/datum/job/station/amuser,
	/datum/job/station/miner,
	/datum/job/station/stalker,
	/datum/job/station/headpractitioner,
	/datum/job/station/nurse,
	/datum/job/station/administrator,
	/datum/job/station/commisariat,
	/datum/job/station/premier,
	/datum/job/station/merchant,
	/datum/job/station/commander,
	/datum/job/refugee,
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
