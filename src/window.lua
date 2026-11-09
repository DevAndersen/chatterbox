local state = require("src/state")
local linesData = require("src/lines")

local mainWindowWidth = 440
local mainWindowHeight = 340

local gameArea = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__GAME_AREA)
local label
local lastId = ""
local currentAnimation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"
local currentText = ""
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

local currentLine

local function debugPlayButtonClick()
    -- Stop the currently playing voice line
    if currentLine and currentLine.isPlaying then
        currentLine:Stop()
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

    currentLine = audio.Play(Plugin.resources["DECtalk"][tostring(selectedLine.key)])
    currentText = selectedLine.value.text
    currentAnimation = selectedLine.value.animation
end

mainWindow:AddSimpleButton("Debug Play", debugPlayButtonClick, { inline = true })
mainWindow:AddSimpleButton("Debug State", function() log(state.getState()) end, { inline = true })

local model = ui.Model.new(mainWindow.content)
model:SetSize(mainWindow.content.width, mainWindow.content.height)

Event.Logic.Subscribe("chatterboxModelLogicEvent", function(logicEvent)

    model:SetSize(mainWindow.content.width, mainWindow.content.height)
    label:SetSize(mainWindow.content.width - 4, mainWindow.content.height - 60)

    if currentLine and currentLine.isPlaying then
        model.animID = config.Seq[currentAnimation].id
        label.content = currentText
        label.colour = Vector4.new(1.0, 1.0, 1.0, 1.0)
    else
        model.animID = config.Seq["HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"].id
        label.colour = Vector4.new(1.0, 1.0, 1.0, 0.5)
    end
end)

-- Grubfoot: SLICE_GOBLIN_CHATHEAD_2011
-- The Raptor: SIGHERO_RAPTOR_CHATHEAD
-- Goebie: TUSKA_RAIDS_GOEBIE_VAR1_CHAT
-- Ripper demon: HLM_RIPPER_DEMON_CHAT
-- Yelps: QUEST_BANDOS_YELPS_CHAT
-- Imp: EASTER_2015_IMP_CHAT
-- Graardor: TSD_GRAARDOR_HEAD_CHAT_AVATARUPDATEINTERIM

-- Configure the model and camera
model:SetModel(ui.ModelType.MODEL, id.Model.SLICE_GOBLIN_CHATHEAD_2011)
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

return mainWindow
