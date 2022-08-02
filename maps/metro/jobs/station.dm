/*------------------------------------------------------------------------------------------------------------------------------------------------------
Station Resident
No responsibilities, considered the 'off-shift' role.
*/

/datum/job/station
    title = "Station Resident"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MED
	total_positions = INF
	spawn_positions = INF
	open_when_dead = 0
	supervisors = "Station Authority"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/station
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	auto_rifle_skill = 2
	semi_rifle_skill = 2
	sniper_skill = 2
	shotgun_skill = 2
	lmg_skill = 2
	smg_skill = 2
	melee_skill = 2
	ranged_skill = 2
	medical_skill = 2
	engineering_skill = 2
	surgery_skill = 2

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11))
//		H.add_skills(rand(2,6),rand(4,7),rand(1,2),rand(1,2),rand(1,2))
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are a simple resident of Cheshov Prospekt.</font></b></span>")

/mob/living/proc/assign_random_quirk()
	if(prob(75))//75% of not choosing a quirk at all.
		return
	if(is_hellbanned())//Hellbanned people will never get quirks.
		return
	var/list/random_quirks = list()
	for(var/thing in subtypesof(/datum/quirk))//Populate possible quirks list.
		var/datum/quirk/Q = thing
		random_quirks += Q
	if(!random_quirks.len)//If there's somewhow nothing there afterwards return.
		return
	var/datum/quirk/chosen_quirk = pick(random_quirks)
	src.quirk = new chosen_quirk
	to_chat(src, "<span class='bnotice'>I was formed a bit different. I am [quirk.name]. [quirk.description]</span>")
	switch(chosen_quirk)
		if(/datum/quirk/cig_addict)
			var/datum/reagent/new_reagent = new /datum/reagent/nicotine
			src.reagents.addiction_list.Add(new_reagent)
		if(/datum/quirk/alcoholic)
			var/datum/reagent/new_reagent = new /datum/reagent/ethanol
			src.reagents.addiction_list.Add(new_reagent)

/*------------------------------------------------------------------------------------------------------------------------------------------------------
Proprietor of the Inn, their subordinate Cook and the Amuser.
Make money, purchase food and drink from various sources to keep your patrons happy.
*/

/datum/job/station/proprietor
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Authority"
	announced = TRUE
	shotgun_skill = 6

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the proprietor of the bar in Cheshov Prospekt. Keep the shroom vodka flowing and pass orders to your Cook. Ensure the Amuser is not robbing your customers blind, or take a cut of the profits.</font></b></span>")

/datum/job/station/cook
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Proprietor of the Bar"

	melee_skill = 6

		equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the Cook in the bar in Cheshov Prospekt. Ensure that you are being provided with ingredients, and keep the Proprietor happy to preserve your employment.</font></b></span>")

/datum/job/station/amuser
	social_class = SOCIAL_CLASS_LOW
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Proprietor of the Bar"
	outfit_type = /decl/hierarchy/outfit/job/amuser

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the entertainment in the bar in Cheshov Prospekt. This is a varied position, and you should seek guidance from the Proprietor.</font></b></span>")

/*------------------------------------------------------------------------------------------------------------------------------------------------------
Next
*/