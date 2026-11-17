---Player state.
---@class State
---@field equipment EquipmentState The state of player's equipment.
---@field area AreaState The state of player's equipment.
---@field skill SkillState The state of the player's skills.
---@field quest QuestState The state of the player's quest completions.
---@field special SpecialState The state of special player checks.
---@field coins integer The total number of coins in the player's coin pouch.
---@field follower? userdata The player's current follower (use "config.Obj", familiars begin with "LORE_").
---@field isIronman boolean Is the player an ironman.
---@field isHardcoreIronman boolean Is the player a hardcore ironman.
---@field isDead boolean Is the player dead (zero lifepoints).

-- State check function imports.
local equipmentStateFunctions = require("src/states/equipment")
local skillStateFunctions = require("src/states/skill")
local areaStateFunctions = require("src/states/area")
local questStateFunctions = require("src/states/quest")
local specialStateFunctions = require("src/states/special")

-- Constants
local furnitureTypeBitMask = 0xfff -- The first three nibbles of the "CONSTRUCTION_HOUSE_FURNITURE_DATA_INDEX_" player variables appear to correspond to furniture ID.
local furnitureDemonicThroneId = 228
local furnitureLimit = 500

---Determines if the player has at least one of the specified furniture type in their Player Owned House.
---@param furnitureTypeId integer The ID of a type of furniture.
---@return boolean
local function hasFurniture(furnitureTypeId)
    for i = 1, furnitureLimit do
        local furnitureData = var.VarPlayer["CONSTRUCTION_HOUSE_FURNITURE_DATA_INDEX_" .. i].value
        local furnitureType = furnitureData & furnitureTypeBitMask

        if furnitureType == furnitureTypeId then
            return true
        end
    end
    return false
end

---Returns the current player state.
---@return State
local getState = function()
    -- Coin pouch
    local currencyPouchGp = Inventory.Find(config.Inv.MONEY_POUCH):GetTotal(id.Obj.COINS)
    local currencyPouchGpb = Inventory.Find(config.Inv.MONEY_POUCH):GetTotal(id.Obj.COINS_B) * 1000000000
    local coins = currencyPouchGp + currencyPouchGpb

    -- Ironman status
    local isIronman = var.VarPlayer.IRONMAN_ENABLED.value
    local isHardcoreIronman = var.VarPlayer.HARDCORE_ENABLED.value

    -- Misc.
    local isDead = var.VarPlayer.LIFEPOINTS.value < 1

    -- Follower (pets and familiars).
    local follower = var.VarPlayer.FOLLOWER_OBJ.value
    if follower.id == -1 then
        follower = nil
    end

    local hasDemonicThrone = hasFurniture(furnitureDemonicThroneId)

    return {
        equipment = equipmentStateFunctions.getEquipmentState(),
        area = areaStateFunctions.getAreaState(),
        skill = skillStateFunctions.getSkillState(),
        quest = questStateFunctions.getQuestState(),
        special = specialStateFunctions.getSpecialState(),

        coins = coins,
        isIronman = isIronman,
        isHardcoreIronman = isHardcoreIronman,
        isDead = isDead,
        follower = follower,

        hasDemonicThrone = hasDemonicThrone
    } --[[@as State]]
end

return
{
    getState = getState
}
