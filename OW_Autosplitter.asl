//Download dbgview to see the comments.
state("OuterWilds") {}

startup
{
	vars.timer = new TimerModel { CurrentState = timer };
	vars.load = false;
    vars.menu = false;

	vars.signatureScan = (Func<Process, IntPtr, string, int, string, IntPtr>)((proc, ptr, name, offset, target) => {

		print("____________\n" + name + " attempt\n____________");
		foreach (var page in proc.MemoryPages())
		{
			var scanner = new SignatureScanner(proc, page.BaseAddress, (int)page.RegionSize);
			if (ptr == IntPtr.Zero)
			{
				ptr= scanner.Scan(new SigScanTarget(offset,target));
			}
			if (ptr != IntPtr.Zero) {
				print("---------------------------------\n" + name + " address found at: 0x" + ptr.ToString("X8") + "\n---------------------------------");
				break;
			}
		}
		return(ptr);

	});

	vars.loadCompare = (Func<int, int, int, int, bool, bool>)((loadingSceneOld, loadingSceneCurrent, currentScene, fadeType, asyncTransition) => {
		if(loadingSceneOld==vars.scene.Old && loadingSceneCurrent==vars.scene.Current)
			return((currentScene==vars.sceneC.Current || currentScene==-1) && fadeType==vars.fadeT.Current && asyncTransition==vars.allowAsync.Current);
		return(false);
	});

//    settings.Add("Splits", false, "AUTO SPLITS (only the first time the action is performed)");
//	settings.SetToolTip("Splits", "What even is a tooltip");
//	settings.CurrentDefaultParent = "Splits";
}
	
init
{
	print("init start");

IntPtr ptrLocator = IntPtr.Zero;
while(ptrLocator == IntPtr.Zero)
{
	ptrLocator = vars.signatureScan(game, ptrLocator, "Locator", 49, "0F84 ???????? 41 83 3F 00 49 BA ???????????????? 49 8B CF 48 83 EC 20 49 BB ???????????????? 41 FF D3 48 83 C4 20 48 8B C8 48 B8");
}

IntPtr ptrTime = IntPtr.Zero;
while(ptrTime == IntPtr.Zero)
{
	ptrTime = vars.signatureScan(game, ptrTime, "OW_Time", 18, "F3 0F5A C0 48 63 45 FC F2 0F2A C8 F2 0F5E C1 48 B8");
}

IntPtr ptrLoad = IntPtr.Zero;
while(ptrLoad == IntPtr.Zero)
{
	ptrLoad = vars.signatureScan(game, ptrLoad, "LoadManager", 14, "55 48 8B EC 56 48 83 EC 78 48 8B F1 48 B8");
}

	IntPtr Locator = (IntPtr)(game.ReadValue<long>(ptrLocator));
	print("|\nPOINTER Locator : " + Locator.ToString("X8") + "\n|");

	IntPtr OW_Time = (IntPtr)(game.ReadValue<long>(ptrTime));
	print("|\nPOINTER OW_Time : " + OW_Time.ToString("X8") + "\n|");

	IntPtr Load = (IntPtr)(game.ReadValue<long>(ptrLoad));
	print("|\nPOINTER LoadManager : " + Load.ToString("X8") + "\n|");

//____________________________________________________________________________________________________
	vars.isSleepingAtCampfire = new MemoryWatcher<bool>(new DeepPointer(Locator + 0xC8, 0xA0));
	vars.deathType = new MemoryWatcher<int>(new DeepPointer(Locator + 0xD8, 0x24));
//____________________________________________________________________________________________________
	//OW_Time s_pauseFlags bool[7] 0x20
	vars.pauseMenu = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x20));//Menu ESC
	vars.pauseLoading = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x21));//Quit to menu
	vars.pauseSleeping = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x23));//Before waking up
	vars.pauseInitializing = new MemoryWatcher<bool>(new DeepPointer(OW_Time - 0x10, 0x24));//"Save icon"
//____________________________________________________________________________________________________
	//LoadManager - 0xc s_currentScene
	vars.sceneC = new MemoryWatcher<int>(new DeepPointer(Load - 0x38 + 0xc));//0x10));
	//LoadManager - 0x10 s_loadingScene
	vars.scene = new MemoryWatcher<int>(new DeepPointer(Load - 0x38 + 0x10));//0x10));
	//LoadManager - 0x24 s_fadeType
	vars.fadeT = new MemoryWatcher<int>(new DeepPointer(Load - 0x38 + 0x24));//0x18));
	//LoadManager - 0x20 s_allowAsyncTransition
	vars.allowAsync = new MemoryWatcher<bool>(new DeepPointer(Load - 0x38 + 0x20));//0x1E));
//____________________________________________________________________________________________________

	vars.watchers = new MemoryWatcherList() {
		vars.pauseMenu,
		vars.pauseLoading,
		vars.pauseSleeping,
		vars.pauseInitializing,
		vars.sceneC,
		vars.scene,
		vars.fadeT,
		vars.allowAsync,
		vars.isSleepingAtCampfire,
		vars.deathType
	};

	print("init end");
}

update {

	if(vars.scene.Current != vars.scene.Old)
	print("|\n sceneLoadingCurrent : " + vars.scene.Current + "\n sceneLoadingOld : " + vars.scene.Old + "\n CurrentScene : " + vars.sceneC.Current + "\n fadeT : " + vars.fadeT.Current + "\n allowAsync : " + vars.allowAsync.Current + "\n|");


	vars.watchers.UpdateAll(game);

	if (vars.loadCompare(0, 1, -1, 1, true))
		vars.menu = true;
	else if(vars.pauseSleeping.Old && !vars.pauseSleeping.Current)
		vars.menu = false;
	else if(vars.loadCompare(2, 0, 2, 0, true) || vars.loadCompare(0, 3, 2, 2, false))
		vars.load = !vars.menu;
	else if(vars.pauseInitializing.Old && !vars.pauseInitializing.Current)
		vars.load = false;
}

isLoading{
    return(vars.load || vars.menu || vars.isSleepingAtCampfire.Current);
}

reset{
    return (false);
}

split{
	if(vars.deathType.Current == 6 && vars.deathType.Old != 6)
		return(true);
	return(false);
}

start{
    vars.load = false;
    vars.menu = false;
    return(vars.pauseSleeping.Old && !vars.pauseSleeping.Current);
}

exit {
    vars.timer.Reset();
}