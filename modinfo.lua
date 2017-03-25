-- Mod Template

package.path = package.path .. ";data/scripts/mods/?.lua"
local Config = require("infinionsys/config")

local Mod = {}

-- Info for ModLoader
Mod.info = 
{
	name= Config.modName,
	version= Config.modVersion,
	description=Config.modDescription,
	author="infal",
	website="",
	icon="",
	dependency =
	{
		["Simple Mod Loader"]={ major=1, minor=2, revision=0 }
	},
	playerScript=nil,
	onInitialize=nil,
}

Mod.onInitialize = function()
	-- This is all the code necessary to get NPCs to drop the custom modules at random.
	
	-- Give all military ships a small chance to drop ACTS and MCTS
	registerSystemUpgradeAsLoot(Config.scriptATCS, NPC.Military, ShipClass.Any, Config.distribution, Config.chanceMilitaryDropATCS)
	registerSystemUpgradeAsLoot(Config.scriptMTCS, NPC.Military, ShipClass.Any, Config.distribution, Config.chanceMilitaryDropMTCS)
	
	-- Give all civilian ships a small chance to drop ACTS and CTCS
	registerSystemUpgradeAsLoot(Config.scriptATCS, NPC.Civilian, ShipClass.Any, Config.distribution, Config.chanceCivilianDropATCS)
	registerSystemUpgradeAsLoot(Config.scriptCTCS, NPC.Civilian, ShipClass.Any, Config.distribution, Config.chanceCivilianDropCTCS)
	
	-- Give all mining ships a better chance to drop CTCS
	registerSystemUpgradeAsLoot(Config.scriptCTCS, NPC.Civilian, ShipClass.AnyMiner, Config.distribution, Config.chanceMinerDropCTCS)
	
	-- Give military ships a better chance of dropping MTCS the larger the ship
	registerSystemUpgradeAsLoot(Config.scriptMTCS, NPC.Military, ShipClass.Cruiser, Config.distribution, Config.chanceCruiserDropMTCS)
	registerSystemUpgradeAsLoot(Config.scriptMTCS, NPC.Military, ShipClass.Destroyer, Config.distribution, Config.chanceDestroyerDropMTCS)
	registerSystemUpgradeAsLoot(Config.scriptMTCS, NPC.Military, ShipClass.Dreadnought, Config.distribution, Config.chanceDreadnoughtDropMTCS)
	registerSystemUpgradeAsLoot(Config.scriptMTCS, NPC.Military, ShipClass.Battleship, Config.distribution, Config.chanceBattleshipDropMTCS)
	
	-- Add the admin ui module to the mod loader admin ui
	registerAdminUIModule(Config.modName, Config.scriptAdminUI)
end

return Mod