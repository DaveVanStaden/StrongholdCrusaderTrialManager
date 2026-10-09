CRUSADER TRIAL MANAGER
Version 1.0

Customize the opponents and castles in Stronghold Crusader: Definitive Edition's original singleplayer trails.

GET STARTED

1. Extract this entire ZIP to a folder on your PC.
2. Install the official SHCDE BepInEx loader into your game folder:
   https://gitlab.com/rawra-stronghold-crusader/shcde-bepinex/-/releases
   Use the loader package, not the source archive.
3. Close the game and open CrusaderTrialManager-1.0.exe.
4. Check the game folder, then click Install mod from this package.
5. Enable replacements and select a trail, mission and opponent.
6. Choose a lord, AI profile and castle. Click Apply replacement.
7. Click Save changes or Save & play, then start a new mission from the trail menu.

Keep the executable, plugin DLL and installation scripts together. If Windows denies access to your game folder, run the app as administrator for installation.

OPPONENTS AND CASTLES

Each opponent is configured separately. Duplicate lords are numbered and show their player position. Settings are independent for every mission.

Default / let the game choose leaves castle selection to the game. Selecting a specific castle supplies that design for every castle variant. You can retain the original lord and change only its castle.

Built-in lords offer their default AI profile plus installed native custom profiles associated with that lord. Their Castle menu also offers installed custom castles. A custom lord offers the profiles included in its own package.

Reset this opponent restores its original settings. Turning off Enable replacements preserves your choices and uses original opponents in subsequent new missions.

CUSTOM LORDS

Native Workshop lords installed in the game's Steam library appear automatically. Use Refresh installed lords after adding or updating a pack.

For built-in lords, native .lordjson profiles and .aivjson castles are discovered in local ExtendedLords folders and installed Workshop folders named after that lord, such as Rat, Richard or Trader. Merchant, Philip and Kahinah folder aliases are recognized. A custom lord is not automatically attached to its native parent: Rascal remains a separate lord.

To attach loose files yourself, select a built-in replacement or Keep original lord for a mission opponent, then click Import AI / castle. Choose one or more .lordjson or .aivjson files. They are copied into TrailManager/LordAssets under the selected lord. Choose them from AI profile and Castle, apply and save. AI and castle choices are independent, and the built-in lord keeps its name and portrait.

Import lord folder copies a native lord package into the game's TrailManager/Lords folder. Select the folder containing .lordjson AI profiles, .aivjson castles and an optional avatar.png portrait. Choose that lord from an opponent's replacement menu.

Workshop files remain in their installed folders. Unsubscribing can make a configured lord unavailable. Imported copies remain available locally. Packs and portraits are not included with this download.

The native parent lord supplies speech and other assets not provided by the pack. Lua scripts, Script Extender metadata and custom audio extensions are not supported. Script Extender is not required for native lord packs.

COMPATIBILITY

Windows x64 with .NET Framework 4.5 or later, Steam game build 24816905 / V2.8.2, and the SHCDE BepInEx loader.

Supports 100 missions across Crusader, Warchest and Extreme. Warchest missions display as 51-80. Expansion lords require their content to be available in the game.

Start a new mission from the trail menu to apply changes. Loading saves, in-mission restart, multiplayer, co-op, custom trails and other DLC trails are outside this release's supported scope.

The mod checks the game build before applying changes. Game updates may require a new compatible release. Original game DLLs are not modified on disk.

UPDATING

This version does not check for or download updates automatically. To update, download and extract a newer release, close the game, open the new app and click Install mod from this package. The installer replaces the tracked plugin, keeps a backup and preserves your mission settings. Keep the app and plugin from the same release together.

REMOVAL AND TROUBLESHOOTING

Close the game, right-click Uninstall.ps1 and choose Run with PowerShell. Enter your game folder when asked. Only tracked, unchanged installation files are removed. Profiles, imported lords, logs and backups are retained. If this mod's installer previously installed and tracked loader files, those unchanged files are removed too.

Right-click the status text at the bottom of the app to open the mod log. Settings are stored in TrailManager/profile.xml inside the game folder.

This is an independent community mod. Stronghold Crusader: Definitive Edition and its assets belong to their respective owners.


