---The event data for skill related events.
---@class SkillEventData
---@field skill SkillType
---@field level integer
---@field xp integer
---@field newXP integer

---A union of possible event data types.
---@alias SpeakerEventData SkillEventData

-- Constants
local mainLogicEventName = "mainLogicEventName"
local mainSkillTransmitEventName = "mainSkillTransmitEventName"

-- Script functions
local mainWindowFunctions = require("src/interfaces/window")

-- Local variables
local previousLifepoints = var.VarPlayer.LIFEPOINTS.value

---Called after a set amount of client-side logic event ticks.
local function onRandomTick()
    mainWindowFunctions.speakEvent(SpeakerEventType.TICK)
end

---Called when a skill event happens.
local function onSkillEvent(eventType, skill, level, xp, newXP)
    mainWindowFunctions.speakEvent(eventType, {
        skill = skill,
        level = level,
        xp = xp,
        newXP = newXP
    })
end

---Called when the player dies.
local function onDeath()
    mainWindowFunctions.speakEvent(SpeakerEventType.DEATH)
end

---Skill transmit event handler.
---@param skillTransmitEvent SkillTransmit
local skillTransmitEventFunction = function(skillTransmitEvent)
    local skill = skillTransmitEvent.skill
    local oldXP = skillTransmitEvent.oldXP
    local newXP = skillTransmitEvent.newXP
    local oldLevel = skillTransmitEvent.oldGameplayLevel
    local newLevel = skillTransmitEvent.newGameplayLevel
    local gainedXP = newXP - oldXP

    if oldLevel ~= newLevel then
        onSkillEvent(SpeakerEventType.LEVEL, skill, newLevel, gainedXP, newXP)
    else
        onSkillEvent(SpeakerEventType.SKILL, skill, newLevel, gainedXP, newXP)
    end
end

---Client logic event handler.
---@param logicEvent Logic
local clientLogicEventFunction = function(logicEvent)
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
end

---Subscribe to events.
local startEventListening = function()
    Event.SkillTransmit.Subscribe(mainSkillTransmitEventName, skillTransmitEventFunction)
    Event.Logic.Subscribe(mainLogicEventName, clientLogicEventFunction)
end

---Unsubscribe from events.
local stopEventListening = function()
    Event.SkillTransmit.Unsubscribe(mainSkillTransmitEventName)
    Event.Logic.Unsubscribe(mainLogicEventName)
end

return
{
    startEventListening = startEventListening,
    stopEventListening = stopEventListening
}
