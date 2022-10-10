//Download dbgview to see the comments.
state("OuterWilds") {}

//1.2.6 -Reworked timer behaviour on the menu and added an option for categories using Menu Storage
//1.2.5 -Updated for the 1.1.13 version.
//1.2.4 -Updated for the 1.1.12 version. Now Works for 1.0.7, 1.1.10, 1.1.11 & 1.1.12
//1.2.3 -Reworked 100% Splits & completed Descriptions for the Stranger's Facts + WarpCore split fix + Physics rate warning
//1.2.2 -Added 100% Splits & Signals Splits + an option to reset your savefile automatically + a lot of small stuff and fixes
//1.2.1 -Added "Free Splits" for the dlc, with the possibility to split when entering/exiting the Stranger/Ring/Dream World.
//1.2.0 -Updated for the dlc, now support at least 1.0.7 & 1.1.10
//1.1.5 -Added a split for the Destroy Spacetime category & forces the timer to compare against 'Game Time'
//1.1.4 -Added an option for resetting on quit out when you haven't splitted yet
//1.1.3 -Added a split option for entering the Quantum Moon
//1.1.2 -Changed the "_firstDeath" split into 3 splits : -Loss of HP -Impact -Anglerfish
//1.1.1 -Fixed issue with the "warp core related" splits that caused them not to be activable again if you activated them once, even after starting a new expedition.
//		-The _exitWarp split is now triggered at the end of the warping animation
//1.1.0 -Added Splits and Options
//		-Too much to list
//1.0.0 Initial release

//Launched when the script first loads (so only once)
startup
{
print("__STARTUP START__");

	if(timer.CurrentTimingMethod == TimingMethod.RealTime) {
		timer.CurrentTimingMethod = TimingMethod.GameTime;
		print("Timing Method Changed!");
	}

	vars.ver = new string[] {"1.0.7", "1.1.10", "1.1.12", "1.1.13"};
	vars.name = "Outer Wilds Autosplitter 1.2.6";
	vars.debug = false;
	vars.timer = new TimerModel { CurrentState = timer };
	vars.load = false;
	vars.menu = false;
	vars.cleanValues = 1;
	vars.loop = 0;
	vars.warpCoreLoop = -1;
	vars.saveFile = "{\"loopCount\":3,\"knownFrequencies\":[true,true,false,false,false,false,false],\"knownSignals\":{\"31\":false,\"30\":false,\"32\":false,\"62\":false,\"60\":false,\"61\":false,\"23\":false,\"20\":false,\"24\":false,\"22\":false,\"21\":false,\"25\":false,\"11\":false,\"10\":false,\"14\":false,\"13\":false,\"12\":false,\"15\":false,\"16\":false,\"40\":false,\"43\":false,\"42\":false,\"49\":false,\"41\":false,\"46\":false,\"44\":false,\"48\":false,\"47\":false,\"45\":false,\"100\":false,\"101\":false},\"dictConditions\":{\"HIDE_TEMPLE_BASEMENT_ENTRIES\":true,\"LAUNCH_CODES_GIVEN\":true},\"shipLogFactSaves\":{\"S_SUNSTATION_R1\":{\"id\":\"S_SUNSTATION_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_R2\":{\"id\":\"S_SUNSTATION_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_R3\":{\"id\":\"S_SUNSTATION_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X1\":{\"id\":\"S_SUNSTATION_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X2\":{\"id\":\"S_SUNSTATION_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X3\":{\"id\":\"S_SUNSTATION_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X4\":{\"id\":\"S_SUNSTATION_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X1\":{\"id\":\"CT_CHERT_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X2\":{\"id\":\"CT_CHERT_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X3\":{\"id\":\"CT_CHERT_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X4\":{\"id\":\"CT_CHERT_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X5\":{\"id\":\"CT_CHERT_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_MOON_LOCATOR_X1\":{\"id\":\"CT_QUANTUM_MOON_LOCATOR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_MOON_LOCATOR_X2\":{\"id\":\"CT_QUANTUM_MOON_LOCATOR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_MOON_LOCATOR_X3\":{\"id\":\"CT_QUANTUM_MOON_LOCATOR_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_GRAVITY_CANNON_R1\":{\"id\":\"CT_GRAVITY_CANNON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_GRAVITY_CANNON_X1\":{\"id\":\"CT_GRAVITY_CANNON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_GRAVITY_CANNON_X2\":{\"id\":\"CT_GRAVITY_CANNON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_R1\":{\"id\":\"CT_ESCAPE_POD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_R2\":{\"id\":\"CT_ESCAPE_POD_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_X1\":{\"id\":\"CT_ESCAPE_POD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_X2\":{\"id\":\"CT_ESCAPE_POD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_R1\":{\"id\":\"CT_HIGH_ENERGY_LAB_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_R2\":{\"id\":\"CT_HIGH_ENERGY_LAB_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_R3\":{\"id\":\"CT_HIGH_ENERGY_LAB_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_X1\":{\"id\":\"CT_HIGH_ENERGY_LAB_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_X2\":{\"id\":\"CT_HIGH_ENERGY_LAB_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_X3\":{\"id\":\"CT_HIGH_ENERGY_LAB_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_R1\":{\"id\":\"CT_WARP_TOWER_MAP_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X1\":{\"id\":\"CT_WARP_TOWER_MAP_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X4\":{\"id\":\"CT_WARP_TOWER_MAP_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X3\":{\"id\":\"CT_WARP_TOWER_MAP_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X2\":{\"id\":\"CT_WARP_TOWER_MAP_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R1\":{\"id\":\"CT_SUNLESS_CITY_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R3\":{\"id\":\"CT_SUNLESS_CITY_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R4\":{\"id\":\"CT_SUNLESS_CITY_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R5\":{\"id\":\"CT_SUNLESS_CITY_R5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R2\":{\"id\":\"CT_SUNLESS_CITY_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_X1\":{\"id\":\"CT_SUNLESS_CITY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_X2\":{\"id\":\"CT_SUNLESS_CITY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_X3\":{\"id\":\"CT_SUNLESS_CITY_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R1\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R2\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R3\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R4\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_X1\":{\"id\":\"CT_ANGLERFISH_FOSSIL_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_X2\":{\"id\":\"CT_ANGLERFISH_FOSSIL_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_X3\":{\"id\":\"CT_ANGLERFISH_FOSSIL_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_CAVES_R1\":{\"id\":\"CT_QUANTUM_CAVES_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_CAVES_X1\":{\"id\":\"CT_QUANTUM_CAVES_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_CAVES_X2\":{\"id\":\"CT_QUANTUM_CAVES_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_R1\":{\"id\":\"CT_LAKEBED_CAVERN_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_R2\":{\"id\":\"CT_LAKEBED_CAVERN_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_X1\":{\"id\":\"CT_LAKEBED_CAVERN_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_X2\":{\"id\":\"CT_LAKEBED_CAVERN_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_X3\":{\"id\":\"CT_LAKEBED_CAVERN_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_WARP_TOWERS_X1\":{\"id\":\"TT_WARP_TOWERS_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_WARP_TOWERS_X2\":{\"id\":\"TT_WARP_TOWERS_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R1\":{\"id\":\"TT_TIME_LOOP_DEVICE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R2\":{\"id\":\"TT_TIME_LOOP_DEVICE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R3\":{\"id\":\"TT_TIME_LOOP_DEVICE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R4\":{\"id\":\"TT_TIME_LOOP_DEVICE_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X1\":{\"id\":\"TT_TIME_LOOP_DEVICE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X2\":{\"id\":\"TT_TIME_LOOP_DEVICE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X3\":{\"id\":\"TT_TIME_LOOP_DEVICE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X4\":{\"id\":\"TT_TIME_LOOP_DEVICE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X5\":{\"id\":\"TT_TIME_LOOP_DEVICE_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_VILLAGE_X1\":{\"id\":\"TH_VILLAGE_X1\",\"revealOrder\":0,\"read\":false,\"newlyRevealed\":true},\"TH_VILLAGE_X2\":{\"id\":\"TH_VILLAGE_X2\",\"revealOrder\":0,\"read\":false,\"newlyRevealed\":true},\"TH_VILLAGE_X3\":{\"id\":\"TH_VILLAGE_X3\",\"revealOrder\":-1,\"read\":true,\"newlyRevealed\":false},\"TH_ZERO_G_CAVE_R1\":{\"id\":\"TH_ZERO_G_CAVE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_ZERO_G_CAVE_X1\":{\"id\":\"TH_ZERO_G_CAVE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_ZERO_G_CAVE_X2\":{\"id\":\"TH_ZERO_G_CAVE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_R1\":{\"id\":\"TH_IMPACT_CRATER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_X1\":{\"id\":\"TH_IMPACT_CRATER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_X2\":{\"id\":\"TH_IMPACT_CRATER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_X3\":{\"id\":\"TH_IMPACT_CRATER_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_R1\":{\"id\":\"TH_NOMAI_MINE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_X1\":{\"id\":\"TH_NOMAI_MINE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_X2\":{\"id\":\"TH_NOMAI_MINE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_X3\":{\"id\":\"TH_NOMAI_MINE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_R1\":{\"id\":\"TH_QUANTUM_SHARD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_R2\":{\"id\":\"TH_QUANTUM_SHARD_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_X1\":{\"id\":\"TH_QUANTUM_SHARD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_X2\":{\"id\":\"TH_QUANTUM_SHARD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_RADIO_TOWER_X1\":{\"id\":\"TH_RADIO_TOWER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_ESKER_R1\":{\"id\":\"TM_ESKER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_ESKER_X1\":{\"id\":\"TM_ESKER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_NORTH_POLE_R1\":{\"id\":\"TM_NORTH_POLE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_NORTH_POLE_X1\":{\"id\":\"TM_NORTH_POLE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_R1\":{\"id\":\"TM_EYE_LOCATOR_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_R2\":{\"id\":\"TM_EYE_LOCATOR_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_X1\":{\"id\":\"TM_EYE_LOCATOR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_X2\":{\"id\":\"TM_EYE_LOCATOR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R1\":{\"id\":\"BH_RIEBECK_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R2\":{\"id\":\"BH_RIEBECK_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R3\":{\"id\":\"BH_RIEBECK_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R4\":{\"id\":\"BH_RIEBECK_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_X1\":{\"id\":\"BH_RIEBECK_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_X2\":{\"id\":\"BH_RIEBECK_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_GRAVITY_CANNON_X1\":{\"id\":\"BH_GRAVITY_CANNON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_GRAVITY_CANNON_X2\":{\"id\":\"BH_GRAVITY_CANNON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_R1\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_R2\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_X1\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_X2\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_X3\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_R1\":{\"id\":\"BH_QUANTUM_SHARD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_X1\":{\"id\":\"BH_QUANTUM_SHARD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_X2\":{\"id\":\"BH_QUANTUM_SHARD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_X3\":{\"id\":\"BH_QUANTUM_SHARD_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_RECEIVER_X1\":{\"id\":\"BH_WARP_RECEIVER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_RECEIVER_X2\":{\"id\":\"BH_WARP_RECEIVER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_ESCAPE_POD_R1\":{\"id\":\"BH_ESCAPE_POD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_ESCAPE_POD_X1\":{\"id\":\"BH_ESCAPE_POD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_ESCAPE_POD_X2\":{\"id\":\"BH_ESCAPE_POD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_R1\":{\"id\":\"BH_OLD_SETTLEMENT_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X1\":{\"id\":\"BH_OLD_SETTLEMENT_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X2\":{\"id\":\"BH_OLD_SETTLEMENT_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X3\":{\"id\":\"BH_OLD_SETTLEMENT_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X4\":{\"id\":\"BH_OLD_SETTLEMENT_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_MURAL_1_X1\":{\"id\":\"BH_MURAL_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_MURAL_2_X1\":{\"id\":\"BH_MURAL_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_MURAL_3_X1\":{\"id\":\"BH_MURAL_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_R1\":{\"id\":\"BH_HANGING_CITY_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_R2\":{\"id\":\"BH_HANGING_CITY_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X1\":{\"id\":\"BH_HANGING_CITY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X2\":{\"id\":\"BH_HANGING_CITY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X3\":{\"id\":\"BH_HANGING_CITY_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X4\":{\"id\":\"BH_HANGING_CITY_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R1\":{\"id\":\"BH_BLACK_HOLE_FORGE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R2\":{\"id\":\"BH_BLACK_HOLE_FORGE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R3\":{\"id\":\"BH_BLACK_HOLE_FORGE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R4\":{\"id\":\"BH_BLACK_HOLE_FORGE_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X4\":{\"id\":\"BH_BLACK_HOLE_FORGE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X5\":{\"id\":\"BH_BLACK_HOLE_FORGE_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X6\":{\"id\":\"BH_BLACK_HOLE_FORGE_X6\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X1\":{\"id\":\"BH_BLACK_HOLE_FORGE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X3\":{\"id\":\"BH_BLACK_HOLE_FORGE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X1\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X2\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X3\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X4\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R1\":{\"id\":\"BH_OBSERVATORY_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R2\":{\"id\":\"BH_OBSERVATORY_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R3\":{\"id\":\"BH_OBSERVATORY_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R4\":{\"id\":\"BH_OBSERVATORY_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X1\":{\"id\":\"BH_OBSERVATORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X2\":{\"id\":\"BH_OBSERVATORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X3\":{\"id\":\"BH_OBSERVATORY_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X4\":{\"id\":\"BH_OBSERVATORY_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_TORNADO_SIMULATION_R1\":{\"id\":\"BH_TORNADO_SIMULATION_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_TORNADO_SIMULATION_X1\":{\"id\":\"BH_TORNADO_SIMULATION_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_TORNADO_SIMULATION_X2\":{\"id\":\"BH_TORNADO_SIMULATION_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"VM_VOLCANO_X1\":{\"id\":\"VM_VOLCANO_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"VM_VOLCANO_X2\":{\"id\":\"VM_VOLCANO_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"VM_VOLCANO_X3\":{\"id\":\"VM_VOLCANO_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_R1\":{\"id\":\"GD_OCEAN_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_R2\":{\"id\":\"GD_OCEAN_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_R3\":{\"id\":\"GD_OCEAN_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_X1\":{\"id\":\"GD_OCEAN_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_X2\":{\"id\":\"GD_OCEAN_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_R1\":{\"id\":\"GD_GABBRO_ISLAND_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X0\":{\"id\":\"GD_GABBRO_ISLAND_X0\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X1\":{\"id\":\"GD_GABBRO_ISLAND_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X2\":{\"id\":\"GD_GABBRO_ISLAND_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X3\":{\"id\":\"GD_GABBRO_ISLAND_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_R1\":{\"id\":\"GD_CONSTRUCTION_YARD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_X1\":{\"id\":\"GD_CONSTRUCTION_YARD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_X2\":{\"id\":\"GD_CONSTRUCTION_YARD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_X3\":{\"id\":\"GD_CONSTRUCTION_YARD_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_BRAMBLE_ISLAND_X1\":{\"id\":\"GD_BRAMBLE_ISLAND_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_R1\":{\"id\":\"GD_STATUE_ISLAND_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_R2\":{\"id\":\"GD_STATUE_ISLAND_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_X1\":{\"id\":\"GD_STATUE_ISLAND_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_X2\":{\"id\":\"GD_STATUE_ISLAND_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_R1\":{\"id\":\"GD_STATUE_WORKSHOP_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_R2\":{\"id\":\"GD_STATUE_WORKSHOP_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_R3\":{\"id\":\"GD_STATUE_WORKSHOP_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_X1\":{\"id\":\"GD_STATUE_WORKSHOP_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_X2\":{\"id\":\"GD_STATUE_WORKSHOP_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_X3\":{\"id\":\"GD_STATUE_WORKSHOP_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_R1\":{\"id\":\"GD_QUANTUM_TOWER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X1\":{\"id\":\"GD_QUANTUM_TOWER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X2\":{\"id\":\"GD_QUANTUM_TOWER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X3\":{\"id\":\"GD_QUANTUM_TOWER_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X4\":{\"id\":\"GD_QUANTUM_TOWER_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R1\":{\"id\":\"ORBITAL_PROBE_CANNON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R2\":{\"id\":\"ORBITAL_PROBE_CANNON_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R4\":{\"id\":\"ORBITAL_PROBE_CANNON_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R3\":{\"id\":\"ORBITAL_PROBE_CANNON_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_X1\":{\"id\":\"ORBITAL_PROBE_CANNON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_X2\":{\"id\":\"ORBITAL_PROBE_CANNON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_X3\":{\"id\":\"ORBITAL_PROBE_CANNON_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_INTACT_MODULE_R1\":{\"id\":\"OPC_INTACT_MODULE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_INTACT_MODULE_X1\":{\"id\":\"OPC_INTACT_MODULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_INTACT_MODULE_X2\":{\"id\":\"OPC_INTACT_MODULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_R1\":{\"id\":\"OPC_BROKEN_MODULE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_R2\":{\"id\":\"OPC_BROKEN_MODULE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_R3\":{\"id\":\"OPC_BROKEN_MODULE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_X1\":{\"id\":\"OPC_BROKEN_MODULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_X2\":{\"id\":\"OPC_BROKEN_MODULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_X3\":{\"id\":\"OPC_BROKEN_MODULE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R1\":{\"id\":\"OPC_SUNKEN_MODULE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R5\":{\"id\":\"OPC_SUNKEN_MODULE_R5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R4\":{\"id\":\"OPC_SUNKEN_MODULE_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R2\":{\"id\":\"OPC_SUNKEN_MODULE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R3\":{\"id\":\"OPC_SUNKEN_MODULE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_X1\":{\"id\":\"OPC_SUNKEN_MODULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_X2\":{\"id\":\"OPC_SUNKEN_MODULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_X3\":{\"id\":\"OPC_SUNKEN_MODULE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_EYE_COORDINATES_X1\":{\"id\":\"OPC_EYE_COORDINATES_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_R1\":{\"id\":\"DB_FELDSPAR_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_R2\":{\"id\":\"DB_FELDSPAR_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_X1\":{\"id\":\"DB_FELDSPAR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_X2\":{\"id\":\"DB_FELDSPAR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_X3\":{\"id\":\"DB_FELDSPAR_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_R1\":{\"id\":\"DB_FROZEN_JELLYFISH_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_X1\":{\"id\":\"DB_FROZEN_JELLYFISH_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_X2\":{\"id\":\"DB_FROZEN_JELLYFISH_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_X3\":{\"id\":\"DB_FROZEN_JELLYFISH_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_R1\":{\"id\":\"DB_ESCAPE_POD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_X1\":{\"id\":\"DB_ESCAPE_POD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_X2\":{\"id\":\"DB_ESCAPE_POD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_X3\":{\"id\":\"DB_ESCAPE_POD_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_R1\":{\"id\":\"DB_NOMAI_GRAVE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_R2\":{\"id\":\"DB_NOMAI_GRAVE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X1\":{\"id\":\"DB_NOMAI_GRAVE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X2\":{\"id\":\"DB_NOMAI_GRAVE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X3\":{\"id\":\"DB_NOMAI_GRAVE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X4\":{\"id\":\"DB_NOMAI_GRAVE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R1\":{\"id\":\"DB_VESSEL_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R2\":{\"id\":\"DB_VESSEL_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R3\":{\"id\":\"DB_VESSEL_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R4\":{\"id\":\"DB_VESSEL_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X1\":{\"id\":\"DB_VESSEL_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X2\":{\"id\":\"DB_VESSEL_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X3\":{\"id\":\"DB_VESSEL_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X4\":{\"id\":\"DB_VESSEL_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X5\":{\"id\":\"DB_VESSEL_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X6\":{\"id\":\"DB_VESSEL_X6\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R1\":{\"id\":\"WHS_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R2\":{\"id\":\"WHS_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R3\":{\"id\":\"WHS_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R4\":{\"id\":\"WHS_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X4\":{\"id\":\"WHS_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X1\":{\"id\":\"WHS_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X2\":{\"id\":\"WHS_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X3\":{\"id\":\"WHS_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X1\":{\"id\":\"COMET_SHUTTLE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X2\":{\"id\":\"COMET_SHUTTLE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X3\":{\"id\":\"COMET_SHUTTLE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X4\":{\"id\":\"COMET_SHUTTLE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_R1\":{\"id\":\"COMET_INTERIOR_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_R2\":{\"id\":\"COMET_INTERIOR_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X1\":{\"id\":\"COMET_INTERIOR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X2\":{\"id\":\"COMET_INTERIOR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X3\":{\"id\":\"COMET_INTERIOR_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X4\":{\"id\":\"COMET_INTERIOR_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R1\":{\"id\":\"QUANTUM_MOON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R2\":{\"id\":\"QUANTUM_MOON_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R3\":{\"id\":\"QUANTUM_MOON_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R4\":{\"id\":\"QUANTUM_MOON_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_X1\":{\"id\":\"QUANTUM_MOON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_X2\":{\"id\":\"QUANTUM_MOON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHUTTLE_X1\":{\"id\":\"QM_SHUTTLE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHUTTLE_X2\":{\"id\":\"QM_SHUTTLE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_R1\":{\"id\":\"QM_SHRINE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X1\":{\"id\":\"QM_SHRINE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X2\":{\"id\":\"QM_SHRINE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X3\":{\"id\":\"QM_SHRINE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X4\":{\"id\":\"QM_SHRINE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_R1\":{\"id\":\"QM_SIXTH_LOCATION_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_R2\":{\"id\":\"QM_SIXTH_LOCATION_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_R3\":{\"id\":\"QM_SIXTH_LOCATION_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X1\":{\"id\":\"QM_SIXTH_LOCATION_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X3\":{\"id\":\"QM_SIXTH_LOCATION_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X5\":{\"id\":\"QM_SIXTH_LOCATION_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X4\":{\"id\":\"QM_SIXTH_LOCATION_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X2\":{\"id\":\"QM_SIXTH_LOCATION_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X6\":{\"id\":\"QM_SIXTH_LOCATION_X6\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_RING_WORLD_X1\":{\"id\":\"IP_RING_WORLD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_X1\":{\"id\":\"IP_ZONE_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_X2\":{\"id\":\"IP_ZONE_1_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_STORY_X1\":{\"id\":\"IP_ZONE_1_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_STORY_X2\":{\"id\":\"IP_ZONE_1_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_SECRET_R1\":{\"id\":\"IP_ZONE_1_SECRET_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_SECRET_X2\":{\"id\":\"IP_ZONE_1_SECRET_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_SECRET_X1\":{\"id\":\"IP_ZONE_1_SECRET_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_X1\":{\"id\":\"IP_ZONE_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_X2\":{\"id\":\"IP_ZONE_2_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_STORY_X1\":{\"id\":\"IP_ZONE_2_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_STORY_X2\":{\"id\":\"IP_ZONE_2_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_SECRET_R1\":{\"id\":\"IP_ZONE_2_SECRET_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_SECRET_X2\":{\"id\":\"IP_ZONE_2_SECRET_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_SECRET_X1\":{\"id\":\"IP_ZONE_2_SECRET_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_LIGHTHOUSE_R1\":{\"id\":\"IP_ZONE_2_LIGHTHOUSE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_LIGHTHOUSE_X2\":{\"id\":\"IP_ZONE_2_LIGHTHOUSE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_LIGHTHOUSE_X1\":{\"id\":\"IP_ZONE_2_LIGHTHOUSE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_R1\":{\"id\":\"IP_ZONE_2_CODE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_X1\":{\"id\":\"IP_ZONE_2_CODE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_X2\":{\"id\":\"IP_ZONE_2_CODE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_X3\":{\"id\":\"IP_ZONE_2_CODE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_X1\":{\"id\":\"IP_ZONE_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_STORY_X1\":{\"id\":\"IP_ZONE_3_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_STORY_X2\":{\"id\":\"IP_ZONE_3_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_SECRET_R1\":{\"id\":\"IP_ZONE_3_SECRET_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_SECRET_X2\":{\"id\":\"IP_ZONE_3_SECRET_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_SECRET_X1\":{\"id\":\"IP_ZONE_3_SECRET_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_R1\":{\"id\":\"IP_ZONE_3_ENTRANCE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_X1\":{\"id\":\"IP_ZONE_3_ENTRANCE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_X2\":{\"id\":\"IP_ZONE_3_ENTRANCE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_X3\":{\"id\":\"IP_ZONE_3_ENTRANCE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_R1\":{\"id\":\"IP_ZONE_3_LAB_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X1\":{\"id\":\"IP_ZONE_3_LAB_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X3\":{\"id\":\"IP_ZONE_3_LAB_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X4\":{\"id\":\"IP_ZONE_3_LAB_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X2\":{\"id\":\"IP_ZONE_3_LAB_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_MAP_PROJECTION_1_X1\":{\"id\":\"IP_MAP_PROJECTION_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_MAP_PROJECTION_2_X1\":{\"id\":\"IP_MAP_PROJECTION_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_MAP_PROJECTION_3_X1\":{\"id\":\"IP_MAP_PROJECTION_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_X2\":{\"id\":\"IP_ZONE_4_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_X3\":{\"id\":\"IP_ZONE_4_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_X4\":{\"id\":\"IP_ZONE_4_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_STORY_X1\":{\"id\":\"IP_ZONE_4_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_STORY_X2\":{\"id\":\"IP_ZONE_4_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_R1\":{\"id\":\"IP_PRISON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_R2\":{\"id\":\"IP_PRISON_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_X1\":{\"id\":\"IP_PRISON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_X2\":{\"id\":\"IP_PRISON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_R1\":{\"id\":\"IP_DREAM_LAKE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_R2\":{\"id\":\"IP_DREAM_LAKE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_X1\":{\"id\":\"IP_DREAM_LAKE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_X2\":{\"id\":\"IP_DREAM_LAKE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R4\":{\"id\":\"IP_SARCOPHAGUS_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R1\":{\"id\":\"IP_SARCOPHAGUS_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R2\":{\"id\":\"IP_SARCOPHAGUS_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R3\":{\"id\":\"IP_SARCOPHAGUS_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_X2\":{\"id\":\"IP_SARCOPHAGUS_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_X3\":{\"id\":\"IP_SARCOPHAGUS_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_X4\":{\"id\":\"IP_SARCOPHAGUS_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_R1\":{\"id\":\"IP_DREAM_ZONE_1_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_X1\":{\"id\":\"IP_DREAM_ZONE_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_X2\":{\"id\":\"IP_DREAM_ZONE_1_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_X3\":{\"id\":\"IP_DREAM_ZONE_1_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_1_R1\":{\"id\":\"IP_DREAM_LIBRARY_1_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_1_X1\":{\"id\":\"IP_DREAM_LIBRARY_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_1_X2\":{\"id\":\"IP_DREAM_LIBRARY_1_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_1_STORY_X1\":{\"id\":\"IP_DREAM_1_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_1_STORY_X2\":{\"id\":\"IP_DREAM_1_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_1_RULE_X1\":{\"id\":\"IP_DREAM_1_RULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_R1\":{\"id\":\"IP_DREAM_ZONE_2_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X1\":{\"id\":\"IP_DREAM_ZONE_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X2\":{\"id\":\"IP_DREAM_ZONE_2_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X3\":{\"id\":\"IP_DREAM_ZONE_2_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_2_R1\":{\"id\":\"IP_DREAM_LIBRARY_2_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_2_X1\":{\"id\":\"IP_DREAM_LIBRARY_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_2_X2\":{\"id\":\"IP_DREAM_LIBRARY_2_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_STORY_X1\":{\"id\":\"IP_DREAM_2_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_STORY_X2\":{\"id\":\"IP_DREAM_2_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_RULE_X1\":{\"id\":\"IP_DREAM_2_RULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_RULE_X2\":{\"id\":\"IP_DREAM_2_RULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_3_R1\":{\"id\":\"IP_DREAM_ZONE_3_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_3_X1\":{\"id\":\"IP_DREAM_ZONE_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_3_X2\":{\"id\":\"IP_DREAM_ZONE_3_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_3_R1\":{\"id\":\"IP_DREAM_LIBRARY_3_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_3_X1\":{\"id\":\"IP_DREAM_LIBRARY_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_3_X2\":{\"id\":\"IP_DREAM_LIBRARY_3_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_3_STORY_X1\":{\"id\":\"IP_DREAM_3_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_3_STORY_X2\":{\"id\":\"IP_DREAM_3_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_3_RULE_X1\":{\"id\":\"IP_DREAM_3_RULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X4\":{\"id\":\"IP_DREAM_ZONE_2_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false}},\"newlyRevealedFactIDs\":[\"TH_VILLAGE_X1\",\"TH_VILLAGE_X2\"],\"lastDeathType\":0,\"burnedMarshmallowEaten\":0,\"fullTimeloops\":0,\"perfectMarshmallowsEaten\":0,\"warpedToTheEye\":false,\"secondsRemainingOnWarp\":0.0,\"loopCountOnParadox\":0,\"shownPopups\":0,\"version\":\"1.1.12.125\"}";
	vars.frame = (float)1/60;
	vars.debugLoop = 0;
	vars.currDlcSplit = 0;
	vars.numDlcSplits = 0;
	vars.Save = "";
	vars.writeTime = "";

	vars.splits = new Dictionary<string, bool>
    {
        { "_deathImpact", false },
		{ "_deathHP", false },
		{ "_deathFish", false },
        { "_sleep", false },
		{ "_wearSuit", false },
		{ "_firstWarp", false },
		{ "_warpCore", false },
		{ "_exitWarp", false },
		{ "_dBramble", false },
		{ "_dBrambleVessel", false },
		{ "_qMoonIn", false }
	};
	vars.signals = new Dictionary<string, int>
    {
        { "EscapePod1 - Brittle Hollow", 7 },
		{ "EscapePod2 - Ember Twin", 10 },
		{ "EscapePod3 - Dark Bramble", 12 },
		{ "Hide&Seek - Galena", 16 },
		{ "Hide&Seek - Tephra", 18 },
		{ "QuantumShard - Brittle Hollow", 20 },
		{ "QuantumShard - Ember Twin", 22 },
		{ "QuantumShard - Giant's Deep", 24 },
		{ "QuantumShard - Timber Hearth Grove", 26 },
		{ "QuantumShard - Timber Hearth Museum", 28 },
		{ "Quantum Moon", 30 },
		{ "Chert", 32 },
		{ "Esker", 34 },
		{ "Feldspar", 36 },
		{ "Gabbro", 38 },
		{ "Riebeck", 40 },
		{ "Nomai", 42 },
		{ "Prisoner", 44 },
		{ "Radio Tower", 66 },
		{ "Satellite", 67 }
	};
	vars.facts = new Dictionary<int, string[]>
	{
		{ 0, new string[] { "S_SUNSTATION_R1", "Other", "" } },
		{ 12, new string[] { "S_SUNSTATION_R2", "Other", "" } },
		{ 24, new string[] { "S_SUNSTATION_R3", "Other", "" } },
		{ 36, new string[] { "S_SUNSTATION_X1", "Other", "" } },
		{ 48, new string[] { "S_SUNSTATION_X2", "Other", "" } },
		{ 60, new string[] { "S_SUNSTATION_X3", "Other", "" } },
		{ 72, new string[] { "S_SUNSTATION_X4", "Other", "" } },
		{ 84, new string[] { "CT_CHERT_X1", "Other", "" } },
		{ 96, new string[] { "CT_CHERT_X2", "Other", "" } },
		{ 108, new string[] { "CT_CHERT_X3", "Other", "" } },
		{ 120, new string[] { "CT_CHERT_X4", "Other", "" } },
		{ 132, new string[] { "CT_CHERT_X5", "Other", "" } },
		{ 144, new string[] { "CT_QUANTUM_MOON_LOCATOR_X1", "Other", "" } },
		{ 156, new string[] { "CT_QUANTUM_MOON_LOCATOR_X2", "Other", "" } },
		{ 168, new string[] { "CT_QUANTUM_MOON_LOCATOR_X3", "Other", "" } },
		{ 180, new string[] { "CT_GRAVITY_CANNON_R1", "Other", "" } },
		{ 192, new string[] { "CT_GRAVITY_CANNON_X1", "Other", "" } },
		{ 204, new string[] { "CT_GRAVITY_CANNON_X2", "Other", "" } },
		{ 216, new string[] { "CT_ESCAPE_POD_R1", "Other", "" } },
		{ 228, new string[] { "CT_ESCAPE_POD_R2", "Other", "" } },
		{ 240, new string[] { "CT_ESCAPE_POD_X1", "Other", "" } },
		{ 252, new string[] { "CT_ESCAPE_POD_X2", "Other", "" } },
		{ 264, new string[] { "CT_HIGH_ENERGY_LAB_R1", "Other", "" } },
		{ 276, new string[] { "CT_HIGH_ENERGY_LAB_R2", "Other", "" } },
		{ 288, new string[] { "CT_HIGH_ENERGY_LAB_R3", "Other", "" } },
		{ 300, new string[] { "CT_HIGH_ENERGY_LAB_X1", "Other", "" } },
		{ 312, new string[] { "CT_HIGH_ENERGY_LAB_X2", "Other", "" } },
		{ 324, new string[] { "CT_HIGH_ENERGY_LAB_X3", "Other", "" } },
		{ 336, new string[] { "CT_WARP_TOWER_MAP_R1", "Other", "" } },
		{ 348, new string[] { "CT_WARP_TOWER_MAP_X1", "Other", "" } },
		{ 384, new string[] { "CT_WARP_TOWER_MAP_X2", "Other", "" } },
		{ 372, new string[] { "CT_WARP_TOWER_MAP_X3", "Other", "" } },
		{ 360, new string[] { "CT_WARP_TOWER_MAP_X4", "Other", "" } },
		{ 396, new string[] { "CT_SUNLESS_CITY_R1", "Other", "" } },
		{ 444, new string[] { "CT_SUNLESS_CITY_R2", "Other", "" } },
		{ 408, new string[] { "CT_SUNLESS_CITY_R3", "Other", "" } },
		{ 420, new string[] { "CT_SUNLESS_CITY_R4", "Other", "" } },
		{ 432, new string[] { "CT_SUNLESS_CITY_R5", "Other", "" } },
		{ 456, new string[] { "CT_SUNLESS_CITY_X1", "Other", "" } },
		{ 468, new string[] { "CT_SUNLESS_CITY_X2", "Other", "" } },
		{ 480, new string[] { "CT_SUNLESS_CITY_X3", "Other", "" } },
		{ 492, new string[] { "CT_ANGLERFISH_FOSSIL_R1", "Other", "" } },
		{ 504, new string[] { "CT_ANGLERFISH_FOSSIL_R2", "Other", "" } },
		{ 516, new string[] { "CT_ANGLERFISH_FOSSIL_R3", "Other", "" } },
		{ 528, new string[] { "CT_ANGLERFISH_FOSSIL_R4", "Other", "" } },
		{ 540, new string[] { "CT_ANGLERFISH_FOSSIL_X1", "Other", "" } },
		{ 552, new string[] { "CT_ANGLERFISH_FOSSIL_X2", "Other", "" } },
		{ 564, new string[] { "CT_ANGLERFISH_FOSSIL_X3", "Other", "" } },
		{ 576, new string[] { "CT_QUANTUM_CAVES_R1", "Other", "" } },
		{ 588, new string[] { "CT_QUANTUM_CAVES_X1", "Other", "" } },
		{ 600, new string[] { "CT_QUANTUM_CAVES_X2", "Other", "" } },
		{ 612, new string[] { "CT_LAKEBED_CAVERN_R1", "Other", "" } },
		{ 624, new string[] { "CT_LAKEBED_CAVERN_R2", "Other", "" } },
		{ 636, new string[] { "CT_LAKEBED_CAVERN_X1", "Other", "" } },
		{ 648, new string[] { "CT_LAKEBED_CAVERN_X2", "Other", "" } },
		{ 660, new string[] { "CT_LAKEBED_CAVERN_X3", "Other", "" } },
		{ 672, new string[] { "TT_WARP_TOWERS_X1", "Other", "" } },
		{ 684, new string[] { "TT_WARP_TOWERS_X2", "Other", "" } },
		{ 696, new string[] { "TT_TIME_LOOP_DEVICE_R1", "Other", "" } },
		{ 708, new string[] { "TT_TIME_LOOP_DEVICE_R2", "Other", "" } },
		{ 720, new string[] { "TT_TIME_LOOP_DEVICE_R3", "Other", "" } },
		{ 732, new string[] { "TT_TIME_LOOP_DEVICE_R4", "Other", "" } },
		{ 744, new string[] { "TT_TIME_LOOP_DEVICE_X1", "Other", "" } },
		{ 756, new string[] { "TT_TIME_LOOP_DEVICE_X2", "Other", "" } },
		{ 768, new string[] { "TT_TIME_LOOP_DEVICE_X3", "Other", "" } },
		{ 780, new string[] { "TT_TIME_LOOP_DEVICE_X4", "Other", "" } },
		{ 792, new string[] { "TT_TIME_LOOP_DEVICE_X5", "Other", "" } },
		{ 804, new string[] { "TH_VILLAGE_X1", "Other", "" } },
		{ 816, new string[] { "TH_VILLAGE_X2", "Other", "" } },
		{ 828, new string[] { "TH_VILLAGE_X3", "Other", "" } },
		{ 840, new string[] { "TH_ZERO_G_CAVE_R1", "Other", "" } },
		{ 852, new string[] { "TH_ZERO_G_CAVE_X1", "Other", "" } },
		{ 864, new string[] { "TH_ZERO_G_CAVE_X2", "Other", "" } },
		{ 876, new string[] { "TH_IMPACT_CRATER_R1", "Other", "" } },
		{ 888, new string[] { "TH_IMPACT_CRATER_X1", "Other", "" } },
		{ 900, new string[] { "TH_IMPACT_CRATER_X2", "Other", "" } },
		{ 912, new string[] { "TH_IMPACT_CRATER_X3", "Other", "" } },
		{ 924, new string[] { "TH_NOMAI_MINE_R1", "Other", "" } },
		{ 936, new string[] { "TH_NOMAI_MINE_X1", "Other", "" } },
		{ 948, new string[] { "TH_NOMAI_MINE_X2", "Other", "" } },
		{ 960, new string[] { "TH_NOMAI_MINE_X3", "Other", "" } },
		{ 972, new string[] { "TH_QUANTUM_SHARD_R1", "Other", "" } },
		{ 984, new string[] { "TH_QUANTUM_SHARD_R2", "Other", "" } },
		{ 996, new string[] { "TH_QUANTUM_SHARD_X1", "Other", "" } },
		{ 1008, new string[] { "TH_QUANTUM_SHARD_X2", "Other", "" } },
		{ 1020, new string[] { "TH_RADIO_TOWER_X1", "Other", "" } },
		{ 1032, new string[] { "TM_ESKER_R1", "Other", "" } },
		{ 1044, new string[] { "TM_ESKER_X1", "Other", "" } },
		{ 1056, new string[] { "TM_NORTH_POLE_R1", "Other", "" } },
		{ 1068, new string[] { "TM_NORTH_POLE_X1", "Other", "" } },
		{ 1080, new string[] { "TM_EYE_LOCATOR_R1", "Other", "" } },
		{ 1092, new string[] { "TM_EYE_LOCATOR_R2", "Other", "" } },
		{ 1104, new string[] { "TM_EYE_LOCATOR_X1", "Other", "" } },
		{ 1116, new string[] { "TM_EYE_LOCATOR_X2", "Other", "" } },
		{ 1128, new string[] { "BH_RIEBECK_R1", "Other", "" } },
		{ 1140, new string[] { "BH_RIEBECK_R2", "Other", "" } },
		{ 1152, new string[] { "BH_RIEBECK_R3", "Other", "" } },
		{ 1164, new string[] { "BH_RIEBECK_R4", "Other", "" } },
		{ 1176, new string[] { "BH_RIEBECK_X1", "Other", "" } },
		{ 1188, new string[] { "BH_RIEBECK_X2", "Other", "" } },
		{ 1200, new string[] { "BH_GRAVITY_CANNON_X1", "Other", "" } },
		{ 1212, new string[] { "BH_GRAVITY_CANNON_X2", "Other", "" } },
		{ 1224, new string[] { "BH_QUANTUM_RESEARCH_TOWER_R1", "Other", "" } },
		{ 1236, new string[] { "BH_QUANTUM_RESEARCH_TOWER_R2", "Other", "" } },
		{ 1248, new string[] { "BH_QUANTUM_RESEARCH_TOWER_X1", "Other", "" } },
		{ 1260, new string[] { "BH_QUANTUM_RESEARCH_TOWER_X2", "Other", "" } },
		{ 1272, new string[] { "BH_QUANTUM_RESEARCH_TOWER_X3", "Other", "" } },
		{ 1284, new string[] { "BH_QUANTUM_SHARD_R1", "Other", "" } },
		{ 1296, new string[] { "BH_QUANTUM_SHARD_X1", "Other", "" } },
		{ 1308, new string[] { "BH_QUANTUM_SHARD_X2", "Other", "" } },
		{ 1320, new string[] { "BH_QUANTUM_SHARD_X3", "Other", "" } },
		{ 1332, new string[] { "BH_WARP_RECEIVER_X1", "Other", "" } },
		{ 1344, new string[] { "BH_WARP_RECEIVER_X2", "Other", "" } },
		{ 1356, new string[] { "BH_ESCAPE_POD_R1", "Other", "" } },
		{ 1368, new string[] { "BH_ESCAPE_POD_X1", "Other", "" } },
		{ 1380, new string[] { "BH_ESCAPE_POD_X2", "Other", "" } },
		{ 1392, new string[] { "BH_OLD_SETTLEMENT_R1", "Other", "" } },
		{ 1404, new string[] { "BH_OLD_SETTLEMENT_X1", "Other", "" } },
		{ 1416, new string[] { "BH_OLD_SETTLEMENT_X2", "Other", "" } },
		{ 1428, new string[] { "BH_OLD_SETTLEMENT_X3", "Other", "" } },
		{ 1440, new string[] { "BH_OLD_SETTLEMENT_X4", "Other", "" } },
		{ 1452, new string[] { "BH_MURAL_1_X1", "Other", "" } },
		{ 1464, new string[] { "BH_MURAL_2_X1", "Other", "" } },
		{ 1476, new string[] { "BH_MURAL_3_X1", "Other", "" } },
		{ 1488, new string[] { "BH_HANGING_CITY_R1", "Other", "" } },
		{ 1500, new string[] { "BH_HANGING_CITY_R2", "Other", "" } },
		{ 1512, new string[] { "BH_HANGING_CITY_X1", "Other", "" } },
		{ 1524, new string[] { "BH_HANGING_CITY_X2", "Other", "" } },
		{ 1536, new string[] { "BH_HANGING_CITY_X3", "Other", "" } },
		{ 1548, new string[] { "BH_HANGING_CITY_X4", "Other", "" } },
		{ 1560, new string[] { "BH_BLACK_HOLE_FORGE_R1", "Other", "" } },
		{ 1572, new string[] { "BH_BLACK_HOLE_FORGE_R2", "Other", "" } },
		{ 1584, new string[] { "BH_BLACK_HOLE_FORGE_R3", "Other", "" } },
		{ 1596, new string[] { "BH_BLACK_HOLE_FORGE_R4", "Other", "" } },
		{ 1644, new string[] { "BH_BLACK_HOLE_FORGE_X1", "Other", "" } },
		{ 1656, new string[] { "BH_BLACK_HOLE_FORGE_X3", "Other", "" } },
		{ 1608, new string[] { "BH_BLACK_HOLE_FORGE_X4", "Other", "" } },
		{ 1620, new string[] { "BH_BLACK_HOLE_FORGE_X5", "Other", "" } },
		{ 1632, new string[] { "BH_BLACK_HOLE_FORGE_X6", "Other", "" } },
		{ 1668, new string[] { "BH_WARP_ALIGNMENT_MAP_X1", "Other", "" } },
		{ 1680, new string[] { "BH_WARP_ALIGNMENT_MAP_X2", "Other", "" } },
		{ 1692, new string[] { "BH_WARP_ALIGNMENT_MAP_X3", "Other", "" } },
		{ 1704, new string[] { "BH_WARP_ALIGNMENT_MAP_X4", "Other", "" } },
		{ 1716, new string[] { "BH_OBSERVATORY_R1", "Other", "" } },
		{ 1728, new string[] { "BH_OBSERVATORY_R2", "Other", "" } },
		{ 1740, new string[] { "BH_OBSERVATORY_R3", "Other", "" } },
		{ 1752, new string[] { "BH_OBSERVATORY_R4", "Other", "" } },
		{ 1764, new string[] { "BH_OBSERVATORY_X1", "Other", "" } },
		{ 1776, new string[] { "BH_OBSERVATORY_X2", "Other", "" } },
		{ 1788, new string[] { "BH_OBSERVATORY_X3", "Other", "" } },
		{ 1800, new string[] { "BH_OBSERVATORY_X4", "Other", "" } },
		{ 1812, new string[] { "BH_TORNADO_SIMULATION_R1", "Other", "" } },
		{ 1824, new string[] { "BH_TORNADO_SIMULATION_X1", "Other", "" } },
		{ 1836, new string[] { "BH_TORNADO_SIMULATION_X2", "Other", "" } },
		{ 1848, new string[] { "VM_VOLCANO_X1", "Other", "" } },
		{ 1860, new string[] { "VM_VOLCANO_X2", "Other", "" } },
		{ 1872, new string[] { "VM_VOLCANO_X3", "Other", "" } },
		{ 1884, new string[] { "GD_OCEAN_R1", "Other", "" } },
		{ 1896, new string[] { "GD_OCEAN_R2", "Other", "" } },
		{ 1908, new string[] { "GD_OCEAN_R3", "Other", "" } },
		{ 1920, new string[] { "GD_OCEAN_X1", "Other", "" } },
		{ 1932, new string[] { "GD_OCEAN_X2", "Other", "" } },
		{ 1944, new string[] { "GD_GABBRO_ISLAND_R1", "Other", "" } },
		{ 1956, new string[] { "GD_GABBRO_ISLAND_X0", "Other", "" } },
		{ 1968, new string[] { "GD_GABBRO_ISLAND_X1", "Other", "" } },
		{ 1980, new string[] { "GD_GABBRO_ISLAND_X2", "Other", "" } },
		{ 1992, new string[] { "GD_GABBRO_ISLAND_X3", "Other", "" } },
		{ 2004, new string[] { "GD_CONSTRUCTION_YARD_R1", "Other", "" } },
		{ 2016, new string[] { "GD_CONSTRUCTION_YARD_X1", "Other", "" } },
		{ 2028, new string[] { "GD_CONSTRUCTION_YARD_X2", "Other", "" } },
		{ 2040, new string[] { "GD_CONSTRUCTION_YARD_X3", "Other", "" } },
		{ 2052, new string[] { "GD_BRAMBLE_ISLAND_X1", "Other", "" } },
		{ 2064, new string[] { "GD_STATUE_ISLAND_R1", "Other", "" } },
		{ 2076, new string[] { "GD_STATUE_ISLAND_R2", "Other", "" } },
		{ 2088, new string[] { "GD_STATUE_ISLAND_X1", "Other", "" } },
		{ 2100, new string[] { "GD_STATUE_ISLAND_X2", "Other", "" } },
		{ 2112, new string[] { "GD_STATUE_WORKSHOP_R1", "Other", "" } },
		{ 2124, new string[] { "GD_STATUE_WORKSHOP_R2", "Other", "" } },
		{ 2136, new string[] { "GD_STATUE_WORKSHOP_R3", "Other", "" } },
		{ 2148, new string[] { "GD_STATUE_WORKSHOP_X1", "Other", "" } },
		{ 2160, new string[] { "GD_STATUE_WORKSHOP_X2", "Other", "" } },
		{ 2172, new string[] { "GD_STATUE_WORKSHOP_X3", "Other", "" } },
		{ 2184, new string[] { "GD_QUANTUM_TOWER_R1", "Other", "" } },
		{ 2196, new string[] { "GD_QUANTUM_TOWER_X1", "Other", "" } },
		{ 2208, new string[] { "GD_QUANTUM_TOWER_X2", "Other", "" } },
		{ 2220, new string[] { "GD_QUANTUM_TOWER_X3", "Other", "" } },
		{ 2232, new string[] { "GD_QUANTUM_TOWER_X4", "Other", "" } },
		{ 2244, new string[] { "ORBITAL_PROBE_CANNON_R1", "Other", "" } },
		{ 2256, new string[] { "ORBITAL_PROBE_CANNON_R2", "Other", "" } },
		{ 2280, new string[] { "ORBITAL_PROBE_CANNON_R3", "Other", "" } },
		{ 2268, new string[] { "ORBITAL_PROBE_CANNON_R4", "Other", "" } },
		{ 2292, new string[] { "ORBITAL_PROBE_CANNON_X1", "Other", "" } },
		{ 2304, new string[] { "ORBITAL_PROBE_CANNON_X2", "Other", "" } },
		{ 2316, new string[] { "ORBITAL_PROBE_CANNON_X3", "Other", "" } },
		{ 2328, new string[] { "OPC_INTACT_MODULE_R1", "Other", "" } },
		{ 2340, new string[] { "OPC_INTACT_MODULE_X1", "Other", "" } },
		{ 2352, new string[] { "OPC_INTACT_MODULE_X2", "Other", "" } },
		{ 2364, new string[] { "OPC_BROKEN_MODULE_R1", "Other", "" } },
		{ 2376, new string[] { "OPC_BROKEN_MODULE_R2", "Other", "" } },
		{ 2388, new string[] { "OPC_BROKEN_MODULE_R3", "Other", "" } },
		{ 2400, new string[] { "OPC_BROKEN_MODULE_X1", "Other", "" } },
		{ 2412, new string[] { "OPC_BROKEN_MODULE_X2", "Other", "" } },
		{ 2424, new string[] { "OPC_BROKEN_MODULE_X3", "Other", "" } },
		{ 2436, new string[] { "OPC_SUNKEN_MODULE_R1", "Other", "" } },
		{ 2472, new string[] { "OPC_SUNKEN_MODULE_R2", "Other", "" } },
		{ 2484, new string[] { "OPC_SUNKEN_MODULE_R3", "Other", "" } },
		{ 2460, new string[] { "OPC_SUNKEN_MODULE_R4", "Other", "" } },
		{ 2448, new string[] { "OPC_SUNKEN_MODULE_R5", "Other", "" } },
		{ 2496, new string[] { "OPC_SUNKEN_MODULE_X1", "Other", "" } },
		{ 2508, new string[] { "OPC_SUNKEN_MODULE_X2", "Other", "" } },
		{ 2520, new string[] { "OPC_SUNKEN_MODULE_X3", "Other", "" } },
		{ 2532, new string[] { "OPC_EYE_COORDINATES_X1", "Other", "" } },
		{ 2544, new string[] { "DB_FELDSPAR_R1", "Other", "" } },
		{ 2556, new string[] { "DB_FELDSPAR_R2", "Other", "" } },
		{ 2568, new string[] { "DB_FELDSPAR_X1", "Other", "" } },
		{ 2580, new string[] { "DB_FELDSPAR_X2", "Other", "" } },
		{ 2592, new string[] { "DB_FELDSPAR_X3", "Other", "" } },
		{ 2604, new string[] { "DB_FROZEN_JELLYFISH_R1", "Other", "" } },
		{ 2616, new string[] { "DB_FROZEN_JELLYFISH_X1", "Other", "" } },
		{ 2628, new string[] { "DB_FROZEN_JELLYFISH_X2", "Other", "" } },
		{ 2640, new string[] { "DB_FROZEN_JELLYFISH_X3", "Other", "" } },
		{ 2652, new string[] { "DB_ESCAPE_POD_R1", "Other", "" } },
		{ 2664, new string[] { "DB_ESCAPE_POD_X1", "Other", "" } },
		{ 2676, new string[] { "DB_ESCAPE_POD_X2", "Other", "" } },
		{ 2688, new string[] { "DB_ESCAPE_POD_X3", "Other", "" } },
		{ 2700, new string[] { "DB_NOMAI_GRAVE_R1", "Other", "" } },
		{ 2712, new string[] { "DB_NOMAI_GRAVE_R2", "Other", "" } },
		{ 2724, new string[] { "DB_NOMAI_GRAVE_X1", "Other", "" } },
		{ 2736, new string[] { "DB_NOMAI_GRAVE_X2", "Other", "" } },
		{ 2748, new string[] { "DB_NOMAI_GRAVE_X3", "Other", "" } },
		{ 2760, new string[] { "DB_NOMAI_GRAVE_X4", "Other", "" } },
		{ 2772, new string[] { "DB_VESSEL_R1", "Other", "" } },
		{ 2784, new string[] { "DB_VESSEL_R2", "Other", "" } },
		{ 2796, new string[] { "DB_VESSEL_R3", "Other", "" } },
		{ 2808, new string[] { "DB_VESSEL_R4", "Other", "" } },
		{ 2820, new string[] { "DB_VESSEL_X1", "Other", "" } },
		{ 2832, new string[] { "DB_VESSEL_X2", "Other", "" } },
		{ 2844, new string[] { "DB_VESSEL_X3", "Other", "" } },
		{ 2856, new string[] { "DB_VESSEL_X4", "Other", "" } },
		{ 2868, new string[] { "DB_VESSEL_X5", "Other", "" } },
		{ 2880, new string[] { "DB_VESSEL_X6", "Other", "" } },
		{ 2892, new string[] { "WHS_R1", "Other", "" } },
		{ 2904, new string[] { "WHS_R2", "Other", "" } },
		{ 2916, new string[] { "WHS_R3", "Other", "" } },
		{ 2928, new string[] { "WHS_R4", "Other", "" } },
		{ 2952, new string[] { "WHS_X1", "Other", "" } },
		{ 2964, new string[] { "WHS_X2", "Other", "" } },
		{ 2976, new string[] { "WHS_X3", "Other", "" } },
		{ 2940, new string[] { "WHS_X4", "Other", "" } },
		{ 2988, new string[] { "COMET_SHUTTLE_X1", "Other", "" } },
		{ 3000, new string[] { "COMET_SHUTTLE_X2", "Other", "" } },
		{ 3012, new string[] { "COMET_SHUTTLE_X3", "Other", "" } },
		{ 3024, new string[] { "COMET_SHUTTLE_X4", "Other", "" } },
		{ 3036, new string[] { "COMET_INTERIOR_R1", "Other", "" } },
		{ 3048, new string[] { "COMET_INTERIOR_R2", "Other", "" } },
		{ 3060, new string[] { "COMET_INTERIOR_X1", "Other", "" } },
		{ 3072, new string[] { "COMET_INTERIOR_X2", "Other", "" } },
		{ 3084, new string[] { "COMET_INTERIOR_X3", "Other", "" } },
		{ 3096, new string[] { "COMET_INTERIOR_X4", "Other", "" } },
		{ 3108, new string[] { "QUANTUM_MOON_R1", "Other", "" } },
		{ 3120, new string[] { "QUANTUM_MOON_R2", "Other", "" } },
		{ 3132, new string[] { "QUANTUM_MOON_R3", "Other", "" } },
		{ 3144, new string[] { "QUANTUM_MOON_R4", "Other", "" } },
		{ 3156, new string[] { "QUANTUM_MOON_X1", "Other", "" } },
		{ 3168, new string[] { "QUANTUM_MOON_X2", "Other", "" } },
		{ 3180, new string[] { "QM_SHUTTLE_X1", "Other", "" } },
		{ 3192, new string[] { "QM_SHUTTLE_X2", "Other", "" } },
		{ 3204, new string[] { "QM_SHRINE_R1", "Other", "" } },
		{ 3216, new string[] { "QM_SHRINE_X1", "Other", "" } },
		{ 3228, new string[] { "QM_SHRINE_X2", "Other", "" } },
		{ 3240, new string[] { "QM_SHRINE_X3", "Other", "" } },
		{ 3252, new string[] { "QM_SHRINE_X4", "Other", "" } },
		{ 3264, new string[] { "QM_SIXTH_LOCATION_R1", "Other", "" } },
		{ 3276, new string[] { "QM_SIXTH_LOCATION_R2", "Other", "" } },
		{ 3288, new string[] { "QM_SIXTH_LOCATION_R3", "Other", "" } },
		{ 3300, new string[] { "QM_SIXTH_LOCATION_X1", "Other", "" } },
		{ 3348, new string[] { "QM_SIXTH_LOCATION_X2", "Other", "" } },
		{ 3312, new string[] { "QM_SIXTH_LOCATION_X3", "Other", "" } },
		{ 3336, new string[] { "QM_SIXTH_LOCATION_X4", "Other", "" } },
		{ 3324, new string[] { "QM_SIXTH_LOCATION_X5", "Other", "" } },
		{ 3360, new string[] { "QM_SIXTH_LOCATION_X6", "Other", "" } },
		{ 3372, new string[] { "IP_RING_WORLD_X1", "Stranger", "Enter the Ring World" } },
		{ 3384, new string[] { "IP_ZONE_1_X1", "Stranger", "Reach River Lowlands" } },
		{ 3396, new string[] { "IP_ZONE_1_X2", "Stranger", "River Lowlands - Find Artifact" } },
		{ 3408, new string[] { "IP_ZONE_1_STORY_X1", "Stranger", "River Lowlands - Reel Story 1 (End)" } },
		{ 3420, new string[] { "IP_ZONE_1_STORY_X2", "Stranger", "River Lowlands - Reel Story 1 (Burned part)" } },
		{ 3432, new string[] { "IP_ZONE_1_SECRET_R1", "Stranger", "Temple - Look at the Hint for the Secret of River Lowlands" } },
		{ 3456, new string[] { "IP_ZONE_1_SECRET_X1", "Stranger", "River Lowlands - Secret Reel (End)" } },
		{ 3444, new string[] { "IP_ZONE_1_SECRET_X2", "Stranger", "River Lowlands - Find Secret Area" } },
		{ 3468, new string[] { "IP_ZONE_2_X1", "Stranger", "Reach Cinder Isles" } },
		{ 3480, new string[] { "IP_ZONE_2_X2", "Stranger", "Cinder Isles - Find Eye in Burned Building" } },
		{ 3492, new string[] { "IP_ZONE_2_STORY_X1", "Stranger", "Cinder Isles - Reel Story 2 (Slide ?/? Eye Scanned)" } },
		{ 3504, new string[] { "IP_ZONE_2_STORY_X2", "Stranger", "Cinder Isles - Reel Story 2 (End)" } },
		{ 3516, new string[] { "IP_ZONE_2_SECRET_R1", "Stranger", "Temple - Look at the Hint for the Secret of Cinder Isles" } },
		{ 3540, new string[] { "IP_ZONE_2_SECRET_X1", "Stranger", "Cinder Isles - Secret Reel (End)" } },
		{ 3528, new string[] { "IP_ZONE_2_SECRET_X2", "Stranger", "Cinder Isles - Find Secret Area" } },
		{ 3552, new string[] { "IP_ZONE_2_LIGHTHOUSE_R1", "Stranger", "Cinder Isles - Discover the Tower Secret w/ a Lantern" } },
		{ 3576, new string[] { "IP_ZONE_2_LIGHTHOUSE_X1", "Stranger", "Cinder Isles - Reel Secret Campfires (End)" } },
		{ 3564, new string[] { "IP_ZONE_2_LIGHTHOUSE_X2", "Stranger", "Cinder Isles - Enter Island Tower Room From The Top" } },
		{ 3588, new string[] { "IP_ZONE_2_CODE_R1", "Stranger", "Subterranean Lake - Vision form the Sarcophagus" } },
		{ 4464, new string[] { "IP_ZONE_2_CODE_R2", "Stranger", "Subterranean Lake - ---" } },
		{ 3600, new string[] { "IP_ZONE_2_CODE_X1", "Stranger", "Island Tower - Hidden Room Open Anything (?)" } },
		{ 3612, new string[] { "IP_ZONE_2_CODE_X2", "Stranger", "Island Tower - Hidden Room Open Seal Symbol w/ Burned Code" } },
		{ 3624, new string[] { "IP_ZONE_2_CODE_X3", "Stranger", "Island Tower - Hidden Room Open Burning Reel Symbol" } },
		{ 3636, new string[] { "IP_ZONE_3_X1", "Stranger", "Reach Hidden Gorge" } },
		{ 3648, new string[] { "IP_ZONE_3_STORY_X1", "Stranger", "Hidden Gorge - Reel Story 3 (End)" } },
		{ 3660, new string[] { "IP_ZONE_3_STORY_X2", "Stranger", "Hidden Gorge - Reel Story 3 (Burned part)" } },
		{ 3672, new string[] { "IP_ZONE_3_SECRET_R1", "Stranger", "Temple - Look at the Hint for the Secret of Hidden Gorge" } },
		{ 3696, new string[] { "IP_ZONE_3_SECRET_X1", "Stranger", "Hidden Gorge - Secret Reel (End)" } },
		{ 3684, new string[] { "IP_ZONE_3_SECRET_X2", "Stranger", "Hidden Gorge - Find Secret Area" } },
		{ 3708, new string[] { "IP_ZONE_3_ENTRANCE_R1", "Stranger", "Hidden Gorge - Reel Hull Breach (End)" } },
		{ 3720, new string[] { "IP_ZONE_3_ENTRANCE_X1", "Stranger", "Reach the Damaged Laboratory" } },
		{ 3732, new string[] { "IP_ZONE_3_ENTRANCE_X2", "Stranger", "Laboratory - Vision Successful Lantern Experiment" } },
		{ 3744, new string[] { "IP_ZONE_3_ENTRANCE_X3", "Stranger", "Hidden Gorge - Reel Lantern Experiment (Slide ?/? Lantern Light Up)" } },
		{ 3756, new string[] { "IP_ZONE_3_LAB_R1", "Stranger", "" } },
		{ 3768, new string[] { "IP_ZONE_3_LAB_X1", "Stranger", "Reach the Abandoned Temple" } },
		{ 3804, new string[] { "IP_ZONE_3_LAB_X2", "Stranger", "Hidden Gorge - Reel Burning Conspiracy (End)" } },
		{ 3780, new string[] { "IP_ZONE_3_LAB_X3", "Stranger", "Temple - Find the Code Cylinder" } },
		{ 3792, new string[] { "IP_ZONE_3_LAB_X4", "Stranger", "Temple - Find the Secret Room after Entering the Correct Code" } },
		{ 3816, new string[] { "IP_MAP_PROJECTION_1_X1", "Stranger", "Temple - Look at the Hint for the Secret of River Lowlands" } },
		{ 3828, new string[] { "IP_MAP_PROJECTION_2_X1", "Stranger", "Temple - Look at the Hint for the Secret of Cinder Isles" } },
		{ 3840, new string[] { "IP_MAP_PROJECTION_3_X1", "Stranger", "Temple - Look at the Hint for the Secret of Hidden Gorge" } },
		{ 3852, new string[] { "IP_ZONE_4_X2", "Stranger", "Reach the Reservoir" } },
		{ 3864, new string[] { "IP_ZONE_4_X3", "Stranger", "Reservoir - Find the Screen in the Code Room" } },
		{ 3876, new string[] { "IP_ZONE_4_X4", "Stranger", "Reservoir - Find the Projection in the Control Room" } },
		{ 3888, new string[] { "IP_ZONE_4_STORY_X1", "Stranger", "Reservoir - Reel Story 4 (Slide ?/? Bell Lowered in Water)" } },
		{ 3900, new string[] { "IP_ZONE_4_STORY_X2", "Stranger", "Reservoir - Reel Story 4 (Burned part)" } },
		{ 3912, new string[] { "IP_PRISON_R1", "Stranger", "Reservoir - Reel Story 4 (Slide ?/? Bell Lowered in Water)" } },
		{ 3924, new string[] { "IP_PRISON_R2", "Stranger", "Reservoir - Discover the Bell Secret w/ a Lantern" } },
		{ 3936, new string[] { "IP_PRISON_X1", "Stranger", "Reservoir - Enter the Bell" } },
		{ 3948, new string[] { "IP_PRISON_X2", "Stranger", "Reservoir - Look at the Sarcophagus" } },
		{ 3960, new string[] { "IP_DREAM_LAKE_R1", "Stranger", "Lake Outside - Look into the bell" } },
		{ 3972, new string[] { "IP_DREAM_LAKE_R2", "Stranger", "Lake Outside - Vision" } },
		{ 3984, new string[] { "IP_DREAM_LAKE_X1", "Stranger", "Reach Subterranean Lake" } },
		{ 3996, new string[] { "IP_DREAM_LAKE_X2", "Stranger", "Subterranean Lake - Attempt to Open the Sealed Sarcophagus" } },
		{ 4020, new string[] { "IP_SARCOPHAGUS_R1", "Stranger", "River Lowlands - Reel Seal 1 (End)" } },
		{ 4032, new string[] { "IP_SARCOPHAGUS_R2", "Stranger", "Cinder Isles - Reel Seal 2 (End)" } },
		{ 4044, new string[] { "IP_SARCOPHAGUS_R3", "Stranger", "Hidden Gorge - Reel Seal 3 (End)" } },
		{ 4008, new string[] { "IP_SARCOPHAGUS_R4", "Stranger", "Reservoir - Look at the Sarcophagus" } },
		{ 4056, new string[] { "IP_SARCOPHAGUS_X2", "Stranger", "Prison - Talk to the Prisoner" } },
		{ 4068, new string[] { "IP_SARCOPHAGUS_X3", "Stranger", "Prison - Vision Prisoner Story" } },
		{ 4080, new string[] { "IP_SARCOPHAGUS_X4", "Stranger", "Prison - Vision Hearthian Story" } },
		{ 4476, new string[] { "IP_SARCOPHAGUS_X5", "Stranger", "Prison - Final Prisoner Vision" } },
		{ 4092, new string[] { "IP_DREAM_ZONE_1_R1", "Stranger", "" } },
		{ 4104, new string[] { "IP_DREAM_ZONE_1_X1", "Stranger", "Reach Shrouded Woodlands" } },
		{ 4116, new string[] { "IP_DREAM_ZONE_1_X2", "Stranger", "Shrouded Woodlands - Hear the Music in the Wood" } },
		{ 4128, new string[] { "IP_DREAM_ZONE_1_X3", "Stranger", "Shrouded Woodlands - Find the Bridge to the Wood" } },
		{ 4140, new string[] { "IP_DREAM_LIBRARY_1_R1", "Stranger", "River Lowlands - Secret Reel (End)" } },
		{ 4152, new string[] { "IP_DREAM_LIBRARY_1_X1", "Stranger", "Reach Shrouded Woodland's Forbidden Archive" } },
		{ 4164, new string[] { "IP_DREAM_LIBRARY_1_X2", "Stranger", "Archive 1 - Open Burned Code" } },
		{ 4176, new string[] { "IP_DREAM_1_STORY_X1", "Stranger", "Archive 1 - Reel Story 1 (Slide 2/71)" } },
		{ 4188, new string[] { "IP_DREAM_1_STORY_X2", "Stranger", "Archive 1 - Reel Story 1 (Slide 55/71 Stranger Construction Complete)" } },
		{ 4200, new string[] { "IP_DREAM_1_RULE_X1", "Stranger", "Archive 1 - Reel Bug Raft (End)" } },
		{ 4212, new string[] { "IP_DREAM_ZONE_2_R1", "Stranger", "" } },
		{ 4224, new string[] { "IP_DREAM_ZONE_2_X1", "Stranger", "Reach Starlit Cove" } },
		{ 4236, new string[] { "IP_DREAM_ZONE_2_X2", "Stranger", "Starlit Cove - Find the Alarm (Trigger in the Cave)" } },
		{ 4248, new string[] { "IP_DREAM_ZONE_2_X3", "Stranger", "Starlit Cove - Find Burned Building" } },
		{ 4452, new string[] { "IP_DREAM_ZONE_2_X4", "Stranger", "Starlit Cove - Enter Tower Room" } },
		{ 4260, new string[] { "IP_DREAM_LIBRARY_2_R1", "Stranger", "Cinder Isles - Secret Reel (End)" } },
		{ 4272, new string[] { "IP_DREAM_LIBRARY_2_X1", "Stranger", "Reach Starlit Cove's Forbidden Archive" } },
		{ 4284, new string[] { "IP_DREAM_LIBRARY_2_X2", "Stranger", "Archive 2 - Open Burned Code" } },
		{ 4296, new string[] { "IP_DREAM_2_STORY_X1", "Stranger", "Archive 2 - Reel Story 2 (Slide 2/99)" } },
		{ 4308, new string[] { "IP_DREAM_2_STORY_X2", "Stranger", "Archive 2 - Reel Story 2 (Slide 88/99 Eye Blocked Completely)" } },
		{ 4320, new string[] { "IP_DREAM_2_RULE_X1", "Stranger", "Archive 2 - Reel Bug Death (Slide ?/? Old Elk Lantern Lights Up)" } },
		{ 4332, new string[] { "IP_DREAM_2_RULE_X2", "Stranger", "Archive 2 - Reel Bug Alarm (Slide ?-3/? Elk Red Text)" } },
		{ 4344, new string[] { "IP_DREAM_ZONE_3_R1", "Stranger", "" } },
		{ 4356, new string[] { "IP_DREAM_ZONE_3_X1", "Stranger", "Reach Endless Canyon" } },
		{ 4368, new string[] { "IP_DREAM_ZONE_3_X2", "Stranger", "Endless Canyon - Find the Painting at the Bottom of the Lodge" } },
		{ 4380, new string[] { "IP_DREAM_LIBRARY_3_R1", "Stranger", "Hidden Gorge - Secret Reel (End)" } },
		{ 4392, new string[] { "IP_DREAM_LIBRARY_3_X1", "Stranger", "Reach Endless Canyon's Forbidden Archive" } },
		{ 4404, new string[] { "IP_DREAM_LIBRARY_3_X2", "Stranger", "Archive 3 - Open Burned Code" } },
		{ 4416, new string[] { "IP_DREAM_3_STORY_X1", "Stranger", "Archive 3 - Reel Story 3 (Slide 2/84)" } },
		{ 4428, new string[] { "IP_DREAM_3_STORY_X2", "Stranger", "Archive 3 - Reel Story 3 (Slide 53/84 Finish Building Simulation)" } },
		{ 4440, new string[] { "IP_DREAM_3_RULE_X1", "Stranger", "Archive 3 - Reel Bug Matrix (Slide ?/? Elk Red Text)" } }
	};

	//Look for a specific part of the game code, in this case a variable we want, since the game code doesn't change it works better than pointer paths for this game (likely because of Unity)
	vars.signatureScan = (Func<Process, string, int, string, IntPtr>)((process, name, offset, target) => {
		print("____________\n" + name + " attempt\n____________");
		IntPtr ptr = IntPtr.Zero;
		foreach (var page in process.MemoryPages())
		{
			var scanner = new SignatureScanner(process, page.BaseAddress, (int)page.RegionSize);
			if (ptr == IntPtr.Zero)
			{
				ptr= scanner.Scan(new SigScanTarget(offset,target));
			}
			if (ptr != IntPtr.Zero) {
				print("---------------------------------\n" + name + " address found at : 0x" + ptr.ToString("X8") + "\n---------------------------------");
				break;
			}
		}
		return(ptr);
	});

	//Compare multiple variable used to load a new scene to detect if the scene we want is loading in the situation we want
	vars.loadCompare = (Func<int, int, int, int, bool, bool>)((loadingSceneOld, loadingSceneCurrent, currentScene, fadeType, asyncTransition) => {
		if(loadingSceneOld==vars.scene.Old && loadingSceneCurrent==vars.scene.Current)
			return((currentScene==vars.sceneC.Current || currentScene==-1) && fadeType==vars.fadeT.Current && asyncTransition==vars.allowAsync.Current);
		return(false);
	});
	
	//
	vars.createSetting = (Func<string, string, string, bool, bool>)((name, description, tooltip, enabled) => {
		settings.Add(name, enabled, description);
		settings.SetToolTip(name, tooltip);
		return true;
	});

	vars.createSetting("GeneralOptions", "Options", "", false);
	vars.createSetting("GeneralSplits", "Splits", "Choose where you want the game to split, by default only works the first time an event happens", true);
	vars.createSetting("DLCSplits", "DLC Splits", "Choose where you want the game to split, but only if you are on version 1.1.10 or later", false);

	settings.CurrentDefaultParent = "GeneralSplits";
		vars.createSetting("_deathImpact", "First death from Impact", "Like jumping off a cliff ;;)", false);
		vars.createSetting("_deathHP", "First death from HP loss", "Like a campfire ;;)", false);
		vars.createSetting("_deathFish", "First death from DaFishy", "chomp", false);
		vars.createSetting("_sleep", "Sleep", "", false);
		vars.createSetting("_wearSuit", "Wear spacesuit", "", false);
		vars.createSetting("_firstWarp", "Use a warp pad", "Any warp pad in the Solar System", false);
		vars.createSetting("_warpCore", "Grab the warp core", "", false);
		vars.createSetting("_exitWarp", "Use a warp pad while holding a warp core", "", false);
		vars.createSetting("_dBramble", "Enter Dark Bramble", "", false);
		vars.createSetting("_dBrambleVessel", "Enter the vessel node in Dark Bramble", "", false);
		vars.createSetting("_qMoonIn", "Enter the Quantum Moon", "", false);
		vars.createSetting("_vesselWarp", "Warp to the Eye of the Universe", "", false);
			vars.createSetting("EyeSplits", "Eye Splits", "", false);
			settings.CurrentDefaultParent = "EyeSplits";
			vars.createSetting("_eyeSurface", "Warp to the Eye surface", "", false);
			vars.createSetting("_eyeTunnel", "Enter the tunnel", "", false);
			vars.createSetting("_eyeObservatory", "Reach the observatory", "", false);
			vars.createSetting("_eyeMap", "Observe the map in the observatory", "", false);
			vars.createSetting("_eyeInstruments", "Start the 'Instrument Hunt'", "", false);
		settings.CurrentDefaultParent = "GeneralSplits";
		vars.createSetting("_bigBang", "BigBang", "Last split of most categories, can be kept on all the time", true);
		vars.createSetting("_dst", "Destroy Spacetime", "Last split of the Destroy Spacetime category", true);
	settings.CurrentDefaultParent = "GeneralOptions";
	vars.createSetting("_menuPauseOff", "Disable the time pause on the menu (Menu Storage)", "", false);
	vars.createSetting("_menuSplit", "Split when quitting back to the menu", "", false);
	vars.createSetting("_menuReset", "Reset the timer when quitting back to the menu", "", false);
	vars.createSetting("_menuResetLite", "  ˪ Same but ONLY if you do before splitting", "", false);
    vars.createSetting("_saveFile", "Auto delete progression while keeping Launch Codes /!\\ OVERWRITE SAVEFILE", "Automatically overwrite your savefile when the timer isn't running to erase everything except the launch codes.\nYOU NEED TO RESET THE TIMER BEFORE QUITTING OUT!\nUse it by clicking \"Resume expedition\"", false);
		vars.createSetting("_forceVersion", "Force the autosplitter to run for a specific game version", "The game need to be restarted\nBe careful, if you select the wrong version it could break the autosplitter", false);
		settings.CurrentDefaultParent = "_forceVersion";
		foreach (string item in vars.ver) {
			vars.createSetting("_v" + item, "" + item, "", false);
		}

	settings.CurrentDefaultParent = "DLCSplits";
	vars.createSetting("Signals", "Signals", "", false);
	vars.createSetting("Facts", "Facts & Rumors [WIP]", "", false);
	vars.createSetting("FreeSplits", "General DLC Splits - hover to read instructions", "Choose what split you want in the Stranger\nRULES\n· Only one split at a time is considered\n· You can use both the free splits and the regular splits in the same run\n· You can select several sub-options, the first one to be validated will trigger the split\n", false);

	for (int i = 0; i < 4; i++) {
		settings.CurrentDefaultParent = "FreeSplits";
    	vars.createSetting("_dlc" + i.ToString(), "Free Split " + (i + 1).ToString(), "", false);
		settings.CurrentDefaultParent = "_dlc" + i.ToString();
		vars.createSetting("_dlc" + i.ToString() + "CloakEnter", "Enter the Stranger Cloak", "", false);
		vars.createSetting("_dlc" + i.ToString() + "CloakExit", "Exit the Stranger Cloak", "", false);
		vars.createSetting("_dlc" + i.ToString() + "RingEnter", "Enter the Ring World", "", false);
		vars.createSetting("_dlc" + i.ToString() + "RingExit", "Exit the Ring World", "", false);
		vars.createSetting("_dlc" + i.ToString() + "DreamEnter", "Enter the Dream World", "", false);
		vars.createSetting("_dlc" + i.ToString() + "DreamExit", "Exit the Dream World", "", false);
		for (int j = 1; j < 3; j++) {
			settings.CurrentDefaultParent = "_dlc" + i.ToString() + (j == 1 ? "DreamEnter" : "DreamExit");
			vars.createSetting("_dlc" + i.ToString() + (j == 1 ? "DreamEnter" : "DreamExit") + "Any", "Any", "", false);
			vars.createSetting("_dlc" + i.ToString() + (j == 1 ? "DreamEnter" : "DreamExit") + "Zone1", "Shrouded Woodlands | River Lowlands", "", false);
			vars.createSetting("_dlc" + i.ToString() + (j == 1 ? "DreamEnter" : "DreamExit") + "Zone2", "Starlit Cove                 | Cinder Isles", "", false);
			vars.createSetting("_dlc" + i.ToString() + (j == 1 ? "DreamEnter" : "DreamExit") + "Zone3", "Endless Canyon          | Hidden Gorge", "", false);
			vars.createSetting("_dlc" + i.ToString() + (j == 1 ? "DreamEnter" : "DreamExit") + "Zone4", "Subterranean Lake     | Submerged Structure", "", false);
		}
	}

	settings.CurrentDefaultParent = "Signals";
	foreach (var item in vars.signals.Keys) {
  		vars.createSetting("_sig" + item, "" + item, "", false);
	}

	settings.CurrentDefaultParent = "Facts";
	vars.createSetting("_Stranger", "Stranger", "", false);
	vars.createSetting("_Other", "Other", "", false);
	foreach (var item in vars.facts) {
		settings.CurrentDefaultParent = "_" + item.Value[1];
  		vars.createSetting("_fact" + item.Value[0], String.IsNullOrEmpty(item.Value[2]) ? item.Value[0] : item.Value[2], item.Value[0], false);
	}

//
	vars.read = (Func<string, string>)((path) => {
		var str = "\n_______________\n\n";
		try {
        	using (FileStream fs = File.OpenRead(path))
			{
        	    byte[] b = new byte[2048];
        	    UTF8Encoding temp = new UTF8Encoding(true);
        	    while (fs.Read(b,0,b.Length) > 0)
        	    {
        	        str += temp.GetString(b);
					Array.Clear(b, 0, b.Length);
        	    }
        		fs.Close();//
			}
		}
		catch (IOException e) {
			print("PB in vars.read\n");
			return vars.Save;
			//throw;
		}
		return str;
	});

	vars.write = (Func<string, string, bool>)((str, path) => {
		UnicodeEncoding uniencoding = new UnicodeEncoding();
            string filename = path;

            byte[] result = uniencoding.GetBytes(str);

            using (FileStream SourceStream = File.Open(filename, FileMode.OpenOrCreate))
            {
                SourceStream.Seek(0, SeekOrigin.End);
                SourceStream.Write(result, 0, result.Length);
            }
		return true;
	});
//
print("__STARTUP END__ ");
}

//Launched whenever a game process has been found (potentially multiple times, when the game is restarted for example)
init
{
	print("__INIT START__");
	
	// MD5 code by CptBrian.
    string MD5Hash;
    using (var md5 = System.Security.Cryptography.MD5.Create())
        using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
            MD5Hash = md5.ComputeHash(s).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
	print("HASH = " + MD5Hash);

	//Steam 1.0.7  		CFF646D642E49E06FBE02DACAA7747E0 
	//Epic  1.0.7  		D2EBA93197CB5DBAAF23748E3657352F 
	//Steam 1.1.10 		8AC2F7475D483025CF94EF3027A58CE7 
	//Epic  1.1.10 		AD7A9F942E657193C8124B1FE0A89CB5
	//Steam 1.1.11 		C10C6961017C813F611D5D02710B07A9
	//Steam 1.1.11new	2DEA3DB5FAC0A7DF634ADEA81123561C
	//Epic  1.1.11 		AD7A9F942E657193C8124B1FE0A89CB5 (hmm)
	//Steam	1.1.12 		75425F7225EC5C685EC183E9E2FEFC68
	//Steam 1.1.12alt	8D09BEF112436A190C1464D82E35F119
	//Epic	1.1.12 		B56866911AECACA1488891A8A32C9BEE
	//Steam 1.1.13		7D64EC17914879EB2541002E4105C1F7
	//Epic  1.1.13		24FEAE80D912656ACA721E7729D03554

	if (MD5Hash == "CFF646D642E49E06FBE02DACAA7747E0" || MD5Hash == "D2EBA93197CB5DBAAF23748E3657352F")
		version = vars.ver[0];
	else if (MD5Hash == "8AC2F7475D483025CF94EF3027A58CE7" || MD5Hash == "AD7A9F942E657193C8124B1FE0A89CB5" || MD5Hash == "C10C6961017C813F611D5D02710B07A9" || MD5Hash == "2DEA3DB5FAC0A7DF634ADEA81123561C")
		version = vars.ver[1];
	else if (MD5Hash == "75425F7225EC5C685EC183E9E2FEFC68" || MD5Hash == "B56866911AECACA1488891A8A32C9BEE" || MD5Hash == "8D09BEF112436A190C1464D82E35F119")
		version = vars.ver[2];
	else if (MD5Hash == "7D64EC17914879EB2541002E4105C1F7" || MD5Hash == "24FEAE80D912656ACA721E7729D03554")
		version = vars.ver[3];
	else version = "unknown";

    print("Game version = " + version);
	if (settings["_forceVersion"]) {
		foreach (var item in vars.ver) {
			if(settings["_v" + item]) {
				version = item;
				print("Forced the game version to " + version);
			}
		}
	}

	vars.splitSignals = new List<int[]> {};
	vars.splitFacts = new List<int[]> {};

	IntPtr ptrLocator = IntPtr.Zero;
	while(ptrLocator == IntPtr.Zero && !vars.debug) {
		if(version != "1.0.7" || version == "unknown")
			ptrLocator = vars.signatureScan(game, "LOCATOR v.1.1.10+", 43, "0F84 ???????? 41 83 3F 00 49 BA ???????????????? 49 8B CF 66 90 49 BB ???????????????? 41 FF D3 48 8B C8 48 B8");
		if (ptrLocator != IntPtr.Zero) {
			if (version == "unknown")
				version = vars.ver[vars.ver.Length - 1];
			break;
		}
		if(version == "1.0.7" || version == "unknown")
			ptrLocator = vars.signatureScan(game, "LOCATOR v.1.0.7", 49, "0F84 ???????? 41 83 3F 00 49 BA ???????????????? 49 8B CF 48 83 EC 20 49 BB ???????????????? 41 FF D3 48 83 C4 20 48 8B C8 48 B8");
		if (ptrLocator != IntPtr.Zero) {
			version = "1.0.7";
			break;
		}
		if (ptrLocator == IntPtr.Zero){
			vars.debugLoop++;
			System.Threading.Thread.Sleep(2000 * vars.debugLoop);
		}
		if(vars.debugLoop == 10)
			vars.debug = true;
	}
	
if (!vars.debug) {
	IntPtr ptrTime = IntPtr.Zero;
	while(ptrTime == IntPtr.Zero) {;
		if (version != "1.0.7")
			ptrTime = vars.signatureScan(game, "OW_TIME v.1.1.10+", 14, "F3 0F2A C8 F3 0F5A C9 F2 0F5E C1 48 B8");
		else
			ptrTime = vars.signatureScan(game, "OW_TIME v.1.0.7", 18, "F3 0F5A C0 48 63 45 FC F2 0F2A C8 F2 0F5E C1 48 B8");
		if (ptrTime == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	IntPtr ptrLoad = IntPtr.Zero;
	while (ptrLoad == IntPtr.Zero) {
		if (version != "1.0.7")
			ptrLoad = vars.signatureScan(game, "LOAD_MANAGER v.1.1.10+", 20, "55 48 8B EC 48 81 EC ???????? 48 89 75 F8 48 8B F1 48 B8 ???????????????? 48 8B 00 48 85 C0 75 15 48 B8");
		else
			ptrLoad = vars.signatureScan(game, "LOAD_MANAGER v.1.0.7", 14, "55 48 8B EC 56 48 83 EC 78 48 8B F1 48 B8");
		if (ptrLoad == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	IntPtr ptrProfile = IntPtr.Zero;
	while(ptrProfile == IntPtr.Zero && version != "1.0.7") {
			//Profile manager getsharedinstance
		ptrProfile = vars.signatureScan(game, "Profile v.1.1.10+", 10, "55 48 8b ec 48 83 ec 20 48 b8 ???????????????? 48 8b 00 48 85 c0 75 29");
		if (ptrProfile == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	if (version != "1.0.7") {
		vars.Profile = (IntPtr)(game.ReadValue<long>(ptrProfile));
		print("|\nPOINTER Profile : 0x" + vars.Profile.ToString("X8") + "\n|");
		//StandaloneProfileManager - 0x90 _currentprofile - 0x10 _profileName - 0x10 Length
		vars.nameLength = new MemoryWatcher<int>(new DeepPointer(vars.Profile, 0x90, 0x10, 0x10));
		//StandaloneProfileManager - 0x78 __profilesPath - 0x10 Length
		vars.pathLength = new MemoryWatcher<int>(new DeepPointer(vars.Profile, 0x78, 0x10));
		vars.path = "";
	}
	else {
		vars.nameLength = new MemoryWatcher<bool>(new DeepPointer(IntPtr.Zero));
		vars.pathLength = new MemoryWatcher<bool>(new DeepPointer(IntPtr.Zero));
	}

	IntPtr Locator = (IntPtr)(game.ReadValue<long>(ptrLocator));
	print("|\nPOINTER Locator : 0x" + Locator.ToString("X8") + "\n|");

	IntPtr OW_Time = (IntPtr)(game.ReadValue<long>(ptrTime));
	print("|\nPOINTER OW_Time : 0x" + OW_Time.ToString("X8") + "\n|");

	IntPtr Load = (IntPtr)(game.ReadValue<long>(ptrLoad));
	print("|\nPOINTER LoadManager : 0x" + Load.ToString("X8") + "\n|");

	if (version != "1.0.7") {
	//LOCATOR_1_1_10+________________________________________________________________________________________________
		//Locator - 0x8 _playerController - 0x139 _isWearingSuit
		vars.isWearingSuit = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x8, 0x139));
		//Locator - 0x8 _playerController - 0x144 _inWarpField
		vars.inWarpField = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x8, 0x144));
		//---
		//Locator - 0x28 _toolModeSwapper - 0x40 _itemCarryTool - 0x98 _heldItem - 0x7C _type
		vars.heldItem = new MemoryWatcher<int>(new DeepPointer(Locator + 0x28, 0x40, 0x98, 0x7C));// 2 = WarpCore (not broken)
		//Locator - 0x28 _toolModeSwapper - 0x40 _itemCarryTool - 0xC0 _promptState
		vars.promptItem = new MemoryWatcher<int>(new DeepPointer(Locator + 0x28, 0x40, 0xC0));
		//---
		//Locator - 0xB8 _playerSectorDetector - 0x54 _inBrambleDimension
		vars.inBrambleDimension = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xB8, 0x54));
		//Locator - 0xB8 _playerSectorDetector - 0x55 _inVesselDimension
		vars.inVesselDimension = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xB8, 0x55));
		if (version == "1.1.13") {
			//Locator - 0xD0 _audioMixer - 0xD2 _isSleepingAtCampfire
			vars.isSleepingAtCampfire = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xD0, 0xD2));
			//---
			//Locator - 0x150 _eyeStateManager - 0x1C _state
			vars.eyeState = new MemoryWatcher<int>(new DeepPointer(Locator + 0x150, 0x1C));
			//Locator - 0x150 _eyeStateManager - 0x20 _initialized
			vars.eyeInitialized = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x150, 0x20));
			//---
			//Locator - 0x158 _timelineObliterationController - 0x40 _cameraEffect - 0x145 _isRealityShatterEffectComplete
			vars.isRealityShatterEffectComplete = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x158, 0x40, 0x145));
		}
		else {
			//Locator - 0xD0 _audioMixer - 0xCA _isSleepingAtCampfire
			vars.isSleepingAtCampfire = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xD0, 0xCA));
			//---
			//Locator - 0x158 _eyeStateManager - 0x1C _state
			vars.eyeState = new MemoryWatcher<int>(new DeepPointer(Locator + 0x158, 0x1C));
			//Locator - 0x158 _eyeStateManager - 0x20 _initialized
			vars.eyeInitialized = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x158, 0x20));
			//---
			//Locator - 0x160 _timelineObliterationController - 0x40 _cameraEffect - 0x145 _isRealityShatterEffectComplete
			vars.isRealityShatterEffectComplete = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x160, 0x40, 0x145));
		}
		//Locator - 0xE0 _deathManager - 0x20 _isDying
		vars.isDying = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xE0, 0x20));//0x21 for _isDead
		//Locator - 0xE0 _deathManager - 0x2c _deathType
		vars.deathType = new MemoryWatcher<int>(new DeepPointer(Locator + 0xE0, 0x2C));//6 = BigBang
		//---
		//Locator - 0x228 _quantumMoon - 0x15C _isPlayerInside
		vars.inQuantumMoon = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x228, 0x15C));
	//DLC
		//---
		//Locator - 0x190 _cloakFieldController - 0x10F _playerInsideCloak
		vars.playerInsideCloak = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x190, 0x10F));
		//---
		//Locator - 0x198 _ringWorldController - 0x184 _playerInsideRingWorld
		vars.playerInsideRingWorld = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x198, 0x184));
		if (version == "1.1.10") {
		//DreamWorldController_1_1_10/1_1_11
			//Locator - 0x1A0 _dreamWorldController - 0x131 _exitingDream
			vars.exitingDream = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1A0, 0x131));
			//Locator - 0x1A0 _dreamWorldController - 0x133 _insideDream
			vars.insideDream = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1A0, 0x133));
			//Locator - 0x1A0 _dreamWorldController - 0xA0 _dreamArrivalPoint - 0x48 DreamArrivalPoint.Location
			vars.dreamLocation = new MemoryWatcher<int>(new DeepPointer(Locator + 0x1A0, 0xA0, 0x48));
		}
		else {
		//DreamWorldController_1_1_12
			//Locator - 0x1A0 _dreamWorldController - 0x149 _exitingDream
			vars.exitingDream = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1A0, 0x149));
			//Locator - 0x1A0 _dreamWorldController - 0x14B _insideDream
			vars.insideDream = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1A0, 0x14B));
			//Locator - 0x1A0 _dreamWorldController - 0xB0 _dreamArrivalPoint - 0x48 DreamArrivalPoint.Location
			vars.dreamLocation = new MemoryWatcher<int>(new DeepPointer(Locator + 0x1A0, 0xB0, 0x48));
		}
	}
	else {
//LOCATOR_1_0_7_________________________________________________________________________________________________
	//Locator - 0x8 _playerController - 0x131 _isWearingSuit
	vars.isWearingSuit = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x8, 0x131));
	//Locator - 0x8 _playerController - 0x13C _inWarpField
	vars.inWarpField = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x8, 0x13C));
	//---
	//Locator - 0x28 _toolModeSwapper - 0x40 _itemCarryTool - 0x80 _heldItem - 0x64 _type
	vars.heldItem = new MemoryWatcher<int>(new DeepPointer(Locator + 0x28, 0x40, 0x80, 0x64));// 2 = WarpCore (not broken)
	//Locator - 0x28 _toolModeSwapper - 0x40 _itemCarryTool - 0xA8 _promptState
	vars.promptItem = new MemoryWatcher<int>(new DeepPointer(Locator + 0x28, 0x40, 0xA8));
	//---
	//Locator - 0xB0 _playerSectorDetector - 0x54 _inBrambleDimension
	vars.inBrambleDimension = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xB0, 0x54));
	//Locator - 0xB0 _playerSectorDetector - 0x55 _inVesselDimension
	vars.inVesselDimension = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xB0, 0x55));
	//---
	//Locator - 0xC8 _audioMixer - 0xA0 _isSleepingAtCampfire
	vars.isSleepingAtCampfire = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xC8, 0xA0));
	//---
	//Locator - 0xD8 _deathManager - 0x18 _isDying
	vars.isDying = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xD8, 0x18));//0x19 for _isDead
	//Locator - 0xD8 _deathManager - 0x24 _deathType
	vars.deathType = new MemoryWatcher<int>(new DeepPointer(Locator + 0xD8, 0x24));//6 = BigBang
	//---
	//Locator - 0x148 _eyeStateManager - 0x1C
	vars.eyeState = new MemoryWatcher<int>(new DeepPointer(Locator + 0x148, 0x1C));
	//Locator - 0x148 _eyeStateManager - 0x20
	vars.eyeInitialized = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x148, 0x20));
	//---
	//Locator - 0x150 _timelineObliterationController - 0x40 _cameraEffect - 0x131 _isRealityShatterEffectComplete
	vars.isRealityShatterEffectComplete = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x150, 0x40, 0x131));
	//---
	//Locator - 0x1C8 _quantumMoon - 0x15C _isPlayerInside
	vars.inQuantumMoon = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1C8, 0x15C));
	//
	vars.playerInsideCloak = new MemoryWatcher<bool>(new DeepPointer(IntPtr.Zero));
	vars.playerInsideRingWorld = new MemoryWatcher<bool>(new DeepPointer(IntPtr.Zero));
	vars.exitingDream = new MemoryWatcher<bool>(new DeepPointer(IntPtr.Zero));
	vars.insideDream = new MemoryWatcher<bool>(new DeepPointer(IntPtr.Zero));
	vars.dreamLocation = new MemoryWatcher<int>(new DeepPointer(IntPtr.Zero));
	}

//OW_TIME_______________________________________________________________________________________________________
	//OW_Time 0x0 s_pauseFlags (bool[7])
	vars.pauseMenu = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x20));//When in the ESC Menu
	vars.pauseLoading = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x21));//When quitting to the menu (and other maybe)
	vars.pauseSleeping = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x23));//Before waking up (loop beginning)
	vars.pauseInitializing = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x24));//When you see the "Save icon" more or less

	//OW_Time 0x10 s_fixedTimestep
	vars.fixedTimestep = new MemoryWatcher<float>(new DeepPointer(OW_Time));

//LOADMANAGER___________________________________________________________________________________________________
	//LoadManager - 0xc s_currentScene
	vars.sceneC = new MemoryWatcher<int>(new DeepPointer(Load - 0x2C));
	//LoadManager - 0x10 s_loadingScene
	vars.scene = new MemoryWatcher<int>(new DeepPointer(Load - 0x28));
	//LoadManager - 0x24 s_fadeType
	vars.fadeT = new MemoryWatcher<int>(new DeepPointer(Load - 0x14));
	//LoadManager - 0x20 s_allowAsyncTransition
	vars.allowAsync = new MemoryWatcher<bool>(new DeepPointer(Load - 0x18));
//
	vars.watchers = new MemoryWatcherList() {
		vars.pauseMenu, vars.pauseLoading, vars.pauseSleeping, vars.pauseInitializing,
		vars.fixedTimestep,
		vars.sceneC, vars.scene, vars.fadeT, vars.allowAsync,
		vars.isWearingSuit,
		vars.inWarpField, vars.heldItem, vars.promptItem,
		vars.inBrambleDimension, vars.inVesselDimension,
		vars.inQuantumMoon,
		vars.eyeState, vars.eyeInitialized,
		vars.isSleepingAtCampfire,
		vars.isDying, vars.deathType,
		vars.isRealityShatterEffectComplete,
		vars.playerInsideCloak, vars.playerInsideRingWorld,
		vars.insideDream, vars.exitingDream, vars.dreamLocation,
		vars.nameLength, vars.pathLength
	};
	vars.watchers.UpdateAll(game);
	if (vars.fixedTimestep.Current != vars.frame) {
		var timingMessage = MessageBox.Show(
			"The physics rate of the game seems to have been modified, please use the default settings (60 fps) when running.\n\n"+
			"See https://www.mobiusdigitalgames.com/supportforum.html or ask on Discord",
			"LiveSplit | " + vars.name,
			MessageBoxButtons.OK, MessageBoxIcon.Warning
		);
	}
