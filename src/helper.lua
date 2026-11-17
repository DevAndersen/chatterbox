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
