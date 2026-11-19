#!/usr/bin/lua
-- Note: This is a helper script meant to be run as a stand-alone Lua script, and is not part of the plugin.

require("src/speakerEventType")
require("src/lineCategory")
require("src/lineAnimation")

local resourceFiles = {}
local lineData = {}

local function getFiles(findCommand)
    local files = {}

    local resourcesHandle = io.popen(findCommand)
    if not resourcesHandle then
        print("Failed to execute command: " .. findCommand)
        os.exit(1)
    end

    for file in resourcesHandle:lines() do
        files[#files + 1] = file
    end

    resourcesHandle:close()
    return files
end

local function getLines(luaFile, fileName)
    local lines = require(luaFile)

    local keyPrefix = fileName .. "/"

    for lineKey, lineValue in pairs(lines) do
        local textType = type(lineValue.text)
        if textType == "string" then
            lineData[keyPrefix .. lineKey] = lineValue.text
        elseif textType == "table" then
            local text = lineValue.text
            ---@cast text table
            for variantKey, variantValue in pairs(text) do
                lineData[keyPrefix .. lineKey .. "_" .. variantKey] = variantValue
            end
        end
    end
end

for k, v in pairs(getFiles("find 'resources/' -maxdepth 2 -type f -name '*.ogg'")) do
    local resourcePath = v:match("resources/(.+)$")
    resourceFiles[resourcePath] = resourcePath
end

for k, v in pairs(getFiles("find 'src/lines/' -maxdepth 1 -type f -name '*.lua'")) do
    local luaFile = v:match("(.+).lua$")
    local fileName = luaFile:match(".+/(.+)$")
    getLines(luaFile, fileName)
end

local ansiBrightRed = "\27[91m"
local ansiRed = "\27[31m"
local ansiYellow = "\27[33m"
local ansiReset = "\27[m"

local anyMissingFiles = false
for key, value in pairs(lineData) do

    local expectedResourceFile = key .. ".ogg"

    if not resourceFiles[expectedResourceFile] then
        anyMissingFiles = true
        print(ansiBrightRed .. "Missing audio: " .. ansiReset)
        print("\t" .. ansiYellow .. "Key:   " .. ansiRed .. expectedResourceFile .. ansiReset)
        print("\t" .. ansiYellow .. "Value: " .. ansiReset .. value)
    end

end

if anyMissingFiles then
    os.exit(1)
else
    os.exit(0)
end
