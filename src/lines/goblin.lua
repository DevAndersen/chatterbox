-- HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK
-- HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4
-- HUMAN_UPDATE_CHATHEAD_HAPPY_EXTREME_LEN4
-- HUMAN_UPDATE_CHATHEAD_BORED_LEN4
-- HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4
-- HUMAN_UPDATE_CHATHEAD_SHIFTY_LEN4

return {
    [1] = {
        text = "I am your goblin buddy.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
    },
    [2] = {
        text = "Are those HAM robes? I hope you are just wearing them because you like the color pink.",
        category = "equipment",
        animation = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
        requirements = function(state)
            return state.fullHam
        end,
    },
    [3] = {
        text = "Cabbages are actually very tasty.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
    },
    [4] = {
        text = "Did you know: Abyssal whips are made from Abyssal Demon spines. Allegedly.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.mainHand == config.Obj.ABYSSAL_WHIP.configName
        end
    },
    [5] = {
        text = "Did you know: You cannot eat a mud pie. Because it contains compost and clay. And you shouldn't eat those. Apparently.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    },
    [6] = {
        text = "Did you know: Hans is the oldest NPC in RuneScape. He looks good for his age.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    },
    [7] = {
        text = "Did you know: Mint cakes were once considered highly valuable. They still are to me. I like the taste.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.GrandExchange
        end
    },
    [8] = {
        text = "Did you know: A bug caused the red Fremennik cloak to provide extreme defensive boosts. A very fashionable bug.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    },
    [9] = {
        text = "Did you know: The symbol of Guthix used to look different in RuneScape Classic.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    },
    [10] = {
        text = "Did you know: There's a ninja hiding on a bench in Rimmington. Just examine it, you'll see.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.hasExaminedRimmingtonBench == false
        end,
    },
    [11] = {
        text = "I like Hazelmere. I hope nothing bad happens to him.",
        audio = "I like Hazel mere. I hope nothing bad happens to him.",
        category = "quest",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.completedTheGrandTree
                and state.completedWhileGuthixSleeps == false
        end,
    },
    [12] = {
        text = "I miss Hazelmere. He was a nice guy.",
        audio = "I miss Hazel mere. He was a nice guy.",
        category = "quest",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.completedWhileGuthixSleeps
        end,
    },
    [13] = {
        text = "The quest name \"A Void Dance\" is a play on the word \"avoidance\". Or maybe \"avoid dance\", which is what I do.",
        audio = "The quest name A Void Dance is a play on the word avoidance. Or maybe avoid dance, which is what I do.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    },
    [14] = {
        text = "Baxtorian's name is a wordplay on the word \"backstory\". Jagex are not very subtle.",
        audio = "Baxtorian's name is a wordplay on the word backstory. Jagex are not very subtle.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
    },
    [15] = {
        text = "You look tough. Can you take down the King Black Dragon by wielding nothing more than a bronze dagger?",
        category = "level",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.attackLevel >= 99
        end,
    },
    [16] = {
        text = "If you need money, you can high alch items.",
        category = "money",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.coins < 1000000
        end,
    },
    [17] = {
        text = "If you need money, you can high alch items. But you cannot high alch people, because that would be wrong.",
        category = "money",
        animation = "HUMAN_UPDATE_CHATHEAD_SHIFTY_LEN4",
        requirements = function(state)
            return state.coins < 1000000
        end,
    },
    [18] = {
        text = "The Grand Exchange isn't all that useful to you, by the way.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.GrandExchange and state.isIronman
        end
    },
    [19] = {
        text = "It is always nice to visit my home town.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.GoblinVillage
        end
    },
    [20] = {
        text = "I was once on vacation here. The local goblins were very nice to me.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.LumbridgeGoblins
        end
    },
    [21] = {
        text = "That hat looks very expensive. But not nearly as comfortable as mine.",
        category = "equipment",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.partyhat
        end
    },
    [22] = {
        text = "Does Santa know that you took his hat? Stealing people's hats isn't a very nice thing to do.",
        category = "equipment",
        animation = "HUMAN_UPDATE_CHATHEAD_SHIFTY_LEN4",
        requirements = function(state)
            return state.santaHat
        end
    },
    [23] = {
        text = "That mask makes you look very scary. But I'm not sure it is going to work on bosses.",
        category = "equipment",
        animation = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
        requirements = function(state)
            return state.halloweenMask
        end
    },
    [24] = {
        text = "I'm feeling a bit hungry. Could you cook a chicken on that campfire over there?",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_BORED_LEN4",
        requirements = function(state)
            return state.region.WarsRetreat
        end
    },
}
