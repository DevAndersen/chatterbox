local speakerIdKey = "speakerId"
local showMainWindowKey = "showMainWindow"

---@enum PersistentDBType
---https://developer.runescape.com/rs/core/persistentdb.html#persistentdbtype
PersistentDBType = {
    BOOL = 0, -- True/false entry
    INT = 1, -- Integer entry
    FLOAT = 2, -- Floating point entry
    STRING = 3, -- Text-based entry
    STRUCTURED_DATA = 4, -- Entry that gets serialized directly to/from Lua tables
}

-- Get/Set integer.

---Retrieve an integer from persistence.
---@param key string
---@return integer?
local function getInt(key)
    return PersistentDB:GetInt(key)
end

---Save an integer to persistence.
---@param key string
---@param value integer
local function setInt(key, value)
    PersistentDB:SetInt(key, value)
end

-- Get/Set boolean.

---Retrieve a boolean from persistence.
---@param key string
---@return boolean?
local function getBool(key)
    return PersistentDB:GetBool(key)
end

---Save a boolean to persistence.
---@param key string
---@param value boolean
local function setBool(key, value)
    PersistentDB:SetBool(key, value)
end

-- Speaker ID.

---Retrieve the speaker ID from persistence.
---@return integer?
local getSpeakerId = function()
    return getInt(speakerIdKey)
end

---Save the speaker ID to persistence.
---@param value integer
local setSpeakerId = function(value)
    setInt(speakerIdKey, value)
end

-- Main window shown state.

---Retrieve the main window shown state from persistence.
---@return boolean?
local getShowMainWindow = function()
    return getBool(showMainWindowKey)
end

---Save the main window shown state to persistence.
---@param value boolean
local setShowMainWindow = function(value)
    setBool(showMainWindowKey, value)
end

---@class Persistence
---@field getSpeakerId function
---@field setSpeakerId function
---@field getShowMainWindow function
---@field setShowMainWindow function

---@type Persistence
return {
    getInt = getInt,
    setInt = setInt,
    getBool = getBool,
    setBool = setBool,
    getSpeakerId = getSpeakerId,
    setSpeakerId = setSpeakerId,
    getShowMainWindow = getShowMainWindow,
    setShowMainWindow = setShowMainWindow
}
