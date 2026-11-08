-- Write the player's current grid coordinates to the developer console
log(tostring(Player.GetEntity().coordGrid))

-- Shape data
local tileSize = 512
local halfTileSize = tileSize / 2
local tris = { 0, 1, 2, 0, 2, 3 }
local lines = { 0, 1, 1, 2, 2, 3, 3, 0 }

function drawRegionSquare(pos1, pos2)
    -- Ensure that the two positions are on the same level
    if pos1.level ~= pos2.level then
        log(string.format(">>> Skipping region [%s, %s], the positions are not on the same level", tostring(pos1), tostring(pos2)))
        return
    end

    -- Geometry
    local aabb = AABB.new(Vector3.new(pos1.x, pos1.level, pos1.z), Vector3.new(pos2.x, pos2.level, pos2.z))
    local playerCoordGrid = Player.GetEntity().coordGrid
    local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)
    local isPlayerInside = aabb:IsInside(playerPos)

    -- Coordinates
    local groundHeight = World.GetGroundHeight(playerCoordGrid.level, playerPos.x * tileSize, playerPos.z * tileSize) + 1020
    local minX = aabb.minX * tileSize
    local minZ = aabb.minZ * tileSize
    local maxX = (aabb.maxX + 1) * tileSize
    local maxZ = (aabb.maxZ + 1) * tileSize

    -- Colors
    local color = 0x49b6de88
    if isPlayerInside then
        color = 0x49de5a88
    end

    -- Draw
    ShapeList.Draw{
        shapePositions = {
            Vector3.new(minX, groundHeight, minZ),
            Vector3.new(maxX, groundHeight, minZ),
            Vector3.new(maxX, groundHeight, maxZ),
            Vector3.new(minX, groundHeight, maxZ)
        },
        shapeRGBA = { color, color, color, color },
        shapeTris = tris,
        shapeLines = lines,
        ignoreDepth = false
    }
end

function drawTileBorder(position)
    -- Geometry
    local groundHeight = World.GetGroundHeight(position.level, position.x * tileSize, position.z * tileSize) + 20

    -- Draw
    ShapeList.Draw{
        shapePositions = {
            Vector3.new(-halfTileSize, 0, -halfTileSize),
            Vector3.new(halfTileSize, 0, -halfTileSize),
            Vector3.new(halfTileSize, 0, halfTileSize),
            Vector3.new(-halfTileSize, 0, halfTileSize)
        },
        shapeRGBA = { 0xff0000ff, 0xff0000ff, 0xff0000ff, 0xff0000ff },
        shapeLines = lines,
        translation = position:ToCoordFine(true).position + Vector3.new(0, groundHeight, 0),
        ignoreDepth = false
    }
end

function drawRegion(pos1, pos2)
    drawRegionSquare(pos1, pos2)
    drawTileBorder(pos1)
    drawTileBorder(pos2)
end

local grandExchangePos1 = CoordGrid.new(0,49,54,3,12)
local grandExchangePos2 = CoordGrid.new(0,49,54,54,60)

local varrockPos1 = CoordGrid.new(0,49,52,39,45)
local varrockPos2 = CoordGrid.new(0,51,54,24,60)

local alKharidPos1 = CoordGrid.new(0,51,49,2,2)
local alKharidPos2 = CoordGrid.new(0,52,50,9,20)

local kharidianDesertPos1 = CoordGrid.new(0,48,44,14,7)
local kharidianDesertPos2 = CoordGrid.new(0,54,49,28,18)

local mortMyreSwampPos1 = CoordGrid.new(0,53,51,28,61)
local mortMyreSwampPos2 = CoordGrid.new(0,55,53,4,60)

local faladorPos1 = CoordGrid.new(0,45,51,56,42)
local faladorPos2 = CoordGrid.new(0,47,52,55,63)

local bandosRemainsPos1 = CoordGrid.new(0,46,54,17,14)
local bandosRemainsPos2 = CoordGrid.new(0,46,54,40,38)

local goblinVillagePos1 = CoordGrid.new(0,46,54,0,37)
local goblinVillagePos2 = CoordGrid.new(0,46,54,20,60)

local wildernessPos1 = CoordGrid.new(0,46,55,6,5)
local wildernessPos2 = CoordGrid.new(0,52,62,44,10)

local warsRetreatPos1 = CoordGrid.new(0,50,158,54,2)
local warsRetreatPos2 = CoordGrid.new(0,51,158,60,41)

local lumbridgePos1 = CoordGrid.new(0,49,50,60,2)
local lumbridgePos2 = CoordGrid.new(0,50,51,40,0)

local lumbridgeGoblinsPos1 = CoordGrid.new(0,50,50,41,25)
local lumbridgeGoblinsPos2 = CoordGrid.new(0,51,50,0,54)

local draynorManorPos1 = CoordGrid.new(0,48,52,15,4)
local draynorManorPos2 = CoordGrid.new(0,49,52,4,53)

local rimmingtonPos1 = CoordGrid.new(0,45,49,63,52)
local rimmingtonPos2 = CoordGrid.new(0,46,50,27,23)

