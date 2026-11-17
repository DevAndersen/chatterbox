---Player state.
---@class State
---@field equipment EquipmentState The state of player's equipment.
---@field area AreaState The state of player's equipment.
---@field skill SkillState The state of player's skills.
---@field coins integer The total number of coins in the player's coin pouch.
---@field follower userdata The player's current follower (use "config.Obj", familiars begin with "LORE_").
---@field isIronman boolean Is the player an ironman.
---@field isHardcoreIronman boolean Is the player a hardcore ironman.
---@field isDead boolean Is the player dead (zero lifepoints).

local equipmentStateFunctions = require("src/states/equipment")
local skillStateFunctions = require("src/states/skill")
local areaStateFunctions = require("src/states/area")

-- Constants
local furnitureTypeBitMask = 0xfff -- The first three nibbles of the "CONSTRUCTION_HOUSE_FURNITURE_DATA_INDEX_" player variables appear to correspond to furniture ID.
local furnitureDemonicThroneId = 228

local function hasFurniture(furnitureTypeId)
    for i = 1,500 do
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
    local hasExaminedRimmingtonBench = var.VarPlayer.XMAS16_BASEPERM2.value ~= 0 -- Examined the Rimmington ninja bench
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
        coins = coins,
        isIronman = isIronman,
        isHardcoreIronman = isHardcoreIronman,
        isDead = isDead,
        follower = follower,

        completedTheGrandTree = config.Quest.FromID(id.Quest.THEGRANDTREE).hasFinishedQuest,
        completedWhileGuthixSleeps = config.Quest.FromID(id.Quest.WHILE_GUTHIX_SLEEPS).hasFinishedQuest,
        hasExaminedRimmingtonBench = hasExaminedRimmingtonBench,
        hasDemonicThrone = hasDemonicThrone
    }
end

return
{
    getState = getState
}
