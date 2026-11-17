-- Global variables
Speaker = nil
SpeakerId = 1
ShowMainWindow = false
MainWindow = nil
ContentLayerInterface = nil

require("src/speakerEventType")
require("src/lineCategory")
require("src/lineAnimation")
Speakers = require("src/speakers")

-- Local variables
local previousLifepoints = var.VarPlayer.LIFEPOINTS.value

-- Global functions
function GetPlayerCoords()
    local playerCoordGrid = Player.GetEntity().coordGrid
    if World.IsRegion() then
        -- GetRegionSourceForCoordGrid rounds down to the nearest 8x8 zone, so this needs to be added back into the value before returning
        local origin = World.GetRegionSourceForCoordGrid(playerCoordGrid)
        origin.x = origin.x + (playerCoordGrid.x % 8)
        origin.z = origin.z + (playerCoordGrid.z % 8)
        return origin
    else
        return playerCoordGrid
    end
end

-- Call script files
local contentLayerFunctions = require("src/interfaces/contentLayer")
local mainWindowFunctions = require("src/interfaces/window")
--require("src/debugRegionRenderer")

-- Called after a set amount of client-side logic event ticks.
function OnRandomTick()
    mainWindowFunctions.speakEvent(SpeakerEventType.TICK)
end

-- Called when the player trains a skill. Also triggers if no XP is gained.
function OnTrainSkill(skill, level, xp)
    mainWindowFunctions.speakEvent(SpeakerEventType.SKILL, { Skill = skill, Level = level, XP = xp })
end

-- Called when the player gain a new level.
function OnGainLevel(skill, level, xp)
    mainWindowFunctions.speakEvent(SpeakerEventType.LEVEL, { Skill = skill, Level = level, XP = xp })
end

-- Called when the player gain XP.
function OnGainXP(skill, level, xp)
    mainWindowFunctions.speakEvent(SpeakerEventType.XP, { Skill = skill, Level = level, XP = xp })
end

-- Called when the player dies.
function OnDeath()
    mainWindowFunctions.speakEvent(SpeakerEventType.DEATH)
end

Event.SkillTransmit.Subscribe("chatterboxSkillTriggerEvent", function(skillTransmitEvent)
    local skill = skillTransmitEvent.skill
    local oldXP = skillTransmitEvent.oldXP
    local newXP = skillTransmitEvent.newXP
    local oldLevel = skillTransmitEvent.oldGameplayLevel
    local newLevel = skillTransmitEvent.newGameplayLevel
    local gainedXP = newXP - oldXP

    OnTrainSkill(skill, newLevel, gainedXP)

    if oldLevel ~= newLevel then
        OnGainLevel(skill, newLevel, gainedXP)
    end

    if oldXP ~= newXP then
        OnGainXP(skill, newLevel, gainedXP)
    end
end)

Event.Logic.Subscribe("chatterboxLogicTriggerEvent", function(logicEvent)
    -- Random tick
    if logicEvent.logicTick % 100 == 0 and math.floor(random(0, 50)) == 0 then
        OnRandomTick()
    end

    -- Check if the player has died
    local currentLifepoints = var.VarPlayer.LIFEPOINTS.value
    if logicEvent.logicTick % 30 == 0 then
        if currentLifepoints == 0 and previousLifepoints > 0 then
            OnDeath()
        end
        previousLifepoints = currentLifepoints
    end
end)

ContentLayerInterface = contentLayerFunctions.createContentLayer()

-- Shutdown cleanup
function PluginShutdown()
    -- Clean up main window
    mainWindowFunctions.destroyMainWindow()

    -- Clean up content layer
    contentLayerFunctions.destroyContentLayer()
end
