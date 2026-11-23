-- Debugging/development helper script, visualizes areas and prints the player's coordinates to the console.

local areaRenderDistance = 32
local areaStateFunctions = require("src/states/area")

-- Write the player's current grid coordinates to the developer console.
local scriptStartPlayerCoordinates = GetPlayerCoords()
if scriptStartPlayerCoordinates then
    print(string.format("%d, %d, %d, %d, %d",
        scriptStartPlayerCoordinates.level,
        scriptStartPlayerCoordinates.mapSquareX,
        scriptStartPlayerCoordinates.mapSquareZ,
        scriptStartPlayerCoordinates.localX,
        scriptStartPlayerCoordinates.localZ))
end

-- Shape data

---The size of a grid tile in fine units.
local tileSize = 512
local halfTileSize = tileSize / 2
local tris = { 0, 1, 2, 0, 2, 3 }
local lines = { 0, 1, 1, 2, 2, 3, 3, 0 }

---Draw square over the game tiles of the area, with coloring depending if the player is currently inside or outside of the area.
---@param pos1 CoordGrid
---@param pos2 CoordGrid
---@param isPlayerInside boolean
local function drawAreaSquare(pos1, pos2, isPlayerInside)
    -- Ensure that the two positions are on the same level.
    if pos1.level ~= pos2.level then
        log(string.format(">>> Skipping area [%s, %s], the positions are not on the same level", tostring(pos1), tostring(pos2)))
        return
    end

    -- Geometry
    local aabb = AABB.new(Vector3.new(pos1.x, pos1.level, pos1.z), Vector3.new(pos2.x, pos2.level, pos2.z))
    local realPlayerCoordGrid = Player.GetEntity().coordGrid

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

---Draws a border on the specified game tile.
---@param vec3 Vector3
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

---Draw an area, including the corner positions.
---@param pos1 CoordGrid
---@param pos2 CoordGrid
---@param isPlayerInside boolean
local function drawArea(pos1, pos2, isPlayerInside)
    drawAreaSquare(pos1, pos2, isPlayerInside)
    drawTileBorder(Vector3.new(pos1.x, pos1.level, pos1.z))
    drawTileBorder(Vector3.new(pos2.x, pos2.level, pos2.z))
end

---Draws an area, or its subareas.
---@param area Area
---@param isPlayerInsideArea boolean
local function drawAreaOrSubAreas(area, isPlayerInsideArea)
    if area.Pos1 and area.Pos2 then
        drawArea(area.Pos1, area.Pos2, isPlayerInsideArea)
    elseif area.SubAreas then
        for _, subArea in pairs(area.SubAreas) do
            drawArea(subArea.Pos1, subArea.Pos2, isPlayerInsideArea)
        end
    end
end

---Returns a new expanded version of the passed area, expanded outwards by the specified expansion size.
---@param area Area
---@param expansionSize integer
---@return Area
local function expandArea(area, expansionSize)
    local pos1Fine = area.Pos1:ToCoordFine(false)
    local pos2Fine = area.Pos2:ToCoordFine(false)
    local expansionSizeFineUnit = expansionSize * tileSize

    local pos1Vec3 = Vector3.new(pos1Fine.x - expansionSizeFineUnit, pos1Fine.level, pos1Fine.z - expansionSizeFineUnit)
    local pos2Vec3 = Vector3.new(pos2Fine.x + expansionSizeFineUnit, pos2Fine.level, pos2Fine.z + expansionSizeFineUnit)
    local expandedPos1 = CoordGrid.new(area.Pos1.level, pos1Vec3)
    local expandedPos2 = CoordGrid.new(area.Pos2.level, pos2Vec3)

    return {
        Pos1 = expandedPos1,
        Pos2 = expandedPos2
    }
end

---Renders nearby areas.
---An area is considered to be nearby if the player resides inside an expanded version of the area (to avoid unnecessarily rendering far-away areas).
---The actual aeras then rendered in the game, with the color indicating whether or not the player is currently inside of them.
local function renderAreas()
    local areas = areaStateFunctions.areas
    local realPlayerCoordGrid = Player.GetEntity().coordGrid
    local playerCoordGrid = GetPlayerCoords()

    -- Ensure that the player's coordinates were not nil.
    if not realPlayerCoordGrid or not playerCoordGrid then
        return
    end

    local playerPos = Vector3.new(playerCoordGrid.x, playerCoordGrid.level, playerCoordGrid.z)

    for _, area in pairs(areas) do
        local isPlayerInsideArea = false

        -- Iterate over all areas (or subareas) to determine if the player resides inside their expanded version(s).
        if area.Pos1 and area.Pos2 then
            isPlayerInsideArea = areaStateFunctions.isPlayerInsideArea(expandArea(area, areaRenderDistance), playerPos)
        elseif area.SubAreas then
            for _, subarea in pairs(area.SubAreas) do
                if areaStateFunctions.isPlayerInsideArea(expandArea(subarea, areaRenderDistance), playerPos) then
                    isPlayerInsideArea = true
                end
            end
        end

        if isPlayerInsideArea then
            drawAreaOrSubAreas(area, areaStateFunctions.isPlayerInsideArea(area, playerPos))
        end
    end
end


Event.Draw.Subscribe("chatterboxDebugAreaDrawEvent", function()
    renderAreas()
end)
