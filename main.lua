-- Global variables.
Speaker = nil
SpeakerId = 1
ShowMainWindow = false

-- Global script imports.
require("src/helper")
require("src/speakerEventType")
require("src/lineCategory")
require("src/lineAnimation")
Speakers = require("src/speakers")

-- Function scripts.
local contentLayerFunctions = require("src/interfaces/contentLayer")
local mainWindowFunctions = require("src/interfaces/window")
local eventListenerFunctions = require("src/eventListener")
--require("src/debugAreaRenderer")

ContentLayerInterface = contentLayerFunctions.createContentLayer()

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
