--[[---------------------------------------------------------------------------

	This script is a System Upgrade. It is based on the standard arbitrarytcs
	script but is a "faction module" that gives more turrets.

--]]---------------------------------------------------------------------------

package.path = package.path .. ";data/scripts/mods/?.lua"
local Config = require("infinionsys/config")

package.path = package.path .. ";data/scripts/modloader/lib/?.lua"
require("enums")

package.path = package.path .. ";data/scripts/systems/?.lua"
require ("basesystem")

package.path = package.path .. ";data/scripts/lib/?.lua"
require ("utility")
require ("randomext")

local isCalibrated = false

function getNumTurrets(seed, rarity)
    math.randomseed(seed)
    return rarity.value + math.max(math.floor(math.random() * rarity.value), 2)
end

function onInstalled(seed, rarity)
	local turrets = getNumTurrets(seed, rarity)
	addMultiplyableBias(StatsBonuses.ArbitraryTurrets, turrets)
end

function onUninstalled(seed, rarity)
end

function getName(seed, rarity)
    return string.format(Config.atcsName, getNumTurrets(seed, rarity))
end

function getIcon(seed, rarity)
    return "data/textures/icons/turret.png"
end

function getEnergy(seed, rarity)
    local num = getNumTurrets(seed, rarity)
    return (num * 320 * Metric.Mega / (0.9 ^ rarity.value)) * Config.energyFactor
end

function getPrice(seed, rarity)
    local num = getNumTurrets(seed, rarity)
    local price = 9500 * num;
    return (price * 3.25 ^ rarity.value) * Config.priceFactor
end

function getTooltipLines(seed, rarity)
    return
    {
        {ltext = Config.allTurrets, rtext = "+" .. getNumTurrets(seed, rarity), icon = "data/textures/icons/turret.png"}
    }
end

function getDescriptionLines(seed, rarity)
    return
    {
        {ltext = Config.atcsDescription, rtext = "", icon = ""},
        {ltext = Config.genDescription, rtext = "", icon = ""}
    }
end
