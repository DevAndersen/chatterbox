local mainWindowFunctions = require("src/interfaces/window")

local contentLayerReadyEventName = "contentLayerReadyEventName"
local contentLayerLogicEventName = "contentLayerLogicEventName"

local initContentLayer = function(contentLayerReadyEvent)
    local contentLayer = contentLayerReadyEvent.component
    local panel = prettyui.SimpleView.new(contentLayer,
    {
        width = contentLayer.width,
        height = contentLayer.height
    })

    -- Go to the next speaker
    local function nextSpeaker()
        SpeakerId = SpeakerId % #Speakers + 1
    end

    -- Go to the previous speaker
    local function previousSpeaker()
        SpeakerId = (SpeakerId - 2) % #Speakers + 1
    end

    -- Add speaker navigation buttons if there are multiple speakers available
    if #Speakers > 1 then
        panel:AddSpriteButton("ARROW_LEFT", previousSpeaker, { x = 8, inline = true })
        panel:AddSpriteButton("ARROW_RIGHT", nextSpeaker, { x = -32, xAnchor = 1, inline = true })
    end

    local speakerNameLabel = ui.Text.new(panel.content)
    speakerNameLabel:AlignTo(ui.AlignMode.CENTRE)
    speakerNameLabel:SetSize(panel.content.width, 50)
    speakerNameLabel.font = id.Font.QUILL_OBLIQUE_LARGE
    speakerNameLabel.colour = Vector4.new(0.83, 0.71, 0.38, 1.0)
    speakerNameLabel.content = Speakers[SpeakerId].Name

    panel:AddSimpleButton("Show window", function() mainWindowFunctions.toggleMainWindow() end,
    {
        active = ShowMainWindow,
        toggleable = true,
    })

    panel:AddSimpleButton("Poke", function()
        mainWindowFunctions.speakEvent(SpeakerEventType.Poke)
    end)

    Event.Logic.Subscribe(contentLayerLogicEventName, function()
        speakerNameLabel.content = Speakers[SpeakerId].Name
    end)

    panel:AddSimpleButton("Debug State", function() log(require("src/state").getState()) end)

    return panel
end

local function createContentLayer()
    Event.ContentLayerReady.Subscribe(contentLayerReadyEventName, function(contentLayerReadyEvent)
        ContentLayerInterface = initContentLayer(contentLayerReadyEvent)
    end)
end

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
