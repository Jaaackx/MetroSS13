/*------------------------------------------------------------------------------------------------------------------------------------------------------
Station Resident
No responsibilities, considered the 'off-shift' role.
*/
/datum/job/station/
	title = "Station Resident"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MED
	total_positions = INFINITY
	spawn_positions = INFINITY
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

/*------------------------------------------------------------------------------------------------------------------------------------------------------
Miscellaneous roles.
*/

/datum/job/station/miner
	title = "Miner"
	social_class = SOCIAL_CLASS_MED
	total_positions = 2
	spawn_positions = 2
	supervisors = "Station Authority"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are a miner in Cheshov Prospekt. Carve away at the rock beneath the Earth and bring your spoils back to the station.</font></b></span>")

/datum/job/station/stalker
	title = "Stalker"
	social_class = SOCIAL_CLASS_MED
	total_positions = 2
	spawn_positions = 2
	outfit_type = /decl/hierarchy/outfit/job/stalker
	supervisors = "Station Authority"
	alt_titles = list("Scavenger","Prospector","Bounty Hunter","Ratcatcher")

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Stalker, tasked with scouring the tunnels and surface for salvage and rare equipment. Collect mutant ear bounties, bring goods back home and don't breathe in the irradiated air.</font></b></span>")


/*------------------------------------------------------------------------------------------------------------------------------------------------------
Proprietor of the Inn, their subordinate Cook and the Amuser.
Make money, purchase food and drink from various sources to keep your patrons happy.
*/

/datum/job/station/proprietor
	title = "Proprietor"
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/proprietor
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
	title = "Cook"
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
	title = "Amuser"
	social_class = SOCIAL_CLASS_MIN
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
Station Command Roles
*/

/datum/job/station/administrator
	title = "Administrator"
	department_flag = COM
	social_class = SOCIAL_CLASS_HIGH
	selection_color = "#a71212"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Premier"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the station Administrator, and are fiercely loyal to the Premier. Handle the treasury, control migration and resolve Residential disputes.</font></b></span>")

/datum/job/station/commisariat
	title = "Commisariat"
	department_flag = COM|SUP
	selection_color = "#a71212"
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Premier"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the Factory Manager, tasked with producing items for the station and for trade exports.</font></b></span>")

/datum/job/station/commander
	title = "Commander"
	department_flag = SEC|COM
	selection_color = "#a71212"
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Premier"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the Commander of the Cheshov Prospekt Military force. Protect the station at all costs, from all threats.</font></b></span>")

/datum/job/station/merchant
	title = "Merchant"
	department_flag = COM|SUP
	outfit_type = /decl/hierarchy/outfit/merchant
	selection_color = "#a71212"
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Premier"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are an independent, wealthy Merchant based out of Cheshov Prospekt. Handle imports and exports, only allowing things like slaves and drugs if the Premier permits them - or if you think you can get away with it.</font></b></span>")


/datum/job/station/premier
	title = "Premier"
	department_flag = COM|SUP
	selection_color = "#a71212"
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	supervisors = "God"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are the Premier of Cheshov Prospekt. Do as you wish.</font></b></span>")

/*------------------------------------------------------------------------------------------------------------------------------------------------------
Clinic Roles
*/

/datum/job/station/headpractitioner
	title = "Head Practitioner"
	department_flag = MED
	selection_color = "#397e55"
	social_class = SOCIAL_CLASS_MED
	outfit_type = /decl/hierarchy/outfit/job/headpractitioner
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Authority"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
		H.add_stats(rand(8,12), rand(5,8), rand(5,7), rand(10,14))
		H.fully_replace_character_name("Prac. [H.real_name]")
		H.say(";Practitioner reporting for duty!")
		to_chat(H, "<span class='notice'><b><font size=3>You are the Head Practitioner of Cheshov Prospekt's clinic. Ensure the place runs smoothly.</font></b></span>")

/datum/job/station/nurse
	title = "Nurse"
	department_flag = MED
	selection_color = "#397e55"
	social_class = SOCIAL_CLASS_MIN
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Authority"

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14))
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		to_chat(H, "<span class='notice'><b><font size=3>You are a Nurse working in Cheshov Prospekt's clinic. Treat any paying patients who come in, and keep the place stocked.</font></b></span>")