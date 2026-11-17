---Defines a speaker.
---@class Speaker
---@field name string The name of the speaker.
---@field description string The description of the speaker.
---@field model number The model of the speaker (use "id.Model").
---@field lines Line[] The lines available to the speaker.
---@field resourceDirectory string The name of the resource containing the speaker's audio files.

return {
    [1] = {
        name = "Gobbo",
        description = "A well-spoken goblin.",
        model = id.Model.SLICE_GOBLIN_CHATHEAD_2011,
        lines = require("src/lines/goblin"),
        resourceDirectory = "DECtalk"
    },
    [2] = {
        name = "The Raptor",
        description = "A mysterious but highly skilled warrior.",
        model = id.Model.SIGHERO_RAPTOR_CHATHEAD,
        lines = require("src/lines/raptor"),
        resourceDirectory = "DECtalk"
    },
} --[=[@as Speaker[]]=]
