---The state of player's skills.
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

---Returns the state of player's skills.
---@return SkillState[]
local getSkillState = function()
    return {
        attack = {
            level = Player.GetLevelUncapped(SkillType.ATTACK),
            gameplayLevel = Player.GetLevelGameplay(SkillType.ATTACK),
            xp = Player.GetXPUncapped(SkillType.ATTACK)
        },
        defence = {
            level = Player.GetLevelUncapped(SkillType.DEFENCE),
            gameplayLevel = Player.GetLevelGameplay(SkillType.DEFENCE),
            xp = Player.GetXPUncapped(SkillType.DEFENCE)
        },
        strength = {
            level = Player.GetLevelUncapped(SkillType.STRENGTH),
            gameplayLevel = Player.GetLevelGameplay(SkillType.STRENGTH),
            xp = Player.GetXPUncapped(SkillType.STRENGTH)
        },
        hitpoints = {
            level = Player.GetLevelUncapped(SkillType.HITPOINTS),
            gameplayLevel = Player.GetLevelGameplay(SkillType.HITPOINTS),
            xp = Player.GetXPUncapped(SkillType.HITPOINTS)
        },
        ranged = {
            level = Player.GetLevelUncapped(SkillType.RANGED),
            gameplayLevel = Player.GetLevelGameplay(SkillType.RANGED),
            xp = Player.GetXPUncapped(SkillType.RANGED)
        },
        prayer = {
            level = Player.GetLevelUncapped(SkillType.PRAYER),
            gameplayLevel = Player.GetLevelGameplay(SkillType.PRAYER),
            xp = Player.GetXPUncapped(SkillType.PRAYER)
        },
        magic = {
            level = Player.GetLevelUncapped(SkillType.MAGIC),
            gameplayLevel = Player.GetLevelGameplay(SkillType.MAGIC),
            xp = Player.GetXPUncapped(SkillType.MAGIC)
        },
        cooking = {
            level = Player.GetLevelUncapped(SkillType.COOKING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.COOKING),
            xp = Player.GetXPUncapped(SkillType.COOKING)
        },
        woodcutting = {
            level = Player.GetLevelUncapped(SkillType.WOODCUTTING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.WOODCUTTING),
            xp = Player.GetXPUncapped(SkillType.WOODCUTTING)
        },
        fletching = {
            level = Player.GetLevelUncapped(SkillType.FLETCHING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.FLETCHING),
            xp = Player.GetXPUncapped(SkillType.FLETCHING)
        },
        fishing = {
            level = Player.GetLevelUncapped(SkillType.FISHING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.FISHING),
            xp = Player.GetXPUncapped(SkillType.FISHING)
        },
        firemaking = {
            level = Player.GetLevelUncapped(SkillType.FIREMAKING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.FIREMAKING),
            xp = Player.GetXPUncapped(SkillType.FIREMAKING)
        },
        crafting = {
            level = Player.GetLevelUncapped(SkillType.CRAFTING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.CRAFTING),
            xp = Player.GetXPUncapped(SkillType.CRAFTING)
        },
        smithing = {
            level = Player.GetLevelUncapped(SkillType.SMITHING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.SMITHING),
            xp = Player.GetXPUncapped(SkillType.SMITHING)
        },
        mining = {
            level = Player.GetLevelUncapped(SkillType.MINING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.MINING),
            xp = Player.GetXPUncapped(SkillType.MINING)
        },
        herblore = {
            level = Player.GetLevelUncapped(SkillType.HERBLORE),
            gameplayLevel = Player.GetLevelGameplay(SkillType.HERBLORE),
            xp = Player.GetXPUncapped(SkillType.HERBLORE)
        },
        agility = {
            level = Player.GetLevelUncapped(SkillType.AGILITY),
            gameplayLevel = Player.GetLevelGameplay(SkillType.AGILITY),
            xp = Player.GetXPUncapped(SkillType.AGILITY)
        },
        thieving = {
            level = Player.GetLevelUncapped(SkillType.THIEVING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.THIEVING),
            xp = Player.GetXPUncapped(SkillType.THIEVING)
        },
        slayer = {
            level = Player.GetLevelUncapped(SkillType.SLAYER),
            gameplayLevel = Player.GetLevelGameplay(SkillType.SLAYER),
            xp = Player.GetXPUncapped(SkillType.SLAYER)
        },
        farming = {
            level = Player.GetLevelUncapped(SkillType.FARMING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.FARMING),
            xp = Player.GetXPUncapped(SkillType.FARMING)
        },
        runecrafting = {
            level = Player.GetLevelUncapped(SkillType.RUNECRAFTING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.RUNECRAFTING),
            xp = Player.GetXPUncapped(SkillType.RUNECRAFTING)
        },
        hunter = {
            level = Player.GetLevelUncapped(SkillType.HUNTER),
            gameplayLevel = Player.GetLevelGameplay(SkillType.HUNTER),
            xp = Player.GetXPUncapped(SkillType.HUNTER)
        },
        construction = {
            level = Player.GetLevelUncapped(SkillType.CONSTRUCTION),
            gameplayLevel = Player.GetLevelGameplay(SkillType.CONSTRUCTION),
            xp = Player.GetXPUncapped(SkillType.CONSTRUCTION)
        },
        summoning = {
            level = Player.GetLevelUncapped(SkillType.SUMMONING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.SUMMONING),
            xp = Player.GetXPUncapped(SkillType.SUMMONING)
        },
        dungeoneering = {
            level = Player.GetLevelUncapped(SkillType.DUNGEONEERING),
            gameplayLevel = Player.GetLevelGameplay(SkillType.DUNGEONEERING),
            xp = Player.GetXPUncapped(SkillType.DUNGEONEERING)
        },
        divination = {
            level = Player.GetLevelUncapped(SkillType.DIVINATION),
            gameplayLevel = Player.GetLevelGameplay(SkillType.DIVINATION),
            xp = Player.GetXPUncapped(SkillType.DIVINATION)
        },
        invention = {
            level = Player.GetLevelUncapped(SkillType.INVENTION),
            gameplayLevel = Player.GetLevelGameplay(SkillType.INVENTION),
            xp = Player.GetXPUncapped(SkillType.INVENTION)
        },
        archaeology = {
            level = Player.GetLevelUncapped(SkillType.ARCHAEOLOGY),
            gameplayLevel = Player.GetLevelGameplay(SkillType.ARCHAEOLOGY),
            xp = Player.GetXPUncapped(SkillType.ARCHAEOLOGY)
        },
        necromancy = {
            level = Player.GetLevelUncapped(SkillType.NECROMANCY),
            gameplayLevel = Player.GetLevelGameplay(SkillType.NECROMANCY),
            xp = Player.GetXPUncapped(SkillType.NECROMANCY)
        },
    }
end

return
{
    getSkillState = getSkillState
}
