---Player state.
---@class State
---@field equipment EquipmentState The state of player's equipment.
---@field area AreaState The state of player's equipment.

local equipmentStateFunctions = require("src/states/equipment")

-- Constants
local furnitureTypeBitMask = 0xfff -- The first three nibbles of the "CONSTRUCTION_HOUSE_FURNITURE_DATA_INDEX_" player variables appear to correspond to furniture ID.
local furnitureDemonicThroneId = 228

local areaState = require("src/areaState")

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

    -- Follower (pets and familiars)
    local follower = var.VarPlayer.FOLLOWER_OBJ.value
    if follower.id == -1 then
        follower = nil
    end

    local hasDemonicThrone = hasFurniture(furnitureDemonicThroneId)

    local equipmentState = equipmentStateFunctions.getEquipmentState()

    return {
        -- Todo: Turn skills into their own table
        attackLevel = Player.GetLevelGameplay(SkillType.ATTACK),
        strengthLevel = Player.GetLevelGameplay(SkillType.STRENGTH),
        thievingLevel = Player.GetLevelGameplay(SkillType.THIEVING),
        cookingLevel = Player.GetLevelGameplay(SkillType.COOKING),
        slayerLevel = Player.GetLevelGameplay(SkillType.SLAYER),
        archaeologyLevel = Player.GetLevelGameplay(SkillType.ARCHAEOLOGY),

        equipment = equipmentState,
        area = areaState.getAreaState(),

        coins = coins,
        completedTheGrandTree = config.Quest.FromID(id.Quest.THEGRANDTREE).hasFinishedQuest,
        completedWhileGuthixSleeps = config.Quest.FromID(id.Quest.WHILE_GUTHIX_SLEEPS).hasFinishedQuest,
        isIronman = isIronman,
        isHardcoreIronman = isHardcoreIronman,
        hasExaminedRimmingtonBench = hasExaminedRimmingtonBench,
        isDead = isDead,
        follower = follower,
        hasDemonicThrone = hasDemonicThrone
    }
end

return
{
    getState = getState
}
