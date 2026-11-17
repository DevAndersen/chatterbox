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

---
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
        attack = getSkillLevelState(SkillType.Attack),
        defence = getSkillLevelState(SkillType.Defence),
        strength = getSkillLevelState(SkillType.Strength),
        hitpoints = getSkillLevelState(SkillType.Hitpoints),
        ranged = getSkillLevelState(SkillType.Ranged),
        prayer = getSkillLevelState(SkillType.Prayer),
        magic = getSkillLevelState(SkillType.Magic),
        cooking = getSkillLevelState(SkillType.Cooking),
        woodcutting = getSkillLevelState(SkillType.Woodcutting),
        fletching = getSkillLevelState(SkillType.Fletching),
        fishing = getSkillLevelState(SkillType.Fishing),
        firemaking = getSkillLevelState(SkillType.Firemaking),
        crafting = getSkillLevelState(SkillType.Crafting),
        smithing = getSkillLevelState(SkillType.Smithing),
        mining = getSkillLevelState(SkillType.Mining),
        herblore = getSkillLevelState(SkillType.Herblore),
        agility = getSkillLevelState(SkillType.Agility),
        thieving = getSkillLevelState(SkillType.Thieving),
        slayer = getSkillLevelState(SkillType.Slayer),
        farming = getSkillLevelState(SkillType.Farming),
        runecrafting = getSkillLevelState(SkillType.Runecrafting),
        hunter = getSkillLevelState(SkillType.Hunter),
        construction = getSkillLevelState(SkillType.Construction),
        summoning = getSkillLevelState(SkillType.Summoning),
        dungeoneering = getSkillLevelState(SkillType.Dungeoneering),
        divination = getSkillLevelState(SkillType.Divination),
        invention = getSkillLevelState(SkillType.Invention),
        archaeology = getSkillLevelState(SkillType.Archaeology),
        necromancy = getSkillLevelState(SkillType.Necromancy),
    }
end

return
{
    getSkillState = getSkillState
}
