local areaRenderDistance = 32

local areaState = require("src/states/area")

-- Write the player's current grid coordinates to the developer console.
log(tostring(GetPlayerCoords()))

-- Shape data
local tileSize = 512
local halfTileSize = tileSize / 2
local tris = { 0, 1, 2, 0, 2, 3 }
local lines = { 0, 1, 1, 2, 2, 3, 3, 0 }

local function drawAreaSquare(pos1, pos2)
    -- Ensure that the two positions are on the same level.
    if pos1.level ~= pos2.level then
        log(string.format(">>> Skipping area [%s, %s], the positions are not on the same level", tostring(pos1), tostring(pos2)))
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
    ShapeList.Draw({
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
    })
end

local function drawTileBorder(vec3)
    -- Geometry
    local groundHeight = World.GetGroundHeight(vec3.y, vec3.x * tileSize, vec3.z * tileSize) + 20

    -- Draw
    ShapeList.Draw({
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
    })
end

local function drawArea(pos1, pos2)
    drawAreaSquare(pos1, pos2)
    drawTileBorder(Vector3.new(pos1.x, pos1.level, pos1.z))
    drawTileBorder(Vector3.new(pos2.x, pos2.level, pos2.z))
end

Event.Draw.Subscribe("chatterboxDebugAreaDrawEvent", function()
    local realPlayerCoordGrid = Player.GetEntity().coordGrid
    local playerCoordGrid = GetPlayerCoords()

    -- Ensure that the player's coordinates were not nil.
    if realPlayerCoordGrid == nil or playerCoordGrid == nil then
        return
    end

    local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)

    for _, area in pairs(areaState.areas) do
        -- Determine if the player is close enough to the area that it should be rendered.
        local aabb = AABB.new(
            Vector3.new(area.Pos1.x - areaRenderDistance, area.Pos1.level - areaRenderDistance, area.Pos1.z - areaRenderDistance),
            Vector3.new(area.Pos2.x + areaRenderDistance, area.Pos2.level + areaRenderDistance, area.Pos2.z + areaRenderDistance))

        if aabb:IsInside(playerPos) then

            local pos1 = CoordFine.new(area.Pos1.level, area.Pos1.x, area.Pos1.z)
            local pos2 = CoordFine.new(area.Pos2.level, area.Pos2.x, area.Pos2.z)

            -- If the player is currently in a region (i.e. an instanced area), determine the offset from the origin.
            if World.IsRegion() then
                local diffX = realPlayerCoordGrid.x - playerCoordGrid.x
                local diffZ = realPlayerCoordGrid.z - playerCoordGrid.z
                pos1.x = pos1.x + diffX
                pos1.z = pos1.z + diffZ
                pos2.x = pos2.x + diffX
                pos2.z = pos2.z + diffZ
            end

            drawArea(pos1, pos2)
        end
    end
end)
