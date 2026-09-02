Route30_MapScriptHeader:
	def_scene_scripts
	scene_const SCENE_ROUTE30_DEMO_GIFT
	scene_const SCENE_ROUTE30_RIVAL
	scene_const SCENE_ROUTE30_NOOP

	def_callbacks

	def_warp_events
	warp_event 15, 19, ROUTE_30_BERRY_SPEECH_HOUSE, 1
	warp_event 28,  3, MR_POKEMONS_HOUSE, 1

	def_coord_events
	coord_event  3, 20, SCENE_ROUTE30_DEMO_GIFT, Route30Gift1
	coord_event  4, 20, SCENE_ROUTE30_DEMO_GIFT, Route30Gift2
	coord_event 32, 20, SCENE_ROUTE30_RIVAL, Route30Rival1
	coord_event 33, 20, SCENE_ROUTE30_RIVAL, Route30Rival2

	def_bg_events
	bg_event  2, 20, BGEVENT_JUMPTEXT, Route30SignText
	bg_event 19, 31, BGEVENT_JUMPTEXT, MrPokemonsHouseDirectionsSignText
	bg_event 26,  1, BGEVENT_JUMPTEXT, MrPokemonsHouseSignText
	bg_event  9,  7, BGEVENT_JUMPTEXT, Route30TrainerTipsText
	bg_event 23,  7, BGEVENT_JUMPTEXT, Route30AdvancedTipsText
	bg_event 13,  8, BGEVENT_ITEM + POTION, EVENT_ROUTE_30_HIDDEN_POTION
	bg_event 17, 31, BGEVENT_JUMPTEXT, BerryMastersHouseSignText

	def_object_events
	object_event  3, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route30PokefanMText, -1
	object_event  4, 25, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, PAL_NPC_BROWN, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route30PokefanMText, -1
	object_event 32, 25, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route30RivalText, EVENT_ROUTE_30_YOUNGSTER_JOEY
	object_event 35,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, TrainerYoungsterJoey, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerYoungsterMikey, -1
	object_event 13,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBug_catcherDon, -1
	object_event  3,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, PAL_NPC_ORANGE, OBJECTTYPE_COMMAND, jumptextfaceplayer, Route30YoungsterText, -1
	object_event 28,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_GREEN, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerLassKrise2, -1
	object_event  5, 20, SPRITE_OAK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30Gift4, -1
	cuttree_event 39,  0, EVENT_ROUTE_30_CUT_TREE
	fruittree_event 20,  6, FRUITTREE_ROUTE_30_1, ORAN_BERRY, PAL_NPC_BLUE
	fruittree_event 19,  1, FRUITTREE_ROUTE_30_2, PECHA_BERRY, PAL_NPC_PINK
	itemball_event 37,  9, ANTIDOTE, 1, EVENT_ROUTE_30_ANTIDOTE

Route30Gift1:
	applyonemovement PLAYER, step_right
Route30Gift2:
	turnobject PLAYER, RIGHT
Route30Gift3:
	opentext
	checkscene
	iftruefwd .Skip
	writetext Route30GiftText
	waitbutton
	setscene SCENE_ROUTE30_RIVAL
	givepoke BAYLEEF, PLAIN_FORM, 30, ORAN_BERRY
	givepoke SEAKING, PLAIN_FORM, 30, ORAN_BERRY
	givepoke GROWLITHE, HISUIAN_FORM, 30, ORAN_BERRY
	readvar VAR_PLAYERGENDER
	assert PLAYER_MALE == 0
	iffalsefwd .MalePokemon
	givepoke RATICATE, PLAIN_FORM, 30, ORAN_BERRY
	sjumpfwd .FinishGift

.MalePokemon
	givepoke FURRET, PLAIN_FORM, 30, ORAN_BERRY
.FinishGift
	verbosegiveitem GREAT_BALL, 5
	closetext
	end

.Skip
	writetext Route30GiftText2
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

Route30Gift4:
	faceplayer
	sjump Route30Gift3

Route30GiftText:
	text "You need some"
	line "#mon for your"
	cont "protection!"
	done

Route30GiftText2:
	text "I'll heal your"
	line "#mon!"
	done

	object_const_def
	const ROUTE30_YOUNGSTER1
	const ROUTE30_PIDGEY
	const ROUTE30_RIVAL

Route30Rival1:
	moveobject ROUTE30_RIVAL, 33, 25
	appear ROUTE30_RIVAL
	showemote EMOTE_SHOCK, PLAYER, 15
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE30_RIVAL, Route30RivalMovement1
	turnobject PLAYER, RIGHT
	sjumpfwd FinishRival
Route30Rival2:
	showemote EMOTE_SHOCK, PLAYER, 15
	appear ROUTE30_RIVAL
	special Special_FadeOutMusic
	pause 15
	applymovement ROUTE30_RIVAL, Route30RivalMovement2
	turnobject PLAYER, LEFT
FinishRival:
	playmusic MUSIC_RIVAL_ENCOUNTER
	showtext Route30RivalText
	winlosstext Route30RivalWinText, Route30RivalLossText
	setlasttalked ROUTE30_RIVAL
	loadtrainer RIVAL0, 1
	startbattle
	reloadmap
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	showtext Route30RivalText1
	turnobject PLAYER, UP
	applymovement ROUTE30_RIVAL, Route30RivalMovement3
	disappear ROUTE30_RIVAL
	playmusic MUSIC_ROUTE_30
	setscene SCENE_ROUTE30_NOOP
	end

Route30RivalMovement1:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

Route30RivalMovement2:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

Route30RivalMovement3:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

YoungsterJoey_ImportantBattleScript:
	waitsfx
	special SaveMusic
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	opentext
	writetext Text_UseTackle
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_PIDGEY, Route30_JoeysRattataAttacksMovement
	opentext
	faceplayer
	writetext Text_ThisIsABigBattle
	waitbutton
	turnobject ROUTE30_YOUNGSTER1, UP
	closetext
	playsound SFX_TACKLE
	applymovement ROUTE30_PIDGEY, Route30_MikeysPidgeyAttacksMovement
	special RestoreMusic
	end

TrainerYoungsterJoey:
	generictrainer YOUNGSTER, JOEY1, EVENT_BEAT_YOUNGSTER_JOEY, YoungsterJoey1SeenText, YoungsterJoey1BeatenText

	text "I should stop"
	line "judging people by"
	cont "how they look."
	done

.Script:
	loadvar VAR_CALLERID, PHONE_YOUNGSTER_JOEY
	opentext
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
	iftruefwd .Rematch
	checkcellnum PHONE_YOUNGSTER_JOEY
	iftruefwd .NumberAccepted
	checkevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext YoungsterJoey1AfterText
	promptbutton
	setevent EVENT_JOEY_ASKED_FOR_PHONE_NUMBER
	callstd asknumber1m
	sjumpfwd .RequestNumber

.AskAgain:
	callstd asknumber2m
.RequestNumber:
	askforphonenumber PHONE_YOUNGSTER_JOEY
	ifequalfwd $1, .PhoneFull
	ifequalfwd $2, .NumberDeclined
	gettrainername YOUNGSTER, JOEY1, STRING_BUFFER_3
	callstd registerednumberm
	jumpstd numberacceptedm

.Rematch:
	callstd rematchm
	winlosstext YoungsterJoey1BeatenText, 0
	readmem wJoeyFightCount
	ifequalfwd 4, .Fight4
	ifequalfwd 3, .Fight3
	ifequalfwd 2, .Fight2
	ifequalfwd 1, .Fight1
	ifequalfwd 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftruefwd .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftruefwd .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftruefwd .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftruefwd .LoadFight1
.LoadFight0:
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 1
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 2
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 3
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	reloadmapafterbattle
	loadmem wJoeyFightCount, 4
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOEY_READY_FOR_REMATCH
	checkevent EVENT_JOEY_HP_UP
	iftruefwd .GiveHPUp
	checkevent EVENT_GOT_HP_UP_FROM_JOEY
	iftruefwd .done
	callstd rematchgiftm
	verbosegiveitem HP_UP
	iffalsefwd .PackFull
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	jumpstd numberacceptedm

.done
	end

.GiveHPUp:
	opentext
	writetext YoungsterJoeyText_GiveHPUpAfterBattle
	waitbutton
	verbosegiveitem HP_UP
	iffalsefwd .PackFull
	clearevent EVENT_JOEY_HP_UP
	setevent EVENT_GOT_HP_UP_FROM_JOEY
	jumpstd numberacceptedm

.NumberAccepted:
	jumpstd numberacceptedm

.NumberDeclined:
	jumpstd numberdeclinedm

.PhoneFull:
	jumpstd phonefullm

.PackFull:
	setevent EVENT_JOEY_HP_UP
	jumpstd packfullm

