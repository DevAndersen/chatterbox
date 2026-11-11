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
        text = "Cabbages are actually very tasty.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
    },
    [3] = {
        text = "Are those HAM robes? I hope you are just wearing them because you like the color pink.",
        category = "equipment",
        animation = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
        requirements = function(state)
            return state.fullHam
        end,
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
    [25] = {
        text = "Roses are red, violets are blue, your familiar is a pack yak, baroo baroo",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_BORED_LEN4",
        requirements = function(state)
            return state.follower == config.Obj.LORE_PACK_YAK
        end
    },
    [26] = {
        text = "I enjoy Dungeoneering. It is my favorite minigame.",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.region.Daemonheim
        end
    },
    [27] = {
        text = "I heard that the Wise Old Man once robbed a Draynor bank. It is nice to see elderly people with active hobbies.",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.region.DraynorVillage
        end
    },
    [28] = {
        text = "For a haunted manor, this place has quite a few residents. I wonder if they all get along.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
        requirements = function(state)
            return state.region.DraynorVillage
        end
    },
    [29] = {
        text = "Cows have a hundred words for grass. And they're all different variations of 'Moo'.",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.region.LumbridgeCowPen
        end
    },
    [30] = {
        text = "I actually speak a little cow. 'Moo' means 'Hello', and also 'Goodbye'.",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.LumbridgeCowPen
        end
    },
    [31] = {
        text = "Did you know: the name 'Lumbridge' is a reference to 'Cambridge', where Jagex HQ is located.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.Lumbridge
        end
    },
    [32] = {
        text = "Archaeologist are weird. Why would you dig up dirt if you don't plan on eating it?",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
        requirements = function(state)
            return state.region.VarrockDigSite
        end
    },
    [33] = {
        text = "Did you know: Falador Park used to be where a lot of players did their trading. I don't think the gardener liked it very much.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.Falador
        end
    },
    [34] = {
        text = "Did you know: Many elves and elven places names are Welsh words.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.Tirannwn or state.region.Prifddinas
        end
    },
    [35] = {
        text = "Did you know: 'Prifddinas' is the Welsh word for 'Capital'.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.Prifddinas
        end
    },
    [36] = {
        text = "Did you know: Fairy rings exist in real life. Sadly, they are not very useful for transportation.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK"
    },
    [37] = {
        text = "Monkfish don't look very much like monks.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.PiscatorisFishingColony
        end
    },
    [38] = {
        text = "Nobody can agree on how to pronouncing this city's name. Best to just call it 'Ardy'.",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_SHIFTY_LEN4",
        requirements = function(state)
            return state.region.EastArdougne
        end
    },
    [39] = {
        text = "Remember, Jad's healers will respawn if they heal him up to full health.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.TzhaarFightCave
        end
    },
    [40] = {
        text = "Did you know: If you drop magic logs, you can see the stars moving.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK"
    },
    [41] = {
        text = "Did you know: Magic logs used to look like a lighter version of willow logs.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK"
    },
    [42] = {
        text = "Did you know: The 'g' in 'gnome' is silent.",
        audio = "Did you know: The 'g' in 'nome' is silent.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.GnomeStronghold
        end
    },
    [43] = {
        text = "Did you know: Ghasts can turn easter eggs into rotten food. A fast way to lose money.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.MortMyreSwamp
        end
    },
    [44] = {
        text = "Those snails have some pretty shells. They would make for an excellent hat.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.MortMyreSwamp
        end
    },
    [45] = {
        text = "What do you call a terrified Mort Myre spirit? An aghast ghast.",
        category = "humor",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_EXTREME_LEN4",
        requirements = function(state)
            return state.region.MortMyreSwamp
        end
    },
    [46] = {
        text = "The citizens in this place gives me the creeps.",
        category = "generic",
        animation = "HUMAN_UPDATE_CHATHEAD_SHIFTY_LEN4",
        requirements = function(state)
            return state.region.Canifis
        end
    },
    [47] = {
        text = "Did you know: The names of these islands are puns on 'Ya, tis' so' and 'Nay, tis' not'.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_TALK",
        requirements = function(state)
            return state.region.FremennikIsles
        end
    },
    [48] = {
        text = "Yak perfume is popular among goblins.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.region.NeitiznotYakPen
        end
    },
    [49] = {
        text = "If you pickpocket the pillory guard, you'll get free tomatoes.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_HAPPY_NORMAL_LEN4",
        requirements = function(state)
            return state.region.Yanille
        end
    },
    [50] = {
        text = "The walls of this city look perfect for trapping penguins.",
        category = "trivia",
        animation = "HUMAN_UPDATE_CHATHEAD_QUIZZICAL_LEN4",
        requirements = function(state)
            return state.region.Yanille
        end
    },
}
