DemoForest_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 36,	5, DEMO_CAVE, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 30,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBugCatcherWillow, -1
	object_event 39, 12, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBugCatcherMateo, -1
	object_event 15, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterLevi, -1
	object_event 37, 18, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerLassSofia, -1
	object_event  5, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBirdKeeperIsaac, -1

GenericTrainerBugCatcherWillow:
	generictrainer BUG_CATCHER, WILLOW, EVENT_BEAT_BUG_CATCHER_WILLOW, .SeenText, .BeatenText

	text "I heard there are"
	line "rare #mon in"
	cont "the trees around"
	cont "here."

	para "But I have't any"
	line "luck today."
	done

.SeenText:
	text "Are you here"
	line "looking for rare"
	cont "bug #mon too?"
	done

.BeatenText:
	text "You're stronger"
	line "than I thought!"
	done

GenericTrainerBugCatcherMateo:
	generictrainer BUG_CATCHER, MATEO, EVENT_BEAT_BUG_CATCHER_MATEO, .SeenText, .BeatenText

	text "My #mon is"
	line "strong… But I'm"
	cont "not."

	para "I'll get stronger!"
	done

.SeenText:
	text "My #mon is"
	line "unbeatable!"
	done

.BeatenText:
	text "I lost?!"
	done

GenericTrainerYoungsterLevi:
	generictrainer YOUNGSTER, LEVI, EVENT_BEAT_YOUNGSTER_LEVI, .SeenText, .BeatenText

	text "You're strong."

	para "I'll train hard"
	line "and beat you"
	cont "someday!"
	done

.SeenText:
	text "You there!"
	line "Want to battle?"
	done

.BeatenText:
	text "Awww… You really"
	line "are strong."
	done

GenericTrainerLassSofia:
	generictrainer LASS, SOFIA, EVENT_BEAT_LASS_SOFIA, .SeenText, .BeatenText

	text "I really like"
	line "this place."

	para "It's so peaceful."
	done

.SeenText:
	text "Who disturbs my"
	line "peace?"
	done

.BeatenText:
	text "So much for my"
	line "peaceful day…"
	done

GenericTrainerBirdKeeperIsaac:
	generictrainer BIRD_KEEPER, ISAAC, EVENT_BEAT_BIRD_KEEPER_ISAAC, .SeenText, .BeatenText

	text "I've trained"
	line "here for years."

	para "It's ideal for"
	line "my birds."
	done

.SeenText:
	text "Care for a"
	line "battle?"
	done

.BeatenText:
	text "Well done."
	done