print("__INIT END__");
print("\n~Running " + vars.name + "~\n");
}
else
	print("DEBUG/ERROR MODE\n~NOT Running " + vars.name + "~\n");
}

//Launched when the game process is exited
exit {
	print("__EXITING THE GAME__\n");
	timer.IsGameTimePaused = true;
}

//Run in a loop after INIT. If the timer isn't running, is followed by START. If the timer is running, is followed by ISLOADING, RESET and SPLITS.
update {
	if (vars.debug)
		return false;

	vars.watchers.UpdateAll(game);

	/*
	if (vars.sceneC.Current != vars.sceneC.Old || vars.scene.Current != vars.scene.Old || vars.fadeT.Current != vars.fadeT.Old || vars.allowAsync.Current != vars.allowAsync.Old) {
		print("Current Scene = " + vars.sceneC.Current + "\nScene = " + vars.scene.Current + " old = " + vars.scene.Old + "\n fadeT = " + vars.fadeT.Current + "\n allowAsync = " + vars.allowAsync.Current);
	}
	*/
	
	if(version != "1.0.7" && (settings["Signals"] || settings["Facts"] || settings["_saveFile"])) {
		if ((vars.nameLength.Current != vars.nameLength.Old || String.IsNullOrEmpty(vars.path)) && vars.pathLength.Current != 0) {
			string name = "";
			vars.path = "";
			char[] str = new char[vars.nameLength.Current];
			for (int i = 0; i < vars.nameLength.Current; i++) {
				vars.tmp = new MemoryWatcher<char>(new DeepPointer(vars.Profile, 0x90, 0x10, 0x14 + (0x2 * i)));
				vars.tmp.Update(game);
				str[i] = vars.tmp.Current;
				name = new string(str);
			}
			str = new char[vars.pathLength.Current];
			for (int i = 0; i < vars.pathLength.Current; i++) {
				vars.tmp = new MemoryWatcher<char>(new DeepPointer(vars.Profile, 0x78, 0x14 + (0x2 * i)));
				vars.tmp.Update(game);
				str[i] = vars.tmp.Current;
				vars.path = new string(str);
			} 
			vars.path += "/" + name + "/data.owsave";
			vars.writeTime = System.IO.File.GetLastWriteTime(vars.path);
			print("\nPATH = " + vars.path + "\nWrite Time = " + vars.writeTime + "\n");
		}
	}

	if (!vars.menu && vars.loadCompare(0, 1, -1, 1, true))
		vars.menu = true;
	else if(vars.menu && ((vars.pauseSleeping.Old && !vars.pauseSleeping.Current) || (vars.loadCompare(3, 0, 3, 1, true)))) {
		vars.menu = false;
		vars.loop++;
	}
	else if(vars.loadCompare(2, 0, 2, 0, true) || vars.loadCompare(0, 3, 2, 2, false))
		vars.load = !vars.menu;
	else if(settings["_menuPauseOff"] && ( vars.loadCompare(0, 2, 1, 1, false) ||  vars.loadCompare(0, 3, 1, 1, true) ) )
		vars.load = vars.menu;
	else if(vars.pauseInitializing.Old && !vars.pauseInitializing.Current)
		vars.load = false;
}

