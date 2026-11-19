---@meta
---Plugin API definitions (for LuaLS).
---Note: Many of the descriptions here are copied directly from the API documentation pages.

---https://developer.runescape.com/rs/math/aabb.html
---@class AABB

---https://developer.runescape.com/rs/audio/index.html
---@class audio

---https://developer.runescape.com/rs/ui/component.html
---@class Component
---@field SetSize function Sets the width/height for this component, optionally taking into account the parent's dimensions.
---@field colour Vector4 Red, Green, Blue, and Alpha tints represented as a 4-channel vector, with each channel limited to a 0..1 range. On assignment, values outside of this range will be clamped.

---Global config store.
---@class config

---https://developer.runescape.com/rs/game/coordfine.html
---@class CoordFine
---@field level integer
---@field x number
---@field y number
---@field z number

---https://developer.runescape.com/rs/game/coordgrid.html
---@class CoordGrid
---@field level integer The level of this CoordGrid. Valid range is 0-3.
---@field x integer The world tile X of this CoordGrid, in Grid units. Valid range is 0-12799.
---@field z integer The world tile Z of this CoordGrid, in Grid units. Valid range is 0-12799.

---https://developer.runescape.com/rs/core/events.html
---@class Event

--Global ID store.
---@class id

---https://developer.runescape.com/rs/game/inventory.html
---@class Inventory

---https://developer.runescape.com/rs/ui/layout_components/layer.html
---@class Layer
---@field x integer (Read-only) Current horizontal position for this component relative to its parent.
---@field y integer (Read-only) Current vertical position for this component relative to its parent.
---@field width integer (Read-only) Current width for this component.
---@field height integer (Read-only) Current height for this component.

--https://developer.runescape.com/rs/core/index.html#log
---@class log

---https://developer.runescape.com/rs/core/events.html?h=logicEvent#logic
---@class Logic
---@field logicTick integer How many logic ticks have occurred since the client was started.

---https://developer.runescape.com/rs/ui/decorative_components/model.html
---@class Model : Component
---@field animID integer The animation currently playing on the model being drawn
---@field SetModel function Sets the model to be drawn as part of this component.

---https://developer.runescape.com/rs/core/persistentdb.html
---@class PersistentDB

---https://developer.runescape.com/rs/game/player.html
---@class Player

---https://developer.runescape.com/rs/core/plugin.html
---@class Plugin

---https://developer.runescape.com/rs/math/index.html#random
---@class random

---https://developer.runescape.com/rs/game/list/shapelist.html
---@class ShapeList

---https://developer.runescape.com/rs/core/events.html?h=logicEvent#skilltransmit
---@class SkillTransmit
---@field skill SkillType The skill that has changed in value.
---@field oldXP integer The previous XP value for the skill.
---@field newXP integer The current XP value for the skill.
---@field oldGameplayLevel integer The previous gameplay level for the skill.
---@field newGameplayLevel integer The current gameplay level for the skill.

---https://developer.runescape.com/rs/game/player.html#skilltype
---@enum SkillType
SkillType = {
    ATTACK = 0,
    DEFENCE = 1,
    STRENGTH = 2,
    HITPOINTS = 3,
    RANGED = 4,
    PRAYER = 5,
    MAGIC = 6,
    COOKING = 7,
    WOODCUTTING = 8,
    FLETCHING = 9,
    FISHING = 10,
    FIREMAKING = 11,
    CRAFTING = 12,
    SMITHING = 13,
    MINING = 14,
    HERBLORE = 15,
    AGILITY = 16,
    THIEVING = 17,
    SLAYER = 18,
    FARMING = 19,
    RUNECRAFTING = 20,
    HUNTER = 21,
    CONSTRUCTION = 22,
    SUMMONING = 23,
    DUNGEONEERING = 24,
    DIVINATION = 25,
    INVENTION = 26,
    ARCHAEOLOGY = 27,
    NECROMANCY = 28
}

---https://developer.runescape.com/rs/ui/decorative_components/text.html
---@class Text : Component
---@field content string The text to draw.

---https://developer.runescape.com/rs/ui/index.html
---@class ui

---https://developer.runescape.com/rs/game/config/vartype.html
---@class var

---https://developer.runescape.com/rs/math/vector.html#vector3
---@class Vector3
---@field x number
---@field y number
---@field z number

---https://developer.runescape.com/rs/math/vector.html#vector4
---@class Vector4
---@field x number
---@field y number
---@field z number
---@field w number

---https://developer.runescape.com/rs/game/world.html
---@class World
