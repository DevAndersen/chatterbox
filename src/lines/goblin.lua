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

---@type table<string, Line>
return {
    -- Generic
    ["HappyGeneric"] = {
        text = {
            ["GoblinBuddy"] = "I am your goblin buddy.",
            ["TastyCabbages"] = "Cabbages are actually very tasty."
        },
        weight = 2,
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Happy,
    },
    ["AntiScam"] = {
        text = {
            ["Doubling"] = "Someone once told me they'd double my money. Turns out they were just trying to scam me.",
            ["Trading"] = "Always remember: When trading with others, double-check what's in the trading window before completing the trade."
        },
        weight = 2,
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
    },
    ["GoblinVillage"] = {
        text = "It is always nice to visit my home town.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GoblinVillage
        end
    },
    ["LumbridgeGoblins"] = {
        text = "I was once on vacation here. The local goblins were very nice to me.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.LumbridgeGoblins
        end
    },
    ["DraynorManorQuizzical"] = {
        text = "For a haunted manor, this place has quite a few residents. I wonder if they all get along.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.DraynorManor
        end
    },
    ["PiscatorisFishingColonyNeutral"] = {
        text = "Monkfish don't look very much like monks.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.PiscatorisFishingColony
        end
    },
    ["FightCaveTip"] = {
        text = "Remember, Jad's healers will respawn if they heal him up to full health.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.TzhaarFightCave
        end
    },
    ["SnelmFashion"] = {
        text = "Those snails have some pretty shells. They would make for an excellent hat.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.MortMyreSwamp
        end
    },
    ["CanifisShifty"] = {
        text = "The citizens in this place gives me the creeps.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.area.Canifis
        end
    },

    -- Equipment
    ["HamRobes"] = {
        text = "Are those H.A.M. robes? I hope you are just wearing them because you like the color pink.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.equipment.special.fullHam
        end,
    },
    ["PartyhatNeutral"] = {
        text = "Judging by your hat, you are ready to party.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.equipment.special.partyhat
        end
    },
    ["PartyhatHappy"] = {
        text = "That hat looks very expensive. But not nearly as comfortable as mine.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.equipment.special.partyhat
        end
    },
    ["SantaHat"] = {
        text = "Does Santa know that you took his hat? Stealing people's hats isn't a very nice thing to do.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.equipment.special.santaHat
        end
    },
    ["HalloweenMask"] = {
        text = "That mask makes you look very scary. But I'm not sure it is going to work on bosses.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.equipment.special.halloweenMask
        end
    },
    ["FixedDevice"] = {
        text = "That 'sheep painting device' of yours looks rather intimidating.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.equipment.slots.mainHand == config.Obj.MOURNING_PAINT_GUN.configName
        end
    },
    ["archaeologyIndy"] = {
        text = "You archaeologists sure do love your whips.",
        type = SpeakerEventType.TICK,
        category = LineCategory.EQUIPMENT,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.equipment.slots.mainHand == config.whip and state.skill.archaeology.level >= 75
        end
    },

    -- Trivia
    ["AbyssalWhipSpine"] = {
        text = "Did you know: Abyssal whips are made from Abyssal Demon spines. Allegedly.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.equipment.slots.mainHand == config.Obj.ABYSSAL_WHIP.configName
        end
    },
    ["MintCakeCurrency"] = {
        text = "Did you know: Mint cakes were once considered highly valuable. They still are to me. I like the taste.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GrandExchange
        end
    },
    ["RimmingtonNinja"] = {
        text = "Did you know: There's a ninja hiding on a bench in Rimmington. Just examine it, you'll see.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.special.hasExaminedRimmingtonBench == false
        end,
    },
    ["GrandExchangeIronman"] = {
        text = "The Grand Exchange isn't all that useful to you, by the way.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GrandExchange and state.isIronman
        end
    },
    ["WarCampfireChicken"] = {
        text = "I'm feeling a bit hungry. Would you mind cooking a chicken on War's campfire?",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Bored,
        requirements = function(state, eventData)
            return state.area.WarsRetreat
        end
    },
    ["LumbridgeTriviaNeutral"] = {
        text = "Did you know: the name 'Lumbridge' is a reference to 'Cambridge', where Jagex HQ is located.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Lumbridge
        end
    },
    ["FaladorTriviaNeutral"] = {
        text = "Did you know: Falador Park used to be where a lot of players did their trading. I don't think the gardener liked it very much.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Falador
        end
    },
    ["ElfTrivia"] = {
        text = "Did you know: Many elves and elven place names are actually Welsh words.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Tirannwn or state.area.Prifddinas
        end
    },
    ["PrifddinasTrivia"] = {
        text = "Did you know: 'Prifddinas' is the Welsh word for 'Capital'.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Prifddinas
        end
    },
    ["PrifddinasHumor"] = {
        text = "Do you get to the Cadarn district very often? Oh, what am I saying - of course you don't.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.Prifddinas and not state.skill.maxed
        end
    },
    ["NeutralTrivia"] = {
        text = {
            ["FairyRings"] = "Did you know: Fairy rings exist in real life. Sadly, they are not very useful for transportation.",
            ["MagicLogs"] = "Did you know: If you drop magic logs, you can see the stars moving.",
            ["WillowLogs"] = "Did you know: Magic logs used to look like a lighter version of willow logs.",
            ["Baxtorian"] = "Baxtorian's name is a wordplay on the word backstory. Jagex are not very subtle.",
            ["Avoidance"] = "The quest name A Void Dance is a play on the word avoidance. Or maybe avoid dance, which is what I do.",
            ["RedFremmyCloak"] = "Did you know: A bug once caused the red Fremennik cloak to provide extreme defensive boosts. A very fashionable bug.",
            ["ClassicGuthixSymbol"] = "Did you know: The symbol of Guthix used to look different in RuneScape Classic.",
            ["Hans"] = "Did you know: Hans is the oldest NPC in RuneScape. He looks good for his age.",
            ["MudPie"] = "Did you know: You cannot eat a mud pie. Because it contains compost and clay. And you shouldn't eat those. Apparently."
        },
        weight = 9,
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral
    },
    ["GnomeTriviaNeutral"] = {
        text = "Did you know: The 'g' in 'gnome' is silent.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.GnomeStronghold
        end
    },
    ["MortMyreEasterEgg"] = {
        text = "Did you know: Ghasts can turn easter eggs into rotten food. A fast way to lose money.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.MortMyreSwamp
        end
    },
    ["FremennikIslesNames"] = {
        text = "Did you know: The names of these islands are puns on \"Ya, tis' so\" and \"Nay, tis' not\".",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.FremennikIsles
        end
    },
    ["YakPenPerfume"] = {
        text = "Yak perfume is popular among goblins.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.NeitiznotYakPen
        end
    },
    ["YanilleFreeTomatoes"] = {
        text = "If you pickpocket the Yanille pillory guard, you'll get free tomatoes.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.Yanille
        end
    },
    ["YanillePenguinWalls"] = {
        text = "The walls of this city look perfect for trapping penguins.",
        type = SpeakerEventType.TICK,
        category = LineCategory.TRIVIA,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.Yanille
        end
    },

    -- Quest
    ["HazelmereAlive"] = {
        text = "I like Hazelmere. I hope nothing bad happens to him.",
        type = SpeakerEventType.TICK,
        category = LineCategory.QUEST,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.quest.theGrandTree
                and state.quest.whileGuthixSleeps == false
        end,
    },
    ["HazelmereDead"] = {
        text = "I miss Hazelmere. He was a nice guy.",
        type = SpeakerEventType.TICK,
        category = LineCategory.QUEST,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.quest.whileGuthixSleeps
        end,
    },

    -- Skills
    ["AttackMaxNeutral"] = {
        text = "You look tough. Can you take down the King Black Dragon by wielding nothing more than a bronze dagger?",
        type = SpeakerEventType.TICK,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.skill.attack.level >= 99
        end,
    },
    ["HalfwayTo99"] = {
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
    ["Level98"] = {
        text = {
            ["Congrats"] = "Congratulations, just one more level to go until 99!",
            ["Nice"] = "Nice, just one more level until 99!"
        },
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.level == 98
        end,
    },
    ["Level99"] = {
        text = "Congratulations!",
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.level == 99
        end,
    },
    ["Level120"] = {
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
            ["Simple"] = "Congratulations!",
            ["Compliment"] = "Congratulations! 200m, that's huge!",
        },
        type = SpeakerEventType.SKILL,
        category = LineCategory.SKILL,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return eventData.totalXP == 200000000 and eventData.gainedXP > 0
        end,
    },

    -- Money
    ["MoneySub1mNeutral"] = {
        text = {
            ["Alch"] = "If you need money, you can high alch items.",
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.MONEY,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.coins < 1000000
        end,
    },
    ["MoneySub1mShifty"] = {
        text = {
            ["AlchPeople"] = "If you need money, you can high alch items. But you cannot high alch people, because that would be wrong.",
            ["Pickpocketing"] = "If you need money, you could always try looking in other people's pockets...",
            ["Thieving"] = "I've heard that thieving is an excellent way to make some quick money."
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.MONEY,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.coins < 1000000
        end,
    },

    -- Humor
    ["PackYakHappy"] = {
        text = {
            ["Roses"] = "Roses are red, violets are blue, your familiar is a pack yak, baroo baroo.",
            ["Snack"] = "If you fill your yak with food, does it become a snack yak?",
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.follower == config.Obj.LORE_PACK_YAK
        end
    },
    ["DungeoneeringHappy"] = {
        text = "I enjoy Dungeoneering. It is my favorite minigame.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.Daemonheim
        end
    },
    ["DraynorVillageHappy"] = {
        text = "I heard that the Wise Old Man once robbed a Draynor bank. It is nice to see elderly people with active hobbies.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.DraynorVillage
        end
    },
    ["LumbridgeCowPenHumor"] = {
        text = {
            ["HundredMoos"] = "Cows have a hundred words for grass. And they're all different variations of 'Moo'.",
            ["SpeakMoo"] = "I actually speak a little cow. 'Moo' means 'Hello', and also 'Goodbye'.",
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.LumbridgeCowPen
        end
    },
    ["DigsiteQuizzical"] = {
        text = "Archaeologist are weird. Why would you dig up dirt if you don't plan on eating it?",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.VarrockDigSite
        end
    },
    ["EastArdougnePronunciation"] = {
        text = {
            ["Ardy"] = "Nobody can agree on how to pronouncing this city's name. Best to just call it 'Ardy'.",
            ["ArrDoyNee"] = "The name of this city is actually pronounced like 'Arr-doy-nee'.",
            ["ArrDoughNee"] = "The name of this city is actually pronounced like 'Arr-dough-nee'.",
            ["ArrDoyn"] = "The name of this city is actually pronounced like 'Arr-doyn'.",
            ["ArdOughNee"] = "The name of this city is actually pronounced like 'Ard-ough-nee'.",
            ["Varrock"] = "The name of this city is actually pronounced like 'Varrock'.",
        },
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Shifty,
        requirements = function(state, eventData)
            return state.area.EastArdougne
        end
    },
    ["MortMyreAghast"] = {
        text = "What do you call a terrified Mort Myre spirit? An aghast ghast!",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return state.area.MortMyreSwamp
        end
    },

    -- Death
    ["QuizzicalDeath"] = {
        text = {
            ["SayHello"] = "Say hello to Death for me!",
            ["DontBelieve"] = "I don't believe dying was the right thing to do there.",
            ["Considered"] = " Have you considerednot dying?",
            ["Mean"] = "Did you mean to die like that?",
            ["Looked"] = "That looked painful...",
            ["Bless"] = "Should I bless your grave, or...?"
        },
        weight = 5,
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical
    },
    ["HappyDeath"] = {
        text = {
            ["Donating"] = "Donating money to Death's retirement fund is very kind of you.",
            ["Company"] = "It is nice of you to keep Death company.",
            ["Gracefully"] = "You died very gracefully. It did not look embarrassing at all.",
            ["Link"] = "You are the weakest link. Goodbye."
        },
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy
    },
    ["DeathFightCave"] = {
        text = {
            ["NoFireCape"] = "No fire cape for you.",
            ["BetterLuck"] = "Oh well. Better luck next time.",
        },
        weight = 10000,
        type = SpeakerEventType.DEATH,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.TzhaarFightCave
        end
    },
    ["LumbridgeCowPenDeath"] = {
        text = "That death was udderly embarrassing. Get it? Udder-ly!",
        weight = 10000,
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.HappyExtreme,
        requirements = function(state, eventData)
            return state.area.LumbridgeCowPen
        end
    },
    ["MosLeHarmlessDeath"] = {
        text = "They should rename that place to SomewhatHarmless.",
        weight = 2,
        type = SpeakerEventType.DEATH,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return state.area.MosLeHarmless
        end
    },
    ["BarrowsHumor"] = {
        text = "If you saw a bird feasting on bones here, would that be a barrow marrow sparrow?",
        weight = 2,
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Happy,
        requirements = function(state, eventData)
            return state.area.Barrows
        end
    },
    ["FairiesOnTheMoon"] = {
        text = "I've heard rumors that there are fairies on the moon. Sounds like nonsense to me.",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return not state.quest.lostCity
        end
    },
    ["Gadget"] = {
        text = "You seem to know a lot about mining and crafting. I knew someone else like that once. Think his name was Steve.",
        type = SpeakerEventType.TICK,
        category = LineCategory.HUMOR,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.skill.mining.level >= 99 and state.skill.crafting.level >= 99
        end
    },
    ["ThievingSkillingLow"] = {
        text = {
            ["Wrong"] = "You do realize stealing is wrong, right?",
            ["Criminal"] = "So, you've decided to become a criminal?",
            ["Pay"] = "Crime doesn't pay, you know...",
        },
        type = SpeakerEventType.SKILL,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return eventData.skill == SkillType.THIEVING and eventData.level < 50
        end
    },
    ["ThievingSkillingHigh"] = {
        text = {
            ["Good"] = "You're a pretty good thief. That was not a compliment.",
            ["Pay"] = "So, it turns out that crime does pay.",
        },
        type = SpeakerEventType.SKILL,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return eventData.skill == SkillType.THIEVING and eventData.level >= 70
        end
    },
    ["FishingSkillHigh"] = {
        text = {
            ["BigFish"] = "I was on a fishing trip once. Caught a fish that was thiiiiiiis big.",
        },
        type = SpeakerEventType.SKILL,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return eventData.skill == SkillType.FISHING and eventData.level >= 70
        end
    },
    ["MiningLevel"] = {
        text = {
            ["Rock"] = "You rock!",
        },
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return eventData.skill == SkillType.MINING and eventData.level >= 50
        end
    },
    ["RunecraftingLevel"] = {
        text = {
            ["Arms"] = "Remember, don't runecraft till your arms fall off.",
        },
        type = SpeakerEventType.LEVEL,
        category = LineCategory.SKILL,
        animation = LineAnimation.Neutral,
        requirements = function(state, eventData)
            return eventData.skill == SkillType.RUNECRAFTING and eventData.level >= 90
        end
    },
    ["CrandorBeforeElvarg"] = {
        text = "Are you sure it's a good idea to enter the lair of a vicious dragon...?",
        type = SpeakerEventType.TICK,
        category = LineCategory.GENERIC,
        animation = LineAnimation.Quizzical,
        requirements = function(state, eventData)
            return state.area.Crandor and not state.quest.dragonSlayer
        end
    },
}
