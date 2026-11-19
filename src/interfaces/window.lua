-- Local constants
local mainWindowDrawEventName = "mainWindowDrawEventName"
local mainWindowLogicEventName = "mainWindowLogicEventName"
local mainWindowWidthPersistenceKey = "mainWindowWidth"
local mainWindowHeightPersistenceKey = "mainWindowHeight"
local mainWindowXPersistenceKey = "mainWindowX"
local mainWindowYPersistenceKey = "mainWindowY"

---@class SpeakerEventInfo
---@field eventType SpeakerEventType
---@field eventData SpeakerEventData?

---@type SpeakerEventInfo?

local stateFunctions = require("src/state")
local persistenceFunctions = require("src/persistence")

---The plugin UI layer.
local uiLayer = ui.Interfaces:GetComponent(id.Component.TOPLEVEL_V2__PLUGIN_BUILD_LAYER_TOP)

local mainWindowWidth = persistenceFunctions.getInt(mainWindowWidthPersistenceKey) or 440
local mainWindowHeight = persistenceFunctions.getInt(mainWindowHeightPersistenceKey) or 340
local currentLine
local speaker
local lineDelay
local createMainWindow
local currentText = ""
local currentErrorMessage = ""
local currentAnimation
local lastId

local width
local height
local posX = persistenceFunctions.getInt(mainWindowXPersistenceKey)
local posY = persistenceFunctions.getInt(mainWindowYPersistenceKey)
local didLastTickChangeWindowState

---@type Window
MainWindow = nil

---Stop the currently playing voice line.
local function stopAudio()
    if currentLine and currentLine.isPlaying then
        currentLine:Stop()
    end
end

---Destroys the main window and performs cleanup logic.
local destroyMainWindow = function()
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

---Toggles the main window.
local toggleMainWindow = function()
    if ShowMainWindow then
        destroyMainWindow()
    else
        createMainWindow()
    end
    ShowMainWindow = not ShowMainWindow
    persistenceFunctions.setShowMainWindow(ShowMainWindow)
end

---Creates the title for the speaker's name.
---@return Text
local function createTitleText()
    local title = ui.Text.new(MainWindow.content)
    title:AlignTo(ui.AlignMode.CENTRE)
    title:SetSize(mainWindowWidth, 50)
    title.font = id.Font.QUILL_OBLIQUE_LARGE
    title.colour = Vector4.new(0.83, 0.71, 0.38, 1.0)
    title.content = speaker.name

    return title
end

---Creates the model object for the speaker's head.
---@return Model
local function createModel()
    local model = ui.Model.new(MainWindow.content)
    model:SetModel(ui.ModelType.MODEL, speaker.model)
    model:SetPos(0, 0)
    model:SetSize(MainWindow.content.width, MainWindow.content.height)
    model.viewDistance = 1600
    model.animID = config.Seq[LineAnimation.Idle].id

    -- Lighting
    local ambient = 1.0
    local contrast = 1.0
    local antiContrast = 0.0
    local sunRGB = Vector3.new(1.0, 1.0, 1.0)
    local sunDirection = Vector3.new(0.0, 0.0, -1.0)
    local envMapID = -1
    model:SetLighting(ambient, contrast, antiContrast, sunRGB, sunDirection, envMapID)

    return model
end

---Creates the label for the line text.
---@return Text
local function createLabel()
    local label = ui.Text.new(MainWindow.content)
    label:AlignTo(ui.AlignMode.CENTRE)
    label:SetPos(0, 120)
    label:SetSize(MainWindow.content.width - 4, MainWindow.content.height - 60)
    label.font = id.Font.NOTOSANS_BOLD_14
    label.colour = Vector4.new(1.0, 1.0, 1.0, 1.0)

    return label
end

---Creates the label for error messages.
---@return Text
local function createErrorLabel()
    local errorLabel = ui.Text.new(MainWindow.content)
    errorLabel:AlignTo(ui.AlignMode.CENTRE)
    errorLabel:SetPos(0, 0)
    errorLabel:SetSize(MainWindow.content.width - 4, 120)
    errorLabel.font = id.Font.NOTOSANS_BOLD_14
    errorLabel.colour = Vector4.new(1.0, 0.0, 0.0, 1.0)

    return errorLabel
end

---Attempt to invoke a speaker event.
---@param speakerEventType SpeakerEventType
---@param speakerEventData SpeakerEventData?
local function speakEvent(speakerEventType, speakerEventData)

    -- Early return if the speaker is not set.
    if not speaker then
        return
    end

    local linesData = speaker.lines

    -- Early return if the main window is not currently shown.
    if not MainWindow then
        return
    end

    -- Early return if the line delay has not yet reached zero.
    if lineDelay > 0 then
        return
    end

    -- Early return if no line data was found
    if not linesData then
        return
    end

    -- Early return if a line is already playing
    if currentLine and currentLine.isPlaying then
        return
    end

    -- Early return if the speaker event data is missing
    if speakerEventType == nil then
        return
    end

    local availableLines = {}
    local playerState = stateFunctions.getState()

    -- Check which lines meet their requirements, excluding the previously played line
    for key, value in pairs(linesData) do
        if (lastId ~= key) and (speakerEventType == value.type) and (value.requirements == nil or value.requirements(playerState, speakerEventData)) then
            -- Determine how much the line should be weighed (i.e. how many times it should be added as an available line)
            local weight = 1
            if value.weight and value.weight > 1 then
                weight = value.weight
            end

            -- Add the line to the list of available lines
            for _ = 1, weight do
                availableLines[#availableLines + 1] = {
                    key = key,
                    value = value
                }
            end
        end
    end


    local selectedLine = GetRandomTableElement(availableLines)

    -- Early return if no lines were available
    if not selectedLine then
        return
    end

    local resourceFileName = tostring(selectedLine.key)

    lastId = selectedLine.key

    -- Set the current text to the text of the line, or in the case of lines with multiple text values, select a random text.
    local textType = type(selectedLine.value.text)
    if textType == "string" then
        currentText = selectedLine.value.text
    elseif textType == "table" then
        local text, key = GetRandomTableElement(selectedLine.value.text)

        -- Early return if the text or key were null.
        if not text or not key then
            return
        end

        currentText = text

        -- Append the key of the selected text to the resource file name.
        resourceFileName = resourceFileName .. "_" .. key
    else
        return
    end

    currentAnimation = selectedLine.value.animation
    log(type(resourceFileName))

    -- Attempt to play the selected line
    if pcall(function() currentLine = audio.Play(Plugin.resources[speaker.resourceDirectory][resourceFileName]) end) then
        currentErrorMessage = ""
    else
        local errorMessage = string.format("Failed to play sound resource '%s' for speaker '%s'", resourceFileName, speaker.name)
        currentErrorMessage = errorMessage
        log(errorMessage)
    end

    lineDelay = 20
