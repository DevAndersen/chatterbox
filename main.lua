-- Global script imports.
require("src/speakerEventType")
require("src/lineCategory")
require("src/lineAnimation")
Speakers = require("src/speakers")

-- Function scripts.
local contentLayerFunctions = require("src/interfaces/contentLayer")
local mainWindowFunctions = require("src/interfaces/window")
--require("src/debugAreaRenderer")

-- Global variables.
Speaker = nil
SpeakerId = 1
ShowMainWindow = false
MainWindow = nil
ContentLayerInterface = contentLayerFunctions.createContentLayer()

-- Local variables
local mainLogicEventName = "mainLogicEventName"
local mainSkillTransmitEventName = "mainSkillTransmitEventName"
local previousLifepoints = var.VarPlayer.LIFEPOINTS.value

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

---Called after a set amount of client-side logic event ticks.
local function onRandomTick()
    mainWindowFunctions.speakEvent(SpeakerEventType.TICK)
end

---Called when the player trains a skill. Also triggers if no XP is gained.
local function onTrainSkill(skill, level, xp)
    mainWindowFunctions.speakEvent(SpeakerEventType.SKILL, { Skill = skill, Level = level, XP = xp })
end

---Called when the player gain a new level.
local function onGainLevel(skill, level, xp)
    mainWindowFunctions.speakEvent(SpeakerEventType.LEVEL, { Skill = skill, Level = level, XP = xp })
end

---Called when the player gain XP.
local function onGainXP(skill, level, xp)
    mainWindowFunctions.speakEvent(SpeakerEventType.XP, { Skill = skill, Level = level, XP = xp })
end

---Called when the player dies.
local function onDeath()
    mainWindowFunctions.speakEvent(SpeakerEventType.DEATH)
end

Event.SkillTransmit.Subscribe(mainSkillTransmitEventName, function(skillTransmitEvent)
    local skill = skillTransmitEvent.skill
    local oldXP = skillTransmitEvent.oldXP
    local newXP = skillTransmitEvent.newXP
    local oldLevel = skillTransmitEvent.oldGameplayLevel
    local newLevel = skillTransmitEvent.newGameplayLevel
    local gainedXP = newXP - oldXP

    onTrainSkill(skill, newLevel, gainedXP)

    if oldLevel ~= newLevel then
        onGainLevel(skill, newLevel, gainedXP)
    end

    if oldXP ~= newXP then
        onGainXP(skill, newLevel, gainedXP)
    end
end)

Event.Logic.Subscribe(mainLogicEventName, function(logicEvent)
    -- Random tick
    if logicEvent.logicTick % 100 == 0 and math.floor(random(0, 50)) == 0 then
        onRandomTick()
    end

    -- Check if the player has died.
    local currentLifepoints = var.VarPlayer.LIFEPOINTS.value
    if logicEvent.logicTick % 30 == 0 then
        if currentLifepoints == 0 and previousLifepoints > 0 then
            onDeath()
        end
        previousLifepoints = currentLifepoints
    end
end)

---Plugin shutdown cleanup
function PluginShutdown()
    -- Clean up main window
    mainWindowFunctions.destroyMainWindow()

    -- Clean up content layer
    contentLayerFunctions.destroyContentLayer()

    Event.SkillTransmit.Unsubscribe(mainSkillTransmitEventName)
    Event.Logic.Unsubscribe(mainLogicEventName)
end
