//Download dbgview to see the comments.
state("OuterWilds") {}

//1.1.5 -Added a split for the Destroy Spacetime category & forces the timer to compare against 'Game Time' at launch
//1.1.4 -Added an option for resetting on quit out when you haven't splited yet
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

print("__STARTUP END__");
}

//Launched whenever a game process has been found (potentially multiple times, when the game is restarted for example)
init
{
print("__INIT START__");

	IntPtr ptrLocator = IntPtr.Zero;
	while(ptrLocator == IntPtr.Zero){
		ptrLocator = vars.signatureScan(game, "Locator", 49, "0F84 ???????? 41 83 3F 00 49 BA ???????????????? 49 8B CF 48 83 EC 20 49 BB ???????????????? 41 FF D3 48 83 C4 20 48 8B C8 48 B8");
		if (ptrLocator == IntPtr.Zero)
			System.Threading.Thread.Sleep(1000);
	}

	IntPtr ptrTime = IntPtr.Zero;
	while(ptrTime == IntPtr.Zero) {
		ptrTime = vars.signatureScan(game, "OW_Time", 18, "F3 0F5A C0 48 63 45 FC F2 0F2A C8 F2 0F5E C1 48 B8");
	}

	IntPtr ptrLoad = IntPtr.Zero;
	while (ptrLoad == IntPtr.Zero) {
		ptrLoad = vars.signatureScan(game, "LoadManager", 14, "55 48 8B EC 56 48 83 EC 78 48 8B F1 48 B8");
	}

	IntPtr Locator = (IntPtr)(game.ReadValue<long>(ptrLocator));
	print("|\nPOINTER Locator : 0x" + Locator.ToString("X8") + "\n|");

	IntPtr OW_Time = (IntPtr)(game.ReadValue<long>(ptrTime));
	print("|\nPOINTER OW_Time : 0x" + OW_Time.ToString("X8") + "\n|");

	IntPtr Load = (IntPtr)(game.ReadValue<long>(ptrLoad));
	print("|\nPOINTER LoadManager : 0x" + Load.ToString("X8") + "\n|");


	//LOCATOR_______________________________________________________________________________________________________
	//Locator - 0x8 _playerController - 0x131 _isWearingSuit
	vars.isWearingSuit = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x8, 0x131));
	//Locator - 0x8 _playerController - 0x13C _inWarpField
	vars.inWarpField = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x8, 0x13C));
	//---
	//Locator - 0x28 _toolModeSwapper - 0x40 _itemCarryTool - 0x80 _heldItem - 0x64 _type
	vars.heldItem = new MemoryWatcher<int>(new DeepPointer(Locator + 0x28, 0x40, 0x80, 0x64));// 2 = WarpCore (not broken)
	//Locator - 0x28 _toolModeSwapper - 0x40 _itemCarryTool - 0xA8 _promptState
	vars.promptItem = new MemoryWatcher<int>(new DeepPointer(Locator + 0x28, 0x40, 0xA8));
	//Locator - 0x28 _toolModeSwapper - 0x50 _firstPersonManipulator - 0x30 _focusedItemSocket - 0x70 _isVesselClassSlot
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
	//Locator - 0x1C8 _playerSectorDetector - 0x15C _isPlayerInside
	vars.inQuantumMoon = new MemoryWatcher<bool>(new DeepPointer(Locator + 0x1C8, 0x15C));

	//OW_TIME_______________________________________________________________________________________________________
	//OW_Time 0x20 s_pauseFlags (bool[7])
	vars.pauseMenu = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x20));//When in the ESC Menu
	vars.pauseLoading = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x21));//WHen quitting to the menu (and other maybe)
	vars.pauseSleeping = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x23));//Before waking up (loop beginning)
	vars.pauseInitializing = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x24));//When you see the "Save icon" more or less

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
		vars.sceneC, vars.scene, vars.fadeT, vars.allowAsync,
		vars.isWearingSuit,
		vars.inWarpField, vars.heldItem, vars.promptItem,
		vars.inBrambleDimension, vars.inVesselDimension,
		vars.inQuantumMoon,
		vars.eyeState, vars.eyeInitialized,
		vars.isSleepingAtCampfire,
		vars.isDying, vars.deathType,
		vars.isRealityShatterEffectComplete
	};

	if (timer.CurrentTimingMethod == 0) {
		timer.CurrentTimingMethod++;
		print("Timing Method Changed!");
	}

print("__INIT END__");
print("\nStart Running Outer Wild's Autosplitter V.1.1.5");
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
	return false;
}
