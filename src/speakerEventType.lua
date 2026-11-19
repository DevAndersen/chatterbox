---@enum SpeakerEventType
---Speaker event types.
SpeakerEventType = {
    TICK = 1, ---Random tick.
    SKILL = 2, ---The player performs a skilling action (may or may not result in gaining XP).
    LEVEL = 3, ---The player levels up a skill.
    DEATH = 4, ---The player dies.
}
