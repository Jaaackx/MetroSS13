/datum/job/penitent //the plan is to have penitent be a default landing job, I will eventually add a randomized system that gives different loadouts much like the migrant system of lifeweb
	title = "Pilgrim"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = INFINITY //maybe open up more of these when we figure out other classes and depending on player count
	spawn_positions = INFINITY
	supervisors = "The Holy Inquisition"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE


	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(6,11), rand(7,12), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		H.witchblood()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You are a Pilgrim. You left your home with little in search of more. Rumors of a holy site drew you to this planet and now life is in your hands. Go to your pilgrim tab and select your fate. </font></b></span>")



		H.verbs += list(
			/mob/living/carbon/human/proc/penitentclass,
		)
/*
Pilgrim Fate System
*/

//yeah this might be the most retarded way of doing it but it works - plz no bully Matt

//mob/living/carbon/human/proc/penitentclass(var/mob/living/carbon/human/M)
/mob/living/carbon/human/proc/penitentclass()
	set name = "Select your class"
	set category = "Pilgrim"
	set desc = "Choose your new profession on this strange world."
	if(!ishuman(src))
		to_chat(src, "<span class='notice'>How tf are you seeing this, ping Wel Ard immediately</span>")
		return
	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't choose a class when you're dead.</span>")
		return
	src.verbs -= list(/mob/living/carbon/human/proc/penitentclass)

	var/mob/living/carbon/human/U = src
	var/fates = list() //lists all possible fates

	fates += pick("Merchant","Bounty Hunter","Penitent",) //adds a fate randomly to essentially give rng pick
	fates += pick("Sherpa","Musician","Disgraced Medicae",) //adds a fate randomly to essentially give rng pick
	fates += pick("Stalker","Scum","Miner",) //adds a fate randomly to essentially give rng pick

	mind.store_memory("[fates]") //should stop people from closing client and rerolling fates


	var/classchoice = input("Choose your fate", "Available fates") as anything in fates


	switch(classchoice)
		if("Sherpa")
			U.add_stats(rand(11,14), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(2,6),rand(4,7),rand(1,2),rand(1,2),rand(1,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/suit/sherpa, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/ushanka2, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/device/flashlight/lantern, slot_belt)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'>Your home world was destroyed in an Ork waaaaaagh, you managed to escape before the planet was destroyed. On your home world, you were a navigator, born with an innate gift for pathfinding.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Penitent")
			U.add_stats(rand(14,16), rand(12,15), rand(10,14), rand (8,12)) //
			U.add_skills(rand(4,8),rand(2,6),rand(1,1),rand(1,1),rand(1,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/suit/raggedrobe, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/plebhood, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/ten, slot_r_store)
			to_chat(U, "<span class='notice'><b><font size=3>You are a penitent, forced to tour the galaxy and toil until death in hopes of one day redeeming yourself. In your youth, you were an unknowing daemon-worshipper. Years of torment and re-education by the Inquisition allowed you this one chance at redemption. Labour endlessly in His name.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Bounty Hunter")
			U.add_stats(rand(13,17), rand(11,15), rand(10,14), rand (8,12)) //veteran hunter
			U.add_skills(rand(3,7),rand(2,7),rand(1,1),rand(1,1),rand(1,1)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/armor/bountyhunter2, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/bountyhead, slot_head)
			equip_to_slot_or_del(new /obj/item/gun/energy/las/lasgun, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/cell/lasgun, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/handcuffs, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>Brought to this planet in search of work, in your youth you were a Sergeant in the Astra Militarum, you've spent the rest of your adulthood as a member of the Imperium's Bounty Hunter guild. Years of experience and hunting have hardened you and made you a force to be reckoned with.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Merchant")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(2,6),rand(2,8),rand(1,4),rand(1,4),rand(1,4)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/head/smokingcap, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/merchant, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones/five, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones2/ten, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'>Guided by your lust for thrones you smelled opportunity on this newly founded world. Work with the village and the outpost to organize trade and enrich yourself.<b><font size=3>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,
			)
		if("Musician")
			U.add_stats(rand(8,16), rand(8,16), rand(10,14), rand (8,12)) //
			U.add_skills(rand(1,8),rand(1,8),rand(1,4),rand(1,4),rand(1,4)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/device/violin, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/musician, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/musichat, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)

			to_chat(U,"<span class='notice'><b><font size=3>A wandering bard you find yourself moving from tavern to tavern entertaining the masses for a few thrones at a time. This planet will surely be no different. </font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Miner")
			U.add_stats(rand(16,18), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(5,7),rand(1,5),rand(1,1),rand(1,1),rand(1,1)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/gloves/thick, slot_gloves)
			equip_to_slot_or_del(new /obj/item/storage/newore, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/satchel_eng, slot_back)
			equip_to_slot_or_del(new /obj/item/pickaxe/newpick, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/clothing/suit/miner, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>A veteran of many digsites you travelled the galaxy looking for work.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Stalker")
			U.add_stats(rand(12,15), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(2,6),rand(4,7),rand(1,2),rand(1,2),rand(1,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/storage/belt/stalker, slot_belt)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/material/knife/butch, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/suit/chokha, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/gun/projectile/shotgun/pump/boltaction/shitty, slot_r_hand)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/brifle_handful, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/clothing/head/pillbox, slot_head)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>Ever in search of new game to hunt, you travelled to this new world in search of trophy and meat.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Scum")
			U.add_stats(rand(13,14), rand(13,15), rand(10,14), rand (8,12)) //
			U.add_skills(rand(1,5),rand(1,7),rand(1,2),rand(1,2),rand(1,2)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/suit/scum, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/head/scum, slot_head)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/fancy/cigarettes/dromedaryco, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/happy, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/storage/pill_bottle/zoom, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/flame/lighter/zippo, slot_l_store)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			to_chat(U,"<span class='notice'><b><font size=3>Always on the run, always moving from scheme to scheme you once again find yourself on a new world. You'll do whatever it takes for a throne or two. Scamming, gambling, drug dealing. You are the scum of the Imperium but you wouldn't have it any other way.</font></b></span>")
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)
		if("Disgraced Medicae")
			U.add_stats(rand(10,14), rand(10,14), rand(10,14), rand (8,12)) //
			U.add_skills(rand(1,5),rand(1,6),rand(3,5),rand(1,2),rand(3,5)) //melee, ranged, med, eng, surgery
			equip_to_slot_or_del(new /obj/item/clothing/mask/gas/prac_mask, slot_wear_mask)
			equip_to_slot_or_del(new /obj/item/clothing/suit/prac_arpon, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/warfare, slot_back)
			equip_to_slot_or_del(new /obj/item/storage/firstaid/adv, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/storage/belt/medical/full, slot_belt)
			equip_to_slot_or_del(new /obj/item/clothing/gloves/prac_gloves, slot_gloves)
			equip_to_slot_or_del(new /obj/item/torch/self_lit, slot_l_hand)
			equip_to_slot_or_del(new /obj/item/stack/thrones3/twenty, slot_in_backpack)
			equip_to_slot_or_del(new /obj/item/stack/thrones, slot_in_backpack)
			to_chat(U,"<span class='notice'><b><font size=3>A few too many slips and you found yourself stripped of your medical license but not the knowledge you gained for years of schooling and practice. Set up shop on this new world and hope no one asks to see your credentials.</font></b></span>")
			var/obj/item/card/id/ring/disgracedmedicae/W = new

			W.icon_state = "medicae_ring"
			W.assignment = "Medicae"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)
			U.verbs -= list(/mob/living/carbon/human/proc/penitentclass,)




