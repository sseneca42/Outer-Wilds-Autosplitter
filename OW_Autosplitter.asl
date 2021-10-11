//Download dbgview to see the comments.
state("OuterWilds") {}

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
	vars.debug = false;
//	vars.timer = new TimerModel { CurrentState = timer };
	vars.load = false;
	vars.menu = false;
	vars.cleanValues = true;
	vars.saveFile = "{\"loopCount\":3,\"knownFrequencies\":[true,true,false,false,false,false,false],\"knownSignals\":{\"31\":false,\"30\":false,\"32\":false,\"62\":false,\"60\":false,\"61\":false,\"23\":false,\"20\":false,\"24\":false,\"22\":false,\"21\":false,\"25\":false,\"11\":false,\"10\":false,\"14\":false,\"13\":false,\"12\":false,\"15\":false,\"16\":false,\"40\":false,\"43\":false,\"42\":false,\"49\":false,\"41\":false,\"46\":false,\"44\":false,\"48\":false,\"47\":false,\"45\":false,\"100\":false,\"101\":false},\"dictConditions\":{\"HIDE_TEMPLE_BASEMENT_ENTRIES\":true,\"LAUNCH_CODES_GIVEN\":true},\"shipLogFactSaves\":{\"S_SUNSTATION_R1\":{\"id\":\"S_SUNSTATION_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_R2\":{\"id\":\"S_SUNSTATION_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_R3\":{\"id\":\"S_SUNSTATION_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X1\":{\"id\":\"S_SUNSTATION_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X2\":{\"id\":\"S_SUNSTATION_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X3\":{\"id\":\"S_SUNSTATION_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"S_SUNSTATION_X4\":{\"id\":\"S_SUNSTATION_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X1\":{\"id\":\"CT_CHERT_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X2\":{\"id\":\"CT_CHERT_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X3\":{\"id\":\"CT_CHERT_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X4\":{\"id\":\"CT_CHERT_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_CHERT_X5\":{\"id\":\"CT_CHERT_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_MOON_LOCATOR_X1\":{\"id\":\"CT_QUANTUM_MOON_LOCATOR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_MOON_LOCATOR_X2\":{\"id\":\"CT_QUANTUM_MOON_LOCATOR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_MOON_LOCATOR_X3\":{\"id\":\"CT_QUANTUM_MOON_LOCATOR_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_GRAVITY_CANNON_R1\":{\"id\":\"CT_GRAVITY_CANNON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_GRAVITY_CANNON_X1\":{\"id\":\"CT_GRAVITY_CANNON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_GRAVITY_CANNON_X2\":{\"id\":\"CT_GRAVITY_CANNON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_R1\":{\"id\":\"CT_ESCAPE_POD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_R2\":{\"id\":\"CT_ESCAPE_POD_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_X1\":{\"id\":\"CT_ESCAPE_POD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ESCAPE_POD_X2\":{\"id\":\"CT_ESCAPE_POD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_R1\":{\"id\":\"CT_HIGH_ENERGY_LAB_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_R2\":{\"id\":\"CT_HIGH_ENERGY_LAB_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_R3\":{\"id\":\"CT_HIGH_ENERGY_LAB_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_X1\":{\"id\":\"CT_HIGH_ENERGY_LAB_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_X2\":{\"id\":\"CT_HIGH_ENERGY_LAB_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_HIGH_ENERGY_LAB_X3\":{\"id\":\"CT_HIGH_ENERGY_LAB_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_R1\":{\"id\":\"CT_WARP_TOWER_MAP_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X1\":{\"id\":\"CT_WARP_TOWER_MAP_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X4\":{\"id\":\"CT_WARP_TOWER_MAP_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X3\":{\"id\":\"CT_WARP_TOWER_MAP_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_WARP_TOWER_MAP_X2\":{\"id\":\"CT_WARP_TOWER_MAP_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R1\":{\"id\":\"CT_SUNLESS_CITY_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R3\":{\"id\":\"CT_SUNLESS_CITY_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R4\":{\"id\":\"CT_SUNLESS_CITY_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R5\":{\"id\":\"CT_SUNLESS_CITY_R5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_R2\":{\"id\":\"CT_SUNLESS_CITY_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_X1\":{\"id\":\"CT_SUNLESS_CITY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_X2\":{\"id\":\"CT_SUNLESS_CITY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_SUNLESS_CITY_X3\":{\"id\":\"CT_SUNLESS_CITY_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R1\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R2\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R3\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_R4\":{\"id\":\"CT_ANGLERFISH_FOSSIL_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_X1\":{\"id\":\"CT_ANGLERFISH_FOSSIL_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_X2\":{\"id\":\"CT_ANGLERFISH_FOSSIL_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_ANGLERFISH_FOSSIL_X3\":{\"id\":\"CT_ANGLERFISH_FOSSIL_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_CAVES_R1\":{\"id\":\"CT_QUANTUM_CAVES_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_CAVES_X1\":{\"id\":\"CT_QUANTUM_CAVES_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_QUANTUM_CAVES_X2\":{\"id\":\"CT_QUANTUM_CAVES_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_R1\":{\"id\":\"CT_LAKEBED_CAVERN_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_R2\":{\"id\":\"CT_LAKEBED_CAVERN_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_X1\":{\"id\":\"CT_LAKEBED_CAVERN_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_X2\":{\"id\":\"CT_LAKEBED_CAVERN_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"CT_LAKEBED_CAVERN_X3\":{\"id\":\"CT_LAKEBED_CAVERN_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_WARP_TOWERS_X1\":{\"id\":\"TT_WARP_TOWERS_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_WARP_TOWERS_X2\":{\"id\":\"TT_WARP_TOWERS_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R1\":{\"id\":\"TT_TIME_LOOP_DEVICE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R2\":{\"id\":\"TT_TIME_LOOP_DEVICE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R3\":{\"id\":\"TT_TIME_LOOP_DEVICE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_R4\":{\"id\":\"TT_TIME_LOOP_DEVICE_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X1\":{\"id\":\"TT_TIME_LOOP_DEVICE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X2\":{\"id\":\"TT_TIME_LOOP_DEVICE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X3\":{\"id\":\"TT_TIME_LOOP_DEVICE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X4\":{\"id\":\"TT_TIME_LOOP_DEVICE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TT_TIME_LOOP_DEVICE_X5\":{\"id\":\"TT_TIME_LOOP_DEVICE_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_VILLAGE_X1\":{\"id\":\"TH_VILLAGE_X1\",\"revealOrder\":0,\"read\":false,\"newlyRevealed\":true},\"TH_VILLAGE_X2\":{\"id\":\"TH_VILLAGE_X2\",\"revealOrder\":0,\"read\":false,\"newlyRevealed\":true},\"TH_VILLAGE_X3\":{\"id\":\"TH_VILLAGE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_ZERO_G_CAVE_R1\":{\"id\":\"TH_ZERO_G_CAVE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_ZERO_G_CAVE_X1\":{\"id\":\"TH_ZERO_G_CAVE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_ZERO_G_CAVE_X2\":{\"id\":\"TH_ZERO_G_CAVE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_R1\":{\"id\":\"TH_IMPACT_CRATER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_X1\":{\"id\":\"TH_IMPACT_CRATER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_X2\":{\"id\":\"TH_IMPACT_CRATER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_IMPACT_CRATER_X3\":{\"id\":\"TH_IMPACT_CRATER_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_R1\":{\"id\":\"TH_NOMAI_MINE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_X1\":{\"id\":\"TH_NOMAI_MINE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_X2\":{\"id\":\"TH_NOMAI_MINE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_NOMAI_MINE_X3\":{\"id\":\"TH_NOMAI_MINE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_R1\":{\"id\":\"TH_QUANTUM_SHARD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_R2\":{\"id\":\"TH_QUANTUM_SHARD_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_X1\":{\"id\":\"TH_QUANTUM_SHARD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_QUANTUM_SHARD_X2\":{\"id\":\"TH_QUANTUM_SHARD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TH_RADIO_TOWER_X1\":{\"id\":\"TH_RADIO_TOWER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_ESKER_R1\":{\"id\":\"TM_ESKER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_ESKER_X1\":{\"id\":\"TM_ESKER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_NORTH_POLE_R1\":{\"id\":\"TM_NORTH_POLE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_NORTH_POLE_X1\":{\"id\":\"TM_NORTH_POLE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_R1\":{\"id\":\"TM_EYE_LOCATOR_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_R2\":{\"id\":\"TM_EYE_LOCATOR_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_X1\":{\"id\":\"TM_EYE_LOCATOR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"TM_EYE_LOCATOR_X2\":{\"id\":\"TM_EYE_LOCATOR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R1\":{\"id\":\"BH_RIEBECK_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R2\":{\"id\":\"BH_RIEBECK_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R3\":{\"id\":\"BH_RIEBECK_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_R4\":{\"id\":\"BH_RIEBECK_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_X1\":{\"id\":\"BH_RIEBECK_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_RIEBECK_X2\":{\"id\":\"BH_RIEBECK_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_GRAVITY_CANNON_X1\":{\"id\":\"BH_GRAVITY_CANNON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_GRAVITY_CANNON_X2\":{\"id\":\"BH_GRAVITY_CANNON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_R1\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_R2\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_X1\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_X2\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_RESEARCH_TOWER_X3\":{\"id\":\"BH_QUANTUM_RESEARCH_TOWER_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_R1\":{\"id\":\"BH_QUANTUM_SHARD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_X1\":{\"id\":\"BH_QUANTUM_SHARD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_X2\":{\"id\":\"BH_QUANTUM_SHARD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_QUANTUM_SHARD_X3\":{\"id\":\"BH_QUANTUM_SHARD_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_RECEIVER_X1\":{\"id\":\"BH_WARP_RECEIVER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_RECEIVER_X2\":{\"id\":\"BH_WARP_RECEIVER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_ESCAPE_POD_R1\":{\"id\":\"BH_ESCAPE_POD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_ESCAPE_POD_X1\":{\"id\":\"BH_ESCAPE_POD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_ESCAPE_POD_X2\":{\"id\":\"BH_ESCAPE_POD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_R1\":{\"id\":\"BH_OLD_SETTLEMENT_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X1\":{\"id\":\"BH_OLD_SETTLEMENT_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X2\":{\"id\":\"BH_OLD_SETTLEMENT_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X3\":{\"id\":\"BH_OLD_SETTLEMENT_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OLD_SETTLEMENT_X4\":{\"id\":\"BH_OLD_SETTLEMENT_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_MURAL_1_X1\":{\"id\":\"BH_MURAL_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_MURAL_2_X1\":{\"id\":\"BH_MURAL_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_MURAL_3_X1\":{\"id\":\"BH_MURAL_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_R1\":{\"id\":\"BH_HANGING_CITY_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_R2\":{\"id\":\"BH_HANGING_CITY_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X1\":{\"id\":\"BH_HANGING_CITY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X2\":{\"id\":\"BH_HANGING_CITY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X3\":{\"id\":\"BH_HANGING_CITY_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_HANGING_CITY_X4\":{\"id\":\"BH_HANGING_CITY_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R1\":{\"id\":\"BH_BLACK_HOLE_FORGE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R2\":{\"id\":\"BH_BLACK_HOLE_FORGE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R3\":{\"id\":\"BH_BLACK_HOLE_FORGE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_R4\":{\"id\":\"BH_BLACK_HOLE_FORGE_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X4\":{\"id\":\"BH_BLACK_HOLE_FORGE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X5\":{\"id\":\"BH_BLACK_HOLE_FORGE_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X6\":{\"id\":\"BH_BLACK_HOLE_FORGE_X6\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X1\":{\"id\":\"BH_BLACK_HOLE_FORGE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_BLACK_HOLE_FORGE_X3\":{\"id\":\"BH_BLACK_HOLE_FORGE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X1\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X2\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X3\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_WARP_ALIGNMENT_MAP_X4\":{\"id\":\"BH_WARP_ALIGNMENT_MAP_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R1\":{\"id\":\"BH_OBSERVATORY_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R2\":{\"id\":\"BH_OBSERVATORY_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R3\":{\"id\":\"BH_OBSERVATORY_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_R4\":{\"id\":\"BH_OBSERVATORY_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X1\":{\"id\":\"BH_OBSERVATORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X2\":{\"id\":\"BH_OBSERVATORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X3\":{\"id\":\"BH_OBSERVATORY_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_OBSERVATORY_X4\":{\"id\":\"BH_OBSERVATORY_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_TORNADO_SIMULATION_R1\":{\"id\":\"BH_TORNADO_SIMULATION_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_TORNADO_SIMULATION_X1\":{\"id\":\"BH_TORNADO_SIMULATION_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"BH_TORNADO_SIMULATION_X2\":{\"id\":\"BH_TORNADO_SIMULATION_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"VM_VOLCANO_X1\":{\"id\":\"VM_VOLCANO_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"VM_VOLCANO_X2\":{\"id\":\"VM_VOLCANO_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"VM_VOLCANO_X3\":{\"id\":\"VM_VOLCANO_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_R1\":{\"id\":\"GD_OCEAN_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_R2\":{\"id\":\"GD_OCEAN_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_R3\":{\"id\":\"GD_OCEAN_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_X1\":{\"id\":\"GD_OCEAN_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_OCEAN_X2\":{\"id\":\"GD_OCEAN_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_R1\":{\"id\":\"GD_GABBRO_ISLAND_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X0\":{\"id\":\"GD_GABBRO_ISLAND_X0\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X1\":{\"id\":\"GD_GABBRO_ISLAND_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X2\":{\"id\":\"GD_GABBRO_ISLAND_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_GABBRO_ISLAND_X3\":{\"id\":\"GD_GABBRO_ISLAND_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_R1\":{\"id\":\"GD_CONSTRUCTION_YARD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_X1\":{\"id\":\"GD_CONSTRUCTION_YARD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_X2\":{\"id\":\"GD_CONSTRUCTION_YARD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_CONSTRUCTION_YARD_X3\":{\"id\":\"GD_CONSTRUCTION_YARD_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_BRAMBLE_ISLAND_X1\":{\"id\":\"GD_BRAMBLE_ISLAND_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_R1\":{\"id\":\"GD_STATUE_ISLAND_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_R2\":{\"id\":\"GD_STATUE_ISLAND_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_X1\":{\"id\":\"GD_STATUE_ISLAND_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_ISLAND_X2\":{\"id\":\"GD_STATUE_ISLAND_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_R1\":{\"id\":\"GD_STATUE_WORKSHOP_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_R2\":{\"id\":\"GD_STATUE_WORKSHOP_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_R3\":{\"id\":\"GD_STATUE_WORKSHOP_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_X1\":{\"id\":\"GD_STATUE_WORKSHOP_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_X2\":{\"id\":\"GD_STATUE_WORKSHOP_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_STATUE_WORKSHOP_X3\":{\"id\":\"GD_STATUE_WORKSHOP_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_R1\":{\"id\":\"GD_QUANTUM_TOWER_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X1\":{\"id\":\"GD_QUANTUM_TOWER_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X2\":{\"id\":\"GD_QUANTUM_TOWER_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X3\":{\"id\":\"GD_QUANTUM_TOWER_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"GD_QUANTUM_TOWER_X4\":{\"id\":\"GD_QUANTUM_TOWER_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R1\":{\"id\":\"ORBITAL_PROBE_CANNON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R2\":{\"id\":\"ORBITAL_PROBE_CANNON_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R4\":{\"id\":\"ORBITAL_PROBE_CANNON_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_R3\":{\"id\":\"ORBITAL_PROBE_CANNON_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_X1\":{\"id\":\"ORBITAL_PROBE_CANNON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_X2\":{\"id\":\"ORBITAL_PROBE_CANNON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"ORBITAL_PROBE_CANNON_X3\":{\"id\":\"ORBITAL_PROBE_CANNON_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_INTACT_MODULE_R1\":{\"id\":\"OPC_INTACT_MODULE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_INTACT_MODULE_X1\":{\"id\":\"OPC_INTACT_MODULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_INTACT_MODULE_X2\":{\"id\":\"OPC_INTACT_MODULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_R1\":{\"id\":\"OPC_BROKEN_MODULE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_R2\":{\"id\":\"OPC_BROKEN_MODULE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_R3\":{\"id\":\"OPC_BROKEN_MODULE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_X1\":{\"id\":\"OPC_BROKEN_MODULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_X2\":{\"id\":\"OPC_BROKEN_MODULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_BROKEN_MODULE_X3\":{\"id\":\"OPC_BROKEN_MODULE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R1\":{\"id\":\"OPC_SUNKEN_MODULE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R5\":{\"id\":\"OPC_SUNKEN_MODULE_R5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R4\":{\"id\":\"OPC_SUNKEN_MODULE_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R2\":{\"id\":\"OPC_SUNKEN_MODULE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_R3\":{\"id\":\"OPC_SUNKEN_MODULE_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_X1\":{\"id\":\"OPC_SUNKEN_MODULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_X2\":{\"id\":\"OPC_SUNKEN_MODULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_SUNKEN_MODULE_X3\":{\"id\":\"OPC_SUNKEN_MODULE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"OPC_EYE_COORDINATES_X1\":{\"id\":\"OPC_EYE_COORDINATES_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_R1\":{\"id\":\"DB_FELDSPAR_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_R2\":{\"id\":\"DB_FELDSPAR_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_X1\":{\"id\":\"DB_FELDSPAR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_X2\":{\"id\":\"DB_FELDSPAR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FELDSPAR_X3\":{\"id\":\"DB_FELDSPAR_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_R1\":{\"id\":\"DB_FROZEN_JELLYFISH_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_X1\":{\"id\":\"DB_FROZEN_JELLYFISH_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_X2\":{\"id\":\"DB_FROZEN_JELLYFISH_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_FROZEN_JELLYFISH_X3\":{\"id\":\"DB_FROZEN_JELLYFISH_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_R1\":{\"id\":\"DB_ESCAPE_POD_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_X1\":{\"id\":\"DB_ESCAPE_POD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_X2\":{\"id\":\"DB_ESCAPE_POD_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_ESCAPE_POD_X3\":{\"id\":\"DB_ESCAPE_POD_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_R1\":{\"id\":\"DB_NOMAI_GRAVE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_R2\":{\"id\":\"DB_NOMAI_GRAVE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X1\":{\"id\":\"DB_NOMAI_GRAVE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X2\":{\"id\":\"DB_NOMAI_GRAVE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X3\":{\"id\":\"DB_NOMAI_GRAVE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_NOMAI_GRAVE_X4\":{\"id\":\"DB_NOMAI_GRAVE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R1\":{\"id\":\"DB_VESSEL_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R2\":{\"id\":\"DB_VESSEL_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R3\":{\"id\":\"DB_VESSEL_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_R4\":{\"id\":\"DB_VESSEL_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X1\":{\"id\":\"DB_VESSEL_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X2\":{\"id\":\"DB_VESSEL_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X3\":{\"id\":\"DB_VESSEL_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X4\":{\"id\":\"DB_VESSEL_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X5\":{\"id\":\"DB_VESSEL_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"DB_VESSEL_X6\":{\"id\":\"DB_VESSEL_X6\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R1\":{\"id\":\"WHS_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R2\":{\"id\":\"WHS_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R3\":{\"id\":\"WHS_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_R4\":{\"id\":\"WHS_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X4\":{\"id\":\"WHS_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X1\":{\"id\":\"WHS_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X2\":{\"id\":\"WHS_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"WHS_X3\":{\"id\":\"WHS_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X1\":{\"id\":\"COMET_SHUTTLE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X2\":{\"id\":\"COMET_SHUTTLE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X3\":{\"id\":\"COMET_SHUTTLE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_SHUTTLE_X4\":{\"id\":\"COMET_SHUTTLE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_R1\":{\"id\":\"COMET_INTERIOR_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_R2\":{\"id\":\"COMET_INTERIOR_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X1\":{\"id\":\"COMET_INTERIOR_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X2\":{\"id\":\"COMET_INTERIOR_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X3\":{\"id\":\"COMET_INTERIOR_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"COMET_INTERIOR_X4\":{\"id\":\"COMET_INTERIOR_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R1\":{\"id\":\"QUANTUM_MOON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R2\":{\"id\":\"QUANTUM_MOON_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R3\":{\"id\":\"QUANTUM_MOON_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_R4\":{\"id\":\"QUANTUM_MOON_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_X1\":{\"id\":\"QUANTUM_MOON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QUANTUM_MOON_X2\":{\"id\":\"QUANTUM_MOON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHUTTLE_X1\":{\"id\":\"QM_SHUTTLE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHUTTLE_X2\":{\"id\":\"QM_SHUTTLE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_R1\":{\"id\":\"QM_SHRINE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X1\":{\"id\":\"QM_SHRINE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X2\":{\"id\":\"QM_SHRINE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X3\":{\"id\":\"QM_SHRINE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SHRINE_X4\":{\"id\":\"QM_SHRINE_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_R1\":{\"id\":\"QM_SIXTH_LOCATION_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_R2\":{\"id\":\"QM_SIXTH_LOCATION_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_R3\":{\"id\":\"QM_SIXTH_LOCATION_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X1\":{\"id\":\"QM_SIXTH_LOCATION_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X3\":{\"id\":\"QM_SIXTH_LOCATION_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X5\":{\"id\":\"QM_SIXTH_LOCATION_X5\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X4\":{\"id\":\"QM_SIXTH_LOCATION_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X2\":{\"id\":\"QM_SIXTH_LOCATION_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"QM_SIXTH_LOCATION_X6\":{\"id\":\"QM_SIXTH_LOCATION_X6\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_RING_WORLD_X1\":{\"id\":\"IP_RING_WORLD_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_X1\":{\"id\":\"IP_ZONE_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_X2\":{\"id\":\"IP_ZONE_1_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_STORY_X1\":{\"id\":\"IP_ZONE_1_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_STORY_X2\":{\"id\":\"IP_ZONE_1_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_SECRET_R1\":{\"id\":\"IP_ZONE_1_SECRET_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_SECRET_X2\":{\"id\":\"IP_ZONE_1_SECRET_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_1_SECRET_X1\":{\"id\":\"IP_ZONE_1_SECRET_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_X1\":{\"id\":\"IP_ZONE_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_X2\":{\"id\":\"IP_ZONE_2_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_STORY_X1\":{\"id\":\"IP_ZONE_2_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_STORY_X2\":{\"id\":\"IP_ZONE_2_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_SECRET_R1\":{\"id\":\"IP_ZONE_2_SECRET_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_SECRET_X2\":{\"id\":\"IP_ZONE_2_SECRET_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_SECRET_X1\":{\"id\":\"IP_ZONE_2_SECRET_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_LIGHTHOUSE_R1\":{\"id\":\"IP_ZONE_2_LIGHTHOUSE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_LIGHTHOUSE_X2\":{\"id\":\"IP_ZONE_2_LIGHTHOUSE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_LIGHTHOUSE_X1\":{\"id\":\"IP_ZONE_2_LIGHTHOUSE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_R1\":{\"id\":\"IP_ZONE_2_CODE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_X1\":{\"id\":\"IP_ZONE_2_CODE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_X2\":{\"id\":\"IP_ZONE_2_CODE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_2_CODE_X3\":{\"id\":\"IP_ZONE_2_CODE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_X1\":{\"id\":\"IP_ZONE_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_STORY_X1\":{\"id\":\"IP_ZONE_3_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_STORY_X2\":{\"id\":\"IP_ZONE_3_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_SECRET_R1\":{\"id\":\"IP_ZONE_3_SECRET_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_SECRET_X2\":{\"id\":\"IP_ZONE_3_SECRET_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_SECRET_X1\":{\"id\":\"IP_ZONE_3_SECRET_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_R1\":{\"id\":\"IP_ZONE_3_ENTRANCE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_X1\":{\"id\":\"IP_ZONE_3_ENTRANCE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_X2\":{\"id\":\"IP_ZONE_3_ENTRANCE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_ENTRANCE_X3\":{\"id\":\"IP_ZONE_3_ENTRANCE_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_R1\":{\"id\":\"IP_ZONE_3_LAB_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X1\":{\"id\":\"IP_ZONE_3_LAB_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X3\":{\"id\":\"IP_ZONE_3_LAB_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X4\":{\"id\":\"IP_ZONE_3_LAB_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_3_LAB_X2\":{\"id\":\"IP_ZONE_3_LAB_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_MAP_PROJECTION_1_X1\":{\"id\":\"IP_MAP_PROJECTION_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_MAP_PROJECTION_2_X1\":{\"id\":\"IP_MAP_PROJECTION_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_MAP_PROJECTION_3_X1\":{\"id\":\"IP_MAP_PROJECTION_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_X2\":{\"id\":\"IP_ZONE_4_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_X3\":{\"id\":\"IP_ZONE_4_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_X4\":{\"id\":\"IP_ZONE_4_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_STORY_X1\":{\"id\":\"IP_ZONE_4_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_ZONE_4_STORY_X2\":{\"id\":\"IP_ZONE_4_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_R1\":{\"id\":\"IP_PRISON_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_R2\":{\"id\":\"IP_PRISON_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_X1\":{\"id\":\"IP_PRISON_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_PRISON_X2\":{\"id\":\"IP_PRISON_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_R1\":{\"id\":\"IP_DREAM_LAKE_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_R2\":{\"id\":\"IP_DREAM_LAKE_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_X1\":{\"id\":\"IP_DREAM_LAKE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LAKE_X2\":{\"id\":\"IP_DREAM_LAKE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R4\":{\"id\":\"IP_SARCOPHAGUS_R4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R1\":{\"id\":\"IP_SARCOPHAGUS_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R2\":{\"id\":\"IP_SARCOPHAGUS_R2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_R3\":{\"id\":\"IP_SARCOPHAGUS_R3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_X2\":{\"id\":\"IP_SARCOPHAGUS_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_X3\":{\"id\":\"IP_SARCOPHAGUS_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_SARCOPHAGUS_X4\":{\"id\":\"IP_SARCOPHAGUS_X4\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_R1\":{\"id\":\"IP_DREAM_ZONE_1_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_X1\":{\"id\":\"IP_DREAM_ZONE_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_X2\":{\"id\":\"IP_DREAM_ZONE_1_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_1_X3\":{\"id\":\"IP_DREAM_ZONE_1_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_1_R1\":{\"id\":\"IP_DREAM_LIBRARY_1_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_1_X1\":{\"id\":\"IP_DREAM_LIBRARY_1_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_1_X2\":{\"id\":\"IP_DREAM_LIBRARY_1_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_1_STORY_X1\":{\"id\":\"IP_DREAM_1_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_1_STORY_X2\":{\"id\":\"IP_DREAM_1_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_1_RULE_X1\":{\"id\":\"IP_DREAM_1_RULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_R1\":{\"id\":\"IP_DREAM_ZONE_2_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X1\":{\"id\":\"IP_DREAM_ZONE_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X2\":{\"id\":\"IP_DREAM_ZONE_2_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_2_X3\":{\"id\":\"IP_DREAM_ZONE_2_X3\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_2_R1\":{\"id\":\"IP_DREAM_LIBRARY_2_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_2_X1\":{\"id\":\"IP_DREAM_LIBRARY_2_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_2_X2\":{\"id\":\"IP_DREAM_LIBRARY_2_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_STORY_X1\":{\"id\":\"IP_DREAM_2_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_STORY_X2\":{\"id\":\"IP_DREAM_2_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_RULE_X1\":{\"id\":\"IP_DREAM_2_RULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_2_RULE_X2\":{\"id\":\"IP_DREAM_2_RULE_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_3_R1\":{\"id\":\"IP_DREAM_ZONE_3_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_3_X1\":{\"id\":\"IP_DREAM_ZONE_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_ZONE_3_X2\":{\"id\":\"IP_DREAM_ZONE_3_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_3_R1\":{\"id\":\"IP_DREAM_LIBRARY_3_R1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_3_X1\":{\"id\":\"IP_DREAM_LIBRARY_3_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_LIBRARY_3_X2\":{\"id\":\"IP_DREAM_LIBRARY_3_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_3_STORY_X1\":{\"id\":\"IP_DREAM_3_STORY_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_3_STORY_X2\":{\"id\":\"IP_DREAM_3_STORY_X2\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false},\"IP_DREAM_3_RULE_X1\":{\"id\":\"IP_DREAM_3_RULE_X1\",\"revealOrder\":-1,\"read\":false,\"newlyRevealed\":false}},\"newlyRevealedFactIDs\":[\"TH_VILLAGE_X1\",\"TH_VILLAGE_X2\"],\"lastDeathType\":0,\"burnedMarshmallowEaten\":0,\"fullTimeloops\":0,\"perfectMarshmallowsEaten\":0,\"warpedToTheEye\":false,\"secondsRemainingOnWarp\":0.0,\"loopCountOnParadox\":0,\"shownPopups\":0,\"version\":\"1.1.10.47\"}";
	vars.frame = (float)1/60;
	vars.loop = 0;
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
	vars.facts = new Dictionary<string, int>
	{
		{ "S_SUNSTATION_R1", 0 },
		{ "S_SUNSTATION_R2", 12 },
		{ "S_SUNSTATION_R3", 24 },
		{ "S_SUNSTATION_X1", 36 },
		{ "S_SUNSTATION_X2", 48 },
		{ "S_SUNSTATION_X3", 60 },
		{ "S_SUNSTATION_X4", 72 },
		{ "CT_CHERT_X1", 84 },
		{ "CT_CHERT_X2", 96 },
		{ "CT_CHERT_X3", 108 },
		{ "CT_CHERT_X4", 120 },
		{ "CT_CHERT_X5", 132 },
		{ "CT_QUANTUM_MOON_LOCATOR_X1", 144 },
		{ "CT_QUANTUM_MOON_LOCATOR_X2", 156 },
		{ "CT_QUANTUM_MOON_LOCATOR_X3", 168 },
		{ "CT_GRAVITY_CANNON_R1", 180 },
		{ "CT_GRAVITY_CANNON_X1", 192 },
		{ "CT_GRAVITY_CANNON_X2", 204 },
		{ "CT_ESCAPE_POD_R1", 216 },
		{ "CT_ESCAPE_POD_R2", 228 },
		{ "CT_ESCAPE_POD_X1", 240 },
		{ "CT_ESCAPE_POD_X2", 252 },
		{ "CT_HIGH_ENERGY_LAB_R1", 264 },
		{ "CT_HIGH_ENERGY_LAB_R2", 276 },
		{ "CT_HIGH_ENERGY_LAB_R3", 288 },
		{ "CT_HIGH_ENERGY_LAB_X1", 300 },
		{ "CT_HIGH_ENERGY_LAB_X2", 312 },
		{ "CT_HIGH_ENERGY_LAB_X3", 324 },
		{ "CT_WARP_TOWER_MAP_R1", 336 },
		{ "CT_WARP_TOWER_MAP_X1", 348 },
		{ "CT_WARP_TOWER_MAP_X2", 384 },
		{ "CT_WARP_TOWER_MAP_X3", 372 },
		{ "CT_WARP_TOWER_MAP_X4", 360 },
		{ "CT_SUNLESS_CITY_R1", 396 },
		{ "CT_SUNLESS_CITY_R2", 444 },
		{ "CT_SUNLESS_CITY_R3", 408 },
		{ "CT_SUNLESS_CITY_R4", 420 },
		{ "CT_SUNLESS_CITY_R5", 432 },
		{ "CT_SUNLESS_CITY_X1", 456 },
		{ "CT_SUNLESS_CITY_X2", 468 },
		{ "CT_SUNLESS_CITY_X3", 480 },
		{ "CT_ANGLERFISH_FOSSIL_R1", 492 },
		{ "CT_ANGLERFISH_FOSSIL_R2", 504 },
		{ "CT_ANGLERFISH_FOSSIL_R3", 516 },
		{ "CT_ANGLERFISH_FOSSIL_R4", 528 },
		{ "CT_ANGLERFISH_FOSSIL_X1", 540 },
		{ "CT_ANGLERFISH_FOSSIL_X2", 552 },
		{ "CT_ANGLERFISH_FOSSIL_X3", 564 },
		{ "CT_QUANTUM_CAVES_R1", 576 },
		{ "CT_QUANTUM_CAVES_X1", 588 },
		{ "CT_QUANTUM_CAVES_X2", 600 },
		{ "CT_LAKEBED_CAVERN_R1", 612 },
		{ "CT_LAKEBED_CAVERN_R2", 624 },
		{ "CT_LAKEBED_CAVERN_X1", 636 },
		{ "CT_LAKEBED_CAVERN_X2", 648 },
		{ "CT_LAKEBED_CAVERN_X3", 660 },
		{ "TT_WARP_TOWERS_X1", 672 },
		{ "TT_WARP_TOWERS_X2", 684 },
		{ "TT_TIME_LOOP_DEVICE_R1", 696 },
		{ "TT_TIME_LOOP_DEVICE_R2", 708 },
		{ "TT_TIME_LOOP_DEVICE_R3", 720 },
		{ "TT_TIME_LOOP_DEVICE_R4", 732 },
		{ "TT_TIME_LOOP_DEVICE_X1", 744 },
		{ "TT_TIME_LOOP_DEVICE_X2", 756 },
		{ "TT_TIME_LOOP_DEVICE_X3", 768 },
		{ "TT_TIME_LOOP_DEVICE_X4", 780 },
		{ "TT_TIME_LOOP_DEVICE_X5", 792 },
		{ "TH_VILLAGE_X1", 804 },
		{ "TH_VILLAGE_X2", 816 },
		{ "TH_VILLAGE_X3", 828 },
		{ "TH_ZERO_G_CAVE_R1", 840 },
		{ "TH_ZERO_G_CAVE_X1", 852 },
		{ "TH_ZERO_G_CAVE_X2", 864 },
		{ "TH_IMPACT_CRATER_R1", 876 },
		{ "TH_IMPACT_CRATER_X1", 888 },
		{ "TH_IMPACT_CRATER_X2", 900 },
		{ "TH_IMPACT_CRATER_X3", 912 },
		{ "TH_NOMAI_MINE_R1", 924 },
		{ "TH_NOMAI_MINE_X1", 936 },
		{ "TH_NOMAI_MINE_X2", 948 },
		{ "TH_NOMAI_MINE_X3", 960 },
		{ "TH_QUANTUM_SHARD_R1", 972 },
		{ "TH_QUANTUM_SHARD_R2", 984 },
		{ "TH_QUANTUM_SHARD_X1", 996 },
		{ "TH_QUANTUM_SHARD_X2", 1008 },
		{ "TM_ESKER_R1", 1020 },
		{ "TM_ESKER_X1", 1032 },
		{ "TM_NORTH_POLE_R1", 1044 },
		{ "TM_NORTH_POLE_X1", 1056 },
		{ "TM_EYE_LOCATOR_R1", 1068 },
		{ "TM_EYE_LOCATOR_R2", 1080 },
		{ "TM_EYE_LOCATOR_X1", 1092 },
		{ "TM_EYE_LOCATOR_X2", 1104 },
		{ "BH_RIEBECK_R1", 1116 },
		{ "BH_RIEBECK_R2", 1128 },
		{ "BH_RIEBECK_R3", 1140 },
		{ "BH_RIEBECK_R4", 1152 },
		{ "BH_RIEBECK_X1", 1164 },
		{ "BH_RIEBECK_X2", 1176 },
		{ "BH_GRAVITY_CANNON_X1", 1188 },
		{ "BH_GRAVITY_CANNON_X2", 1200 },
		{ "BH_QUANTUM_RESEARCH_TOWER_R1", 1212 },
		{ "BH_QUANTUM_RESEARCH_TOWER_R2", 1224 },
		{ "BH_QUANTUM_RESEARCH_TOWER_X1", 1236 },
		{ "BH_QUANTUM_RESEARCH_TOWER_X2", 1248 },
		{ "BH_QUANTUM_RESEARCH_TOWER_X3", 1260 },
		{ "BH_QUANTUM_SHARD_R1", 1272 },
		{ "BH_QUANTUM_SHARD_X1", 1284 },
		{ "BH_QUANTUM_SHARD_X2", 1296 },
		{ "BH_QUANTUM_SHARD_X3", 1308 },
		{ "BH_WARP_RECEIVER_X1", 1320 },
		{ "BH_WARP_RECEIVER_X2", 1332 },
		{ "BH_ESCAPE_POD_R1", 1344 },
		{ "BH_ESCAPE_POD_X1", 1356 },
		{ "BH_ESCAPE_POD_X2", 1368 },
		{ "BH_OLD_SETTLEMENT_R1", 1380 },
		{ "BH_OLD_SETTLEMENT_X1", 1392 },
		{ "BH_OLD_SETTLEMENT_X2", 1404 },
		{ "BH_OLD_SETTLEMENT_X3", 1416 },
		{ "BH_OLD_SETTLEMENT_X4", 1428 },
		{ "BH_MURAL_1_X1", 1440 },
		{ "BH_MURAL_2_X1", 1452 },
		{ "BH_MURAL_3_X1", 1464 },
		{ "BH_HANGING_CITY_R1", 1476 },
		{ "BH_HANGING_CITY_R2", 1488 },
		{ "BH_HANGING_CITY_X1", 1500 },
		{ "BH_HANGING_CITY_X2", 1512 },
		{ "BH_HANGING_CITY_X3", 1524 },
		{ "BH_HANGING_CITY_X4", 1536 },
		{ "BH_BLACK_HOLE_FORGE_R1", 1548 },
		{ "BH_BLACK_HOLE_FORGE_R2", 1560 },
		{ "BH_BLACK_HOLE_FORGE_R3", 1572 },
		{ "BH_BLACK_HOLE_FORGE_R4", 1584 },
		{ "BH_BLACK_HOLE_FORGE_X1", 1632 },
		{ "BH_BLACK_HOLE_FORGE_X3", 1644 },
		{ "BH_BLACK_HOLE_FORGE_X4", 1596 },
		{ "BH_BLACK_HOLE_FORGE_X5", 1608 },
		{ "BH_BLACK_HOLE_FORGE_X6", 1620 },
		{ "BH_WARP_ALIGNMENT_MAP_X1", 1656 },
		{ "BH_WARP_ALIGNMENT_MAP_X2", 1668 },
		{ "BH_WARP_ALIGNMENT_MAP_X3", 1680 },
		{ "BH_WARP_ALIGNMENT_MAP_X4", 1692 },
		{ "BH_OBSERVATORY_R1", 1704 },
		{ "BH_OBSERVATORY_R2", 1716 },
		{ "BH_OBSERVATORY_R3", 1728 },
		{ "BH_OBSERVATORY_R4", 1740 },
		{ "BH_OBSERVATORY_X1", 1752 },
		{ "BH_OBSERVATORY_X2", 1764 },
		{ "BH_OBSERVATORY_X3", 1776 },
		{ "BH_OBSERVATORY_X4", 1788 },
		{ "BH_TORNADO_SIMULATION_R1", 1800 },
		{ "BH_TORNADO_SIMULATION_X1", 1812 },
		{ "BH_TORNADO_SIMULATION_X2", 1824 },
		{ "VM_VOLCANO_X1", 1836 },
		{ "VM_VOLCANO_X2", 1848 },
		{ "VM_VOLCANO_X3", 1860 },
		{ "GD_OCEAN_R1", 1872 },
		{ "GD_OCEAN_R2", 1884 },
		{ "GD_OCEAN_R3", 1896 },
		{ "GD_OCEAN_X1", 1908 },
		{ "GD_OCEAN_X2", 1920 },
		{ "GD_GABBRO_ISLAND_R1", 1932 },
		{ "GD_GABBRO_ISLAND_X0", 1944 },
		{ "GD_GABBRO_ISLAND_X1", 1956 },
		{ "GD_GABBRO_ISLAND_X2", 1968 },
		{ "GD_GABBRO_ISLAND_X3", 1980 },
		{ "GD_CONSTRUCTION_YARD_R1", 1992 },
		{ "GD_CONSTRUCTION_YARD_X1", 2004 },
		{ "GD_CONSTRUCTION_YARD_X2", 2016 },
		{ "GD_CONSTRUCTION_YARD_X3", 2028 },
		{ "GD_BRAMBLE_ISLAND_X1", 2040 },
		{ "GD_STATUE_ISLAND_R1", 2052 },
		{ "GD_STATUE_ISLAND_R2", 2064 },
		{ "GD_STATUE_ISLAND_X1", 2076 },
		{ "GD_STATUE_ISLAND_X2", 2088 },
		{ "GD_STATUE_WORKSHOP_R1", 2100 },
		{ "GD_STATUE_WORKSHOP_R2", 2112 },
		{ "GD_STATUE_WORKSHOP_R3", 2124 },
		{ "GD_STATUE_WORKSHOP_X1", 2136 },
		{ "GD_STATUE_WORKSHOP_X2", 2148 },
		{ "GD_STATUE_WORKSHOP_X3", 2160 },
		{ "GD_QUANTUM_TOWER_R1", 2172 },
		{ "GD_QUANTUM_TOWER_X1", 2184 },
		{ "GD_QUANTUM_TOWER_X2", 2196 },
		{ "GD_QUANTUM_TOWER_X3", 2208 },
		{ "GD_QUANTUM_TOWER_X4", 2220 },
		{ "ORBITAL_PROBE_CANNON_R1", 2232 },
		{ "ORBITAL_PROBE_CANNON_R2", 2244 },
		{ "ORBITAL_PROBE_CANNON_R3", 2268 },
		{ "ORBITAL_PROBE_CANNON_R4", 2256 },
		{ "ORBITAL_PROBE_CANNON_X1", 2280 },
		{ "ORBITAL_PROBE_CANNON_X2", 2292 },
		{ "ORBITAL_PROBE_CANNON_X3", 2304 },
		{ "OPC_INTACT_MODULE_R1", 2316 },
		{ "OPC_INTACT_MODULE_X1", 2328 },
		{ "OPC_INTACT_MODULE_X2", 2340 },
		{ "OPC_BROKEN_MODULE_R1", 2352 },
		{ "OPC_BROKEN_MODULE_R2", 2364 },
		{ "OPC_BROKEN_MODULE_R3", 2376 },
		{ "OPC_BROKEN_MODULE_X1", 2388 },
		{ "OPC_BROKEN_MODULE_X2", 2400 },
		{ "OPC_BROKEN_MODULE_X3", 2412 },
		{ "OPC_SUNKEN_MODULE_R1", 2424 },
		{ "OPC_SUNKEN_MODULE_R2", 2460 },
		{ "OPC_SUNKEN_MODULE_R3", 2472 },
		{ "OPC_SUNKEN_MODULE_R4", 2448 },
		{ "OPC_SUNKEN_MODULE_R5", 2436 },
		{ "OPC_SUNKEN_MODULE_X1", 2484 },
		{ "OPC_SUNKEN_MODULE_X2", 2496 },
		{ "OPC_SUNKEN_MODULE_X3", 2508 },
		{ "OPC_EYE_COORDINATES_X1", 2520 },
		{ "DB_FELDSPAR_R1", 2532 },
		{ "DB_FELDSPAR_R2", 2544 },
		{ "DB_FELDSPAR_X1", 2556 },
		{ "DB_FELDSPAR_X2", 2568 },
		{ "DB_FELDSPAR_X3", 2580 },
		{ "DB_FROZEN_JELLYFISH_R1", 2592 },
		{ "DB_FROZEN_JELLYFISH_X1", 2604 },
		{ "DB_FROZEN_JELLYFISH_X2", 2616 },
		{ "DB_FROZEN_JELLYFISH_X3", 2628 },
		{ "DB_ESCAPE_POD_R1", 2640 },
		{ "DB_ESCAPE_POD_X1", 2652 },
		{ "DB_ESCAPE_POD_X2", 2664 },
		{ "DB_ESCAPE_POD_X3", 2676 },
		{ "DB_NOMAI_GRAVE_R1", 2688 },
		{ "DB_NOMAI_GRAVE_R2", 2700 },
		{ "DB_NOMAI_GRAVE_X1", 2712 },
		{ "DB_NOMAI_GRAVE_X2", 2724 },
		{ "DB_NOMAI_GRAVE_X3", 2736 },
		{ "DB_NOMAI_GRAVE_X4", 2748 },
		{ "DB_VESSEL_R1", 2760 },
		{ "DB_VESSEL_R2", 2772 },
		{ "DB_VESSEL_R3", 2784 },
		{ "DB_VESSEL_R4", 2796 },
		{ "DB_VESSEL_X1", 2808 },
		{ "DB_VESSEL_X2", 2820 },
		{ "DB_VESSEL_X3", 2832 },
		{ "DB_VESSEL_X4", 2844 },
		{ "DB_VESSEL_X5", 2856 },
		{ "DB_VESSEL_X6", 2868 },
		{ "WHS_R1", 2880 },
		{ "WHS_R2", 2892 },
		{ "WHS_R3", 2904 },
		{ "WHS_R4", 2916 },
		{ "WHS_X1", 2940 },
		{ "WHS_X2", 2952 },
		{ "WHS_X3", 2964 },
		{ "WHS_X4", 2928 },
		{ "COMET_SHUTTLE_X1", 2976 },
		{ "COMET_SHUTTLE_X2", 2988 },
		{ "COMET_SHUTTLE_X3", 3000 },
		{ "COMET_SHUTTLE_X4", 3012 },
		{ "COMET_INTERIOR_R1", 3024 },
		{ "COMET_INTERIOR_R2", 3036 },
		{ "COMET_INTERIOR_X1", 3048 },
		{ "COMET_INTERIOR_X2", 3060 },
		{ "COMET_INTERIOR_X3", 3072 },
		{ "COMET_INTERIOR_X4", 3084 },
		{ "QUANTUM_MOON_R1", 3096 },
		{ "QUANTUM_MOON_R2", 3108 },
		{ "QUANTUM_MOON_R3", 3120 },
		{ "QUANTUM_MOON_R4", 3132 },
		{ "QUANTUM_MOON_X1", 3144 },
		{ "QUANTUM_MOON_X2", 3156 },
		{ "QM_SHUTTLE_X1", 3168 },
		{ "QM_SHUTTLE_X2", 3180 },
		{ "QM_SHRINE_R1", 3192 },
		{ "QM_SHRINE_X1", 3204 },
		{ "QM_SHRINE_X2", 3216 },
		{ "QM_SHRINE_X3", 3228 },
		{ "QM_SHRINE_X4", 3240 },
		{ "QM_SIXTH_LOCATION_R1", 3252 },
		{ "QM_SIXTH_LOCATION_R2", 3264 },
		{ "QM_SIXTH_LOCATION_R3", 3276 },
		{ "QM_SIXTH_LOCATION_X1", 3288 },
		{ "QM_SIXTH_LOCATION_X2", 3336 },
		{ "QM_SIXTH_LOCATION_X3", 3300 },
		{ "QM_SIXTH_LOCATION_X4", 3324 },
		{ "QM_SIXTH_LOCATION_X5", 3312 },
		{ "QM_SIXTH_LOCATION_X6", 3348 },
		{ "TH_RADIO_TOWER_X1", 3360 },
		{ "IP_RING_WORLD_X1", 3372 },
		{ "IP_ZONE_1_X1", 3384 },
		{ "IP_ZONE_1_X2", 3396 },
		{ "IP_ZONE_1_STORY_X1", 3408 },
		{ "IP_ZONE_1_STORY_X2", 3420 },
		{ "IP_ZONE_1_SECRET_R1", 3432 },
		{ "IP_ZONE_1_SECRET_X1", 3456 },
		{ "IP_ZONE_1_SECRET_X2", 3444 },
		{ "IP_ZONE_2_X1", 3468 },
		{ "IP_ZONE_2_X2", 3480 },
		{ "IP_ZONE_2_STORY_X1", 3492 },
		{ "IP_ZONE_2_STORY_X2", 3504 },
		{ "IP_ZONE_2_SECRET_R1", 3516 },
		{ "IP_ZONE_2_SECRET_X1", 3540 },
		{ "IP_ZONE_2_SECRET_X2", 3528 },
		{ "IP_ZONE_2_LIGHTHOUSE_R1", 3552 },
		{ "IP_ZONE_2_LIGHTHOUSE_X1", 3576 },
		{ "IP_ZONE_2_LIGHTHOUSE_X2", 3564 },
		{ "IP_ZONE_2_CODE_R1", 3588 },
		{ "IP_ZONE_2_CODE_X1", 3600 },
		{ "IP_ZONE_2_CODE_X2", 3612 },
		{ "IP_ZONE_2_CODE_X3", 3624 },
		{ "IP_ZONE_3_X1", 3636 },
		{ "IP_ZONE_3_STORY_X1", 3648 },
		{ "IP_ZONE_3_STORY_X2", 3660 },
		{ "IP_ZONE_3_SECRET_R1", 3672 },
		{ "IP_ZONE_3_SECRET_X1", 3696 },
		{ "IP_ZONE_3_SECRET_X2", 3684 },
		{ "IP_ZONE_3_ENTRANCE_R1", 3708 },
		{ "IP_ZONE_3_ENTRANCE_X1", 3720 },
		{ "IP_ZONE_3_ENTRANCE_X2", 3732 },
		{ "IP_ZONE_3_ENTRANCE_X3", 3744 },
		{ "IP_ZONE_3_LAB_R1", 3756 },
		{ "IP_ZONE_3_LAB_X1", 3768 },
		{ "IP_ZONE_3_LAB_X2", 3804 },
		{ "IP_ZONE_3_LAB_X3", 3780 },
		{ "IP_ZONE_3_LAB_X4", 3792 },
		{ "IP_MAP_PROJECTION_1_X1", 3816 },
		{ "IP_MAP_PROJECTION_2_X1", 3828 },
		{ "IP_MAP_PROJECTION_3_X1", 3840 },
		{ "IP_ZONE_4_X2", 3852 },
		{ "IP_ZONE_4_X3", 3864 },
		{ "IP_ZONE_4_X4", 3876 },
		{ "IP_ZONE_4_STORY_X1", 3888 },
		{ "IP_ZONE_4_STORY_X2", 3900 },
		{ "IP_PRISON_R1", 3912 },
		{ "IP_PRISON_R2", 3924 },
		{ "IP_PRISON_X1", 3936 },
		{ "IP_PRISON_X2", 3948 },
		{ "IP_DREAM_LAKE_R1", 3960 },
		{ "IP_DREAM_LAKE_R2", 3972 },
		{ "IP_DREAM_LAKE_X1", 3984 },
		{ "IP_DREAM_LAKE_X2", 3996 },
		{ "IP_SARCOPHAGUS_R1", 4020 },
		{ "IP_SARCOPHAGUS_R2", 4032 },
		{ "IP_SARCOPHAGUS_R3", 4044 },
		{ "IP_SARCOPHAGUS_R4", 4008 },
		{ "IP_SARCOPHAGUS_X2", 4056 },
		{ "IP_SARCOPHAGUS_X3", 4068 },
		{ "IP_SARCOPHAGUS_X4", 4080 },
		{ "IP_DREAM_ZONE_1_R1", 4092 },
		{ "IP_DREAM_ZONE_1_X1", 4104 },
		{ "IP_DREAM_ZONE_1_X2", 4116 },
		{ "IP_DREAM_ZONE_1_X3", 4128 },
		{ "IP_DREAM_LIBRARY_1_R1", 4140 },
		{ "IP_DREAM_LIBRARY_1_X1", 4152 },
		{ "IP_DREAM_LIBRARY_1_X2", 4164 },
		{ "IP_DREAM_1_STORY_X1", 4176 },
		{ "IP_DREAM_1_STORY_X2", 4188 },
		{ "IP_DREAM_1_RULE_X1", 4200 },
		{ "IP_DREAM_ZONE_2_R1", 4212 },
		{ "IP_DREAM_ZONE_2_X1", 4224 },
		{ "IP_DREAM_ZONE_2_X2", 4236 },
		{ "IP_DREAM_ZONE_2_X3", 4248 },
		{ "IP_DREAM_LIBRARY_2_R1", 4260 },
		{ "IP_DREAM_LIBRARY_2_X1", 4272 },
		{ "IP_DREAM_LIBRARY_2_X2", 4284 },
		{ "IP_DREAM_2_STORY_X1", 4296 },
		{ "IP_DREAM_2_STORY_X2", 4308 },
		{ "IP_DREAM_2_RULE_X1", 4320 },
		{ "IP_DREAM_2_RULE_X2", 4332 },
		{ "IP_DREAM_ZONE_3_R1", 4344 },
		{ "IP_DREAM_ZONE_3_X1", 4356 },
		{ "IP_DREAM_ZONE_3_X2", 4368 },
		{ "IP_DREAM_LIBRARY_3_R1", 4380 },
		{ "IP_DREAM_LIBRARY_3_X1", 4392 },
		{ "IP_DREAM_LIBRARY_3_X2", 4404 },
		{ "IP_DREAM_3_STORY_X1", 4416 },
		{ "IP_DREAM_3_STORY_X2", 4428 },
		{ "IP_DREAM_3_RULE_X1", 4440 }
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
	vars.createSetting("DLCSplits", "DLC Splits", "Choose where you want the game to split, but only if you are on version 1.1.10 or later", true);

	settings.CurrentDefaultParent = "GeneralSplits";
		vars.createSetting("_deathImpact", "First death from Impact", "Like jumping off a cliff ;;)", false);
		vars.createSetting("_deathHP", "First death from HP loss", "Like a campfire ;;)", false);
		vars.createSetting("_deathFish", "First death from DaFishy", "chomp", false);
		vars.createSetting("_sleep", "Sleep", "", false);
		vars.createSetting("_wearSuit", "Wear spacesuit", "", false);
		vars.createSetting("_firstWarp", "Use a warp pad", "Any warp pad in the Solar System", false);
		vars.createSetting("_warpCore", "Grab a warp core", "Any kind of warp core, 'vessel', 'broken' and the HEL ones", false);
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
	vars.createSetting("_menuSplit", "Split when quitting back to the menu", "", false);
	vars.createSetting("_menuReset", "Reset the timer when quitting back to the menu", "", false);
	vars.createSetting("_menuResetLite", " ˪ Same but ONLY if you do before splitting", "", false);
    vars.createSetting("_saveFile", "Auto delete progression while keeping Launch Codes /!\\ OVERWRITE SAVEFILE", "Automatically overwrite your savefile when the timer isn't running to erase everything except the launch codes.\nUse it by clicking \"Resume expedition\"", false);

	settings.CurrentDefaultParent = "DLCSplits";
	vars.createSetting("Signals", "Signals", "", false);
	vars.createSetting("Facts", "Facts & Rumors", "", false);
	vars.createSetting("FreeSplits", "General DLC Splits - hover to read instructions", "Choose what split you want in the Stranger\nRULES\n· Only one split at a time is considered\n· You can use both the free splits and the regular splits in the same run\n· You can select several sub-options, the first one to be validated will trigger the split\n", false);

	for (int i = 0; i < 8; i++) {
		settings.CurrentDefaultParent = "FreeSplits";
    	vars.createSetting("_dlc" + i.ToString(), "Free Split " + (i + 1).ToString(), "", false);
		settings.CurrentDefaultParent = "_dlc" + i.ToString();
		vars.createSetting("_dlc" + i.ToString() + "CloakEnter", "Stranger In", "", false);
		vars.createSetting("_dlc" + i.ToString() + "CloakExit", "Stranger Out", "", false);
		vars.createSetting("_dlc" + i.ToString() + "RingEnter", "Ring In", "", false);
		vars.createSetting("_dlc" + i.ToString() + "RingExit", "Ring Out", "", false);
		vars.createSetting("_dlc" + i.ToString() + "DreamEnter", "Dream In", "", false);
		vars.createSetting("_dlc" + i.ToString() + "DreamExit", "Dream Out", "", false);
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
  		vars.createSetting("_sig" + item, item, "", false);
	}

	settings.CurrentDefaultParent = "Facts";
	vars.createSetting("_X", "Facts", "", false);
	vars.createSetting("_R", "Rumors", "", false);
	foreach (var item in vars.facts.Keys) {
		settings.CurrentDefaultParent = "_" + item[item.Length - 2];
  		vars.createSetting("_fact" + item, item, "", false);
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
			throw;
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

print("__STARTUP END__");
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

	//Steam 1.0.7  CFF646D642E49E06FBE02DACAA7747E0 
	//Epic  1.0.7  D2EBA93197CB5DBAAF23748E3657352F 
	//Steam 1.1.10 8AC2F7475D483025CF94EF3027A58CE7 
	//Epic  1.1.10 AD7A9F942E657193C8124B1FE0A89CB5
	if(MD5Hash == "8AC2F7475D483025CF94EF3027A58CE7" || MD5Hash == "AD7A9F942E657193C8124B1FE0A89CB5")
		version = "1.1.10";
	else if (MD5Hash == "CFF646D642E49E06FBE02DACAA7747E0" || MD5Hash == "D2EBA93197CB5DBAAF23748E3657352F")
		version = "1.0.7";
	else version = "unknown";
    print("Game version = " + version);

	vars.splitSignals = new List<int[]> {};
	vars.splitFacts = new List<int[]> {};

	IntPtr ptrLocator = IntPtr.Zero;
	while(ptrLocator == IntPtr.Zero && !vars.debug) {
		if(version == "1.1.10" || version == "unknown")
			ptrLocator = vars.signatureScan(game, "LOCATOR v.1.1.10", 43, "0F84 ???????? 41 83 3F 00 49 BA ???????????????? 49 8B CF 66 90 49 BB ???????????????? 41 FF D3 48 8B C8 48 B8");
		if (ptrLocator != IntPtr.Zero) {
			version = "1.1.10";
			break;
		}
		if(version == "1.0.7" || version == "unknown")
			ptrLocator = vars.signatureScan(game, "LOCATOR v.1.0.7", 49, "0F84 ???????? 41 83 3F 00 49 BA ???????????????? 49 8B CF 48 83 EC 20 49 BB ???????????????? 41 FF D3 48 83 C4 20 48 8B C8 48 B8");
		if (ptrLocator != IntPtr.Zero) {
			version = "1.0.7";
			break;
		}
		if (ptrLocator == IntPtr.Zero){
			vars.loop++;
			System.Threading.Thread.Sleep(2000 * vars.loop);
		}
		if(vars.loop == 10)
			vars.debug = true;
	}
	
if (!vars.debug) {
	IntPtr ptrTime = IntPtr.Zero;
	while(ptrTime == IntPtr.Zero) {;
		if (version == "1.1.10")
			ptrTime = vars.signatureScan(game, "OW_TIME v.1.1.10", 14, "F3 0F2A C8 F3 0F5A C9 F2 0F5E C1 48 B8");
		else
			ptrTime = vars.signatureScan(game, "OW_TIME v.1.0.7", 18, "F3 0F5A C0 48 63 45 FC F2 0F2A C8 F2 0F5E C1 48 B8");
		if (ptrTime == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	IntPtr ptrLoad = IntPtr.Zero;
	while (ptrLoad == IntPtr.Zero) {
		if (version == "1.1.10")
			ptrLoad = vars.signatureScan(game, "LOAD_MANAGER v.1.1.10", 20, "55 48 8B EC 48 81 EC ???????? 48 89 75 F8 48 8B F1 48 B8 ???????????????? 48 8B 00 48 85 C0 75 15 48 B8");
		else
			ptrLoad = vars.signatureScan(game, "LOAD_MANAGER v.1.0.7", 14, "55 48 8B EC 56 48 83 EC 78 48 8B F1 48 B8");
		if (ptrLoad == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	IntPtr ptrProfile = IntPtr.Zero;
	while(ptrProfile == IntPtr.Zero && version == "1.1.10") {
			//Profile manager getsharedinstance
		ptrProfile = vars.signatureScan(game, "Profile v.1.1.10", 10, "55 48 8b ec 48 83 ec 20 48 b8 ???????????????? 48 8b 00 48 85 c0 75 29");
		if (ptrProfile == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	if (version == "1.1.10") {
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

	if (version == "1.1.10") {
//LOCATOR_1_1_10________________________________________________________________________________________________
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
	//---
	//Locator - 0xD0 _audioMixer - 0xCA _isSleepingAtCampfire
	vars.isSleepingAtCampfire = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xD0, 0xCA));
	//---
	//Locator - 0xE0 _deathManager - 0x20 _isDying
	vars.isDying = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xE0, 0x20));//0x21 for _isDead
	//Locator - 0xE0 _deathManager - 0x2c _deathType
	vars.deathType = new MemoryWatcher<int>(new DeepPointer(Locator + 0xE0, 0x2C));//6 = BigBang
	//---
	//Locator - 0x158 _eyeStateManager - 0x1C _state
	vars.eyeState = new MemoryWatcher<int>(new DeepPointer(Locator + 0x158, 0x1C));
	//Locator - 0x158 _eyeStateManager - 0x20 _initialized
	vars.eyeInitialized = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x158, 0x20));
	//---
	//Locator - 0x160 _timelineObliterationController - 0x40 _cameraEffect - 0x145 _isRealityShatterEffectComplete
	vars.isRealityShatterEffectComplete = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x160, 0x40, 0x145));
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
	//---
	//Locator - 0x1A0 _dreamWorldController - 0x131 _exitingDream
	vars.exitingDream = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1A0, 0x131));
	//Locator - 0x1A0 _dreamWorldController - 0x133 _insideDream
	vars.insideDream = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1A0, 0x133));
	//Locator - 0x1A0 _dreamWorldController - 0xA0 _dreamArrivalPoint - 0x48 DreamArrivalPoint.Location
	vars.dreamLocation = new MemoryWatcher<int>(new DeepPointer(Locator + 0x1A0, 0xA0, 0x48));
	
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
	vars.pauseLoading = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x21));//WHen quitting to the menu (and other maybe)
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

	if (timer.CurrentTimingMethod == 0) {
		timer.CurrentTimingMethod++;
		print("Timing Method Changed!");
	}

