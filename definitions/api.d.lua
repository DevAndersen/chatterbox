---@meta
---Plugin API definitions (for LuaLS).

---https://developer.runescape.com/rs/math/aabb.html
---@class AABB

---https://developer.runescape.com/rs/audio/index.html
---@class audio

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

--https://developer.runescape.com/rs/core/index.html#log
---@class log

---https://developer.runescape.com/rs/game/player.html
---@class Player

---https://developer.runescape.com/rs/core/plugin.html
---@class Plugin

---https://developer.runescape.com/rs/math/index.html#random
---@class random

---https://developer.runescape.com/rs/game/list/shapelist.html
---@class ShapeList

---https://developer.runescape.com/rs/game/player.html#skilltype
---@class SkillType

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
