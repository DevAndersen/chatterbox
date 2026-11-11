-- Regions
-- Note: Regions must be on the same level (first CoordGrid constructor parameter)
local regions = {
    Lumbridge = {
        Pos1 = CoordGrid.new(0,49,50,60,2),
        Pos2 = CoordGrid.new(0,50,51,40,0),
    },
    GrandExchange = {
        Pos1 = CoordGrid.new(0,49,54,3,12),
        Pos2 = CoordGrid.new(0,49,54,54,60),
    },
    Varrock = {
        Pos1 = CoordGrid.new(0,49,52,39,45),
        Pos2 = CoordGrid.new(0,51,54,24,60),
    },
    AlKharid = {
        Pos1 = CoordGrid.new(0,51,49,2,2),
        Pos2 = CoordGrid.new(0,52,50,9,20),
    },
    KharidianDesert = {
        Pos1 = CoordGrid.new(0,48,44,14,7),
        Pos2 = CoordGrid.new(0,54,49,28,18),
    },
    MortMyreSwamp = {
        Pos1 = CoordGrid.new(0,53,51,28,61),
        Pos2 = CoordGrid.new(0,55,53,4,60),
    },
    Falador = {
        Pos1 = CoordGrid.new(0,45,51,56,42),
        Pos2 = CoordGrid.new(0,47,52,55,63),
    },
    BandosRemains = {
        Pos1 = CoordGrid.new(0,46,54,17,14),
        Pos2 = CoordGrid.new(0,46,54,40,38),
    },
    GoblinVillage = {
        Pos1 = CoordGrid.new(0,46,54,0,37),
        Pos2 = CoordGrid.new(0,46,54,20,60),
    },
    Wilderness = {
        Pos1 = CoordGrid.new(0,46,55,6,5),
        Pos2 = CoordGrid.new(0,52,62,44,10),
    },
    WarsRetreat = {
        Pos1 = CoordGrid.new(0,50,158,54,2),
        Pos2 = CoordGrid.new(0,51,158,60,41),
    },
    LumbridgeGoblins = {
        Pos1 = CoordGrid.new(0,50,50,41,25),
        Pos2 = CoordGrid.new(0,51,50,0,54),
    },
    Draynor = {
        Pos1 = CoordGrid.new(0,48,52,15,4),
        Pos2 = CoordGrid.new(0,49,52,4,53),
    },
    Rimmington = {
        Pos1 = CoordGrid.new(0,45,49,63,52),
        Pos2 = CoordGrid.new(0,46,50,27,23),
    },
    PlayerOwnedHouseIsland = {
        Pos1 = CoordGrid.new(0,62,32,8,9),
        Pos2 = CoordGrid.new(0,65,35,6,0),
    },
    GnomeMaze = {
        Pos1 = CoordGrid.new(0,39,49,9,5),
        Pos2 = CoordGrid.new(0,39,49,58,54),
    },
    Yanille = {
        Pos1 = CoordGrid.new(0,39,48,47,3),
        Pos2 = CoordGrid.new(0,40,48,60,38),
    },
    EastArdougne = {
        Pos1 = CoordGrid.new(0,39,51,63,0),
        Pos2 = CoordGrid.new(0,41,52,62,9),
    },
    WestArdougne = {
        Pos1 = CoordGrid.new(0,38,51,29,17),
        Pos2 = CoordGrid.new(0,39,52,60,6),
    },
    PlayerOwnedFarm = {
        Pos1 = CoordGrid.new(0,41,52,11,10),
        Pos2 = CoordGrid.new(0,41,52,61,52),
    },
    Catherby = {
        Pos1 = CoordGrid.new(0,43,53,28,30),
        Pos2 = CoordGrid.new(0,44,54,9,12),
    },
    Camelot = {
        Pos1 = CoordGrid.new(0,43,54,31,61),
        Pos2 = CoordGrid.new(0,42,54,56,18),
    },
    SeersVillage = {
        Pos1 = CoordGrid.new(0,42,54,0,0),
        Pos2 = CoordGrid.new(0,42,54,51,50),
    },
    Rellekka = {
        Pos1 = CoordGrid.new(0,40,57,42,0),
        Pos2 = CoordGrid.new(0,42,58,0,6),
    },
    FremennikIsles = {
        Pos1 = CoordGrid.new(0,36,59,3,0),
        Pos2 = CoordGrid.new(0,37,60,59,59),
    },
    PiscatorisFishingColony = {
        Pos1 = CoordGrid.new(0,36,57,8,15),
        Pos2 = CoordGrid.new(0,36,57,52,54),
    },
    DraynorVillage = {
        Pos1 = CoordGrid.new(0,48,50,5,33),
        Pos2 = CoordGrid.new(0,48,51,34,18),
    },
    KerapacArena = {
        Pos1 = CoordGrid.new(0,249,7,14,14),
        Pos2 = CoordGrid.new(0,249,7,46,49),
    },
    CroesusFront = {
        Pos1 = CoordGrid.new(0,28,19,35,10),
        Pos2 = CoordGrid.new(0,29,19,61,53),
    },
    ArchGlacorArena = {
        Pos1 = CoordGrid.new(1,101,10,18,41),
        Pos2 = CoordGrid.new(1,101,10,49,47),
    },
    Prifddinas = {
        Pos1 = CoordGrid.new(1,32,51,52,13),
        Pos2 = CoordGrid.new(1,35,53,49,62),
    },
    MaxGuild = {
        Pos1 = CoordGrid.new(1,35,51,26,37),
        Pos2 = CoordGrid.new(1,35,51,46,52),
    },
    PortSarim = {
        Pos1 = CoordGrid.new(0,47,49,0,41),
        Pos2 = CoordGrid.new(0,47,51,51,0),
    },
    Entrana = {
        Pos1 = CoordGrid.new(0,43,52,50,2),
        Pos2 = CoordGrid.new(0,44,52,55,63),
    },
    Menaphos = {
        Pos1 = CoordGrid.new(0,48,40,3,43),
        Pos2 = CoordGrid.new(0,50,43,53,55),
    },
    Sophanem = {
        Pos1 = CoordGrid.new(0,51,42,4,14),
        Pos2 = CoordGrid.new(0,51,43,58,56),
    },
    Wendlewick = {
        Pos1 = CoordGrid.new(0,53,23,28,3),
        Pos2 = CoordGrid.new(0,55,24,0,46),
    },
    Amberfell = {
        Pos1 = CoordGrid.new(0,58,24,2,14),
        Pos2 = CoordGrid.new(0,58,24,44,50),
    },
    LinbogVillage = {
        Pos1 = CoordGrid.new(0,60,21,23,54),
        Pos2 = CoordGrid.new(0,62,23,10,18),
    },
    Heathervein = {
        Pos1 = CoordGrid.new(0,60,26,2,1),
        Pos2 = CoordGrid.new(0,60,26,45,35),
    },
    Canifis = {
        Pos1 = CoordGrid.new(0,54,54,18,11),
        Pos2 = CoordGrid.new(0,54,54,62,52),
    },
    Daemonheim = {
        Pos1 = CoordGrid.new(0,53,56,0,36),
        Pos2 = CoordGrid.new(0,54,59,63,13),
    },
    PortPhasmatys = {
        Pos1 = CoordGrid.new(0,57,54,2,1),
        Pos2 = CoordGrid.new(0,57,55,63,11),
    },
    Barrows = {
        Pos1 = CoordGrid.new(0,55,51,28,10),
        Pos2 = CoordGrid.new(0,55,51,63,45),
    },
    Edgeville = {
        Pos1 = CoordGrid.new(0,48,54,2,6),
        Pos2 = CoordGrid.new(0,48,55,43,0),
    },
    GnomeStronghold = {
        Pos1 = CoordGrid.new(0,37,53,7,3),
        Pos2 = CoordGrid.new(0,38,54,61,58),
    },
    PiscatorisHunteAarea = {
        Pos1 = CoordGrid.new(0,35,55,52,10),
        Pos2 = CoordGrid.new(0,37,57,36,11),
    },
    Karamja = {
        Pos1 = CoordGrid.new(0,42,45,2,1),
        Pos2 = CoordGrid.new(0,46,49,24,46),
    },
    Karamja2 = { -- Todo
        Pos1 = CoordGrid.new(0,42,48,0,55),
        Pos2 = CoordGrid.new(0,43,50,59,50),
    },
    FortForinthry = {
        Pos1 = CoordGrid.new(0,51,55,10,11),
        Pos2 = CoordGrid.new(0,52,55,8,55),
    },
    MosLeHarmless = {
        Pos1 = CoordGrid.new(0,56,45,59,44),
        Pos2 = CoordGrid.new(0,60,48,17,1),
    },
    Havenhythe = {
        Pos1 = CoordGrid.new(0,53,20,7,49),
        Pos2 = CoordGrid.new(0,63,28,54,10),
    },
    EverlightDigSite = {
        Pos1 = CoordGrid.new(0,57,48,38,57),
        Pos2 = CoordGrid.new(0,59,51,46,53),
    },
    VarrockDigSite = {
        Pos1 = CoordGrid.new(0,51,52,51,16),
        Pos2 = CoordGrid.new(0,53,53,2,50),
    },
}


--Pos1 = CoordGrid.new(),
--Pos2 = CoordGrid.new(),

local getRegionState = function()
    local regionState = {}

    -- Iterate over all regions, adding them as true or false to a table depending if the player is currently within a region
    for key, value in pairs(regions) do
        local aabb = AABB.new(Vector3.new(value.Pos1.x, value.Pos1.level, value.Pos1.z), Vector3.new(value.Pos2.x, value.Pos2.level, value.Pos2.z))
        local playerCoordGrid = Player.GetEntity().coordGrid
        local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)
        regionState[key] = aabb:IsInside(playerPos)
    end

    return regionState
end

return {
    regions=regions,
    getRegionState=getRegionState
}
