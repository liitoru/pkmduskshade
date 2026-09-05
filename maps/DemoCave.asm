DemoCave_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 33,  7, ROUTE_30, 2
	warp_event 19,  3, DEMO_CAVE, 3
	warp_event  5, 11, DEMO_CAVE, 2
	warp_event 11, 33, DEMO_FOREST, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 27,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBugCatcherNoah, -1
	object_event 13, 18, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerDereck, -1
	object_event  7, 31, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerLuke, -1
	object_event 27, 24, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerFirebreatherLeo, -1
	object_event 14,  9, SPRITE_POKEMANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerPokemaniacCarlson, -1
;	object_event  6,  8, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHexManiacAshley, -1
;	object_event 13, 17, SPRITE_ACE_TRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerCooltrainermHenri, -1
;	object_event 23, 25, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerHikerGrady, -1
;	object_event 29,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerScientistCarl, -1
;	itemball_event 10, 23, NUGGET, 1, EVENT_QUIET_CAVE_1F_NUGGET
;	itemball_event 26,  4, TWISTEDSPOON, 1, EVENT_QUIET_CAVE_1F_TWISTEDSPOON
;	itemball_event 14,  2, DUSK_STONE, 1, EVENT_QUIET_CAVE_1F_DUSK_STONE
;	itemball_event  3,  3, DUSK_BALL, 1, EVENT_QUIET_CAVE_1F_DUSK_BALL

;GenericTrainerHexManiacAshley:
;	generictrainer HEX_MANIAC, ASHLEY, EVENT_BEAT_HEX_MANIAC_ASHLEY, HexManiacAshleySeenText, HexManiacAshleyBeatenText

;	text "I see things that"
;	line "others can't see…"
;	done

;GenericTrainerCooltrainermHenri:
;	generictrainer COOLTRAINERM, HENRI, EVENT_BEAT_COOLTRAINERM_HENRI, CooltrainermHenriSeenText, CooltrainermHenriBeatenText

;	text "Having a diverse"
;	line "team to support"

;	para "each others' weak-"
;	line "nesses is key."
;	done

;GenericTrainerHikerGrady:
;	generictrainer HIKER, GRADY, EVENT_BEAT_HIKER_GRADY, HikerGradySeenText, HikerGradyBeatenText

;	text "You could hear a"
;	line "pin drop in this"
;	cont "place!"
;	done

;GenericTrainerScientistCarl:
;	generictrainer SCIENTIST, CARL, EVENT_BEAT_SCIENTIST_CARL, ScientistCarlSeenText, ScientistCarlBeatenText

;	text "It's interesting"
;	line "that such a quiet"
;	cont "environment can"

;	para "exist right near"
;	line "rushing water."
;	done

;HexManiacAshleySeenText:
;	text "The spirits have"
;	line "shown me your"
;	cont "defeat!"
;	done

;HexManiacAshleyBeatenText:
;	text "No! The spirits"
;	line "can't be wrong!"
;	done

;CooltrainermHenriSeenText:
;	text "Can you handle my"
;	line "balanced team of"
;	cont "#mon?"
;	done

;CooltrainermHenriBeatenText: ; text > text
;	text "I guess you can!"
;	done

;HikerGradySeenText:
;	text "I heard you long"
;	line "before I saw you!"
;	done

;HikerGradyBeatenText:
;	text "Ach!"
;	done

;ScientistCarlSeenText:
;	text "I'm studying the"
;	line "acoustics of this"
;	cont "cave system."
;	done

;ScientistCarlBeatenText:
;	text "My studies don't"
;	line "apply to battles!"
;	done

GenericTrainerBugCatcherNoah:
	generictrainer BUG_CATCHER, NOAH, EVENT_BEAT_BUG_CATCHER_NOAH, .SeenText, .BeatenText

	text "I'll keep going"
	line "this way."

	para "Maybe I'll find"
	line "a rare bug."
	done

.SeenText:
	text "I'm going to"
	line "catch all the"
	cont "bugs here!"
	done

.BeatenText:
	text "Fine… we can"
	line "share the bugs."
	done

GenericTrainerHikerDereck:
	generictrainer HIKER, DERECK, EVENT_BEAT_HIKER_DERECK, .SeenText, .BeatenText

	text "A hiker is always"
	line "prepared!"

	para "I always carry my"
	line "trusty repellent."
	done

.SeenText:
	text "A hiker is always"
	line "ready for a good"
	cont "battle!"
	done

.BeatenText:
	text "I wasn't prepared"
	line "enough."
	done

GenericTrainerHikerLuke:
	generictrainer HIKER, LUKE, EVENT_BEAT_HIKER_LUKE, .SeenText, .BeatenText

	text "I'm ready to"
	line "explore this"
	cont "whole cave."

	para "Although maybe I"
	line "should stop by a"
	cont "#mon Center"
	cont "first."
	done

.SeenText:
	text "Nothing like a"
	line "battle to stretch"
	cont "out!"
	done

.BeatenText:
	text "Now I feel ready"
	line "to explore even"
	cont "more."
	done

GenericTrainerFirebreatherLeo:
	generictrainer FIREBREATHER, LEO, EVENT_BEAT_FIREBREATHER_LEO, .SeenText, .BeatenText

	text "I like this cave."

	para "Nothing to"
	line "accidentally burn"
	cont "down."
	done

.SeenText:
	text "Our fire is"
	line "unrivaled!"
	done

.BeatenText:
	text "Event the fiercest"
	line "fire can flicker."
	done

GenericTrainerPokemaniacCarlson:
	generictrainer POKEMANIAC, CARLSON, EVENT_BEAT_POKEMANIAC_CARLSON, .SeenText, .BeatenText

	text "There must be a"
	line "very rare #mon"
	cont "around here."
	done

.SeenText:
	text "Hold it right"
	line "there!"

	para "You'll ruin those"
	line "footprints!"
	done

.BeatenText:
	text "Uurggh…"
	done
