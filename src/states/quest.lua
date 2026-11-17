---The state of the player's quest completions.
---@class QuestState
---@field theGrandTree boolean
---@field whileGuthixSleeps boolean

---Get the quest state.
---@return QuestState
local getQuestState = function()
    ---@type QuestState
    return {
        theGrandTree = config.Quest.FromID(id.Quest.THEGRANDTREE).hasFinishedQuest,
        whileGuthixSleeps = config.Quest.FromID(id.Quest.WHILE_GUTHIX_SLEEPS).hasFinishedQuest,
    }
end

return {
    getQuestState = getQuestState
}
