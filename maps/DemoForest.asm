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
	object_event  6,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DemoForestEndingNPC, -1
	object_event 24, 18, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DemoForestUltraBallScript, -1
	object_event 35,  6, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, DemoForestHealNPC, -1

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

DemoForestEndingNPC:
	opentext
	checkevent EVENT_BEAT_BIRD_KEEPER_ISAAC
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_BUG_CATCHER_MATEO
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_BUG_CATCHER_WILLOW
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_LASS_SOFIA
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_YOUNGSTER_LEVI
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_YOUNGSTER_JOEY
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_LASS_KRISE
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_YOUNGSTER_MIKEY
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_BUG_CATCHER_DON
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_FISHER_RALPH
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_FISHER_TULLY
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_FISHER_WILTON
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_HEX_MANIAC_ASHLEY
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_COOLTRAINERM_HENRI
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_HIKER_GRADY
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_SCIENTIST_CARL
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_BUG_CATCHER_NOAH
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_HIKER_DERECK
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_HIKER_LUKE
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_FIREBREATHER_LEO
	iffalsefwd .DontEnd
	checkevent EVENT_BEAT_POKEMANIAC_CARLSON
	iftruefwd .End
.DontEnd
	writetext FightAllTrainersText
	waitbutton
	closetext
	end

.End
	writetext CongratulationsText
	waitbutton
	closetext
	clearevent EVENT_BEAT_BIRD_KEEPER_ISAAC
	clearevent EVENT_BEAT_BUG_CATCHER_MATEO
	clearevent EVENT_BEAT_BUG_CATCHER_WILLOW
	clearevent EVENT_BEAT_LASS_SOFIA
	clearevent EVENT_BEAT_YOUNGSTER_LEVI
	clearevent EVENT_BEAT_YOUNGSTER_JOEY
	clearevent EVENT_BEAT_LASS_KRISE
	clearevent EVENT_BEAT_YOUNGSTER_MIKEY
	clearevent EVENT_BEAT_BUG_CATCHER_DON
	clearevent EVENT_BEAT_FISHER_RALPH
	clearevent EVENT_BEAT_FISHER_TULLY
	clearevent EVENT_BEAT_FISHER_WILTON
	clearevent EVENT_BEAT_HEX_MANIAC_ASHLEY
	clearevent EVENT_BEAT_COOLTRAINERM_HENRI
	clearevent EVENT_BEAT_HIKER_GRADY
	clearevent EVENT_BEAT_SCIENTIST_CARL
	clearevent EVENT_BEAT_BUG_CATCHER_NOAH
	clearevent EVENT_BEAT_HIKER_DERECK
	clearevent EVENT_BEAT_HIKER_LUKE
	clearevent EVENT_BEAT_FIREBREATHER_LEO
	clearevent EVENT_BEAT_POKEMANIAC_CARLSON
	setmapscene ROUTE_30, SCENE_ROUTE30_RIVAL
	blackoutmod ROUTE_30
	halloffame
	end

FightAllTrainersText:
	text "Come back after"
	line "you have defeated"
	cont "all trainers."
	done

CongratulationsText:
	text "Congratulations!"

	para "You have completed"
	line "the demo!"

	para "All trainers will"
	line "now be reset, so"
	cont "you can keep"
	cont "playing!"
	done

DemoForestUltraBallScript:
	opentext
	checkitem ULTRA_BALL
	iffalsefwd .GetUltraBall
	jumpthistext

	text "Come back when you"
	line "need more Ultra"
	cont "Balls."
	done

.GetUltraBall
	writetext TakeUltraBallText
	waitbutton
	verbosegiveitem ULTRA_BALL, 5
	closetext
	end

TakeUltraBallText:
	text "Here, take these"
	line "to help catch"
	cont "#mon."
	done

DemoForestHealNPC:
	faceplayer
	opentext
	writetext DemoForestHealText
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	jumpthistext

	text "Good luck!"
	done

DemoForestHealText:
	text "I can heal you."
	done
