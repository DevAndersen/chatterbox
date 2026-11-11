local regionState = require("src/regionState")

-- Write the player's current grid coordinates to the developer console
log(tostring(GetPlayerCoords()))

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
    local playerCoordGrid = GetPlayerCoords()
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

function drawTileBorder(vec3)
    -- Geometry
    local groundHeight = World.GetGroundHeight(vec3.y, vec3.x * tileSize, vec3.z * tileSize) + 20

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
        translation = (vec3 * tileSize) + Vector3.new(halfTileSize, groundHeight, halfTileSize),
        ignoreDepth = false
    }
end

function drawRegion(pos1, pos2)
    drawRegionSquare(pos1, pos2)
    drawTileBorder(Vector3.new(pos1.x, pos1.level, pos1.z))
    drawTileBorder(Vector3.new(pos2.x, pos2.level, pos2.z))
end

local regionRenderDistance = 32

Event.Draw.Subscribe("chatterboxDebugRegionDrawEvent", function()
    local playerCoordGrid = GetPlayerCoords()
    local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)

    for _, region in pairs(regionState.regions) do

        -- Determine if the player is close enough to the region that it should be rendered
        local aabb = AABB.new(
            Vector3.new(region.Pos1.x - regionRenderDistance, region.Pos1.level - regionRenderDistance, region.Pos1.z - regionRenderDistance),
            Vector3.new(region.Pos2.x + regionRenderDistance, region.Pos2.level + regionRenderDistance, region.Pos2.z + regionRenderDistance))

        if aabb:IsInside(playerPos) then
            drawRegion(region.Pos1, region.Pos2)
        end
    end
end)
