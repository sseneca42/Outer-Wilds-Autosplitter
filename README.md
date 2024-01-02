# Outer-Wilds-Autosplitter
*If you have any comment or issue with the autosplitter or this README, contact me on Discord Nepo#2778.<br>
Any help or suggestion is appreciated!*<br>
*Join the [Outer Wilds Speedrunning Discord Server](https://discord.gg/pW4cqtEqUh)!*

## What is this?
This is a load remover and autosplitter made for Outer Wilds on PC, usable with [Livesplit](https://livesplit.org/).<br>
__Features:__<br>
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

4 - In `Settings` you can select exactly where you want the autosplitter to split. (The sub-options will be ignored if the parent option isn't activated)<br>

![Settings](https://github.com/sseneca42/Outer-Wilds-Autosplitter/blob/main/Images/Image3_SettingsScreen.png)<br>

5 - Don't forget to edit your splits to match the one you choosed.<br><br>
*-When you close Livesplit you will be asked if you want to save your splits and layout, say YES or you will have to start everything all over again.<br>*

## Troubleshooting
If you have any issue or question you can join the Outer Wilds Speedrunning [Discord Server](https://discord.gg/T69zH3UnSZ) and contact me `Nepo#2778` or send me a message on [speedrun.com](https://www.speedrun.com/user/Nepo)<br>
If you do not find what you need here do not hesitate to contact me, it would even be appreciated because it could help fix new issues before they impact more people.<br>

### __GENERAL TROUBLESHOOTING__<br>
* Be sure that you do not have 'Scriptable Auto Splitter' in your Layout Editor [Right click on LiveSplit -> Click on "Edit Layout..." -> Select the element you want to delete and click on the *"-"* button].<br>
* Be sure that you followed the steps detailed in the __"How to use it?"__ section, check that you activated the Auto Splitter in the __Splits Editor__ and that the splits you want to use (and their parent options) are all checked in the __Options__.<br>
* Try launching Livesplit as an administrator.<br>
* Try launching Livesplit in Windows 8 Compatibility Mode.<br>
* Do not let the game running in the background right after launching it, you should be at least on the main menu before you tab out.<br>

### __IF YOU GOT AN ERROR MESSAGE:__<br>
* A new update or a mod being installed can impact the autosplitter, if you have used mods in the past you should verify your files.<br>
Here is how to verify your files on STEAM:<br>
   * <sub>In your game list right click on Outer Wilds -> Click on "Properties..." -> Click on "Local Files" -> Click on "Verify integrity of game files".<br>Launch the game through the mod manager when you want to play with them again.</sub><br>

  Alternatively or if you don't use Steam, you can keep multiple installs of the game, here is how to do that:<br>
   * <sub>Locate your games files. Default locations: <br>-Steam: X:\Program Files\Steam\steamapps\common\Outer Wilds<br>-Epic Games: X:\Program Files\Epic Games\Outer Wilds<br>For example if you installed mods you can rename your install to something else than Outer Wilds like "Outer Wilds Mods" and reinstall the game, you will now have the game installed twice, once with mods, once without. Then when you want to play with mods again rename both installs so that the modded one is named "Outer Wilds".<br>You can also keep your other installs in another place and move them in and out. No matter how you do it, the file named "Outer Wilds" that is in the good emplacement will be the one used. </sub><br>

### __IF LIVESPLIT CANNOT FIND THE AUTOSPLITTER:__<br>
* Try to reinstall/move Livesplit to another location.<br>

### __KNOWN ISSUES:__<br>
* Incompatible with Windows 7 (and below?)<br>
* Incompatible with the Xbox launcher version<br>

_I'm sorry, as of now I do not have access to Windows 7 and I do not know if it is even possible to counter the protections put in place by Microsoft on the Xbox version.<br>
If this impacts you you can still run the game, just let us know what your issue is and your runs will be retimed after you submit them._

## Patchnote and futur improvements
__1.0.0__<br>
-Initial release<br>
__1.1.0__<br>
-Added Splits and Options. Too much to list<br>
__1.1.1__<br>
-Fixed issues with the "warp core related" splits, the _exitWarp split is now triggered at the end of the warping animation.<br>
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
-Added descriptions to the Stranger's 100% Splits + WarpCore split fix + Secret Settings modification warning<br>
__1.2.4__<br>
-Now works for 1.0.7, 1.1.10, 1.1.11 & 1.1.12<br>
__1.2.5__<br>
-Now also works for 1.1.13<br>
__1.2.6__<br>
-Maintenance and bug fixes<br>
__1.2.7__<br>
-Reworked the splits to better match current usage, added death splits. Reworked scanning so that it stops searching if the target is not found.<br>
__1.2.8__<br>
-Added an error message when scanning fails. Reworked the facts splits so that they work regardless of the savefile organisation<br>
__NEXT :__<br>
-Put the fact splits informations and the save file in separate files
-Rework the fact splits to support any fact, so that mod campaigns can potentially be plugged in and work as well
-Complete descriptions for every 100% splits
-Put the conditions for the normal splits in a list, simply for the sake of cleanliness
-Add comments

## Pantheon of gratitude

* Thanks to __turkwinif__ for helping me several times during the development of the early versions and for handling most of the retiming + plenty of other things.<br>
* Thanks to everybody who took on their time to help me and reported issues, especially __frodododo__, __Skywalker__ and __zid__.<br>
* Thanks to __DevilSquirrel__ for their guide on making Autosplitters for Unity games and thanks to __Ero__ for teaching me how to use the Cheat Engine's mono dissect tool properly.<br>
