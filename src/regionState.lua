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
    Piscatoris = {
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
    }
}

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