end

---Handles persisting window location and size if they have changed.
local function handleWindowStateChange()
    local newWidth = MainWindow.root.width
    local newHeight = MainWindow.root.height
    local newPosX = MainWindow.root.x
    local newPosY = MainWindow.root.y

    local windowStateChange

    if width and height and posX and posY then
        windowStateChange = width ~= newWidth or height ~= newHeight or posX ~= newPosX or posY ~= newPosY
    end

    -- Only write to persistence if drag/resize stopped.
    if didLastTickChangeWindowState and not windowStateChange then
        persistenceFunctions.setInt(mainWindowWidthPersistenceKey, newWidth)
        persistenceFunctions.setInt(mainWindowHeightPersistenceKey, newHeight)
        persistenceFunctions.setInt(mainWindowXPersistenceKey, newPosX)
        persistenceFunctions.setInt(mainWindowYPersistenceKey, newPosY)
    end

    didLastTickChangeWindowState = windowStateChange
    width = newWidth
    height = newHeight
    posX = newPosX
    posY = newPosY
end

---Creates the main window.
createMainWindow = function()
    -- Exit if main window already exists
    if MainWindow then
        return
    end

    speaker = Speakers[SpeakerId]
    local lastSpeakerId = SpeakerId

    lastId = ""
    currentAnimation = LineAnimation.Idle
    currentText = ""
    currentErrorMessage = ""

    lineDelay = 3

    if posX and posY then
        MainWindow = prettyui.Window.new(uiLayer, {
            title = "Chatterbox",
            x = posX,
            y = posY,
            width = mainWindowWidth,
            height = mainWindowHeight,
            resizable = true,
            onClose = function()
                toggleMainWindow()
            end,
        })
    else
        MainWindow = prettyui.Window.new(uiLayer, {
            title = "Chatterbox",
            x = -mainWindowWidth / 2,
            y = -mainWindowHeight / 2,
            xAnchor = 0.5,
            yAnchor = 0.5,
            width = mainWindowWidth,
            height = mainWindowHeight,
            resizable = true,
            onClose = function()
                toggleMainWindow()
            end,
        })
    end

    local title = createTitleText()
    local model = createModel()
    local label = createLabel()
    local errorLabel = createErrorLabel()

    -- Update the speaker
    local function updateSpeaker()
        stopAudio()

        currentText = ""
        currentErrorMessage = ""
        speaker = Speakers[SpeakerId]

        title.content = speaker.name
        model:SetModel(ui.ModelType.MODEL, speaker.model)
        model.animID = config.Seq[LineAnimation.Idle].id
    end

    Event.Logic.Subscribe(mainWindowLogicEventName, function(logicEvent)

        handleWindowStateChange()

        if logicEvent.logicTick % 20 == 0 and lineDelay > 0 then
            lineDelay = lineDelay - 1
        end

        -- Update the speaker if the speaker ID has changed.
        if lastSpeakerId ~= SpeakerId then
            updateSpeaker()
            lastSpeakerId = SpeakerId
        end

        -- Resize the model area to fit the window size.
        model:SetSize(MainWindow.content.width, MainWindow.content.height)

        -- Resize the label area to fit the window size.
        label:SetSize(MainWindow.content.width - 4, MainWindow.content.height - 60)
        label.content = currentText

        -- Set the text of the error label.
        errorLabel.content = currentErrorMessage

        -- If a line is currently being played, animate the model and make the label color white.
        -- Otherwise, change the model animation to idle, and make the text gray.
        if currentLine and currentLine.isPlaying then
            model.animID = config.Seq[currentAnimation].id
            label.colour = Vector4.new(1.0, 1.0, 1.0, 1.0)
        else
            model.animID = config.Seq[LineAnimation.Idle].id
            label.colour = Vector4.new(1.0, 1.0, 1.0, 0.5)
        end
    end)

    Event.Draw.Subscribe(mainWindowDrawEventName, function()
        title:SetSize(MainWindow.content.width, 50)
        label:SetSize(MainWindow.content.width - 4, MainWindow.content.height - 60)
        errorLabel:SetSize(MainWindow.content.width - 4, 120)
    end)
end

return {
    toggleMainWindow = toggleMainWindow,
    destroyMainWindow = destroyMainWindow,
    speakEvent = speakEvent
}