local playerOwnedHouseIslandPos1 = CoordGrid.new(0,62,32,8,9)
local playerOwnedHouseIslandPos2 = CoordGrid.new(0,65,35,6,0)

local gnomeMazePos1 = CoordGrid.new(0,39,49,9,5)
local gnomeMazePos2 = CoordGrid.new(0,39,49,58,54)

local yanillePos1 = CoordGrid.new(0,39,48,47,3)
local yanillePos2 = CoordGrid.new(0,40,48,60,38)

local eastArdougnePos1 = CoordGrid.new(0,39,51,63,0)
local eastArdougnePos2 = CoordGrid.new(0,41,52,62,9)

local playerOwnedFarmPos1 = CoordGrid.new(0,41,52,11,10)
local playerOwnedFarmPos2 = CoordGrid.new(0,41,52,61,52)

local westArdougnePos1 = CoordGrid.new(0,38,51,29,17)
local westArdougnePos2 = CoordGrid.new(0,39,52,60,6)

local catherbyPos1 = CoordGrid.new(0,43,53,28,30)
local catherbyPos2 = CoordGrid.new(0,44,54,9,12)

local camelotPos1 = CoordGrid.new(0,43,54,31,61)
local camelotPos2 = CoordGrid.new(0,42,54,56,18)

local seersVillagePos1 = CoordGrid.new(0,42,54,0,0)
local seersVillagePos2 = CoordGrid.new(0,42,54,51,50)

local rellekkaPos1 = CoordGrid.new(0,40,57,42,0)
local rellekkaPos2 = CoordGrid.new(0,42,58,0,6)

local fremennikIslesPos1 = CoordGrid.new(0,36,59,3,0)
local fremennikIslesPos2 = CoordGrid.new(0,37,60,59,59)

local piscatorisPos1 = CoordGrid.new(0,36,57,8,15)
local piscatorisPos2 = CoordGrid.new(0,36,57,52,54)

local draynorVillagePos1 = CoordGrid.new(0,48,50,5,33)
local draynorVillagePos2 = CoordGrid.new(0,48,51,34,18)

local kerapacArenaPos1 = CoordGrid.new(0,249,7,14,14)
local kerapacArenaPos2 = CoordGrid.new(0,249,7,46,49)

local croesusFrontPos1 = CoordGrid.new(0,28,19,35,10)
local croesusFrontPos2 = CoordGrid.new(0,29,19,61,53)

local archGlacorArenaPos1 = CoordGrid.new(1,101,10,18,41)
local archGlacorArenaPos2 = CoordGrid.new(1,101,10,49,47)

--local Pos1 = CoordGrid.new()
--local Pos2 = CoordGrid.new()

Event.Draw.Subscribe("chatterboxDebugRegionDrawEvent", function()
    --drawRegion(grandExchangePos1, grandExchangePos2)
    --drawRegion(varrockPos1, varrockPos2)
    --drawRegion(alKharidPos1, alKharidPos2)
    --drawRegion(kharidianDesertPos1, kharidianDesertPos2)
    --drawRegion(mortMyreSwampPos1, mortMyreSwampPos2)
    --drawRegion(faladorPos1, faladorPos2)
    --drawRegion(bandosRemainsPos1, bandosRemainsPos2)
    --drawRegion(goblinVillagePos1, goblinVillagePos2)
    --drawRegion(wildernessPos1, wildernessPos2)
    --drawRegion(warsRetreatPos1, warsRetreatPos2)
    --drawRegion(lumbridgePos1, lumbridgePos2)
    --drawRegion(lumbridgeGoblinsPos1, lumbridgeGoblinsPos2)
    --drawRegion(draynorManorPos1, draynorManorPos2)
    --drawRegion(rimmingtonPos1, rimmingtonPos2)
    --drawRegion(playerOwnedHouseIslandPos1, playerOwnedHouseIslandPos2)
    --drawRegion(gnomeMazePos1, gnomeMazePos2)
    --drawRegion(yanillePos1, yanillePos2)
    --drawRegion(eastArdougnePos1, eastArdougnePos2)
    --drawRegion(playerOwnedFarmPos1, playerOwnedFarmPos2)
    --drawRegion(westArdougnePos1, westArdougnePos2)
    --drawRegion(catherbyPos1, catherbyPos2)
    --drawRegion(camelotPos1, camelotPos2)
    --drawRegion(seersVillagePos1, seersVillagePos2)
    --drawRegion(rellekkaPos1, rellekkaPos2)
    --drawRegion(fremennikIslesPos1, fremennikIslesPos2)
    --drawRegion(piscatorisPos1, piscatorisPos2)
    --drawRegion(draynorVillagePos1, draynorVillagePos2)
    --drawRegion(kerapacArenaPos1, kerapacArenaPos2)
    --drawRegion(croesusFrontPos1, croesusFrontPos2)
    --drawRegion(archGlacorArenaPos1, archGlacorArenaPos2)
end)