//Start the timer if it returns TRUE
start {
	if (vars.cleanValues > 0 && vars.pauseInitializing.Current) {
		print("Cleaning 'Splits' Array\n");
	   	vars.load = false;
    	vars.menu = false;
        vars.splits["_deathImpact"] = false;
		vars.splits["_deathHP"] = false;
		vars.splits["_deathFish"] = false;
		vars.splits["_sleep"] = false;
		vars.splits["_wearSuit"] = false;
		vars.splits["_firstWarp"] = false;
		vars.splits["_exitWarp"] = false;
		vars.splits["_warpCore"] = false;
		vars.splits["_dBramble"] = false;
		vars.splits["_dBrambleVessel"] = false;
		vars.splits["_qMoonIn"] = false;
		vars.currDlcSplit = 0;
		vars.loop = 0;
		vars.warpCoreLoop = -1;
		vars.splitSignals = new List<int[]> {};
		foreach (var item in vars.signals) {
			if(settings["_sig" + item.Key])
			vars.splitSignals.Add(new int[] { item.Value, 1 });
		}
		vars.splitFacts = new List<int[]> {};
		foreach (var item in vars.facts) {
			if(settings["_fact" + item.Value[0]])
			vars.splitFacts.Add(new int[] { item.Key, 1 });
		}
		vars.numDlcSplits = 0;
		for (int i = 0; i < 4; i++) 
		{
			if (settings["_dlc" + i.ToString()])
				vars.numDlcSplits++;
			else
				break;
		}
	print("Number of free dlc splits = " + vars.numDlcSplits);
	/*
		foreach(var item in vars.splitSignals) {//
			print("sig nb = " + item[0] + " | bool = " + item[1]);//
		}//
		foreach(var item in vars.splitFacts) {//
			print("fact nb = " + item[0] + " | bool = " + item[1]);//
		}//
	*/
		vars.cleanValues = 0;
	}
	if (settings["_saveFile"] && !String.IsNullOrEmpty(vars.path) && !(vars.pauseSleeping.Current || vars.pauseInitializing.Current)) {
		try {
			if (System.IO.File.ReadAllText(vars.path) != vars.saveFile) {
				System.IO.File.WriteAllText(@vars.path, vars.saveFile);
				print("Overwriting file");
			}
		}
		catch (IOException e) {
			print("Couldn't access the file 1");
		//throw;
		}
	}
	if ((vars.pauseSleeping.Old && !vars.pauseSleeping.Current) || vars.loadCompare(0, 3, 1, 1, true)) {
		vars.cleanValues = 1;
		return true;
	}
}

