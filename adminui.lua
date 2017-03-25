--[[---------------------------------------------------------------------------
	
	This script is a plugin module for the ModLoader Admin UI.

	Select from a list of online players and give them a module.

--]]---------------------------------------------------------------------------

-- Include Files
package.path = package.path .. ";data/scripts/mods/?.lua"
local Config = require ("infinionsys/config")

package.path = package.path .. ";data/scripts/lib/?.lua"
require ("utility")
require ("goods")
require ("randomext")


-- Local variables
local t = {}
local container
local playerListBox
local moduleRarity
local moduleQty
local moduleType


t.initUI = function(parent)

	container = parent

    local size = parent.size
	
	local pos = Rect(10, 40, 260, size.y)
	playerListBox = container:createListBox(pos)
	local playerListLabel = container:createLabel(vec2(10, 10), Config.playersOnline, 14)
	
	local moduleLabel = container:createLabel(vec2(290, 40), Config.moduleLabel, 16)
	
	moduleType = container:createComboBox(Rect(300, 80, 450, 110), "dummy")
	moduleType:addEntry("Arbitrary TCS")
	moduleType:addEntry("Military TCS")
	moduleType:addEntry("Civilian TCS")	
	
	moduleRarity = container:createComboBox(Rect(460, 80, 610, 110), "dummy")
	moduleRarity:addEntry("Common")
	moduleRarity:addEntry("Uncommon")
	moduleRarity:addEntry("Rare")
	moduleRarity:addEntry("Exceptional")
	moduleRarity:addEntry("Exotic")
	moduleRarity:addEntry("Legendary")
	
	local moduleQtyLabel = container:createLabel(vec2(620, 85), "Qty:", 14)
	moduleQty = container:createTextBox(Rect(670, 80, 720, 110), "dummy")
	local coolingRegButton = container:createButton(Rect(730, 80, 880, 110), "Give", "onGiveModule")
end

t.onShowWindow = function()
    if onClient() then
		invokeServerFunction("getOnlinePlayerList")
	end
end

function getOnlinePlayerList()
	if onServer() then
		local playerNames = {Galaxy():getOnlinePlayerNames()}
		invokeClientFunction(Player(callingPlayer), "setOnlinePlayerList", playerNames)
	end
end

function setOnlinePlayerList(playerList)
	if onClient and playerList then
		playerListBox:clear()
		for _, playerName in pairs(playerList) do
			playerListBox:addEntry(playerName)
		end
	end
end

function onGiveModule()
	if onClient() then
		local playerName = playerListBox:getSelectedEntry()
		if playerName == nil then return end
		
		local script = moduleType.selectedIndex
		if script == 0 then script = Config.scriptATCS
		elseif script == 1 then script = Config.scriptMTCS
		else script = Config.scriptCTCS end
		
		local rarityValue = moduleRarity.selectedIndex
		
		local quantity = tonumber(moduleQty.text) or 1
		
		invokeServerFunction("giveModule", playerName, script, rarityValue, quantity)
		return
	end
end

function giveModule(playerName, script, rarity, quantity)
	if onServer() then
		local playerList = {Server():getOnlinePlayers()}
		local player = nil
		for _, p in pairs(playerList) do
			if p.name == playerName then
				player = p
				break
			end
		end
		if player == nil then return end
		for i=1, quantity do
			local item = SystemUpgradeTemplate(script, Rarity(rarity), random():createSeed())
			player:getInventory():add(item)
		end
	end
end


-- This is to prevent errors with UI elements that require a function when something
-- is selected/changed etc but that function isn't being used by this script.
function dummy() end

return t









