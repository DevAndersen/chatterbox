---Describes a voice line and related information.
---@class Line
---@field text string The string displayed for the line.
---@field type SpeakerEventType The type of event that the line should be triggered by.
---@field category LineCategory The category of the line.
---@field animation string The animation to play when the line is being spoken.
---@field weight number? The optional weight of the line (how likely it is to be selected).
---@field requirements LineRequirement? An optional requirements check that must either be null or return true for the line to be available.

---A line requirement function.
---@alias LineRequirement fun(state: State): boolean

---@type Line[]
return {
    -- Generic
    [1] = {
        text = "I am your goblin buddy.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy,
    },
    [2] = {
        text = "Cabbages are actually very tasty.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy,
    },
    [19] = {
        text = "It is always nice to visit my home town.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.GoblinVillage
        end
    },
    [20] = {
        text = "I was once on vacation here. The local goblins were very nice to me.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.LumbridgeGoblins
        end
    },
    [28] = {
        text = "For a haunted manor, this place has quite a few residents. I wonder if they all get along.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical,
        requirements = function(state)
            return state.area.DraynorManor
        end
    },
    [37] = {
        text = "Monkfish don't look very much like monks.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.PiscatorisFishingColony
        end
    },
    [39] = {
        text = "Remember, Jad's healers will respawn if they heal him up to full health.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.TzhaarFightCave
        end
    },
    [44] = {
        text = "Those snails have some pretty shells. They would make for an excellent hat.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.MortMyreSwamp
        end
    },
    [46] = {
        text = "The citizens in this place gives me the creeps.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Shifty,
        requirements = function(state)
            return state.area.Canifis
        end
    },

    -- Equipment
    [3] = {
        text = "Are those HAM robes? I hope you are just wearing them because you like the color pink.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Quizzical,
        requirements = function(state)
            return state.equipment.special.fullHam
        end,
    },
    [21] = {
        text = "That hat looks very expensive. But not nearly as comfortable as mine.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.equipment.special.partyhat
        end
    },
    [22] = {
        text = "Does Santa know that you took his hat? Stealing people's hats isn't a very nice thing to do.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state)
            return state.equipment.special.santaHat
        end
    },
    [23] = {
        text = "That mask makes you look very scary. But I'm not sure it is going to work on bosses.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Quizzical,
        requirements = function(state)
            return state.equipment.special.halloweenMask
        end
    },
    [64] = {
        text = "Judging by your hat, you are ready to party.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.equipment.special.partyhat
        end
    },
    [65] = {
        text = "That 'sheep painting device' of yours looks rather intimidating.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state)
            return state.equipment.slots.mainHand == config.Obj.MOURNING_PAINT_GUN.configName
        end
    },
    [66] = {
        text = "You archaeologists sure do love your whips.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state)
            return state.equipment.slots.mainHand == config.whip and state.skill.archaeology.level > 75
        end
    },

    -- Trivia
    [4] = {
        text = "Did you know: Abyssal whips are made from Abyssal Demon spines. Allegedly.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.equipment.slots.mainHand == config.Obj.ABYSSAL_WHIP.configName
        end
    },
    [5] = {
        text = "Did you know: You cannot eat a mud pie. Because it contains compost and clay. And you shouldn't eat those. Apparently.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
    },
    [6] = {
        text = "Did you know: Hans is the oldest NPC in RuneScape. He looks good for his age.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
    },
    [7] = {
        text = "Did you know: Mint cakes were once considered highly valuable. They still are to me. I like the taste.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.GrandExchange
        end
    },
    [8] = {
        text = "Did you know: A bug once caused the red Fremennik cloak to provide extreme defensive boosts. A very fashionable bug.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
    },
    [9] = {
        text = "Did you know: The symbol of Guthix used to look different in RuneScape Classic.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
    },
    [10] = {
        text = "Did you know: There's a ninja hiding on a bench in Rimmington. Just examine it, you'll see.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.special.hasExaminedRimmingtonBench == false
        end,
    },
    [13] = {
        text = "The quest name \"A Void Dance\" is a play on the word \"avoidance\". Or maybe \"avoid dance\", which is what I do.",
        audio = "The quest name A Void Dance is a play on the word avoidance. Or maybe avoid dance, which is what I do.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
    },
    [14] = {
        text = "Baxtorian's name is a wordplay on the word \"backstory\". Jagex are not very subtle.",
        audio = "Baxtorian's name is a wordplay on the word backstory. Jagex are not very subtle.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
    },
    [18] = {
        text = "The Grand Exchange isn't all that useful to you, by the way.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.GrandExchange and state.isIronman
        end
    },
    [24] = {
        text = "I'm feeling a bit hungry. Would you mind cooking a chicken on War's campfire?",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Bored,
        requirements = function(state)
            return state.area.WarsRetreat
        end
    },
    [31] = {
        text = "Did you know: the name 'Lumbridge' is a reference to 'Cambridge', where Jagex HQ is located.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.Lumbridge
        end
    },
    [33] = {
        text = "Did you know: Falador Park used to be where a lot of players did their trading. I don't think the gardener liked it very much.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.Falador
        end
    },
    [34] = {
        text = "Did you know: Many elves and elven places names are Welsh words.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.Tirannwn or state.area.Prifddinas
        end
    },
    [35] = {
        text = "Did you know: 'Prifddinas' is the Welsh word for 'Capital'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.Prifddinas
        end
    },
    [36] = {
        text = "Did you know: Fairy rings exist in real life. Sadly, they are not very useful for transportation.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral
    },

    [40] = {
        text = "Did you know: If you drop magic logs, you can see the stars moving.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral
    },
    [41] = {
        text = "Did you know: Magic logs used to look like a lighter version of willow logs.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral
    },
    [42] = {
        text = "Did you know: The 'g' in 'gnome' is silent.",
        audio = "Did you know: The 'g' in 'nome' is silent.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.GnomeStronghold
        end
    },
    [43] = {
        text = "Did you know: Ghasts can turn easter eggs into rotten food. A fast way to lose money.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.MortMyreSwamp
        end
    },
    [47] = {
        text = "Did you know: The names of these islands are puns on 'Ya, tis' so' and 'Nay, tis' not'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.FremennikIsles
        end
    },
    [48] = {
        text = "Yak perfume is popular among goblins.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.area.NeitiznotYakPen
        end
    },
    [49] = {
        text = "If you pickpocket the Yanille pillory guard, you'll get free tomatoes.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.area.Yanille
        end
    },
    [50] = {
        text = "The walls of this city look perfect for trapping penguins.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Quizzical,
        requirements = function(state)
            return state.area.Yanille
        end
    },

    -- Quest
    [11] = {
        text = "I like Hazelmere. I hope nothing bad happens to him.",
        audio = "I like Hazel mere. I hope nothing bad happens to him.",
        type = SpeakerEventType.TICK,
        category = LineCategory.QUEST,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.quest.theGrandTree
                and state.quest.whileGuthixSleeps == false
        end,
    },
    [12] = {
        text = "I miss Hazelmere. He was a nice guy.",
        audio = "I miss Hazel mere. He was a nice guy.",
        type = SpeakerEventType.TICK,
        category = LineCategory.QUEST,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.quest.whileGuthixSleeps
        end,
    },

    -- Level
    [15] = {
        text = "You look tough. Can you take down the King Black Dragon by wielding nothing more than a bronze dagger?",
        type = SpeakerEventType.TICK,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.skill.attack.level >= 99
        end,
    },

    -- Money
    [16] = {
        text = "If you need money, you can high alch items.",
        type = SpeakerEventType.TICK,
        category = LineCategory.MONEY,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.coins < 1000000
        end,
    },
    [17] = {
        text = "If you need money, you can high alch items. But you cannot high alch people, because that would be wrong.",
        type = SpeakerEventType.TICK,
        category = LineCategory.MONEY,
        animation = LineAnimation.Shifty,
        requirements = function(state)
            return state.coins < 1000000
        end,
    },

    -- Humor
    [25] = {
        text = "Roses are red, violets are blue, your familiar is a pack yak, baroo baroo",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Bored,
        requirements = function(state)
            return state.follower == config.Obj.LORE_PACK_YAK
        end
    },
    [26] = {
        text = "I enjoy Dungeoneering. It is my favorite minigame.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.area.Daemonheim
        end
    },
    [27] = {
        text = "I heard that the Wise Old Man once robbed a Draynor bank. It is nice to see elderly people with active hobbies.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.area.DraynorVillage
        end
    },
    [29] = {
        text = "Cows have a hundred words for grass. And they're all different variations of 'Moo'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state)
            return state.area.LumbridgeCowPen
        end
    },
    [30] = {
        text = "I actually speak a little cow. 'Moo' means 'Hello', and also 'Goodbye'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.LumbridgeCowPen
        end
    },
    [32] = {
        text = "Archaeologist are weird. Why would you dig up dirt if you don't plan on eating it?",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical,
        requirements = function(state)
            return state.area.VarrockDigSite
        end
    },
    [38] = {
        text = "Nobody can agree on how to pronouncing this city's name. Best to just call it 'Ardy'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Shifty,
        requirements = function(state)
            return state.area.EastArdougne
        end
    },
    [45] = {
        text = "What do you call a terrified Mort Myre spirit? An aghast ghast.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state)
            return state.area.MortMyreSwamp
        end
    },

    -- Death
    [55] = {
        text = "Say hello to Death for me!",
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical
    },
    [51] = {
        text = "I don't believe dying was the right thing to do there.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical
    },
    [52] = {
        text = "Donating money to Death's retirement fund is very kind of you.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical
    },
    [53] = {
        text = "Have you considered not dying?",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical
    },
    [54] = {
        text = "It is nice of you to keep Death company.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy
    },
    [56] = {
        text = "Did you mean to die like that?",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical,
    },
    [57] = {
        text = "You died very gracefully. It did not look embarrassing at all.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy
    },
    [58] = {
        text = "That looked painful...",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical
    },
    [59] = {
        text = "Should I bless your grave, or...?",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral
    },
    [60] = {
        text = "You are the weakest link. Goodbye.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral
    },
    [61] = {
        text = "No fire cape for you.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.TzhaarFightCave
        end
    },
    [62] = {
        text = "That death was udderly embarrassing. Get it? Udder-ly!",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state)
            return state.area.LumbridgeCowPen
        end
    },
    [63] = {
        text = "They should rename that place to SomewhatHarmless.",
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state)
            return state.area.MosLeHarmless
        end
    },
}
