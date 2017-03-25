--[[---------------------------------------------------------------------------

	This script is a System Upgrade. It is based on the standard civiltcs
	script but is a "faction module" that gives better stats.

--]]---------------------------------------------------------------------------

package.path = package.path .. ";data/scripts/mods/?.lua"
local Config = require("infinionsys/config")

package.path = package.path .. ";data/scripts/modloader/lib/?.lua"
require("enums")

package.path = package.path .. ";data/scripts/systems/?.lua"
require ("basesystem")

package.path = package.path .. ";data/scripts/lib/?.lua"
require ("randomext")
require ("utility")

function getNumTurrets(seed, rarity)
    math.randomseed(seed)
    return rarity.value + math.max(math.floor(math.random() * rarity.value), 2)
end

function onInstalled(seed, rarity)
    addMultiplyableBias(StatsBonuses.UnarmedTurrets, getNumTurrets(seed, rarity))
end

function onUninstalled(seed, rarity)
end

function getName(seed, rarity)
    return string.format(Config.ctcsName, getNumTurrets(seed, rarity))
end

function getIcon(seed, rarity)
    return "data/textures/icons/turret.png"
end

function getEnergy(seed, rarity)
    local num = getNumTurrets(seed, rarity)
    return (num * 170 * Metric.Mega / (0.9 ^ rarity.value)) * Config.energyFactor
end

function getPrice(seed, rarity)
    local num = getNumTurrets(seed, rarity)
    local price = 5650 * num;
    return price * 3.25 ^ rarity.value
end

function getTooltipLines(seed, rarity)
    return
    {
        {ltext = Config.unarmedTurrets, rtext = "+" .. getNumTurrets(seed, rarity), icon = "data/textures/icons/turret.png"}
    }
end

function getDescriptionLines(seed, rarity)
    return
    {
        {ltext = Config.ctcsDescription, rtext = "", icon = ""},
        {ltext = Config.genDescription, rtext = "", icon = ""}
    }
end
