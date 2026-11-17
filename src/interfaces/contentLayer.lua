local mainWindowFunctions = require("src/interfaces/window")

local contentLayerReadyEventName = "contentLayerReadyEventName"
local contentLayerLogicEventName = "contentLayerLogicEventName"

---Go to the next speaker
local function nextSpeaker()
    SpeakerId = SpeakerId % #Speakers + 1
end

---Go to the previous speaker
local function previousSpeaker()
    SpeakerId = (SpeakerId - 2) % #Speakers + 1
end

---Initializes the content layer.
local initContentLayer = function(contentLayerReadyEvent)
    local contentLayer = contentLayerReadyEvent.component
    local panel = prettyui.SimpleView.new(contentLayer,
    {
        width = contentLayer.width,
        height = contentLayer.height
    })

    -- Add speaker navigation buttons if there are multiple speakers available
    if #Speakers > 1 then
        panel:AddSpriteButton("ARROW_LEFT", previousSpeaker, { x = 8, inline = true })
        panel:AddSpriteButton("ARROW_RIGHT", nextSpeaker, { x = -32, xAnchor = 1, inline = true })
    end

    -- Add a label displaying the name of the speaker
    local speakerNameLabel = ui.Text.new(panel.content)
    speakerNameLabel:AlignTo(ui.AlignMode.CENTRE)
    speakerNameLabel:SetSize(panel.content.width, 50)
    speakerNameLabel.font = id.Font.QUILL_OBLIQUE_LARGE
    speakerNameLabel.colour = Vector4.new(0.83, 0.71, 0.38, 1.0)
    speakerNameLabel.content = Speakers[SpeakerId].Name

    -- Add a button with a tooltip containing the description of the speaker
    local speakerDescriptionButton = panel:AddSpriteButton("INFO")
    speakerDescriptionButton:SetTooltip(Speakers[SpeakerId].Description)

    -- Add a button for toggling the main window.
    local windowToggleButton
    windowToggleButton = panel:AddSimpleButton("Toggle window", function() mainWindowFunctions.toggleMainWindow() end,
    {
        active = ShowMainWindow,
        toggleable = true,
    })

    -- Add a button to manually trigger a random tick event
    panel:AddSimpleButton("Poke", function()
        mainWindowFunctions.speakEvent(SpeakerEventType.TICK)
    end)

    -- Subscribe to client logic updates
    Event.Logic.Subscribe(contentLayerLogicEventName, function()
        -- Ensure that speaker-specific details changes if the speaker is changed
        speakerNameLabel.content = Speakers[SpeakerId].Name
        speakerDescriptionButton:SetTooltip(Speakers[SpeakerId].Description)

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
