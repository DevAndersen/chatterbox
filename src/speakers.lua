-- Grubfoot: SLICE_GOBLIN_CHATHEAD_2011
-- The Raptor: SIGHERO_RAPTOR_CHATHEAD
-- Goebie: TUSKA_RAIDS_GOEBIE_VAR1_CHAT
-- Ripper demon: HLM_RIPPER_DEMON_CHAT
-- Yelps: QUEST_BANDOS_YELPS_CHAT
-- Imp: EASTER_2015_IMP_CHAT
-- Graardor: TSD_GRAARDOR_HEAD_CHAT_AVATARUPDATEINTERIM

return {
    [1] = {
        Name = "Gobbo",
        Model = id.Model.SLICE_GOBLIN_CHATHEAD_2011,
        Lines = require("src/lines/goblin"),
        ResourceDirectory = "DECtalk"
    },
    [2] = {
        Name = "The Raptor",
        Model = id.Model.SIGHERO_RAPTOR_CHATHEAD,
        Lines = require("src/lines/raptor"),
        ResourceDirectory = "DECtalk"
    },
}
