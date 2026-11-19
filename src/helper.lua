---Get the current location of the player. Returns reference location if the player is currently in a region (i.e. an instance).
---@return CoordGrid?
function GetPlayerCoords()
    local playerCoordGrid = Player.GetEntity().coordGrid
    if World.IsRegion() then
        -- GetRegionSourceForCoordGrid rounds down to the nearest 8x8 zone, so this needs to be added back into the value before returning.
        local origin = World.GetRegionSourceForCoordGrid(playerCoordGrid)
        origin.x = origin.x + (playerCoordGrid.x % 8)
        origin.z = origin.z + (playerCoordGrid.z % 8)
        return origin
    else
        return playerCoordGrid
    end
end

---Returns the true number of elements in the provided table.
---@param table table
---@return integer
function GetTableCount(table)
    local count = 0

    for _ in pairs(table) do
        count = count + 1
    end

    return count
end

---Returns a random element from the provided table. Returns nil if the table is empty.
---@generic TKey The type of the table keys.
---@generic TValue The type of the table values.
---@param table table<TKey, TValue>
---@return TValue?, string?
function GetRandomTableElement(table)
    local keys = {}
    local isEmpty = true

    for key in pairs(table) do
        keys[#keys + 1] = key
        isEmpty = false
    end

    if isEmpty then
        return nil
    end

    local randomKey = keys[math.floor(random(1, #keys + 1))]
    return table[randomKey], randomKey
end
