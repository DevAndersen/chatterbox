local mainWindowFunctions = require("src/interfaces/window")

local contentLayerReadyEventName = "contentLayerReadyEventName"
local contentLayerLogicEventName = "contentLayerLogicEventName"

local speakerDescriptionButton
local speakerNameLabel

---Update speaker-related elements of the content layer.
local function updateSpeakerDetails()
    if speakerDescriptionButton then
        speakerDescriptionButton:SetTooltip(Speakers[SpeakerId].description)
    end

    if speakerNameLabel then
        speakerNameLabel.content = Speakers[SpeakerId].name
    end
end

---Go to the next speaker.
local function nextSpeaker()
    SpeakerId = SpeakerId % #Speakers + 1
    updateSpeakerDetails()
end

---Go to the previous speaker.
local function previousSpeaker()
    SpeakerId = (SpeakerId - 2) % #Speakers + 1
    updateSpeakerDetails()
end

---Initializes the content layer.
local initContentLayer = function(contentLayerReadyEvent)
    local contentLayer = contentLayerReadyEvent.component
    local panel = prettyui.SimpleView.new(contentLayer, {
        width = contentLayer.width,
        height = contentLayer.height
    })

    -- Add speaker navigation buttons if there are multiple speakers available
    if #Speakers > 1 then
        panel:AddSpriteButton("ARROW_LEFT", previousSpeaker, { x = 8, inline = true })
        panel:AddSpriteButton("ARROW_RIGHT", nextSpeaker, { x = -32, xAnchor = 1, inline = true })
    end

    -- Add a label displaying the name of the speaker
    speakerNameLabel = ui.Text.new(panel.content)
    speakerNameLabel:AlignTo(ui.AlignMode.CENTRE)
    speakerNameLabel:SetSize(panel.content.width, 50)
    speakerNameLabel.font = id.Font.QUILL_OBLIQUE_LARGE
    speakerNameLabel.colour = Vector4.new(0.83, 0.71, 0.38, 1.0)
    speakerNameLabel.content = Speakers[SpeakerId].name

    -- Add a button with a tooltip containing the description of the speaker
    speakerDescriptionButton = panel:AddSpriteButton("INFO")
    speakerDescriptionButton:SetTooltip(Speakers[SpeakerId].description)

    -- Add a button for toggling the main window.
    local windowToggleButton
    windowToggleButton = panel:AddSimpleButton("Toggle window", function() mainWindowFunctions.toggleMainWindow() end, {
        active = ShowMainWindow,
        toggleable = true,
    })

    -- Add a button to manually trigger a random tick event
    panel:AddSimpleButton("Poke", function()
        mainWindowFunctions.speakEvent(SpeakerEventType.TICK)
    end)

    -- Subscribe to client logic updates
    Event.Logic.Subscribe(contentLayerLogicEventName, function()
        -- Ensure that the window toggle button shows the correct state
        if windowToggleButton.active ~= ShowMainWindow then
            windowToggleButton:SetActive(ShowMainWindow)
        end
    end)

    -- Add a button that prints the state to the developer console.
    panel:AddSimpleButton("Debug State", function() log(require("src/state").getState()) end)

    return panel
end

local function createContentLayer()
    Event.ContentLayerReady.Subscribe(contentLayerReadyEventName, function(contentLayerReadyEvent)
        ContentLayerInterface = initContentLayer(contentLayerReadyEvent)
    end)
end

---Destroys the content layer and performs cleanup logic.
local function destroyContentLayer()
    Event.ContentLayerReady.Unsubscribe(contentLayerReadyEventName)
    if ContentLayerInterface then
        ContentLayerInterface:Destroy()
        ContentLayerInterface = nil
    end
end

return {
    createContentLayer = createContentLayer,
    destroyContentLayer = destroyContentLayer
}
