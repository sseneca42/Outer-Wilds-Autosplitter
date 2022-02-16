state("OuterWilds") {}

startup
{
	vars.Log = (Action<object>)(output => print("[Outer Wilds] " + output));
	vars.Unity = Assembly.Load(File.ReadAllBytes(@"Components\UnityASL.bin")).CreateInstance("UnityASL.Unity");

	vars.CompletedSplits = new List<string>();
	vars.DEFAULT_TIMESTEP = 1f / 60f;
	vars.SPLIT_CONDITIONS = new Dictionary<string, Func<bool>>
	{
		{ "deathImpact",    () => vars.Unity["deathType"].Old != 1 && vars.Unity["deathType"].Current == 1 },
		{ "deathHP",        () => !vars.Unity["isDying"].Old && vars.Unity["isDying"].Current },
		{ "deathFish",      () => vars.Unity["deathType"].Old != 5 && vars.Unity["deathType"].Current == 5 },
		{ "sleep",          () => !vars.Unity["isSleepingAtCampfire"].Old && vars.Unity["isSleepingAtCampfire"].Current },
		{ "wearSuit",       () => !vars.Unity["isWearingSuit"].Old && vars.Unity["isWearingSuit"].Current },
		{ "firstWarp",      () => !vars.Unity["inWarpField"].Old && vars.Unity["inWarpField"].Current },
		{ "warpCore",       () => vars.CompletedSplits.Contains("firstWarp") && vars.Unity["promptItem"].Old == 3 && vars.Unity["promptItem"].Current > 3 && vars.Unity["heldItem"].Current == 2 },
		{ "exitWarp",       () => vars.CompletedSplits.Contains("warpCore") && vars.Unity["inWarpField"].Old && !vars.Unity["inWarpField"].Current },
		{ "dBramble",       () => !vars.Unity["inBrambleDimension"].Old && vars.Unity["inBrambleDimension"].Current },
		{ "dBrambleVessel", () => !vars.Unity["inVesselDimension"].Old && vars.Unity["inVesselDimension"].Current },
		{ "qMoonIn",        () => !vars.Unity["inQuantumMoon"].Old && vars.Unity["inQuantumMoon"].Current },
		{ "vesselWarp",     () => !vars.Unity["eyeInitialized"].Old && vars.Unity["eyeInitialized"].Current },
		{ "eyeSurface",     () => vars.Unity["eyeState"].Old != 10 && vars.Unity["eyeState"].Current == 10 },
		{ "eyeTunnel",      () => vars.Unity["eyeState"].Old != 20 && vars.Unity["eyeState"].Current == 20 },
		{ "eyeObservatory", () => vars.Unity["eyeState"].Old != 40 && vars.Unity["eyeState"].Current == 40 },
		{ "eyeMap",         () => vars.Unity["eyeState"].Old != 50 && vars.Unity["eyeState"].Current == 50 },
		{ "eyeInstruments", () => vars.Unity["eyeState"].Old != 80 && vars.Unity["eyeState"].Current == 80 },
		{ "bigBang",        () => vars.Unity["deathType"].Old != 6 && vars.Unity["deathType"].Current == 6 },
		{ "dst",            () => !vars.Unity["isRealityShatterEffectComplete"].Old && vars.Unity["isRealityShatterEffectComplete"].Current }
	};

	dynamic[,] sett =
	{
		{ null, "general", "Options", false, null },
			{ "general", "menuSplit",     "Split when quitting back to the menu",                                        false, null },
			{ "general", "menuReset",     "Reset the timer when quitting back to the menu",                              false, null },
			{ "general", "menuResetLite", " ┗ Same but ONLY if you do before splitting",                                 false, null },
			{ "general", "saveFile",      "Auto delete progression while keeping Launch Codes /!\\ OVERWRITES SAVEFILE", false, "Overwrites your savefile when timer starts to erase everything except launch codes.\nYou must reset the timer before quitting out!\nUse by clicking \"Resume expedition\"." },
			{ "general", "forceVersion",  "Force the autosplitter to run for a specific game version",                   false, "Restart the game for this to take effect!\nSelecting a wrong version may break the autosplitter." },
				{ "forceVersion", "v107",  "1.0.7",            false, null },
				{ "forceVersion", "v1110", "1.1.10 or 1.1.11", false, null },
				{ "forceVersion", "v1112", "1.1.12",           false, null },

		{ null, "splits", "Splits", true, "Choose where you want the game to split,\nby default only works the first time an event happens." },
			{ "splits", "deathImpact",    "First death from impact",                  false, "Like jumping off a cliff." },
			{ "splits", "deathHP",        "First death from HP loss",                 false, "Like a campfire." },
			{ "splits", "deathFish",      "First death from DaFishy",                 false, "chomp" },
			{ "splits", "sleep",          "Sleep",                                    false, null },
			{ "splits", "wearSuit",       "Wear spacesuit",                           false, null },
			{ "splits", "firstWarp",      "Use a warp pad",                           false, "Any warp pad in the Solar System." },
			{ "splits", "warpCore",       "Grab the warp core",                       false, null },
			{ "splits", "exitWarp",       "Use a warp pad while holding a warp core", false, null },
			{ "splits", "dBramble",       "Enter Dark Bramble",                       false, null },
			{ "splits", "dBrambleVessel", "Enter the vessel node in Dark Bramble",    false, null },
			{ "splits", "qMoonIn",        "Enter the Quantum Moon",                   false, null },
			{ "splits", "vesselWarp",     "Warp to the Eye of the Universe",          false, null },
			{ "splits", "eyeSplits",      "Eye Splits",                               false, null },
				{ "eyeSplits", "eyeSurface",     "Warp to the Eye surface",            false, null },
				{ "eyeSplits", "eyeTunnel",      "Enter the tunnel",                   false, null },
				{ "eyeSplits", "eyeObservatory", "Reach the observatory",              false, null },
				{ "eyeSplits", "eyeMap",         "Observe the map in the observatory", false, null },
				{ "eyeSplits", "eyeInstruments", "Start the 'Instrument Hunt'",        false, null },
			{ "splits", "bigBang", "BigBang",           true, "Last split of most categories,\ncan be kept on all the time." },
			{ "splits", "dst",     "Destroy Spacetime", true, "Last split of the Destroy Spacetime category." },

		{ null, "dlc", "DLC Splits", false, "Choose where you want the game to split,\nbut only if you are on version 1.1.10 or later." },
			{ "dlc", "signals",    "Signals",                                         false, null },
			{ "dlc", "facts",      "Facts & Rumors [WIP]",                            false, null },
				{ "facts", "stranger", "Stranger", false, null },
				{ "facts", "other",    "Other",    false, null },
			{ "dlc", "freeSplits", "General DLC Splits - hover to read instructions", false, "Only one split at a time is considered.\nYou can use both the free splits and the regular splits in the same run.\nYou can select several sub-options, the first one to be validated will trigger the split." }
	};

	for (int i = 0; i < sett.GetLength(0); ++i)
	{
		settings.Add(sett[i, 1], sett[i, 3], sett[i, 2], sett[i, 0]);
		settings.SetToolTip(sett[i, 1], sett[i, 4]);
	}

	for (int i = 0; i < 8; ++i)
	{
		var dlc = "dlc" + i;
		settings.Add(dlc, false, "Free Split " + (i + 1), "freeSplits");
			settings.Add(dlc + "CloakEnter", false, "Enter the Stranger Cloak", dlc);
			settings.Add(dlc +  "CloakExit", false, "Exit the Stranger Cloak", dlc);
			settings.Add(dlc +  "RingEnter", false, "Enter the Ring World", dlc);
			settings.Add(dlc +   "RingExit", false, "Exit the Ring World", dlc);
			settings.Add(dlc + "DreamEnter", false, "Enter the Dream World", dlc);
			settings.Add(dlc +  "DreamExit", false, "Exit the Dream World", dlc);

		for (int j = 1; j < 3; ++j)
		{
			var dream = dlc + (j == 1 ? "DreamEnter" : "DreamExit");
			settings.Add(dream +   "Any", false, "Any", dream);
			settings.Add(dream + "Zone1", false, "Shrouded Woodlands | River Lowlands", dream);
			settings.Add(dream + "Zone2", false, "Starlit Cove                 | Cinder Isles", dream);
			settings.Add(dream + "Zone3", false, "Endless Canyon          | Hidden Gorge", dream);
			settings.Add(dream + "Zone4", false, "Subterranean Lake     | Submerged Structure", dream);
		}
	}

	Func<System.Xml.Linq.XElement, string, string> attr = (e, id) => e.Attribute(id).Value;

	var data = System.Xml.Linq.XDocument.Parse(File.ReadAllText(@"Components\OuterWildsData.xml")).Element("OWData");
	vars.SignalName = data.Element("Signals").Elements("Signal").ToDictionary(e => int.Parse(attr(e, "ID")), e => attr(e, "Name"));

	foreach (var signal in vars.SignalName.Values)
		settings.Add("signal" + signal, false, signal, "signals");

	foreach (var fact in data.Element("Facts").Element("Stranger").Elements("Fact"))
	{
		var name = attr(fact, "Name");
		var desc = attr(fact, "Description");
		settings.Add("fact" + name, false, desc == "" ? name : desc, "stranger");
	}

	foreach (var fact in data.Element("Facts").Element("Other").Elements("Fact"))
	{
		var name = attr(fact, "Name");
		var desc = attr(fact, "Description");
		settings.Add("fact" + name, false, desc == "" ? name : desc, "other");
	}
}

