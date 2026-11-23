---Defined areas, and whether or not the player is currently inside of them.
---@class AreaState
---@field Lumbridge boolean
---@field GrandExchange boolean
---@field Varrock boolean
---@field AlKharid boolean
---@field KharidianDesert boolean
---@field MortMyreSwamp boolean
---@field Falador boolean
---@field BandosRemains boolean
---@field GoblinVillage boolean
---@field Wilderness boolean
---@field WarsRetreat boolean
---@field LumbridgeGoblins boolean
---@field DraynorManor boolean
---@field Rimmington boolean
---@field GnomeMaze boolean
---@field Yanille boolean
---@field EastArdougne boolean
---@field WestArdougne boolean
---@field PlayerOwnedFarm boolean
---@field Catherby boolean
---@field Camelot boolean
---@field SeersVillage boolean
---@field Rellekka boolean
---@field FremennikIsles boolean
---@field PiscatorisFishingColony boolean
---@field DraynorVillage boolean
---@field KerapacArena boolean
---@field CroesusFront boolean
---@field ArchGlacorArena boolean
---@field Prifddinas boolean
---@field MaxGuild boolean
---@field PortSarim boolean
---@field Entrana boolean
---@field Menaphos boolean
---@field Sophanem boolean
---@field Wendlewick boolean
---@field Amberfell boolean
---@field LinbogVillage boolean
---@field Heathervein boolean
---@field Canifis boolean
---@field Daemonheim boolean
---@field PortPhasmatys boolean
---@field Barrows boolean
---@field Edgeville boolean
---@field GnomeStronghold boolean
---@field PiscatorisHunteAarea boolean
---@field Karamja boolean
---@field FortForinthry boolean
---@field MosLeHarmless boolean
---@field Havenhythe boolean
---@field EverlightDigSite boolean
---@field VarrockDigSite boolean
---@field Lletya boolean
---@field TzHaarCity boolean
---@field TzhaarFightCave boolean
---@field LumbridgeCowPen boolean
---@field Tirannwn boolean
---@field NeitiznotYakPen boolean
---@field BrimhavenAgilityArena boolean
---@field Um boolean
---@field UmRitualSite boolean
---@field GateOfElidinis boolean
---@field SanctumOfRebirthVermyxArena boolean
---@field SanctumOfRebirthKezalamArena boolean
---@field SanctumOfRebirthNakatraArena boolean
---@field TheLostGrove boolean
---@field ZukArena boolean
---@field ZukThrone boolean
---@field KalphiteKingArena boolean
---@field ExiledKalphiteQueenArena boolean
---@field KalphiteQueenArena boolean
---@field TheHeartOfGielinorMainArea boolean Note: Overlaps with HelwyrArena.
---@field GregorovicArena boolean
---@field TwinFuriesArena boolean
---@field VindictaAndGorvekArena boolean
---@field HelwyrArena boolean Note: Overlaps with TheHeartOfGielinorMainArea
---@field TelosArena boolean
---@field AraxxorArena boolean
---@field AraxxiArena boolean
---@field GodWarsDungeon boolean Note: Overlaps with GraardorArena, KreearraArena, ZilyanaArena, and KrilTsutsarothArena.
---@field GraardorArena boolean Note: Overlaps with GodWarsDungeon.
---@field KreearraArena boolean Note: Overlaps with GodWarsDungeon.
---@field ZilyanaArena boolean Note: Overlaps with GodWarsDungeon.
---@field KrilTsutsarothArena boolean Note: Overlaps with GodWarsDungeon.
---@field NexArena boolean
---@field NexAngelOfDeathArena boolean
---@field VoragoArena boolean
---@field ZemouregalAndVorkathArena boolean
---@field IvarArena boolean
---@field DwarvenMine boolean
---@field LivingRockCaverns boolean
---@field Crandor boolean
---@field RuneSpanBottomFloor boolean
---@field RuneSpanMiddleFloor boolean
---@field RuneSpanTopFloor boolean
---@field DeepSeaFishingHub boolean
---@field FightArena boolean
---@field PaleWispColony boolean
---@field FlickeringWispColony boolean
---@field BrightWispColony boolean
---@field GleamingWispColony boolean
---@field VibrantWispColony boolean
---@field LustrousWispColony boolean
---@field ElderWispColony boolean
---@field BrilliantWispColony boolean
---@field RadiantWispColony boolean
---@field LuminousWispColony boolean
---@field IncandescentWispColony boolean
---@field MusaPointPier boolean

---Defines an area of the game world.
---@class Area
---@field Pos1 CoordGrid? The south-western corner of the area.
---@field Pos2 CoordGrid? The north-eastern corner of the area.
---@field SubAreas Area[]? The north-eastern corner of the area.

---Defined areas
---Note: The two corner positions of areas must be on the same level (first CoordGrid constructor parameter).
---@type table<string, Area>
local areas = {
    Lumbridge = {
        Pos1 = CoordGrid.new(0, 49, 50, 60, 2),
        Pos2 = CoordGrid.new(0, 50, 51, 40, 0),
    },
    GrandExchange = {
        Pos1 = CoordGrid.new(0, 49, 54, 3, 12),
        Pos2 = CoordGrid.new(0, 49, 54, 54, 60),
    },
    Varrock = {
        Pos1 = CoordGrid.new(0, 49, 52, 39, 45),
        Pos2 = CoordGrid.new(0, 51, 54, 24, 60),
    },
    AlKharid = {
        Pos1 = CoordGrid.new(0, 51, 49, 2, 2),
        Pos2 = CoordGrid.new(0, 52, 50, 9, 20),
    },
    KharidianDesert = {
        Pos1 = CoordGrid.new(0, 48, 44, 14, 7),
        Pos2 = CoordGrid.new(0, 54, 49, 28, 18),
    },
    MortMyreSwamp = {
        Pos1 = CoordGrid.new(0, 53, 51, 28, 61),
        Pos2 = CoordGrid.new(0, 55, 53, 4, 60),
    },
    Falador = {
        Pos1 = CoordGrid.new(0, 45, 51, 56, 42),
        Pos2 = CoordGrid.new(0, 47, 52, 55, 63),
    },
    BandosRemains = {
        Pos1 = CoordGrid.new(0, 46, 54, 17, 14),
        Pos2 = CoordGrid.new(0, 46, 54, 40, 38),
    },
    GoblinVillage = {
        Pos1 = CoordGrid.new(0, 46, 54, 0, 37),
        Pos2 = CoordGrid.new(0, 46, 54, 20, 60),
    },
    Wilderness = {
        Pos1 = CoordGrid.new(0, 46, 55, 6, 5),
        Pos2 = CoordGrid.new(0, 52, 62, 44, 10),
    },
    WarsRetreat = {
        Pos1 = CoordGrid.new(0, 50, 158, 54, 2),
        Pos2 = CoordGrid.new(0, 51, 158, 60, 41),
    },
    LumbridgeGoblins = {
        Pos1 = CoordGrid.new(0, 50, 50, 41, 25),
        Pos2 = CoordGrid.new(0, 51, 50, 0, 54),
    },
    DraynorManor = {
        Pos1 = CoordGrid.new(0, 48, 52, 15, 4),
        Pos2 = CoordGrid.new(0, 49, 52, 4, 53),
    },
    Rimmington = {
        Pos1 = CoordGrid.new(0, 45, 49, 63, 52),
        Pos2 = CoordGrid.new(0, 46, 50, 27, 23),
    },
    GnomeMaze = {
        Pos1 = CoordGrid.new(0, 39, 49, 9, 5),
        Pos2 = CoordGrid.new(0, 39, 49, 58, 54),
    },
    Yanille = {
        Pos1 = CoordGrid.new(0, 39, 48, 47, 3),
        Pos2 = CoordGrid.new(0, 40, 48, 60, 38),
    },
    EastArdougne = {
        Pos1 = CoordGrid.new(0, 39, 51, 63, 0),
        Pos2 = CoordGrid.new(0, 41, 52, 62, 9),
    },
    WestArdougne = {
        Pos1 = CoordGrid.new(0, 38, 51, 29, 17),
        Pos2 = CoordGrid.new(0, 39, 52, 60, 6),
    },
    PlayerOwnedFarm = {
        Pos1 = CoordGrid.new(0, 41, 52, 11, 10),
        Pos2 = CoordGrid.new(0, 41, 52, 61, 52),
    },
    Catherby = {
        SubAreas = {
            Town = {
                Pos1 = CoordGrid.new(0, 43, 53, 28, 30),
                Pos2 = CoordGrid.new(0, 44, 54, 17, 12),
            },
            Beach = {
                Pos1 = CoordGrid.new(0, 44, 53, 14, 37),
                Pos2 = CoordGrid.new(0, 44, 53, 45, 45),
            },
            Beach2 = {
                Pos1 = CoordGrid.new(0, 44, 53, 32, 32),
                Pos2 = CoordGrid.new(0, 44, 53, 45, 36),
            },
        },
    },
    Camelot = {
        Pos1 = CoordGrid.new(0, 42, 54, 56, 18),
        Pos2 = CoordGrid.new(0, 43, 54, 31, 61),
    },
    SeersVillage = {
        Pos1 = CoordGrid.new(0, 42, 54, 0, 0),
        Pos2 = CoordGrid.new(0, 42, 54, 51, 50),
    },
    Rellekka = {
        Pos1 = CoordGrid.new(0, 40, 57, 42, 0),
        Pos2 = CoordGrid.new(0, 42, 58, 0, 6),
    },
    FremennikIsles = {
        Pos1 = CoordGrid.new(0, 36, 59, 3, 0),
        Pos2 = CoordGrid.new(0, 37, 60, 59, 59),
    },
    PiscatorisFishingColony = {
        Pos1 = CoordGrid.new(0, 36, 57, 8, 15),
        Pos2 = CoordGrid.new(0, 36, 57, 52, 54),
    },
    DraynorVillage = {
        Pos1 = CoordGrid.new(0, 48, 50, 5, 33),
        Pos2 = CoordGrid.new(0, 48, 51, 34, 18),
    },
    KerapacArena = {
        Pos1 = CoordGrid.new(0, 5, 2, 14, 14),
        Pos2 = CoordGrid.new(0, 5, 2, 46, 49),
    },
    CroesusFront = {
        Pos1 = CoordGrid.new(0, 28, 19, 35, 10),
        Pos2 = CoordGrid.new(0, 29, 19, 61, 53),
    },
    ArchGlacorArena = {
        Pos1 = CoordGrid.new(1, 27, 16, 18, 41),
        Pos2 = CoordGrid.new(1, 27, 16, 49, 47),
    },
    Prifddinas = {
        Pos1 = CoordGrid.new(1, 32, 51, 52, 13),
        Pos2 = CoordGrid.new(1, 35, 53, 49, 62),
    },
    MaxGuild = {
        Pos1 = CoordGrid.new(1, 35, 51, 26, 37),
        Pos2 = CoordGrid.new(1, 35, 51, 46, 52),
    },
    PortSarim = {
        Pos1 = CoordGrid.new(0, 47, 49, 0, 41),
        Pos2 = CoordGrid.new(0, 47, 51, 51, 0),
    },
    Entrana = {
        Pos1 = CoordGrid.new(0, 43, 52, 50, 2),
        Pos2 = CoordGrid.new(0, 44, 52, 55, 63),
    },
    Menaphos = {
        Pos1 = CoordGrid.new(0, 48, 40, 3, 43),
        Pos2 = CoordGrid.new(0, 50, 43, 53, 55),
    },
    Sophanem = {
        Pos1 = CoordGrid.new(0, 51, 42, 4, 14),
        Pos2 = CoordGrid.new(0, 51, 43, 58, 56),
    },
    Wendlewick = {
        Pos1 = CoordGrid.new(0, 53, 23, 28, 3),
        Pos2 = CoordGrid.new(0, 55, 24, 0, 46),
    },
    Amberfell = {
        Pos1 = CoordGrid.new(0, 58, 24, 2, 14),
        Pos2 = CoordGrid.new(0, 58, 24, 44, 50),
    },
    LinbogVillage = {
        Pos1 = CoordGrid.new(0, 60, 21, 23, 54),
        Pos2 = CoordGrid.new(0, 62, 23, 10, 18),
    },
    Heathervein = {
        Pos1 = CoordGrid.new(0, 60, 26, 2, 1),
        Pos2 = CoordGrid.new(0, 60, 26, 45, 35),
    },
    Canifis = {
        Pos1 = CoordGrid.new(0, 54, 54, 18, 11),
        Pos2 = CoordGrid.new(0, 54, 54, 62, 52),
    },
    Daemonheim = {
        Pos1 = CoordGrid.new(0, 53, 56, 0, 36),
        Pos2 = CoordGrid.new(0, 54, 59, 63, 13),
    },
    PortPhasmatys = {
        Pos1 = CoordGrid.new(0, 57, 54, 2, 1),
        Pos2 = CoordGrid.new(0, 57, 55, 63, 11),
    },
    Barrows = {
        SubAreas = {
            Barrows1 = {
                Pos1 = CoordGrid.new(0, 55, 51, 28, 10),
                Pos2 = CoordGrid.new(0, 55, 51, 63, 45),
            },
            Barrows2 = {
                Pos1 = CoordGrid.new(0, 55, 150, 8, 7),
                Pos2 = CoordGrid.new(0, 55, 150, 58, 56),
            },
            Barrows3 = {
                Pos1 = CoordGrid.new(0, 55, 151, 4, 3),
                Pos2 = CoordGrid.new(0, 55, 151, 59, 58),
            },
            Barrows4 = {
                Pos1 = CoordGrid.new(0, 55, 149, 6, 44),
                Pos2 = CoordGrid.new(0, 55, 149, 30, 57),
            }
        }
    },
    Edgeville = {
        Pos1 = CoordGrid.new(0, 48, 54, 2, 6),
        Pos2 = CoordGrid.new(0, 48, 55, 43, 0),
    },
    GnomeStronghold = {
        Pos1 = CoordGrid.new(0, 37, 53, 7, 3),
        Pos2 = CoordGrid.new(0, 38, 54, 61, 58),
    },
    PiscatorisHunteAarea = {
        Pos1 = CoordGrid.new(0, 35, 55, 52, 10),
        Pos2 = CoordGrid.new(0, 37, 57, 36, 11),
    },
    Karamja = {
        SubAreas = {
            Karamja1 = {
                Pos1 = CoordGrid.new(0, 42, 45, 2, 1),
                Pos2 = CoordGrid.new(0, 46, 49, 24, 46),
            },
            Karamja2 = {
                Pos1 = CoordGrid.new(0, 42, 48, 0, 55),
                Pos2 = CoordGrid.new(0, 43, 50, 59, 50),
            }
        }
    },
    FortForinthry = {
        Pos1 = CoordGrid.new(0, 51, 55, 10, 11),
        Pos2 = CoordGrid.new(0, 52, 55, 8, 55),
    },
    MosLeHarmless = {
        Pos1 = CoordGrid.new(0, 56, 45, 59, 44),
        Pos2 = CoordGrid.new(0, 60, 48, 17, 1),
    },
    Havenhythe = {
        Pos1 = CoordGrid.new(0, 53, 20, 7, 49),
        Pos2 = CoordGrid.new(0, 63, 28, 54, 10),
    },
    EverlightDigSite = {
        Pos1 = CoordGrid.new(0, 57, 48, 38, 57),
        Pos2 = CoordGrid.new(0, 59, 51, 46, 53),
    },
    VarrockDigSite = {
        Pos1 = CoordGrid.new(0, 51, 52, 51, 16),
        Pos2 = CoordGrid.new(0, 53, 53, 2, 50),
    },
    Lletya = {
        Pos1 = CoordGrid.new(0, 36, 49, 14, 18),
        Pos2 = CoordGrid.new(0, 36, 49, 54, 59),
    },
    TzHaarCity = {
        Pos1 = CoordGrid.new(0, 70, 78, 63, 62),
        Pos2 = CoordGrid.new(0, 74, 80, 61, 60),
    },
    TzhaarFightCave = {
        Pos1 = CoordGrid.new(0, 69, 80, 0, 0),
        Pos2 = CoordGrid.new(0, 69, 80, 63, 63),
    },
    LumbridgeCowPen = {
        Pos1 = CoordGrid.new(0, 50, 50, 53, 55),
        Pos2 = CoordGrid.new(0, 51, 51, 2, 34),
    },
    Tirannwn = {
        Pos1 = CoordGrid.new(0, 33, 48, 37, 29),
        Pos2 = CoordGrid.new(0, 36, 51, 21, 11),
    },
    NeitiznotYakPen = {
        Pos1 = CoordGrid.new(0, 36, 59, 11, 10),
        Pos2 = CoordGrid.new(0, 36, 59, 24, 24),
    },
    BrimhavenAgilityArena = {
        Pos1 = CoordGrid.new(3, 43, 149, 7, 8),
        Pos2 = CoordGrid.new(3, 43, 149, 55, 56),
    },
    Um = {
        Pos1 = CoordGrid.new(1, 15, 26, 0, 25),
        Pos2 = CoordGrid.new(1, 18, 29, 62, 62),
    },
    UmRitualSite = {
        Pos1 = CoordGrid.new(1, 16, 27, 0, 32),
        Pos2 = CoordGrid.new(1, 16, 27, 26, 58),
    },
    GateOfElidinis = {
        Pos1 = CoordGrid.new(2, 85, 30, 0, 0),
        Pos2 = CoordGrid.new(2, 85, 30, 63, 63),
    },
    SanctumOfRebirthVermyxArena = {
        Pos1 = CoordGrid.new(1, 86, 21, 8, 41),
        Pos2 = CoordGrid.new(1, 86, 21, 55, 55),
    },
    SanctumOfRebirthKezalamArena = {
        Pos1 = CoordGrid.new(1, 85, 23, 18, 16),
        Pos2 = CoordGrid.new(1, 85, 23, 44, 48),
    },
    SanctumOfRebirthNakatraArena = {
        Pos1 = CoordGrid.new(1, 88, 21, 18, 12),
        Pos2 = CoordGrid.new(1, 88, 21, 43, 58),
    },
    TheLostGrove = {
        Pos1 = CoordGrid.new(0, 20, 87, 11, 8),
        Pos2 = CoordGrid.new(0, 22, 89, 59, 53),
    },
    ZukArena = {
        Pos1 = CoordGrid.new(0, 15, 6, 17, 15),
        Pos2 = CoordGrid.new(0, 15, 6, 47, 49),
    },
    ZukThrone = {
        Pos1 = CoordGrid.new(1, 15, 6, 31, 52),
        Pos2 = CoordGrid.new(1, 15, 6, 33, 53),
    },
    KalphiteKingArena = {
        Pos1 = CoordGrid.new(0, 46, 27, 16, 18),
        Pos2 = CoordGrid.new(0, 46, 27, 46, 46),
    },
    ExiledKalphiteQueenArena = {
        Pos1 = CoordGrid.new(0, 46, 26, 3, 29),
        Pos2 = CoordGrid.new(0, 46, 26, 38, 52),
    },
    KalphiteQueenArena = {
        Pos1 = CoordGrid.new(0, 54, 148, 10, 10),
        Pos2 = CoordGrid.new(0, 54, 148, 52, 46),
    },
    TheHeartOfGielinorMainArea = {
        Pos1 = CoordGrid.new(1, 48, 107, 45, 40),
        Pos2 = CoordGrid.new(1, 51, 110, 19, 16),
    },
    GregorovicArena = {
        Pos1 = CoordGrid.new(1, 51, 110, 24, 24),
        Pos2 = CoordGrid.new(1, 51, 110, 47, 47),
    },
    TwinFuriesArena = {
        Pos1 = CoordGrid.new(1, 48, 110, 21, 21),
        Pos2 = CoordGrid.new(1, 48, 110, 40, 40),
    },
    VindictaAndGorvekArena = {
        Pos1 = CoordGrid.new(1, 48, 107, 16, 17),
        Pos2 = CoordGrid.new(1, 48, 107, 39, 47),
    },
    HelwyrArena = {
        Pos1 = CoordGrid.new(1, 51, 107, 16, 25),
        Pos2 = CoordGrid.new(1, 51, 107, 39, 47),
    },
    TelosArena = {
        SubAreas = {
            TelosArena1 = {
                Pos1 = CoordGrid.new(0, 59, 110, 10, 10),
                Pos2 = CoordGrid.new(0, 59, 110, 33, 33),
            },
            TelosArena2 = {
                Pos1 = CoordGrid.new(0, 60, 110, 10, 10),
                Pos2 = CoordGrid.new(0, 60, 110, 33, 33),
            },
            TelosArena3 = {
                Pos1 = CoordGrid.new(0, 59, 109, 10, 10),
                Pos2 = CoordGrid.new(0, 59, 109, 33, 33),
            },
            TelosArena4 = {
                Pos1 = CoordGrid.new(1, 60, 109, 12, 13),
                Pos2 = CoordGrid.new(1, 60, 109, 49, 50),
            }
        }
    },
    AraxxorArena = {
        Pos1 = CoordGrid.new(1, 70, 97, 10, 37),
        Pos2 = CoordGrid.new(1, 71, 98, 29, 8),
    },
    AraxxiArena = {
        Pos1 = CoordGrid.new(1, 71, 97, 36, 46),
        Pos2 = CoordGrid.new(1, 71, 98, 57, 5),
    },
    GodWarsDungeon = {
        Pos1 = CoordGrid.new(0, 44, 82, 0, 0),
        Pos2 = CoordGrid.new(0, 45, 83, 63, 63),
    },
    GraardorArena = {
        Pos1 = CoordGrid.new(0, 44, 83, 47, 41),
        Pos2 = CoordGrid.new(0, 44, 83, 60, 59),
    },
    KreearraArena = {
        Pos1 = CoordGrid.new(0, 44, 82, 4, 47),
        Pos2 = CoordGrid.new(0, 44, 82, 22, 60),
    },
    ZilyanaArena = {
        Pos1 = CoordGrid.new(0, 45, 81, 36, 59),
        Pos2 = CoordGrid.new(0, 45, 82, 50, 8),
    },
    KrilTsutsarothArena = {
        Pos1 = CoordGrid.new(0, 45, 83, 38, 6),
        Pos2 = CoordGrid.new(0, 45, 83, 56, 20),
    },
    NexArena = {
        Pos1 = CoordGrid.new(0, 45, 81, 31, 5),
        Pos2 = CoordGrid.new(0, 45, 81, 59, 33),
    },
    NexAngelOfDeathArena = {
        Pos1 = CoordGrid.new(2, 44, 28, 15, 15),
        Pos2 = CoordGrid.new(2, 44, 28, 49, 49),
    },
    VoragoArena = {
        SubAreas = {
            VoragoArena1 = {
                Pos1 = CoordGrid.new(0, 48, 95, 20, 20),
                Pos2 = CoordGrid.new(0, 48, 95, 43, 43),
            },
            VoragoArena2 = {
                Pos1 = CoordGrid.new(0, 47, 94, 20, 20),
                Pos2 = CoordGrid.new(0, 47, 94, 43, 43),
            },
            VoragoArena3 = {
                Pos1 = CoordGrid.new(0, 48, 94, 20, 20),
                Pos2 = CoordGrid.new(0, 48, 94, 43, 43),
            },
            VoragoArena4 = {
                Pos1 = CoordGrid.new(0, 47, 93, 20, 20),
                Pos2 = CoordGrid.new(0, 47, 93, 43, 43),
            },
            VoragoArena5 = {
                Pos1 = CoordGrid.new(0, 48, 93, 19, 30),
                Pos2 = CoordGrid.new(0, 48, 93, 42, 34),
            }
        }
    },
    ZemouregalAndVorkathArena = {
        Pos1 = CoordGrid.new(0, 20, 33, 42, 34),
        Pos2 = CoordGrid.new(0, 21, 33, 22, 61),
    },
    IvarArena = {
        Pos1 = CoordGrid.new(0, 56, 25, 54, 36),
        Pos2 = CoordGrid.new(0, 57, 25, 4, 53),
    },
    DwarvenMine = {
        Pos1 = CoordGrid.new(0, 46, 152, 18, 4),
        Pos2 = CoordGrid.new(0, 47, 153, 52, 60),
    },
    LivingRockCaverns = {
        Pos1 = CoordGrid.new(0, 56, 79, 22, 20),
        Pos2 = CoordGrid.new(0, 57, 80, 41, 42),
    },
    Crandor = {
        Pos1 = CoordGrid.new(0, 43, 50, 60, 30),
        Pos2 = CoordGrid.new(0, 44, 51, 48, 46),
    },
    RuneSpanBottomFloor = {
        Pos1 = CoordGrid.new(1, 61, 94, 0, 0),
        Pos2 = CoordGrid.new(1, 62, 95, 63, 63),
    },
    RuneSpanMiddleFloor = {
        Pos1 = CoordGrid.new(1, 64, 94, 0, 0),
        Pos2 = CoordGrid.new(1, 65, 95, 63, 63),
    },
    RuneSpanTopFloor = {
        Pos1 = CoordGrid.new(1, 67, 94, 0, 0),
        Pos2 = CoordGrid.new(1, 68, 95, 63, 63),
    },
    DeepSeaFishingHub = {
        Pos1 = CoordGrid.new(0, 32, 110, 15, 37),
        Pos2 = CoordGrid.new(0, 33, 111, 36, 39),
    },
    FightArena = {
        Pos1 = CoordGrid.new(0, 40, 49, 3, 3),
        Pos2 = CoordGrid.new(0, 40, 49, 59, 60),
    },
    PaleWispColony = {
        Pos1 = CoordGrid.new(0, 48, 50, 43, 10),
        Pos2 = CoordGrid.new(0, 48, 50, 54, 21),
    },
    FlickeringWispColony = {
        Pos1 = CoordGrid.new(0, 46, 53, 57, 4),
        Pos2 = CoordGrid.new(0, 47, 53, 4, 15),
    },
    BrightWispColony = {
        Pos1 = CoordGrid.new(0, 51, 52, 34, 63),
        Pos2 = CoordGrid.new(0, 51, 53, 44, 9),
    },
    GlowingWispColony = {
        Pos1 = CoordGrid.new(0, 42, 53, 40, 14),
        Pos2 = CoordGrid.new(0, 42, 53, 52, 26),
    },
    SparklingWispColony = {
        Pos1 = CoordGrid.new(0, 43, 56, 12, 10),
        Pos2 = CoordGrid.new(0, 43, 56, 22, 18),
    },
    GleamingWispColony = {
        Pos1 = CoordGrid.new(0, 45, 47, 5, 35),
        Pos2 = CoordGrid.new(0, 45, 47, 14, 43),
    },
    VibrantWispColony = {
        Pos1 = CoordGrid.new(0, 37, 44, 48, 42),
        Pos2 = CoordGrid.new(0, 37, 44, 60, 58),
    },
    LustrousWispColony = {
        Pos1 = CoordGrid.new(0, 54, 55, 6, 12),
        Pos2 = CoordGrid.new(0, 54, 55, 18, 25),
    },
    ElderWispColony = {
        Pos1 = CoordGrid.new(0, 66, 98, 39, 40),
        Pos2 = CoordGrid.new(0, 66, 98, 63, 58),
    },
    BrilliantWispColony = {
        Pos1 = CoordGrid.new(0, 53, 51, 5, 22),
        Pos2 = CoordGrid.new(0, 53, 51, 20, 36),
    },
    RadiantWispColony = {
        Pos1 = CoordGrid.new(0, 59, 55, 22, 25),
        Pos2 = CoordGrid.new(0, 59, 55, 37, 38),
    },
    LuminousWispColony = {
        Pos1 = CoordGrid.new(0, 51, 41, 43, 27),
        Pos2 = CoordGrid.new(0, 51, 41, 57, 40),
    },
    IncandescentWispColony = {
        Pos1 = CoordGrid.new(0, 35, 47, 34, 33),
        Pos2 = CoordGrid.new(0, 35, 47, 52, 51),
    },
    MusaPointPier = {
        Pos1 = CoordGrid.new(0, 45, 49, 40, 39),
        Pos2 = CoordGrid.new(0, 45, 49, 49, 44),
    },
    SeersVillageFlaxField = {
        Pos1 = CoordGrid.new(0, 42, 53, 49, 45),
        Pos2 = CoordGrid.new(0, 42, 53, 63, 59),
    },
}

---Determines if the player is inside the areaa (including subareas).
---@param area Area
---@param playerPos Vector3
---@return boolean
local function isPlayerInsideArea(area, playerPos)
    if area.Pos1 and area.Pos2 then
        local areaAABB = AABB.new(Vector3.new(area.Pos1.x, area.Pos1.level, area.Pos1.z), Vector3.new(area.Pos2.x, area.Pos2.level, area.Pos2.z))
        return areaAABB:IsInside(playerPos)
    elseif area.SubAreas then
        for _, subArea in pairs(area.SubAreas) do
            local subAreaAABB = AABB.new(Vector3.new(subArea.Pos1.x, subArea.Pos1.level, subArea.Pos1.z), Vector3.new(subArea.Pos2.x, subArea.Pos2.level, subArea.Pos2.z))
            if subAreaAABB:IsInside(playerPos) then
                return true
            end
        end
    end
    return false
end

---Returns all defined areas, and whether or not the player is currently inside of them.
---@return AreaState
local getAreaState = function()
    local areaState = {}
    local playerCoordGrid = GetPlayerCoords()

    if playerCoordGrid then
        local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)

        -- Iterate over all areas, adding them as true or false to a table depending if the player is currently within an area.
        for key, area in pairs(areas) do
            areaState[key] = isPlayerInsideArea(area, playerPos)
        end
    end

    return areaState --[[@as AreaState]]
end

return {
    areas = areas,
    getAreaState = getAreaState,
    isPlayerInsideArea = isPlayerInsideArea
}
