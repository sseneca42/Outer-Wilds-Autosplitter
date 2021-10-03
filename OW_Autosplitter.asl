//Download dbgview to see the comments.
state("OuterWilds") {}

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
	vars.timer = new TimerModel { CurrentState = timer };
	vars.load = false;
    vars.menu = false;
	vars.cleanValues = true;
	vars.frame = (float)1/60;
	vars.loop = 0;
	vars.currDlcSplit = 0;
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
	vars.createSetting = (Func<string, string, string, bool, bool>)((name, description, tooltip, enabled) => {
		settings.Add(name, enabled, description);
		settings.SetToolTip(name, tooltip);
		return true;
	});

	//
	vars.createSetting("GeneralSplits", "Splits", "Choose where you want the game to split, by default only works the first time an event happens", true);
	vars.createSetting("GeneralOptions", "Options", "", false);
	//
	vars.createSetting("DLC", "DLC - hover to read instructions", "Choose what split you want in the Stranger\nRULES\n· Only one split at a time is considered\n· You can use both the free splits and the regular splits in the same run\n· You can select several sub-options, the first one to be validated will trigger the split\n", false);
	//
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
	vars.createSetting("_menuResetLite", "Reset the timer when quitting back to the menu ONLY if you do before splitting", "", false);
	vars.createSetting("_exitReset", "Reset the timer when closing the game", "", false);
    
	settings.CurrentDefaultParent = "DLC";
	for (int i = 0; i < 10; i++) {
		settings.CurrentDefaultParent = "DLC";
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

//

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

	IntPtr ptrLocator = IntPtr.Zero;
//*
	while(ptrLocator == IntPtr.Zero){
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
			return;
	}
	vars.loop = 0;
//*/
	IntPtr ptrTime = IntPtr.Zero;
//*
	while(ptrTime == IntPtr.Zero) {;
		if (version == "1.1.10")
			ptrTime = vars.signatureScan(game, "OW_TIME v.1.1.10", 14, "F3 0F2A C8 F3 0F5A C9 F2 0F5E C1 48 B8");
		else
			ptrTime = vars.signatureScan(game, "OW_TIME v.1.0.7", 18, "F3 0F5A C0 48 63 45 FC F2 0F2A C8 F2 0F5E C1 48 B8");
		if (ptrTime == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}
//*/
	IntPtr ptrLoad = IntPtr.Zero;
//*
	while (ptrLoad == IntPtr.Zero) {
		if (version == "1.1.10")
			ptrLoad = vars.signatureScan(game, "LOAD_MANAGER v.1.1.10", 20, "55 48 8B EC 48 81 EC ???????? 48 89 75 F8 48 8B F1 48 B8 ???????????????? 48 8B 00 48 85 C0 75 15 48 B8");
		else
			ptrLoad = vars.signatureScan(game, "LOAD_MANAGER v.1.0.7", 14, "55 48 8B EC 56 48 83 EC 78 48 8B F1 48 B8");
		if (ptrLoad == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}
//*/

	IntPtr Locator = (IntPtr)(game.ReadValue<long>(ptrLocator));
	print("|\nPOINTER Locator : 0x" + Locator.ToString("X8") + "\n|");

	IntPtr OW_Time = (IntPtr)(game.ReadValue<long>(ptrTime));
	print("|\nPOINTER OW_Time : 0x" + OW_Time.ToString("X8") + "\n|");

	IntPtr Load = (IntPtr)(game.ReadValue<long>(ptrLoad));
	print("|\nPOINTER LoadManager : 0x" + Load.ToString("X8") + "\n|");

	if(version == "1.1.10") {
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

	//______________________________________________________________________________________________________________

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
		vars.playerInsideCloak, vars.playerInsideRingWorld, vars.insideDream, vars.dreamLocation
	};

	if (timer.CurrentTimingMethod == 0) {
		timer.CurrentTimingMethod++;
		print("Timing Method Changed!");
	}

	vars.numDlcSplits = 0;
	for (int i = 0; i < 10; i++) 
	{
		if (settings["_dlc" + i.ToString()])
			vars.numDlcSplits++;
		else
			break;
	}	
	print("Number of free dlc splits = " + vars.numDlcSplits);

print("__INIT END__");
print("\n~Running Outer Wilds Autosplitter V.1.2.1~\n");
}

//Launched when the game process is exited
exit {
	print("__EXITING THE GAME__\n");
	if(settings["GeneralOptions"] && settings["_exitReset"])
    	vars.timer.Reset();
	timer.IsGameTimePaused = true;
}

//Run in a loop after INIT. If the timer isn't running, is followed by START. If the timer is running, is followed by ISLOADING, RESET and SPLITS.
update {
	vars.watchers.UpdateAll(game);
	
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
	if (vars.cleanValues) {
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
		vars.cleanValues = false;
		vars.currDlcSplit = 0;
	}
	if (vars.pauseSleeping.Old && !vars.pauseSleeping.Current) {
		vars.cleanValues = true;
		return true;
	}
}

//'Pause' the timer if it returns TRUE
isLoading {
    return(vars.load || vars.menu || vars.isSleepingAtCampfire.Current);
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
	//print("settings = " + settings["DLC"] + "" + settings["_dlc" + vars.currDlcSplit.ToString() + "CloakEnter"] + "\nsplits curr = " + vars.currDlcSplit + " num = " + vars.numDlcSplits);
	if (version == "1.1.10" && settings["DLC"]) {
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
	return false;
}