/datum/job/innkeeper  //so that the inn always has someone working
	title = "Innkeeper"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //better off than your average gross pilgrim
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 1
	supervisors = "Money"
	selection_color = "#848484"
	access = list(access_bar,)
	minimal_access = list(access_bar)
	outfit_type = /decl/hierarchy/outfit/job/innkeeper
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.add_stats(rand(13,15), rand(13,15), rand(8,12), rand (8,11)) //they suck and are supposed to suck
		H.add_skills(rand(6,9),rand(2,6),rand(2,4),rand(2,3),rand(1,3)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		H.verbs += list(
		/mob/living/carbon/human/proc/khorne,
		/mob/living/carbon/human/proc/nurgle,
		/mob/living/carbon/human/proc/slaanesh,
		/mob/living/carbon/human/proc/tzeentch)
		to_chat(H, "<span class='notice'><b><font size=3>You landed on this outpost some time ago, with the savings you had, you opened an inn hoping to grow your wealth serving the various pilgrims and travelers. Trade with gatherers and the outpost to always stay stocked so that no paying customer will be without food and drink. You have a full kitchen, alcohol and small farm to grow what you need. </font></b></span>")




/datum/job/administrator  //so that the inn always has someone working
	title = "House Noble"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MED //better off than your average gross pilgrim
	total_positions = 2
	spawn_positions = 2
	head_position = 1
	open_when_dead = 1
	supervisors = "the merchant guilds"
	selection_color = "#337C81"
	access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	minimal_access = list(access_bar, access_maint_tunnels, access_clinic, access_administratum, access_change_ids, access_keycard_auth,)
	outfit_type = /decl/hierarchy/outfit/job/administrator
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8

	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = STATION
		..()
		H.fully_replace_character_name("Lord [current_name]")
		H.add_skills(rand(5,8),rand(5,8),rand(5,8),rand(5,8),rand(5,8)) //melee, ranged, med, eng, surgery
		H.add_stats(rand(14,16), rand(14,16), rand(12,18), rand (12,18)) //a lil better fed than others.
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.warfare_language_shit(LANGUAGE_RUSSIAN)
		H.warfare_faction = STATION
		to_chat(H, "<span class='notice'><b><font size=3>You are a member of an ancient Imperial House on this planet. You act as a go-between for the village and your merchant contacts on the outer systems. Work with your Servant Penitent to ensure the continued survival of your house, it is imperative that the line of succession remains unbroken. Ensure there are pilgrims working the farm and that the clinic is staffed, you are as reliant on them as they are upon you. </font></b></span>")

//loadouts below here
/decl/hierarchy/outfit/job/penitent
	name = OUTFIT_JOB_NAME("Pilgrim")
	uniform = /obj/item/clothing/under/rank/station
	neck = /obj/item/reagent_containers/food/drinks/canteen
	shoes = /obj/item/clothing/shoes/prac_boots
	l_ear = null
	r_ear = null
	id_type = null
	gloves = null
	pda_slot = null


/decl/hierarchy/outfit/job/innkeeper
	name = OUTFIT_JOB_NAME("Innkeeper")
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/innapron
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/bardhat
	l_ear = /obj/item/device/radio/headset/red_team
	r_ear = null
	pda_slot = null
	shoes = /obj/item/clothing/shoes/vigilante
	suit_store = /obj/item/gun/projectile/shotgun/pump/shitty
	backpack_contents = list(
	/obj/item/ammo_magazine/handful/shotgun/shotgun_handful = 2,
	/obj/item/storage/box/beanbags = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/five = 1,
)


//Administrator
/decl/hierarchy/outfit/job/administrator
	name = OUTFIT_JOB_NAME("House Noble")
	uniform = /obj/item/clothing/under/rank/consort/adept
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/thick/swat/combat/warfare
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	id_type = /obj/item/card/id/ring/administrator
	l_ear = /obj/item/device/radio/headset/red_team/sl_delta
	belt = /obj/item/device/flashlight/lantern
	pda_slot = null
	backpack_contents = list(
	/obj/item/stack/thrones = 2,
	/obj/item/stack/thrones2/five = 1,
	/obj/item/stack/thrones3/twenty = 1,
	/obj/item/gun/projectile/talon/adept = 1,
	/obj/item/ammo_magazine/c45m = 2,

	)
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR