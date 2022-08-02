#if !defined(using_map_DATUM)
	#include "metro_areas.dm"
	#include "metro_unit_testing.dm"
	#include "jobs/metro_jobs.dm"
	#include "../shared/items/clothing.dm"
	#include "../shared/items/cards_ids.dm"

	#include "metro-1.dmm"
	#include "metro-2.dmm"
	#include "metro-3.dmm"
	#include "metro-4.dmm"
	#include "metro-5.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/metro

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif
