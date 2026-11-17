-- Global script imports.
require("src/speakerEventType")
require("src/lineCategory")
require("src/lineAnimation")
Speakers = require("src/speakers")

-- Function scripts.
local contentLayerFunctions = require("src/interfaces/contentLayer")
local mainWindowFunctions = require("src/interfaces/window")
local eventListenerFunctions = require("src/eventListener")
--require("src/debugAreaRenderer")

-- Global variables.
Speaker = nil
SpeakerId = 1
ShowMainWindow = false
MainWindow = nil
ContentLayerInterface = contentLayerFunctions.createContentLayer()

-- Global functions
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

-- Register event listeners.
eventListenerFunctions.startEventListening()

---Plugin shutdown cleanup
function PluginShutdown()
    -- Clean up main window.
    mainWindowFunctions.destroyMainWindow()

    -- Clean up content layer.
    contentLayerFunctions.destroyContentLayer()

    -- Clean up event listening.
    eventListenerFunctions.stopEventListening()
end
