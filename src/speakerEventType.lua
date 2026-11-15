---@enum SpeakerEventType
---Speaker event types.
SpeakerEventType = {
    TICK = 1, ---Random tick.
    SKILL = 2, ---The player performs a skill action (regardless if XP is gained).
    XP = 3, ---The player gains XP.
    LEVEL = 4, ---The player levels up a skill.
    DEATH = 5, ---The player dies.
}
