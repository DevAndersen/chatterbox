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
    ---@type SkillState
    return {
        attack = getSkillLevelState(SkillType.ATTACK),
        defence = getSkillLevelState(SkillType.DEFENCE),
        strength = getSkillLevelState(SkillType.STRENGTH),
        hitpoints = getSkillLevelState(SkillType.HITPOINTS),
        ranged = getSkillLevelState(SkillType.RANGED),
        prayer = getSkillLevelState(SkillType.PRAYER),
        magic = getSkillLevelState(SkillType.MAGIC),
        cooking = getSkillLevelState(SkillType.COOKING),
        woodcutting = getSkillLevelState(SkillType.WOODCUTTING),
        fletching = getSkillLevelState(SkillType.FLETCHING),
        fishing = getSkillLevelState(SkillType.FISHING),
        firemaking = getSkillLevelState(SkillType.FIREMAKING),
        crafting = getSkillLevelState(SkillType.CRAFTING),
        smithing = getSkillLevelState(SkillType.SMITHING),
        mining = getSkillLevelState(SkillType.MINING),
        herblore = getSkillLevelState(SkillType.HERBLORE),
        agility = getSkillLevelState(SkillType.AGILITY),
        thieving = getSkillLevelState(SkillType.THIEVING),
        slayer = getSkillLevelState(SkillType.SLAYER),
        farming = getSkillLevelState(SkillType.FARMING),
        runecrafting = getSkillLevelState(SkillType.RUNECRAFTING),
        hunter = getSkillLevelState(SkillType.HUNTER),
        construction = getSkillLevelState(SkillType.CONSTRUCTION),
        summoning = getSkillLevelState(SkillType.SUMMONING),
        dungeoneering = getSkillLevelState(SkillType.DUNGEONEERING),
        divination = getSkillLevelState(SkillType.DIVINATION),
        invention = getSkillLevelState(SkillType.INVENTION),
        archaeology = getSkillLevelState(SkillType.ARCHAEOLOGY),
        necromancy = getSkillLevelState(SkillType.NECROMANCY),
    }
end

return
{
    getSkillState = getSkillState
}
