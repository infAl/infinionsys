--[[---------------------------------------------------------------------------

	This file contains all of the strings and configurable values for the mod
	and could be edited for language localisation

--]]---------------------------------------------------------------------------

-- Make config a module so that it can be referenced as a local object
-- rather than having a bunch of globals
local t = {}

t.modName = "Infinion Corporation Faction Modules"
t.modVersion = {major=1, minor=0, revision=0}
t.modDescription = "Adds system upgrades that are slightly better than standard modules."


-- Config
t.chanceMilitaryDropATCS = 2 -- [1 - 100] Percent chance of a military ship dropping the atcs
t.chanceMilitaryDropMTCS = 5 -- [1 - 100] Percent chance of a military ship dropping the mtcs

t.chanceCivilianDropATCS = 1 -- [1 - 100] Percent chance of a civilian ship dropping the atcs
t.chanceCivilianDropCTCS = 5 -- [1 - 100] Percent chance of a civilian ship dropping the ctcs

t.chanceMinerDropCTCS = 23 -- [1 - 100] Percent chance of a mining ship dropping the ctcs

t.chanceCruiserDropMTCS = 10 -- [1 - 100] Percent chance of a cruiser dropping the mtcs
t.chanceDestroyerDropMTCS = 17 -- [1 - 100] Percent chance of a destroyer dropping the mtcs
t.chanceDreadnoughtDropMTCS = 24 -- [1 - 100] Percent chance of a dreadnought dropping the mtcs
t.chanceBattleshipDropMTCS = 35 -- [1 - 100] Percent chance of a battleship dropping the mtcs

t.distribution =
{
	[5] = 0.1,	-- legendary
	[4] = 4,	-- exotic
	[3] = 64,	-- exceptional
	[2] = 160,	-- rare
	[1] = 0,	-- uncommon
	[0] = 0,	-- common
}

t.energyFactor = 1.0 -- Energy required for modules is multiplied by this number. If you think they use too much power, make the number 0.5 or whatever
t.priceFactor = 1.0 -- Price for modules is multiplied by this number


-- Scripts
local dir = "data/scripts/mods/infinionsys/"
t.scriptATCS = dir .. "infinion_atcs.lua"
t.scriptMTCS = dir .. "infinion_mtcs.lua"
t.scriptCTCS = dir .. "infinion_ctcs.lua"
t.scriptAdminUI = dir .. "adminui.lua"


-- Admin UI
t.adminUI = "Admin UI"
t.playersOnline = "Players Online"
t.moduleLabel = "Infinion Corporation Faction Modules"


-- System Upgrades
t.genDescription = "Manufactured to Infinion Corporation specifications"

t.atcsName = "Infinion Corporation Turret Control System A-TCS-%i"
t.atcsDescription = "All-round Turret Control System"
t.allTurrets = "All Turrets"

t.ctcsName = "Infinion Corporation Turret Control System C-TCS-%i"
t.ctcsDescription = "Civil Turret Control System"
t.unarmedTurrets = "Unarmed Turrets"

t.mtcsName = "Infinion Corporation Turret Control System M-TCS-%i"
t.mtcsDescription = "Military Turret Control System"
t.armedTurrets = "Armed Turrets"


return t
















