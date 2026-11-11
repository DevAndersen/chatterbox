local mainWindowDrawEventName = "mainWindowDrawEventName"
local mainWindowLogicEventName = "mainWindowLogicEventName"

local speakerEventData
local currentLine

-- Stop the currently playing voice line
local function stopAudio()
    if currentLine and currentLine.isPlaying then
        currentLine:Stop()
    end
end

local function createMainWindow()
    -- Exit if main window already exists
    if MainWindow then
        return
    end

    local state = require("src/state")

    local mainWindowWidth = 440
    local mainWindowHeight = 340

    local lastSpeakerId = SpeakerId
    local speaker = Speakers[SpeakerId]
    local linesData = speaker.Lines

    local uiLayer = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__PLUGIN_BUILD_LAYER_TOP)
    local label
    local errorLabel
    local lastId = ""
    local currentAnimation = "HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"
    local currentText = ""
    local currentErrorMessage = ""

    -- Clear any potential speaker event data, to ensure lines aren't played for old events
    speakerEventData = nil

    local lineDelay = 3

    MainWindow = prettyui.Window.new(uiLayer, {
        title = "Chatterbox",
        x = -mainWindowWidth / 2,
        y = -mainWindowHeight / 2,
        xAnchor = 0.5,
        yAnchor = 0.5,
        width = mainWindowWidth,
        height = mainWindowHeight,
        resizable = true,
    })

    local model = ui.Model.new(MainWindow.content)

    local title = ui.Text.new(MainWindow.content)

    -- Update the speaker
    local function updateSpeaker()
        stopAudio()

        currentText = ""
        currentErrorMessage = ""
        speaker = Speakers[SpeakerId]

        title.content = speaker.Name
        model:SetModel(ui.ModelType.MODEL, speaker.Model)
        model.animID = config.Seq["HUMAN_UPDATE_CHATHEAD_NEUTRAL_IDLE"].id
        linesData = speaker.Lines
    end

    title:AlignTo(ui.AlignMode.CENTRE)
    title:SetSize(mainWindowWidth, 50)
    title.font = id.Font.QUILL_OBLIQUE_LARGE
    title.colour = Vector4.new(0.83, 0.71, 0.38, 1.0)
    title.content = speaker.Name

    local function playLine()
        -- Early return if no line data was found
        if not linesData then
            return
        end

        -- Early return if a line is already playing
        if currentLine and currentLine.isPlaying then
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
        speakerEventData = nil
    end

    model:SetSize(MainWindow.content.width, MainWindow.content.height)

    Event.Logic.Subscribe(mainWindowLogicEventName, function(logicEvent)

        if logicEvent.logicTick % 10 == 0 and lineDelay > 0 then
            lineDelay = lineDelay - 1
        end

        if speakerEventData and speakerEventData.EventType == SpeakerEventType.Poke then
            stopAudio()
            playLine()
        elseif lineDelay == 0 and speakerEventData ~= nil then
            playLine()
            lineDelay = 20
        end

        if lastSpeakerId ~= SpeakerId then
            updateSpeaker()
            lastSpeakerId = SpeakerId
        end

        model:SetSize(MainWindow.content.width, MainWindow.content.height)

        label:SetSize(MainWindow.content.width - 4, MainWindow.content.height - 60)
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

    Event.Draw.Subscribe(mainWindowDrawEventName, function()
        title:SetSize(MainWindow.content.width, 50)
        label:SetSize(MainWindow.content.width - 4, MainWindow.content.height - 60)
        errorLabel:SetSize(MainWindow.content.width - 4, 120)
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

    label = ui.Text.new(MainWindow.content)
    label:AlignTo(ui.AlignMode.CENTRE)
    label:SetPos(0, 120)
    label:SetSize(MainWindow.content.width - 4, MainWindow.content.height - 60)
    label.font = id.Font.NOTOSANS_BOLD_14
    label.colour = Vector4.new(1.0, 1.0, 1.0, 1.0)

    errorLabel = ui.Text.new(MainWindow.content)
    errorLabel:AlignTo(ui.AlignMode.CENTRE)
    errorLabel:SetPos(0, 0)
    errorLabel:SetSize(MainWindow.content.width - 4, 120)
    errorLabel.font = id.Font.NOTOSANS_BOLD_14
    errorLabel.colour = Vector4.new(1.0, 0.0, 0.0, 1.0)
end

local function destroyMainWindow()
    -- Unsubscribe event listeners
    Event.Logic.Unsubscribe(mainWindowLogicEventName)
    Event.Draw.Unsubscribe(mainWindowDrawEventName)

    -- Clean up the main window
    if MainWindow then
        MainWindow:Destroy()
        MainWindow = nil
    end

    stopAudio()
end

local function toggleMainWindow()
    if ShowMainWindow then
        destroyMainWindow()
    else
        createMainWindow()
    end
    ShowMainWindow = not ShowMainWindow
end

local function speakEvent(speakerEventType, speakerEventMetadata)
    if MainWindow then
        speakerEventData = { EventType = speakerEventType, Metadata = speakerEventMetadata }
    end
end

return  {
    toggleMainWindow = toggleMainWindow,
    destroyMainWindow = destroyMainWindow,
    speakEvent = speakEvent
}