GenericTrainerLassKrise2:
	generictrainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKrisSeenText2, LassKriseBeatenText2

	text "Give your #mon"
	line "berries and see"
	cont "what they can do!"
	done

LassKrisSeenText2:
	text "Berries are really"
	line "really useful!"

	para "They're also tasty!"
	done

LassKriseBeatenText2:
	text "That left a sour"
	line "taste in my mouth!"
	done

GenericTrainerYoungsterMikey:
	generictrainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText

	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done

GenericTrainerBug_catcherDon:
	generictrainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, Bug_catcherDonSeenText, Bug_catcherDonBeatenText

	text "I ran out of #"
	line "Balls while I was"
	cont "catching #mon."

	para "I should've bought"
	line "some more…"
	done

Route30_JoeysRattataAttacksMovement:
	run_step_up
	run_step_down
	step_end

Route30_MikeysPidgeyAttacksMovement:
	run_step_down
	run_step_up
	step_end

Text_UseTackle:
	text "Go, Rattata!"

	para "Tackle!"
	done

Text_ThisIsABigBattle:
	text "What? This is a"
	line "big battle!"
	cont "Leave me alone!"
	done

YoungsterJoey1SeenText:
	text "I just lost, so"
	line "I'm trying to find"
	cont "more #mon."

	para "Wait! You look"
	line "weak! Come on,"
	cont "let's battle!"
	done

YoungsterJoey1BeatenText:
	text "Ack! I lost again!"
	line "Doggone it!"
	done

YoungsterJoey1AfterText:
	text "Do I have to have"
	line "more #mon in"

	para "order to battle"
	line "better?"

	para "No! I'm sticking"
	line "with this one no"
	cont "matter what!"
	done

YoungsterMikeySeenText:
	text "You're a #mon"
	line "trainer, right?"

	para "Then you have to"
	line "battle!"
	done

YoungsterMikeyBeatenText:
	text "That's strange."
	line "I won before."
	done

Bug_catcherDonSeenText:
	text "Instead of a bug"
	line "#mon, I found"
	cont "a trainer!"
	done

Bug_catcherDonBeatenText:
	text "Argh! You're too"
	line "strong!"
	done

Route30YoungsterText:
	text "I don't know why"
	line "there's a PC out"
	cont "here, I'm just a"
	cont "kid!"
	done

Route30CooltrainerFText:
	text "I'm not a trainer."

	para "But if you look"
	line "one in the eyes,"
	cont "prepare to battle."
	done

Route30SignText:
	text "Route 72"
	done

;	para "Cherrygrove City -"
;	line "Violet City"
;	done

MrPokemonsHouseDirectionsSignText:
	text "Mr.#mon's House"
	line "Straight Ahead!"
	done

MrPokemonsHouseSignText:
	text "Mr.#mon's House"
	done

BerryMastersHouseSignText:
	text "Berry Master's"
	line "House"
	done

Route30TrainerTipsText:
	text "Trainer Tips"

	para "No stealing other"
	line "people's #mon!"

	para "# Balls are to"
	line "be thrown only at"
	cont "wild #mon!"
	done

Route30AdvancedTipsText:
	text "Advanced Tips!"

	para "During a battle,"
	line "press Select to"
	cont "switch #mon!"

	para "Press Start to"
	line "reuse an item!"

	para "Or press B to"
	line "run away or"
	cont "forfeit!"

	para "When you're choos-"
	line "ing a move to use,"

	para "press Select to"
	line "swap it with an-"
	cont "other one, or"

	para "press Start to see"
	line "its description!"
	done

YoungsterJoeyText_GiveHPUpAfterBattle:
	text "I lost again…"
	line "Gee, you're tough!"

	para "Oh yeah, I almost"
	line "forgot that I had"
	cont "to give you this."

	para "Use it to get even"
	line "tougher, OK?"

	para "I'm going to get"
	line "tougher too."
	done

Route30PokefanMText:
	text "Sorry, but this"
	line "path is closed."
	done

Route30RivalText:
	text "Hold it."

	para "You think you're"
	line "strong enough to"
	cont "continue?"

	para "Let's test that"
	line "thought out!"
	done

Route30RivalText1:
	text "You won't get so"
	line "lucky next time!"

	para "I'm going to look"
	line "around for more"
	cont "#mon."

	para "See ya!"
	done

Route30RivalLossText:
	text "Looks like you're"
	line "not as good as"
	cont "you thought!"
	done

Route30RivalWinText:
	text "Looks like you're"
	line "as good as you"
	cont "thought…"
	done
