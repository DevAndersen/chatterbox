---Describes a voice line and related information.
---@class Line
---@field text string | table<string, string> The string(s) displayed for the line.
---@field type SpeakerEventType The type of event that the line should be triggered by.
---@field category LineCategory The category of the line.
---@field animation string The animation to play when the line is being spoken.
---@field weight number? The optional weight of the line (how likely it is to be selected).
---@field requirements LineRequirement? An optional requirements check that must either be null or return true for the line to be available.

---A line requirement function.
---@alias LineRequirement fun(state: State, data: SpeakerEventData?): boolean

---@type Line[]
return {
    -- Generic
    ["happygeneric"] = {
        text = {
            ["goblinbuddy"] = "I am your goblin buddy.",
            ["tastycabbages"] = "Cabbages are actually very tasty."
        },
        weight = 2,
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy,
    },
    [19] = {
        text = "It is always nice to visit my home town.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GoblinVillage
        end
    },
    [20] = {
        text = "I was once on vacation here. The local goblins were very nice to me.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.LumbridgeGoblins
        end
    },
    [28] = {
        text = "For a haunted manor, this place has quite a few residents. I wonder if they all get along.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.DraynorManor
        end
    },
    [37] = {
        text = "Monkfish don't look very much like monks.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.PiscatorisFishingColony
        end
    },
    [39] = {
        text = "Remember, Jad's healers will respawn if they heal him up to full health.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.TzhaarFightCave
        end
    },
    [44] = {
        text = "Those snails have some pretty shells. They would make for an excellent hat.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.MortMyreSwamp
        end
    },
    [46] = {
        text = "The citizens in this place gives me the creeps.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.area.Canifis
        end
    },

    -- Equipment
    [3] = {
        text = "Are those HAM robes? I hope you are just wearing them because you like the color pink.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.equipment.special.fullHam
        end,
    },
    [21] = {
        text = "That hat looks very expensive. But not nearly as comfortable as mine.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.equipment.special.partyhat
        end
    },
    [22] = {
        text = "Does Santa know that you took his hat? Stealing people's hats isn't a very nice thing to do.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.equipment.special.santaHat
        end
    },
    [23] = {
        text = "That mask makes you look very scary. But I'm not sure it is going to work on bosses.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.equipment.special.halloweenMask
        end
    },
    [64] = {
        text = "Judging by your hat, you are ready to party.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.equipment.special.partyhat
        end
    },
    [65] = {
        text = "That 'sheep painting device' of yours looks rather intimidating.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.equipment.slots.mainHand == config.Obj.MOURNING_PAINT_GUN.configName
        end
    },
    [66] = {
        text = "You archaeologists sure do love your whips.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.equipment.slots.mainHand == config.whip and state.skill.archaeology.level > 75
        end
    },

    -- Trivia
    [4] = {
        text = "Did you know: Abyssal whips are made from Abyssal Demon spines. Allegedly.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.equipment.slots.mainHand == config.Obj.ABYSSAL_WHIP.configName
        end
    },
    [7] = {
        text = "Did you know: Mint cakes were once considered highly valuable. They still are to me. I like the taste.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GrandExchange
        end
    },
    [10] = {
        text = "Did you know: There's a ninja hiding on a bench in Rimmington. Just examine it, you'll see.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.special.hasExaminedRimmingtonBench == false
        end,
    },
    [18] = {
        text = "The Grand Exchange isn't all that useful to you, by the way.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GrandExchange and state.isIronman
        end
    },
    [24] = {
        text = "I'm feeling a bit hungry. Would you mind cooking a chicken on War's campfire?",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Bored,
        requirements = function(state, eventData)
            return state.area.WarsRetreat
        end
    },
    [31] = {
        text = "Did you know: the name 'Lumbridge' is a reference to 'Cambridge', where Jagex HQ is located.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Lumbridge
        end
    },
    [33] = {
        text = "Did you know: Falador Park used to be where a lot of players did their trading. I don't think the gardener liked it very much.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Falador
        end
    },
    [34] = {
        text = "Did you know: Many elves and elven places names are Welsh words.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Tirannwn or state.area.Prifddinas
        end
    },
    [35] = {
        text = "Did you know: 'Prifddinas' is the Welsh word for 'Capital'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Prifddinas
        end
    },
    ["neutraltrivia"] = {
        text = {
            ["fairyrings"] = "Did you know: Fairy rings exist in real life. Sadly, they are not very useful for transportation.",
            ["magiclogs"] = "Did you know: If you drop magic logs, you can see the stars moving.",
            ["willowlogs"] = "Did you know: Magic logs used to look like a lighter version of willow logs.",
            ["baxtorian"] = "Baxtorian's name is a wordplay on the word backstory. Jagex are not very subtle.",
            ["avoidance"] = "The quest name A Void Dance is a play on the word avoidance. Or maybe avoid dance, which is what I do.",
            ["redfremmycloak"] = "Did you know: A bug once caused the red Fremennik cloak to provide extreme defensive boosts. A very fashionable bug.",
            ["classicguthixsymbol"] = "Did you know: The symbol of Guthix used to look different in RuneScape Classic.",
            ["hans"] = "Did you know: Hans is the oldest NPC in RuneScape. He looks good for his age.",
            ["mudpie"] = "Did you know: You cannot eat a mud pie. Because it contains compost and clay. And you shouldn't eat those. Apparently."
        },
        weight = 9,
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral
    },
    [42] = {
        text = "Did you know: The 'g' in 'gnome' is silent.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GnomeStronghold
        end
    },
    [43] = {
        text = "Did you know: Ghasts can turn easter eggs into rotten food. A fast way to lose money.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.MortMyreSwamp
        end
    },
    [47] = {
        text = "Did you know: The names of these islands are puns on 'Ya, tis' so' and 'Nay, tis' not'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.FremennikIsles
        end
    },
    [48] = {
        text = "Yak perfume is popular among goblins.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.NeitiznotYakPen
        end
    },
    [49] = {
        text = "If you pickpocket the Yanille pillory guard, you'll get free tomatoes.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.Yanille
        end
    },
    [50] = {
        text = "The walls of this city look perfect for trapping penguins.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.Yanille
        end
    },

    -- Quest
    [11] = {
        text = "I like Hazelmere. I hope nothing bad happens to him.",
        type = SpeakerEventType.TICK,
        category = LineCategory.QUEST,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.quest.theGrandTree
                and state.quest.whileGuthixSleeps == false
        end,
    },
    [12] = {
        text = "I miss Hazelmere. He was a nice guy.",
        type = SpeakerEventType.TICK,
        category = LineCategory.QUEST,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.quest.whileGuthixSleeps
        end,
    },

    -- Skills
    [15] = {
        text = "You look tough. Can you take down the King Black Dragon by wielding nothing more than a bronze dagger?",
        type = SpeakerEventType.TICK,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.skill.attack.level >= 99
        end,
    },
    ["halfwayto99"] = {
        text = {
            ["a"] = "Congratulations, halfway to 99!",
            ["b"] = "Congratulations, that's halfway to 99!"
        },
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return (eventData.level == 92 and eventData.skill ~= SkillType.INVENTION) or (eventData.level == 84 and eventData.skill == SkillType.INVENTION)
        end,
    },
    ["level98"] = {
        text = {
            ["congrats"] = "Congratulations, just one more level to go until 99!",
            ["nice"] = "Nice, just one more level until 99!"
        },
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.level == 98
        end,
    },
    ["level99"] = {
        text = "Congratulations!",
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.level == 99
        end,
    },
    ["level120"] = {
        text = "Congratulations!",
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.level == 120
        end,
    },
    ["200m"] = {
        text = {
            ["simple"] = "Congratulations!",
            ["compliment"] = "Congratulations! 200m, that's huge!",
        },
        type = SpeakerEventType.SKILL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.totalXP == 200000000 and eventData.gainedXP > 0
        end,
    },

    -- Money
    ["moneysub1mneutral"] = {
        text = {
            ["alch"] = "If you need money, you can high alch items.",
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.MONEY,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.coins < 1000000
        end,
    },
    ["moneysub1mshifty"] = {
        text = {
            ["alchpeople"] = "If you need money, you can high alch items. But you cannot high alch people, because that would be wrong.",
            ["pickpocketing"] = "If you need money, you could always try looking in other people's pockets...",
            ["thieving"] = "I've heard that thieving is an excellent way to make some quick money."
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.MONEY,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.coins < 1000000
        end,
    },

    -- Humor
    [25] = {
        text = "Roses are red, violets are blue, your familiar is a pack yak, baroo baroo.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Bored,
        requirements = function(state, eventData)
            return state.follower == config.Obj.LORE_PACK_YAK
        end
    },
    [26] = {
        text = "I enjoy Dungeoneering. It is my favorite minigame.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.Daemonheim
        end
    },
    [27] = {
        text = "I heard that the Wise Old Man once robbed a Draynor bank. It is nice to see elderly people with active hobbies.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.DraynorVillage
        end
    },
    [29] = {
        text = "Cows have a hundred words for grass. And they're all different variations of 'Moo'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.LumbridgeCowPen
        end
    },
    [30] = {
        text = "I actually speak a little cow. 'Moo' means 'Hello', and also 'Goodbye'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.LumbridgeCowPen
        end
    },
    [32] = {
        text = "Archaeologist are weird. Why would you dig up dirt if you don't plan on eating it?",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.VarrockDigSite
        end
    },
    [38] = {
        text = "Nobody can agree on how to pronouncing this city's name. Best to just call it 'Ardy'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.area.EastArdougne
        end
    },
    [45] = {
        text = "What do you call a terrified Mort Myre spirit? An aghast ghast.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return state.area.MortMyreSwamp
        end
    },

    -- Death
    ["quizzicaldeath"] = {
        text = {
            ["sayhello"] = "Say hello to Death for me!",
            ["dontbelieve"] = "I don't believe dying was the right thing to do there.",
            ["considered"] = " Have you considerednot dying?",
            ["mean"] = "Did you mean to die like that?",
            ["looked"] = "That looked painful...",
            ["bless"] = "Should I bless your grave, or...?"
        },
        weight = 5,
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical
    },
    ["happydeath"] = {
        text = {
            ["donating"] = "Donating money to Death's retirement fund is very kind of you.",
            ["company"] = "It is nice of you to keep Death company.",
            ["gracefully"] = "You died very gracefully. It did not look embarrassing at all.",
            ["link"] = "You are the weakest link. Goodbye."
        },
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy
    },
    ["deathfightcave"] = {
        text = {
            ["nofirecape"] = "No fire cape for you.",
            ["luck"] = "Oh well. Better luck next time.",
        },
        weight = 10000,
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.TzhaarFightCave
        end
    },
    [62] = {
        text = "That death was udderly embarrassing. Get it? Udder-ly!",
        weight = 10000,
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return state.area.LumbridgeCowPen
        end
    },
    [63] = {
        text = "They should rename that place to SomewhatHarmless.",
        weight = 2,
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.MosLeHarmless
        end
    },
}
