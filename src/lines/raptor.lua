---@type table<string, Line>
return {
    ["1"] = {
        text = "You don't look as tough as you think you do.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy,
    },
    ["2"] = {
        text = "Do you even know how to kill a Turoth?",
        type = SpeakerEventType.TICK,
        category = LineCategory.SKILL,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.skill.slayer.level < 55
        end,
    },
    ["3"] = {
        text = "Do you even remember how to kill a Turoth?",
        type = SpeakerEventType.TICK,
        category = LineCategory.SKILL,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.skill.slayer.level >= 75
        end,
    },
}
