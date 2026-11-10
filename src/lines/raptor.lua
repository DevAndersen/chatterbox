return {
    [1] = {
        text = "You don't look as tough as you think you do.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
    },
    [2] = {
        text = "Do you even know how to kill a Turoth?",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.slayerLevel < 55
        end,
    },
    [3] = {
        text = "Do you even remember how to kill a Turoth?",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.slayerLevel >= 75
        end,
    },
}