onStart
{
	vars.CompletedSplits.Clear();

	vars.Load = false;
	vars.Menu = false;
	current.DLCSplit = 0;

	for (int i = 0; i < 8; ++i)
	{
		if (settings["dlc" + i]) ++vars.DLCSplitsCount;
		else break;
	}
}

init
{
	vars.Load = false;
	vars.Menu = false;
	vars.DLCSplitsCount = 0;
	current.DLCSplit = 0;

	var ptrSize = game.Is64Bit() ? 0x8 : 0x4;

	vars.Unity.TryOnLoad = (Func<dynamic, bool>)(helper =>
	{
		var list = helper.GetClass("mscorlib", "List`1");
		var dict = helper.GetClass("mscorlib", "Dictionary`2");
		var str = helper.GetClass("mscorlib", "String");
		int strLength = str["m_stringLength"], strStart = str["m_firstChar"];

		#region StandaloneProfileManager
		vars.Log("Finding save file path...");

		var spm = helper.GetClass("Assembly-CSharp", "StandaloneProfileManager");
		if (spm.Static == IntPtr.Zero || spm.Fields.Count == 0)
		{
			Thread.Sleep(5000);
			return false;
		}

		var pd = helper.GetClass("Assembly-CSharp", "ProfileData");

		vars.SaveFilePath = "";
		IntPtr nameStr, pathStr;
		new DeepPointer(spm.Static + spm["s_instance"], spm["_currentProfile"], pd["profileName"], 0x0).DerefOffsets(game, out nameStr);
		new DeepPointer(spm.Static + spm["s_instance"], spm["_profilesPath"], 0x0).DerefOffsets(game, out pathStr);

		int nameLen = game.ReadValue<int>(nameStr + strLength), pathLen = game.ReadValue<int>(pathStr + strLength);
		string name = game.ReadString(nameStr + strStart, nameLen * 2), path = game.ReadString(pathStr + strStart, pathLen * 2);

		vars.SaveFilePath = path + "/" + name + "/data.owsave";

		vars.Log("  => " + vars.SaveFilePath);
		#endregion

		#region Locator
		vars.Log("Starting Locator initialization...");

		var locator = helper.GetClass("Assembly-CSharp", "Locator");

		var pcc = helper.GetClass("Assembly-CSharp", "PlayerCharacterController");
		vars.Unity.Make<bool>(locator.Static, locator["_playerController"], pcc["_isWearingSuit"]).Name = "isWearingSuit";
		vars.Unity.Make<bool>(locator.Static, locator["_playerController"], pcc["_inWarpField"]).Name = "inWarpField";

		var tms = helper.GetClass("Assembly-CSharp", "ToolModeSwapper");
		var it = helper.GetClass("Assembly-CSharp", "ItemTool");
		var owItem = helper.GetClass("Assembly-CSharp", "OWItem");
		vars.Unity.Make<int>(locator.Static, locator["_toolModeSwapper"], tms["_itemCarryTool"], it["_heldItem"], owItem["_type"]).Name = "heldItem";
		vars.Unity.Make<int>(locator.Static, locator["_toolModeSwapper"], tms["_itemCarryTool"], it["_promptState"]).Name = "promptItem";

		var psd = helper.GetClass("Assembly-CSharp", "PlayerSectorDetector");
		vars.Unity.Make<bool>(locator.Static, locator["_playerSectorDetector"], psd["_inBrambleDimension"]).Name = "inBrambleDimension";
		vars.Unity.Make<bool>(locator.Static, locator["_playerSectorDetector"], psd["_inVesselDimension"]).Name = "inVesselDimension";

		var owAm = helper.GetClass("Assembly-CSharp", "OWAudioMixer");
		vars.Unity.Make<bool>(locator.Static, locator["_audioMixer"], owAm["_sleepingAtCampfire"]).Name = "isSleepingAtCampfire";

		var dMng = helper.GetClass("Assembly-CSharp", "DeathManager");
		vars.Unity.Make<bool>(locator.Static, locator["_deathManager"], dMng["_isDying"]).Name = "isDying";
		vars.Unity.Make<int>(locator.Static, locator["_deathManager"], dMng["_deathType"]).Name = "deathType";

		var esMng = helper.GetClass("Assembly-CSharp", "EyeStateManager");
		vars.Unity.Make<int>(locator.Static, locator["_eyeStateManager"], esMng["_state"]).Name = "eyeState";
		vars.Unity.Make<bool>(locator.Static, locator["_eyeStateManager"], esMng["_initialized"]).Name = "eyeInitialized";

		var cfc = helper.GetClass("Assembly-CSharp", "CloakFieldController");
		vars.Unity.Make<bool>(locator.Static, locator["_cloakFieldController"], cfc["_playerInsideCloak"]).Name = "playerInsideCloak";

		var rwc = helper.GetClass("Assembly-CSharp", "RingWorldController");
		vars.Unity.Make<bool>(locator.Static, locator["_ringWorldController"], rwc["_playerInsideRingWorld"]).Name = "playerInsideRingWorld";

		var dwc = helper.GetClass("Assembly-CSharp", "DreamWorldController");
		var dap = helper.GetClass("Assembly-CSharp", "DreamArrivalPoint");
		vars.Unity.Make<bool>(locator.Static, locator["_dreamWorldController"], dwc["_exitingDream"]).Name = "exitingDream";
		vars.Unity.Make<bool>(locator.Static, locator["_dreamWorldController"], dwc["_insideDream"]).Name = "insideDream";
		vars.Unity.Make<int>(locator.Static, locator["_dreamWorldController"], dwc["_dreamArrivalPoint"], dap["_location"]).Name = "dreamLocation";

		var tloc = helper.GetClass("Assembly-CSharp", "TimelineObliterationController");
		var pcec = helper.GetClass("Assembly-CSharp", "PlayerCameraEffectController");
		vars.Unity.Make<bool>(locator.Static, locator["_timelineObliterationController"], tloc["_cameraEffect"], pcec["_isRealityShatterEffectComplete"]).Name = "isRealityShatterEffectComplete";

		var qm = helper.GetClass("Assembly-CSharp", "QuantumMoon");
		vars.Unity.Make<bool>(locator.Static, locator["_quantumMoon"], qm["_isPlayerInside"]).Name = "inQuantumMoon";

		vars.Log("Locator initialization complete.");
		#endregion

		#region OWTime
		vars.Log("Starting OWTime initialization...");

		var owTime = helper.GetClass("Assembly-CSharp", "OWTime");

		vars.Unity.Make<bool>(owTime.Static, owTime["s_pauseFlags"], ptrSize * 4 + 0x0).Name = "pauseMenu";
		vars.Unity.Make<bool>(owTime.Static, owTime["s_pauseFlags"], ptrSize * 4 + 0x1).Name = "pauseLoading";
		vars.Unity.Make<bool>(owTime.Static, owTime["s_pauseFlags"], ptrSize * 4 + 0x3).Name = "pauseSleeping";
		vars.Unity.Make<bool>(owTime.Static, owTime["s_pauseFlags"], ptrSize * 4 + 0x4).Name = "pauseInitializing";
		vars.Unity.Make<float>(owTime.Static, owTime["s_fixedTimestep"]).Name = "fixedTimestep";

		vars.Unity["fixedTimestep"].Update(game);
		if (vars.Unity["fixedTimestep"].Current != vars.DEFAULT_TIMESTEP)
		{
			var mbox = MessageBox.Show(timer.Form,
				"The physics rate of the game seems to have been modified. Please use the 60 FPS when running.\n"+
				"For further questions, please join and ask on the Discord server, or visit the troubleshooting website.\n\n" +
				"Would you like to open the website now?",
				"LiveSplit | Outer Wilds",
				MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

			if (mbox == DialogResult.Yes)
				Process.Start("https://mobiusdigitalgames.com/supportforum.html");
		}

		vars.Log("OWTime initialization complete.");
		#endregion

		#region LoadManager
		vars.Log("Starting LoadManager initialization...");

		var loadMng = helper.GetClass("Assembly-CSharp", "LoadManager");

		vars.Unity.Make<int>(loadMng.Static, loadMng["s_currentScene"]).Name = "currentScene";
		vars.Unity.Make<int>(loadMng.Static, loadMng["s_loadingScene"]).Name = "loadingScene";
		vars.Unity.Make<int>(loadMng.Static, loadMng["s_fadeType"]).Name = "fadeType";
		vars.Unity.Make<bool>(loadMng.Static, loadMng["s_allowAsyncTransition"]).Name = "allowAsync";

		vars.Log("LoadManager initialization complete.");
		#endregion

		#region PlayerData
		vars.Log("Starting PlayerData initialization...");

		var pld = helper.GetClass("Assembly-CSharp", "PlayerData");
		var gs = helper.GetClass("Assembly-CSharp", "GameSave");

		vars.KnownSignals = (Func<List<string>>)(() =>
		{
			var ret = new List<string>();

			IntPtr dictPtr;
			new DeepPointer(pld.Static + pld["_currentGameSave"], gs["knownSignals"], 0x0).DerefOffsets(game, out dictPtr);

			var count = game.ReadValue<int>(dictPtr + (int)(dict["count"]));
			var entries = game.ReadPointer(dictPtr + (int)(dict["entries"]));
			for (int i = 0; i < count; ++i)
			{
				var slot = entries + (ptrSize * 4) + (ptrSize * 2 * i);
				if (!game.ReadValue<bool>(slot + 0xC)) continue;

				ret.Add(vars.SignalName[game.ReadValue<int>(slot + 0x8)]);
			}

			return ret;
		});

		vars.NewFactIDs = (Func<List<string>>)(() =>
		{
			var ret = new List<string>();

			IntPtr listPtr;
			new DeepPointer(pld.Static + pld["_currentGameSave"], gs["newlyRevealedFactIDs"], 0x0).DerefOffsets(game, out listPtr);

			var count = game.ReadValue<int>(listPtr + (int)(list["_size"]));
			var items = game.ReadPointer(listPtr + (int)(list["_items"]));
			for (int i = 0; i < count; ++i)
			{
				var slot = items + (ptrSize * 4) + ptrSize * i;
				IntPtr strPtr = game.ReadPointer(slot);
				var len = game.ReadValue<int>(strPtr + (int)(str["m_stringLength"]));

				ret.Add(game.ReadString(strPtr + (int)(str["m_firstChar"]), len * 2));
			}

			return ret;
		});

		vars.Log("PlayerData initialization complete.");
		#endregion

		return true;
	});

	vars.LoadCompare = (Func<int, int, int, int, bool, bool>)((o_loadScene, c_loadScene, c_currentScene, fadeType, allowAsync) =>
	{
		int w_o_lS = vars.Unity["loadingScene"].Old, w_c_lS = vars.Unity["loadingScene"].Current, w_c_cS = vars.Unity["currentScene"].Current, w_fT = vars.Unity["fadeType"].Current;
		bool w_aA = vars.Unity["allowAsync"].Current;

		return w_o_lS == o_loadScene && w_c_lS == c_loadScene && w_fT == fadeType && w_aA == allowAsync
		       && (c_currentScene == -1 || w_c_cS == c_currentScene);
	});

	vars.Unity.Load(game);
}

update
{
	if (!vars.Unity.Loaded) return false;

	vars.Unity.Update();

	if (!vars.Menu && vars.LoadCompare(0, 1, -1, 1, true))
	{
		vars.Menu = true;
	}
	else if (vars.Menu && vars.Unity["pauseSleeping"].Old && !vars.Unity["pauseSleeping"].Current || vars.LoadCompare(3, 0, 3, 1, true))
	{
		vars.Menu = false;
	}
	else if (vars.LoadCompare(2, 0, 2, 0, true) || vars.LoadCompare(0, 3, 2, 2, false))
	{
		vars.Load = !vars.Menu;
	}
	else if (vars.Unity["pauseInitializing"].Old && !vars.Unity["pauseInitializing"].Current)
	{
		vars.Load = false;
	}
}

start
{
	return vars.Unity["pauseSleeping"].Old && !vars.Unity["pauseSleeping"].Current;
}

split
{
	if (settings["menuSplit"] && vars.Unity["pauseMenu"].Old && vars.Unity["pauseLoading"].Current)
		return true;

	foreach (var split in vars.SPLIT_CONDITIONS)
	{
		if (!settings[split.Key] || vars.CompletedSplits.Contains(split.Key) || !split.Value()) continue;

		vars.CompletedSplits.Add(split.Key);
		return true;
	}

	if (version == "1.0.7") return;

	if (settings["freeSplits"])
	{
		if (current.DLCSplit >= vars.DLCSplitsCount) return;

		var dlc = "dlc" + current.DLCSplit;
		if (settings[dlc + "CloakEnter"] && !vars.Unity["playerInsideCloak"].Old && vars.Unity["playerInsideCloak"].Current
		    || settings[dlc + "CloakExit"] && vars.Unity["playerInsideCloak"].Old && !vars.Unity["playerInsideCloak"].Current
		    || settings[dlc + "RingEnter"] && vars.Unity["playerInsideRingWorld"].Current && !vars.Unity["playerInsideRingWorld"].Old
		    || settings[dlc + "RingExit"] && !vars.Unity["playerInsideRingWorld"].Current && vars.Unity["playerInsideRingWorld"].Old
		    || settings[dlc + "DreamEnter"] && vars.Unity["insideDream"].Current && !vars.Unity["insideDream"].Old
		    && (settings[dlc + "DreamEnterAny"]
		        || settings[dlc + "DreamEnterZone1"] && vars.Unity["dreamLocation"].Current == 100
		        || settings[dlc + "DreamEnterZone2"] && vars.Unity["dreamLocation"].Current == 200
		        || settings[dlc + "DreamEnterZone3"] && vars.Unity["dreamLocation"].Current == 300
		        || settings[dlc + "DreamEnterZone4"] && vars.Unity["dreamLocation"].Current == 400)
		    || settings[dlc + "DreamExit"] && !vars.Unity["insideDream"].Current && vars.Unity["insideDream"].Old
		    && (settings[dlc + "DreamExitAny"]
		        || settings[dlc + "DreamExitZone1"] && vars.Unity["dreamLocation"].Current == 100
		        || settings[dlc + "DreamExitZone2"] && vars.Unity["dreamLocation"].Current == 200
		        || settings[dlc + "DreamExitZone3"] && vars.Unity["dreamLocation"].Current == 300
		        || settings[dlc + "DreamExitZone4"] && vars.Unity["dreamLocation"].Current == 400))
		{
			++current.DLCSplit;
			return true;
		}
	}

	if (!settings["signals"] && !settings["facts"]) return;

	foreach (var signal in vars.KnownSignals())
	{
		if (!settings["signal" + signal] || vars.CompletedSplits.Contains(signal)) continue;

		vars.CompletedSplits.Add(signal);
		return true;
	}

	foreach (var fact in vars.NewFactIDs())
	{
		if (!settings["fact" + fact] || vars.CompletedSplits.Contains(fact)) continue;

		vars.CompletedSplits.Add(fact);
		return true;
	}
}

reset
{
	if (!vars.Menu) return;

	return settings["menuReset"] || settings["menuResetLite"] && timer.CurrentSplitIndex == 0;
}

isLoading
{
	return vars.Load || vars.Menu || vars.Unity["isSleepingAtCampfire"].Current && !vars.Unity["exitingDream"].Current;
}

exit
{
	timer.IsGameTimePaused = true;
	vars.Unity.Reset();
}

shutdown
{
	vars.Unity.Reset();
}
