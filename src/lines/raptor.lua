local category = require("src/lineCategories")
local animation = {
    Neutral = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    Happy = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
    HappyExtreme = "HUMAN_UPDATE_CHATHEAD_HAPPY_EXTREME_LEN4",
    Bored = "HUMAN_UPDATE_CHATHEAD_BORED_LEN4",
    Quizzical = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
    Shifty = "HUMAN_UPDATE_CHATHEAD_SHIFTY_LEN4"
}

return {
    [1] = {
        text = "You don't look as tough as you think you do.",
        category = category.Generic,
        animation = animation.Happy,
    },
    [2] = {
        text = "Do you even know how to kill a Turoth?",
        category = category.Level,
        animation = animation.Happy,
        requirements = function(state)
            return state.slayerLevel < 55
        end,
    },
    [3] = {
        text = "Do you even remember how to kill a Turoth?",
        category = category.Level,
        animation = animation.Happy,
        requirements = function(state)
            return state.slayerLevel >= 75
        end,
    },
}
