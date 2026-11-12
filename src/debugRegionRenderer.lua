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
    local realPlayerCoordGrid = Player.GetEntity().coordGrid
    local playerPos = Vector3.new(realPlayerCoordGrid.x, realPlayerCoordGrid.level, realPlayerCoordGrid.z)
    local isPlayerInside = aabb:IsInside(playerPos)

    -- Coordinates
    local groundHeight = World.GetGroundHeight(realPlayerCoordGrid.level, realPlayerCoordGrid.x * tileSize, realPlayerCoordGrid.z * tileSize) + 1020
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
    local realPlayerCoordGrid = Player.GetEntity().coordGrid
    local playerCoordGrid = GetPlayerCoords()
    local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)

    for _, region in pairs(regionState.regions) do
        -- Determine if the player is close enough to the region that it should be rendered
        local aabb = AABB.new(
            Vector3.new(region.Pos1.x - regionRenderDistance, region.Pos1.level - regionRenderDistance, region.Pos1.z - regionRenderDistance),
            Vector3.new(region.Pos2.x + regionRenderDistance, region.Pos2.level + regionRenderDistance, region.Pos2.z + regionRenderDistance))

        if aabb:IsInside(playerPos) then

            local pos1 = CoordFine.new(region.Pos1.level, region.Pos1.x, region.Pos1.z)
            local pos2 = CoordFine.new(region.Pos2.level, region.Pos2.x, region.Pos2.z)

            -- If the player is currently in a region, determine the offset from the origin
            if World.IsRegion() then
                local diffX = realPlayerCoordGrid.x - playerCoordGrid.x
                local diffZ = realPlayerCoordGrid.z - playerCoordGrid.z
                pos1.x = pos1.x + diffX
                pos1.z = pos1.z + diffZ
                pos2.x = pos2.x + diffX
                pos2.z = pos2.z + diffZ
            end

            drawRegion(pos1, pos2)
        end
    end
end)