print("__INIT END__");
print("\n~Running Outer Wilds Autosplitter V.1.2.2~\n");
}
else
	print("DEBUG/ERROR MODE\n~NOT Running Outer Wilds Autosplitter V.1.2.2\n~");
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

	if(version == "1.1.10" && (settings["Signals"] || settings["Facts"])) {
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
	
//	if(vars.fixedTimestep.Current == vars.frame)
//	 print("FTS = " + vars.fixedTimestep.Current);

	if (!vars.menu && vars.loadCompare(0, 1, -1, 1, true))
		vars.menu = true;
	else if(vars.menu && ((vars.pauseSleeping.Old && !vars.pauseSleeping.Current) || (vars.loadCompare(3, 0, 3, 1, true))))
		vars.menu = false;
	else if(vars.loadCompare(2, 0, 2, 0, true) || vars.loadCompare(0, 3, 2, 2, false))
		vars.load = !vars.menu;
	else if(vars.pauseInitializing.Old && !vars.pauseInitializing.Current)
		vars.load = false;
}

//Start the timer if it returns TRUE
start {
	if (vars.cleanValues && vars.pauseInitializing.Current) {
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
		vars.splitSignals = new List<int[]> {};
		foreach (var item in vars.signals) {
			if(settings["_sig" + item.Key])
			vars.splitSignals.Add(new int[] { item.Value, 1 });
		}
		vars.splitFacts = new List<int[]> {};
		foreach (var item in vars.facts) {
			if(settings["_fact" + item.Key])
			vars.splitFacts.Add(new int[] { item.Value, 1 });
		}
		vars.numDlcSplits = 0;
		for (int i = 0; i < 8; i++) 
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
		vars.cleanValues = false;
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
		throw;
		}
	}
	if (vars.pauseSleeping.Old && !vars.pauseSleeping.Current) {
		vars.cleanValues = true;
		return true;
	}
}

