# Outer-Wilds-Autosplitter
*If you have any comment or issue with the autosplitter or this README, contact me on Discord Nepo#2778.<br>
Any help or suggestion is appreciated!*<br>
*Join the [Outer Wilds Speedrun Discord Server](https://discord.gg/T69zH3UnSZ)!*

## What is this?
This is a load remover and autosplitter made for Outer Wilds on PC, usable with [Livesplit](https://livesplit.org/).<br>
__Features :__<br>
* Pause the timer when sleeping.<br>
* Pause the timer when quitting out to the menu - Unpause when waking up after resuming the expedition.<br>
* Pause the timer when the game is loading [after a death, after the status cutscene, when warping to the eye].<br>
* Start the run.<br>
* Choose when you want to split/reset *(+ some other details)* in the settings.<br>

## How to use it?

[Download Livesplit](https://livesplit.org/downloads/)<br>
0 - Right click on LiveSplit -> "Compare Against" -> Choose "Game Time".<br>
1 - Right click on LiveSplit -> Click on "Edit Splits...".<br>
2 - Select "Outer Wilds" in the `Game Name` field.<br>

![Select the game you are running](https://github.com/sseneca42/Outer-Wilds-Autosplitter/blob/main/Images/Image1_GameName.png)<br>

3 - Click on `Activate` [1] and then click on `Settings` [2]. Click on `Website` [3] to open this github page.<br>

![Active the Autosplitter and click on 'Settings'](https://github.com/sseneca42/Outer-Wilds-Autosplitter/blob/main/Images/Image2_ActivateSettings.png)<br>

4 - In `Settings` you can select exactly where you want the autosplitter to split, depending notably of the category you are running. (The sub-options will be ignored if the parent option isn't activated)<br>

![Settings](https://github.com/sseneca42/Outer-Wilds-Autosplitter/blob/main/Images/Image3_SettingsScreen.png)<br>

5 - __Be sure that the your timing method is "Game Time"__<br>
&nbsp;&nbsp; [Right click on LiveSplit -> Compare against -> Game Time]<br>
&nbsp;&nbsp;&nbsp; or<br>
&nbsp;&nbsp; [Right click on LiveSplit -> Click on "Edit Layout..." -> Click on "Layout Settings" -> Click on the "Timer" tab -> Check "Timing Method"]<br>
6 - Don't forget to edit your splits to match the one you choosed.<br><br>
*-When you close Livesplit you will be asked if you want to save your splits and layout, say YES or you will have to start everything all over again.<br>*

## Troubleshooting
If you have any issue or question you can contact me on Discord `Nepo#2778` or send me a message on [speedrun.com](https://www.speedrun.com/user/Nepo)<br>

__If Livesplit cannot find the autosplitter :__<br>
-Try to reinstall/move Livesplit to another location. (Let me know if you have more details)<br>

__If the autosplitter does not work as expected or does not start :__<br>
-Be sure that you do not have 'Scriptable Auto Splitter' in your Layout Editor [Right click on LiveSplit -> Click on "Edit Layout..." -> Select the element you want to delete and click on the *"-"* button].<br>
-Be sure that you followed the steps detailed in the __"How to use it?"__ section (*especially step 5*), check that you activated the Auto Splitter in the __Splits Editor__ and that the splits you want to use (and their parent options) are all checked in the __Options__.<br>
-A new Update or a mod being installed *could* impact the autosplitter, let me know if you notice anything.<br>
-Try launching Livesplit as an administrator.<br>
-You can install [DebugView](https://docs.microsoft.com/en-us/sysinternals/downloads/debugview) to see the comments, it probably won't help you much though.<br>

__Known issue·s :__<br>
-

## Patchnote and futur improvements
__1.0.0__<br>
-Initial release.<br>
__1.1.0__<br>
-Added Splits and Options.<br>
-Too much to list.<br>
__1.1.1__<br>
-Fixed issue with the "warp core related" splits that caused them not to be activable again if you activated them once, even after starting a new expedition.<br>
-The _exitWarp split is now triggered at the end of the warping animation.<br>
__1.1.2__<br>
-Changed the "_firstDeath" split into 3 different splits : -Loss of HP Death -Impact Death -Anglerfish Death.<br>
__1.1.3__<br>
-Added a split option for entering the Quantum Moon<br>
__1.1.4__<br>
-Added an option for resetting on quit out when you haven't splited yet<br>
__1.1.5__<br>
-Added a split for the Destroy Spacetime category & forces the timer to compare against 'Game Time'<br>
__1.2.0__<br>
-Updated for the DLC, now support at least 1.0.7 & 1.1.10<br>
__1.2.1__<br>
-Added "Free Splits" for the dlc, with the possibility to split when entering/exiting the Stranger/Ring/Dream World.<br>
__1.2.2__<br>
-Added 100% Splits & Signals Splits + an option to reset your savefile automatically + a lot of smaller stuff<br>
__1.2.3__<br>
-Added descriptions to the Stranger's 100% Splits + WarpCore split fix + Secret Settings modification warning<br><br>
__NEXT :__<br>
-Complete descriptions for every 100% splits
-Improved scanning performance (?)

## Pantheon of gratitude

* Thanks __turkwinif__ for helping me several times during the development of the early versions and thank you for handling most of the retiming and plenty of other things.<br>
* Thanks to everybody who took on their time to help me and reported issues, especially __frodododo__, __Skywalker__ and __zid__.<br>
* Thanks to __DevilSquirrel__ for their guide on making Autosplitters for Unity games and thanks to __Ero__ for teaching me how to use the Cheat Engine's mono dissect tool properly.<br>
