---@meta
---Plugin API definitions (for LuaLS).
---Note: Many of the descriptions here are copied directly from the API documentation pages.

---https://developer.runescape.com/rs/math/aabb.html
---@class AABB

---https://developer.runescape.com/rs/audio/index.html
---@class audio
---@field Play fun(): audio.SoundInstance Creates an instance for an audio resource that can then be played back.
---@field Stop fun(): audio.SoundInstance Immediately stops playback for the sound instance associated with the provided ID if it exists and is live.

---https://developer.runescape.com/rs/audio/index.html#audioaudiobus
---@enum audio.AudioBus
audio.AudioBus = {
    MASTER = 0,
    SFX = 1,
    MUSIC = 2,
    MUSIC_LOGIN = 3,
    AMBIENT = 4,
    VOICEOVER = 5,
    SFX_SUB = 6,
    MUSIC_SUB = 7,
    DIALOG_SUB = 8,
    PLAYER_ANIMATION_SUB = 9,
    NPC_ANIMATION_SUB = 10,
    LOCATION_ANIMATION_SUB = 11,
    GENERAL_ANIMATION_SUB = 12,
    LOCATIONS_SUB = 13,
    LOCATION_RANDOM_SUB = 14,
    LOCATION_GENERIC_SUB = 15
}

---https://developer.runescape.com/rs/audio/index.html#audioemittershape
---@enum audio.EmitterShape
audio.EmitterShape = {
    SPHERE = 0, -- The sound's volume scales based on distance between the emitter and the listener, and takes into account the angle between them. Represents a spherical volume.
    BOX = 1, -- The sound's volume scales based on distance between the emitter and the listener, and takes into account the angle between them. Represents a box volume.
    SPHERE_NO_PANNING = 2, -- The sound's volume scales based on distance between the emitter and the listener, ignoring the angle between them. Represents a spherical volume.
    BOX_NO_PANNING = 3, -- The sound's volume scales based on distance between the emitter and the listener, ignoring the angle between them. Represents a box volume.
    NONE = 4, -- The emitter doesn't use spatial audio.
}

---https://developer.runescape.com/rs/audio/index.html#audiosoundinstance
---@class audio.SoundInstance
---@field isPlaying boolean True if this sound is currently playing, false otherwise.
---@field isPaused boolean True if this sound is currently paused.
---@field id integer Numeric ID used to uniquely identify this sound instance.
---@field Stop fun(self: audio.SoundInstance) Stops playing this sound instance immediately. Does nothing if this sound has already expired.

---https://developer.runescape.com/rs/audio/index.html#audiosoundplaybackparams
---@class audio.SoundPlaybackParams
---@field type audio.SoundType The type of this sound. Defaults to audio.SoundType.Script.
---@field numLoops integer How many times this sound should loop for. Defaults to 0, indicating a one-shot sound.
---@field volume number Volume for this sound's playback relative to its audio bus volume. Defaults to 1.0, representing 100% volume.
---@field audioBus audio.AudioBus The audio bus associated with this sound. Defaults to audio.AudioBus.SFX.
---@field emitterShape audio.EmitterShape The shape used for this sound's spatial audio. Defaults to audio.EmitterShape.none, representing non-spatial audio.
---@field minDistance number Minimum distance in world units for this sound to be audible. Only relevant for spatial audio. Defaults to 0.
---@field maxDistance number Maximum distance in world units for this sound to be audible. Only relevant for spatial audio. Defaults to 0.
---@field origin Vector3 Origin in world units for this sound's emitter. Only relevant for spatial audio. Defaults to 0,0,0.
---@field level integer Height level where this sound's playing from. Only relevant for spatial audio. Defaults to -1.
---@field samplingRate integer Rate at which this audio is sampled. Affects pitch and playback speed. Defaults to 0, indicating the default sample rate (256) should be used instead.
---@field delayTick integer The number of logic ticks to delay playback for. Defaults to 0, indicating immediate playback.

---https://developer.runescape.com/rs/audio/index.html#audiosoundtype
---@enum audio.SoundType
audio.SoundType = {
    INVALID = 255,
    ENTITY = 0,
    LOCATION = 1,
    LOCATION_RANDOM = 2,
    GENERAL_ANIMATION = 3,
    LOCATION_ANIMATION = 4,
    ENTITY_ANIMATION = 5,
    SPOT_ANIMATION = 6,
    SCRIPT = 7,
    SERVER_TRIGGERED = 8,
    MUSIC = 9, -- Identifies a sound meant to be played as music. Playback for audio of this type cannot be manually stopped.
    JINGLE = 10, -- Identifies a sound meant to be played as a short jingle. Playback for audio of this type cannot be manually stopped.
    ENTITY_MOVEMENT = 11,
    INTERFACE_ANIMATION = 12,
}

---https://developer.runescape.com/rs/ui/component.html
---@class Component
---@field SetSize fun(self: Component, x: integer, y: integer, parentPercentageX: number?, parentPercentageY: number?) Sets the width/height for this component, optionally taking into account the parent's dimensions.
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
---@field ToCoordFine fun(self: CoordGrid, fromCentre: boolean): CoordGrid Returns a CoordFine using the current CoordGrid as a base.

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
---@field SetModel fun(self: Model, type: ui.ModelType, modelID: integer, secondaryModelID: integer?) Sets the model to be drawn as part of this component.

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

---https://developer.runescape.com/rs/ui/decorative_components/model.html#uimodeltype
---@class ui.ModelType

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
