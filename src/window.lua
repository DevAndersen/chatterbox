local state = require("src/state")
local speakers = require("src/speakers")

local mainWindowWidth = 440
local mainWindowHeight = 340

local speakerId = 1
local speaker = speakers[speakerId]
local linesData = speaker.Lines

local currentLine
local gameArea = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__GAME_AREA)
local label
local errorLabel
local lastId = ""
local currentAnimation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"
local currentText = ""
local currentErrorMessage = ""
local mainWindow = prettyui.Window.new(gameArea, {
    title = "Chatterbox",
    x = -mainWindowWidth / 2,
    y = -mainWindowHeight / 2,
    xAnchor = 0.5,
    yAnchor = 0.5,
    width = mainWindowWidth,
    height = mainWindowHeight,
    resizable = true,
})

local model = ui.Model.new(mainWindow.content)

local title = ui.Text.new(mainWindow.content)

-- Stop the currently playing voice line
local function stopAudio()
    if currentLine and currentLine.isPlaying then
        currentLine:Stop()
    end
end

-- Update the speaker
local function updateSpeaker()
    stopAudio()

    currentText = ""
    currentErrorMessage = ""
    speaker = speakers[speakerId]

    title.content = speaker.Name
    model:SetModel(ui.ModelType.MODEL, speaker.Model)
    model.animID = config.Seq["HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"].id
    linesData = speaker.Lines
end

-- Go to the next speaker
local function nextSpeaker()
    speakerId = speakerId % #speakers + 1
    updateSpeaker()
end

-- Go to the previous speaker
local function previousSpeaker()
    speakerId = (speakerId - 2) % #speakers + 1
    updateSpeaker()
end

-- Add speaker navigation buttons if there are multiple speakers available
if #speakers > 1 then
    mainWindow:AddSpriteButton("ARROW_LEFT", previousSpeaker, { x = 8, inline = true })
    mainWindow:AddSpriteButton("ARROW_RIGHT", nextSpeaker, { x = -32, xAnchor = 1, inline = true })
end

title:AlignTo(ui.AlignMode.CENTRE)
title:SetSize(mainWindowWidth, 50)
title.font = id.Font.QUILL_OBLIQUE_LARGE
title.colour = Vector4.new(0.83, 0.71, 0.38, 1.0)
title.content = speaker.Name

local function debugPlayButtonClick()
    stopAudio()

    -- Early return if no line data was found
    if not linesData then
        return
    end

    local availableLines = {}
    local playerState = state.getState()

    -- Check which lines meet their requirements, excluding the previously played line
    for key,value in pairs(linesData) do
        if lastId ~= key and (value.requirements == nil or value.requirements(playerState)) then
            availableLines[#availableLines + 1] = { key = key, value = value }
        end
    end

    -- Early return if no lines were available
    if #availableLines == 0 then
        return
    end

    local lineIndex = math.floor(random(1, #availableLines + 1))
    local selectedLine = availableLines[lineIndex]

    lastId = selectedLine.key
    currentText = selectedLine.value.text
    currentAnimation = selectedLine.value.animation

    -- Attempt to play the selected line
    if pcall(function() currentLine = audio.Play(Plugin.resources[speaker.ResourceDirectory][tostring(selectedLine.key)]) end) then
        currentErrorMessage = ""
    else
        local errorMessage = string.format("Failed to play sound resource '%s' for speaker '%s'", selectedLine.key, speaker.Name)
        currentErrorMessage = errorMessage
        log(errorMessage)
    end
end

mainWindow:AddSimpleButton("Debug Play", debugPlayButtonClick)
mainWindow:AddSimpleButton("Debug State", function() log(state.getState()) end)

model:SetSize(mainWindow.content.width, mainWindow.content.height)

Event.Logic.Subscribe("chatterboxModelLogicEvent", function()
    model:SetSize(mainWindow.content.width, mainWindow.content.height)

    label:SetSize(mainWindow.content.width - 4, mainWindow.content.height - 60)
    label.content = currentText

    errorLabel.content = currentErrorMessage

    if currentLine and currentLine.isPlaying then
        model.animID = config.Seq[currentAnimation].id
        label.colour = Vector4.new(1.0, 1.0, 1.0, 1.0)
    else
        model.animID = config.Seq["HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"].id
        label.colour = Vector4.new(1.0, 1.0, 1.0, 0.5)
    end
end)

Event.Draw.Subscribe("myEvent", function(drawEvent)
    title:SetSize(mainWindow.content.width, 50)
    label:SetSize(mainWindow.content.width - 4, mainWindow.content.height - 60)
    errorLabel:SetSize(mainWindow.content.width - 4, 120)
end)

-- Configure the model and camera
model:SetModel(ui.ModelType.MODEL, speaker.Model)
model:SetPos(0, 0)
model.viewDistance = 1600
model.animID = config.Seq["HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"].id

local ambient = 1.0
local contrast = 1.0
local antiContrast = 0.0
local sunRGB = Vector3.new(1.0, 1.0, 1.0)
local sunDirection = Vector3.new(0.0, 0.0, -1.0)
local envMapID = -1

model:SetLighting(ambient, contrast, antiContrast, sunRGB, sunDirection, envMapID)

label = ui.Text.new(mainWindow.content)
label:AlignTo(ui.AlignMode.CENTRE)
label:SetPos(0, 120)
label:SetSize(mainWindow.content.width - 4, mainWindow.content.height - 60)
label.font = id.Font.NOTOSANS_BOLD_14
label.colour = Vector4.new(1.0, 1.0, 1.0, 1.0)

errorLabel = ui.Text.new(mainWindow.content)
errorLabel:AlignTo(ui.AlignMode.CENTRE)
errorLabel:SetPos(0, 0)
errorLabel:SetSize(mainWindow.content.width - 4, 120)
errorLabel.font = id.Font.NOTOSANS_BOLD_14
errorLabel.colour = Vector4.new(1.0, 0.0, 0.0, 1.0)

return mainWindow