//'Pause' the timer if it returns TRUE
isLoading {
    return(vars.load || ( vars.menu && !settings["_menuPauseOff"] ) || (vars.isSleepingAtCampfire.Current && !vars.exitingDream.Current) || (settings["_menuPauseOff"] && vars.menu && vars.pauseLoading.Current) );
}

//Reset the timer if it returns TRUE
reset {
	return (settings["GeneralOptions"] && (settings["_menuReset"] || (settings["_menuResetLite"] && timer.CurrentSplitIndex == 0)) && vars.menu);
	//should remove generaloptions
}

//Split if it returns TRUE
split {
	if (settings["GeneralOptions"] && settings["_menuSplit"] && vars.pauseLoading.Current && vars.pauseMenu.Old)
		return true;
	if(settings["GeneralSplits"]) {
		if (settings["_bigBang"] && vars.deathType.Current == 6 && vars.deathType.Old != 6)
			return true;
		else if (settings["_dst"] && vars.isRealityShatterEffectComplete.Current && !vars.isRealityShatterEffectComplete.Old)
			return true;
		else if (settings["_deathImpact"] && !vars.splits["_deathImpact"] && vars.deathType.Old != 1 && vars.deathType.Current == 1) {
			vars.splits["_deathImpact"] = true;
			return true;
		}
		else if (settings["_deathHP"] && !vars.splits["_deathHP"] && vars.isDying.Current && !vars.isDying.Old && vars.deathType.Current == 0) {
			vars.splits["_deathHP"] = true;
			return true;
		}
		else if (settings["_deathFish"] && !vars.splits["_deathFish"] && vars.deathType.Old != 5 && vars.deathType.Current == 5) {
			vars.splits["_deathFish"] = true;
			return true;
		}
		else if (settings["_sleep"] && !vars.splits["_sleep"] && vars.isSleepingAtCampfire.Current && !vars.isSleepingAtCampfire.Old) {
			vars.splits["_sleep"] = true;
			return true;
		}
		else if (settings["_wearSuit"] && !vars.splits["_wearSuit"] && vars.isWearingSuit.Current && !vars.isWearingSuit.Old) {
			vars.splits["_wearSuit"] = true;
			return true;
		}
		else if (vars.inWarpField.Current && !vars.inWarpField.Old && !vars.splits["_warpCore"]) {
			vars.warpCoreLoop = vars.loop;
			if (!vars.splits["_firstWarp"]) {
				vars.splits["_firstWarp"] = true;
				return (settings["_firstWarp"]);
			}
		}
		else if (!vars.splits["_warpCore"] && vars.heldItem.Current == 2 && vars.promptItem.Old == 3 && vars.promptItem.Current > 3 && vars.warpCoreLoop == vars.loop) {
			vars.splits["_warpCore"] = true;
			return (settings["_warpCore"]);
		}
		else if (settings["_exitWarp"] && !vars.splits["_exitWarp"] && !vars.inWarpField.Current && vars.inWarpField.Old && vars.splits["_warpCore"] && vars.warpCoreLoop == vars.loop) {
			vars.splits["_exitWarp"] = true;
			return true;
		}
		else if (settings["_dBramble"] && !vars.splits["_dBramble"] && vars.inBrambleDimension.Current && !vars.inBrambleDimension.Old) {
			vars.splits["_dBramble"] = true;
			return true;
		}
		else if (settings["_dBrambleVessel"] && !vars.splits["_dBrambleVessel"] && vars.inVesselDimension.Current && !vars.inVesselDimension.Old) {
			vars.splits["_dBrambleVessel"] = true;
			return true;
		}
		else if (settings["_qMoonIn"] && !vars.splits["_qMoonIn"] && vars.inQuantumMoon.Current && !vars.inQuantumMoon.Old) {
			vars.splits["_qMoonIn"] = true;
			return true;
		}
		else if (settings["_vesselWarp"] && vars.eyeInitialized.Current && !vars.eyeInitialized.Old)
			return true;
		else if (settings["EyeSplits"]) {
			if (settings["_eyeSurface"] && vars.eyeState.Current == 10 && vars.eyeState.Old != 10)
				return true;
			else if (settings["_eyeTunnel"] && vars.eyeState.Current == 20 && vars.eyeState.Old != 20)
				return true;
			else if (settings["_eyeObservatory"] && vars.eyeState.Current == 40 && vars.eyeState.Old != 40)
				return true;
			else if (settings["_eyeMap"] && vars.eyeState.Current == 50 && vars.eyeState.Old != 50)
				return true;
			else if (settings["_eyeInstruments"] && vars.eyeState.Current == 80 && vars.eyeState.Old != 80)
				return true;
		}
	}

	if (version != "1.0.7") {
		if (settings["FreeSplits"]) {
			if (vars.currDlcSplit < vars.numDlcSplits) {
				if((settings["_dlc" + vars.currDlcSplit.ToString() + "CloakEnter"] && vars.playerInsideCloak.Current && !vars.playerInsideCloak.Old)
				|| (settings["_dlc" + vars.currDlcSplit.ToString() + "CloakExit"] && !vars.playerInsideCloak.Current && vars.playerInsideCloak.Old)
				|| (settings["_dlc" + vars.currDlcSplit.ToString() + "RingEnter"] && vars.playerInsideRingWorld.Current && !vars.playerInsideRingWorld.Old)
				|| (settings["_dlc" + vars.currDlcSplit.ToString() + "RingExit"] && !vars.playerInsideRingWorld.Current && vars.playerInsideRingWorld.Old)
				|| (settings["_dlc" + vars.currDlcSplit.ToString() + "DreamEnter"] && vars.insideDream.Current && !vars.insideDream.Old &&
					(settings["_dlc" + vars.currDlcSplit.ToString() + "DreamEnterAny"]
				|| (vars.dreamLocation.Current == 100 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamEnterZone1"])
				|| (vars.dreamLocation.Current == 200 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamEnterZone2"])
				|| (vars.dreamLocation.Current == 300 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamEnterZone3"])
				|| (vars.dreamLocation.Current == 400 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamEnterZone4"]) ))
				|| (settings["_dlc" + vars.currDlcSplit.ToString() + "DreamExit"] && !vars.insideDream.Current && vars.insideDream.Old &&
					(settings["_dlc" + vars.currDlcSplit.ToString() + "DreamExitAny"]
				|| (vars.dreamLocation.Old == 100 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamExitZone1"])
				|| (vars.dreamLocation.Old == 200 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamExitZone2"])
				|| (vars.dreamLocation.Old == 300 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamExitZone3"])
				|| (vars.dreamLocation.Old == 400 && settings["_dlc" + vars.currDlcSplit.ToString() + "DreamExitZone4"]) ))
				) {
					vars.currDlcSplit++;
					return true;
				}
			}
		}

		if(settings["Signals"] || settings["Facts"]) {
			if (vars.writeTime != System.IO.File.GetLastWriteTime(vars.path) || vars.cleanValues == 1) {
				print("NEW SAVE");
				vars.writeTime = System.IO.File.GetLastWriteTime(vars.path);
//				vars.write(vars.Save, @"C:\Users\xxx\Test.txt");
				var arr = new string[1];
				try {
					arr = System.IO.File.ReadAllText(vars.path).Split('\"');
				}
				catch (IOException e) {
					print("Couldn't access the file 2");
					return false;
					//throw;
				}
				if (vars.splitSignals.Count > 0) {
					foreach (var item in vars.splitSignals) {
						if (item[1] == 1 && arr[item[0]] == ":true,") {
							print("item = " + arr[item[0]]);
							item[1] = 0;
							if (vars.cleanValues != 1)
								vars.timer.Split();
						}
					}
				}
				if (vars.splitFacts.Count > 0) {
					for (int i = 70; i < arr.Length; i++) {
						if (arr[i] == "shipLogFactSaves") {
							vars.tmp = i + 2;
							break;
						}
					}
					foreach (var item in vars.splitFacts) {
						if ((vars.tmp + item[0] + 7 < arr.Length) && item[1] == 1 && arr[vars.tmp + item[0] + 7] != ":-1,") {
							print("Unlocked = " + arr[vars.tmp + item[0]] + " | " + arr[vars.tmp + item[0] + 7]);
							item[1] = 0;
							if (vars.cleanValues != 1) {
/*
								timer.CurrentSplit.Name = ( String.IsNullOrEmpty(vars.facts[item[0]][2]) ? vars.facts[item[0]][0] : vars.facts[item[0]][2] );
								print("item = " + ( String.IsNullOrEmpty(vars.facts[item[0]][2]) ? vars.facts[item[0]][0] : vars.facts[item[0]][2]) );
*/
								vars.timer.Split();
							}
						}
					}
				}
				vars.cleanValues = vars.cleanValues == 1 ? 2 : vars.cleanValues;
			}
		}
	}
	return false;
}