//'Pause' the timer if it returns TRUE
isLoading {
    return(vars.load || vars.menu || (vars.isSleepingAtCampfire.Current && !vars.exitingDream.Current));
}

//Reset the timer if it returns TRUE
reset {
	return (settings["GeneralOptions"] && (settings["_menuReset"] || (settings["_menuResetLite"] && timer.CurrentSplitIndex == 0)) && vars.menu);
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
		else if (settings["_firstWarp"] && !vars.splits["_firstWarp"] && vars.inWarpField.Current && !vars.inWarpField.Old) {
			vars.splits["_firstWarp"] = true;
			return true;
		}
		else if (!vars.splits["_warpCore"] && vars.heldItem.Current == 2 && vars.promptItem.Old == 3 && vars.promptItem.Current > 3) {
			vars.splits["_warpCore"] = true;
			return (settings["_warpCore"]);
		}
		else if (settings["_exitWarp"] && !vars.splits["_exitWarp"] && !vars.inWarpField.Current && vars.inWarpField.Old && vars.splits["_warpCore"]) {
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

	if (version == "1.1.10") {
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
			if (vars.writeTime != System.IO.File.GetLastWriteTime(vars.path)) {
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
					throw;
				}
				vars.ret = false;
				if (vars.splitSignals.Count > 0) {
					foreach (var item in vars.splitSignals) {
//						print("item = " + arr[item[0]]);
						if (item[1] == 1 && arr[item[0]] == ":true,") {
							item[1] = 0;
							vars.ret = true;
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
//						print("item = " + arr[vars.tmp + item[0]] + " | " + arr[vars.tmp + item[0] + 7]);
						if ((vars.tmp + item[0] + 7 < arr.Length) && item[1] == 1 && arr[vars.tmp + item[0] + 7] != ":-1,") {
							item[1] = 0;
							vars.ret = true;
						}
					}
				}
				if (vars.ret /*&& ___*/) {
					return true;
				}
			}
		}
	}
	return false;
}
