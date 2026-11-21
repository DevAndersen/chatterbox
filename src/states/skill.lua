---The state of the player's skills.
---@class SkillState
---@field attack SkillLevelState
---@field defence SkillLevelState
---@field strength SkillLevelState
---@field hitpoints SkillLevelState
---@field ranged SkillLevelState
---@field prayer SkillLevelState
---@field magic SkillLevelState
---@field cooking SkillLevelState
---@field woodcutting SkillLevelState
---@field fletching SkillLevelState
---@field fishing SkillLevelState
---@field firemaking SkillLevelState
---@field crafting SkillLevelState
---@field smithing SkillLevelState
---@field mining SkillLevelState
---@field herblore SkillLevelState
---@field agility SkillLevelState
---@field thieving SkillLevelState
---@field slayer SkillLevelState
---@field farming SkillLevelState
---@field runecrafting SkillLevelState
---@field hunter SkillLevelState
---@field construction SkillLevelState
---@field summoning SkillLevelState
---@field dungeoneering SkillLevelState
---@field divination SkillLevelState
---@field invention SkillLevelState
---@field archaeology SkillLevelState
---@field necromancy SkillLevelState
---@field maxed boolean

---The state of a specific skill.
---@class SkillLevelState
---@field level integer The player's level in the skill.
---@field gameplayLevel integer The player's gameplay level (including boosts and stat drains) in the skill.
---@field xp integer The player's XP in the skill.

---@param skill SkillType
---@return SkillLevelState
local getSkillLevelState = function(skill)
    ---@type SkillLevelState
    return {
        level = Player.GetLevelUncapped(skill),
        gameplayLevel = Player.GetLevelGameplay(skill),
        xp = Player.GetXPUncapped(skill)
    }
end

---Returns the state of the player's skills.
---@return SkillState
local getSkillState = function()
    local attack = getSkillLevelState(SkillType.ATTACK)
    local defence = getSkillLevelState(SkillType.DEFENCE)
    local strength = getSkillLevelState(SkillType.STRENGTH)
    local hitpoints = getSkillLevelState(SkillType.HITPOINTS)
    local ranged = getSkillLevelState(SkillType.RANGED)
    local prayer = getSkillLevelState(SkillType.PRAYER)
    local magic = getSkillLevelState(SkillType.MAGIC)
    local cooking = getSkillLevelState(SkillType.COOKING)
    local woodcutting = getSkillLevelState(SkillType.WOODCUTTING)
    local fletching = getSkillLevelState(SkillType.FLETCHING)
    local fishing = getSkillLevelState(SkillType.FISHING)
    local firemaking = getSkillLevelState(SkillType.FIREMAKING)
    local crafting = getSkillLevelState(SkillType.CRAFTING)
    local smithing = getSkillLevelState(SkillType.SMITHING)
    local mining = getSkillLevelState(SkillType.MINING)
    local herblore = getSkillLevelState(SkillType.HERBLORE)
    local agility = getSkillLevelState(SkillType.AGILITY)
    local thieving = getSkillLevelState(SkillType.THIEVING)
    local slayer = getSkillLevelState(SkillType.SLAYER)
    local farming = getSkillLevelState(SkillType.FARMING)
    local runecrafting = getSkillLevelState(SkillType.RUNECRAFTING)
    local hunter = getSkillLevelState(SkillType.HUNTER)
    local construction = getSkillLevelState(SkillType.CONSTRUCTION)
    local summoning = getSkillLevelState(SkillType.SUMMONING)
    local dungeoneering = getSkillLevelState(SkillType.DUNGEONEERING)
    local divination = getSkillLevelState(SkillType.DIVINATION)
    local invention = getSkillLevelState(SkillType.INVENTION)
    local archaeology = getSkillLevelState(SkillType.ARCHAEOLOGY)
    local necromancy = getSkillLevelState(SkillType.NECROMANCY)

    local maxed =
        attack.level >= 99
        and defence.level >= 99
        and strength.level >= 99
        and hitpoints.level >= 99
        and ranged.level >= 99
        and prayer.level >= 99
        and magic.level >= 99
        and cooking.level >= 99
        and woodcutting.level >= 99
        and fletching.level >= 99
        and fishing.level >= 99
        and firemaking.level >= 99
        and crafting.level >= 99
        and smithing.level >= 99
        and mining.level >= 99
        and herblore.level >= 99
        and agility.level >= 99
        and thieving.level >= 99
        and slayer.level >= 99
        and farming.level >= 99
        and runecrafting.level >= 99
        and hunter.level >= 99
        and construction.level >= 99
        and summoning.level >= 99
        and dungeoneering.level >= 99
        and divination.level >= 99
        and invention.level >= 99
        and archaeology.level >= 99
        and necromancy.level >= 99

    ---@type SkillState
    return {
        attack = attack,
        defence = defence,
        strength = strength,
        hitpoints = hitpoints,
        ranged = ranged,
        prayer = prayer,
        magic = magic,
        cooking = cooking,
        woodcutting = woodcutting,
        fletching = fletching,
        fishing = fishing,
        firemaking = firemaking,
        crafting = crafting,
        smithing = smithing,
        mining = mining,
        herblore = herblore,
        agility = agility,
        thieving = thieving,
        slayer = slayer,
        farming = farming,
        runecrafting = runecrafting,
        hunter = hunter,
        construction = construction,
        summoning = summoning,
        dungeoneering = dungeoneering,
        divination = divination,
        invention = invention,
        archaeology = archaeology,
        necromancy = necromancy,
        maxed = maxed
    }
end

return
{
    getSkillState = getSkillState
}
