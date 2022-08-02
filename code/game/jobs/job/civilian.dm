//Food && these jobs are outpost support staff

// Bar Servitor

/datum/job/bartender
	title = "Bartender"
	department = "Service"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 1
	supervisors = "the Innkeeper"
	selection_color = "#337C81"
	access = list(access_hydroponics, access_bar, access_kitchen)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3



	equip(var/mob/living/carbon/human/H)
		var/servitor_number = rand(1,1000)
		var/servitor_name = "abel"
		..()
		H.fully_replace_character_name("[servitor_name] [servitor_number]")
		H.add_stats(rand(10,11), rand(8), rand(6,16), rand(7,8)) //extremely simple minded and weak
		H.add_skills(rand(6,9),rand(3,6),1,rand(5,7),3) //servitors know how to make basic self repairs
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.warfare_faction = STATION
		to_chat(H, "<span class='notice'><b><font size=3>You are a servitor, specifically one designed for managing a bar and serving drinks. You are to obey Imperial citizens and serve their every need. You are nearly mindless and will follow any order given to you by a superior.</font></b></span>")

// Cook

/datum/job/chef
	title = "Cook"
	department = "Service"
	department_flag = CIV
	total_positions = 0
	spawn_positions = 0
	open_when_dead = 1
	social_class = SOCIAL_CLASS_MED
	latejoin_at_spawnpoints = TRUE
	supervisors = "the Seneschal, the Commissar"
	selection_color = "#337C81"
	access = list(access_hydroponics, access_bar, access_kitchen, access_maint_tunnels)
	minimal_access = list(access_kitchen)
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3
	outfit_type = /decl/hierarchy/outfit/job/service/chef

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(11,12), rand(10,12), rand(10,12), rand(8,11)) //highly trained and skilled
		H.add_skills(rand(6,8),rand(6,7),rand(1,6),rand(1,2),1)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.warfare_faction = STATION
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a newly recruited Trooper, your training recently complete you were assigned kitchen duties. It is up to you to feed a hungry outpost.</font></b></span>")

// Farmer

/datum/job/hydro
	title = "Crofter"
	department = "Service"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	social_class = SOCIAL_CLASS_MED
	supervisors = "Production Manager"
	selection_color = "#ae6419"
	latejoin_at_spawnpoints = TRUE
	access = list(access_hydroponics, access_bar, access_kitchen,access_maint_tunnels)
	minimal_access = list(access_hydroponics, access_maint_tunnels, access_kitchen)
	alt_titles = list("Shroomfarmer", "Stockman", "Soiler")
	outfit_type = /decl/hierarchy/outfit/job/service/gardener
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("[current_name]")
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14)) //well fed and robust
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3) //farmers are handy
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.warfare_faction = STATION
		to_chat(H, "<span class='notice'><b><font size=3>You run the farm in Cheshov Prospekt under the employ of the Production Manager. Keep the station fed, the shroomvodka flowing and the exports coming.</font></b></span>")

// Janitor Servitor

/datum/job/janitor
	title = "Janitor"
	department = "Service"
	department_flag = CIV
	total_positions = 5
	spawn_positions = 5
	open_when_dead = 1
	latejoin_at_spawnpoints = TRUE
	social_class = SOCIAL_CLASS_MED
	supervisors = "Station Authority"
	selection_color = "#337C81"
	access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	minimal_access = list(access_janitor, access_maint_tunnels, access_engine, access_research, access_medical)
	//alt_titles = list("Custodian","Sanitation Technician")
	outfit_type = /decl/hierarchy/outfit/job/service/janitor
	announced = FALSE
	auto_rifle_skill = 3
	semi_rifle_skill = 3
	sniper_skill = 3
	shotgun_skill = 3
	lmg_skill = 3
	smg_skill = 3


	equip(var/mob/living/carbon/human/H)
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14)) //well fed and robust
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3) //farmers are handy
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.warfare_faction = STATION
		to_chat(H, "<span class='notice'><b><font size=3>You are a Janitor, concerned with keeping the station clean to prevent the spread of disease.</font></b></span>")

// Undertaker
/mob/living/proc/assign_child_quirk()
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
	if(chosen_quirk == /datum/quirk/cig_addict || chosen_quirk == /datum/quirk/alcoholic || chosen_quirk == /datum/quirk/obscura)
		random_quirks -= list(
			/datum/quirk/cig_addict,
			/datum/quirk/alcoholic,
			/datum/quirk/obscura
			)
		chosen_quirk = pick(random_quirks)
		return
	src.quirk = new chosen_quirk
	to_chat(src, "<span class='bnotice'>I was formed a bit different. I am [quirk.name]. [quirk.description]</span>")

/datum/job/undertaker
	title = "Undertaker"
	department = "Service"
	department_flag = CIV
	social_class = SOCIAL_CLASS_MED
	total_positions = 1
	spawn_positions = 1
	latejoin_at_spawnpoints = TRUE
	open_when_dead = 1
	supervisors = "Station Authority"
	selection_color = "#848484"
	access = list(access_janitor, access_maint_tunnels, access_medical, access_morgue)
	minimal_access = list(access_janitor, access_maint_tunnels, access_medical, access_morgue)
	outfit_type = /decl/hierarchy/outfit/job/service/undertaker
	announced = FALSE
	auto_rifle_skill = 2
	semi_rifle_skill = 2
	sniper_skill = 2
	shotgun_skill = 2
	lmg_skill = 2
	smg_skill = 2
	melee_skill = 4
	ranged_skill = 6
	medical_skill = 5
	engineering_skill = 2
	surgery_skill = 5

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(14,16), rand(13,15), rand(14,16), rand(8,14)) //well fed and robust
		H.add_skills(rand(7,10),rand(6,10),rand(3,5),rand(2,4),3) //farmers are handy
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.get_idcard()?.access = list(access_janitor, access_maint_tunnels, access_medical, access_morgue)
		H.assign_random_quirk()
		H.set_trait(new/datum/trait/death_tolerant())
		to_chat(H, "<span class='notice'><b><font size=3>You are a war orphan, found and taken in by the generous Deacon you owe him your life. However, you must earn your keep. </font></b></span>")
