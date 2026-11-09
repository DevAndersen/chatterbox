-- Call script files
local mainWindow = require("src/window")
--require("src/debugRegionRenderer")

-- Called after a set amount of client-side logic event ticks.
function OnTick()
end

-- Called when the player trains a skill. Also triggers if no XP is gained.
function OnTrainSkill(skill, level, xp)
end

-- Called when the player gain a new level.
function OnGainLevel(skill, level, xp)
end

-- Called when the player gain XP.
function OnGainXP(skill, level, xp)
end

Event.Logic.Subscribe("chatterboxLogicTriggerEvent", function(logicEvent)
    if logicEvent.logicTick % 100 == 0 then
        OnTick()
    end
end)

Event.SkillTransmit.Subscribe("chatterboxSkillTriggerEvent", function (skillTransmitEvent)
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

-- Shutdown cleanup
function PluginShutdown()
    if mainWindow then
        mainWindow:Destroy()
    end
end
