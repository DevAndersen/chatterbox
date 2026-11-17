---The state of special player checks.
---@class SpecialState
---@field hasExaminedRimmingtonBench boolean 

local getSpecialState = function()
    return {
        hasExaminedRimmingtonBench = var.VarPlayer.XMAS16_BASEPERM2.value ~= 0 -- Examined the Rimmington ninja bench
    }
end

return {
    getSpecialState = getSpecialState
}
