---The state of the player's equipment.
---@class EquipmentState
---@field slots EquipmentSlotState Player's equipment slot states.
---@field special EquipmentSpecialState Special equipment checks.

---Player equipment slot states.
---@class EquipmentSlotState
---@field head string?
---@field cape string?
---@field amulet string?
---@field mainHand string?
---@field body string?
---@field offhand string?
---@field legs string?
---@field hands string?
---@field feet string?
---@field ring string?
---@field quiver string?
---@field pocket string?

---Special player equipment checks.
---@class EquipmentSpecialState
---@field whip boolean Is the player wielding a whip.
---@field fullHam boolean Is the player wearing the full H.A.M. outfit.
---@field partyhat boolean Is the player wearing a partyhat.
---@field santaHat boolean Is the player wearing a santa hat.
---@field halloweenMask boolean Is the player wearing a hallowe'en mask.
---@field skillcape boolean Is the player wearing a skillcape.
---@field maxCape boolean Is the player wearing a max cape.
---@field masterMaxCape boolean Is the player wearing a master max cape.
---@field compCape boolean Is the player wearing a completionist cape.
---@field masterCompCape boolean Is the player wearing a master completionist cape.
---@field trimmedCompCape boolean Is the player wearing a trimmed completionist cape.
---@field masterTrimmedCompCape boolean Is the player wearing a master trimmed completionist cape.
---@field fireCape boolean Is the player wearing a fire cape.
---@field kilnCape boolean Is the player wearing a kiln cape.
---@field zukCape boolean Is the player wearing a Zuk cape.
---@field hybridZukCape boolean Is the player wearing a hybrid zuk cape.

--- Equipment slot IDs (config.Enum.WORNITEMS_SLOT_NAME.values).
---@enum EquipmentSlot
local equipmentSlot = {
    HEAD = 1, -- Helmet
    CAPE = 2, -- Cape
    AMULET = 3, -- Amulet
    MAINHAND = 4, -- Weapon / Main-hand
    BODY = 5, -- Body
    OFFHAND = 6, -- Shield / Off-hand
    LEGS = 8, -- Legs
    HANDS = 10, -- Hands
    FEET = 11, -- Feet
    RING = 13, -- Ring
    QUIVER = 14, -- Quiver
    AURA = 15, -- Aura
    POCKET = 18, -- Pocket
}

---Get the object configName of the specified slot. Returns nil if the slot is empty.
---@param slot EquipmentSlot The equipment slot to check.
---@return string?
local function getEquipment(slot)
    local wornEquipment = Inventory.Find(id.Inv.WORN)
    local objInSlot = wornEquipment:GetSlots(0)[slot].obj

    if objInSlot.id == -1 then
        return nil
    end

    return objInSlot.configName
end

---Determines of the passed objectConfig (item) has the passed param. 
---@param objectConfig string? The objectConfig to check (use "config.Obj.X.configName")
---@param param userdata The parameter to check for (use "config.Param").
---@return boolean
local function objectHasParam(objectConfig, param)
    -- Check for nil
    if objectConfig == nil then
        return false
    end

    -- Iterate over all params of the object, returning true if it has the requested param
    for _, value in pairs(config.Obj[objectConfig].params) do
        if value == param then
            return true
        end
    end

    -- The object did not have the param, return false
    return false
end

---Returns the state of player's equipment.
---@return EquipmentState
local function getEquipmentState()
    -- Equipment slots.
    local head = getEquipment(equipmentSlot.HEAD)
    local cape = getEquipment(equipmentSlot.CAPE)
    local amulet = getEquipment(equipmentSlot.AMULET)
    local mainHand = getEquipment(equipmentSlot.MAINHAND)
    local body = getEquipment(equipmentSlot.BODY)
    local offhand = getEquipment(equipmentSlot.OFFHAND)
    local legs = getEquipment(equipmentSlot.LEGS)
    local hands = getEquipment(equipmentSlot.HANDS)
    local feet = getEquipment(equipmentSlot.FEET)
    local ring = getEquipment(equipmentSlot.RING)
    local quiver = getEquipment(equipmentSlot.QUIVER)
    local pocket = getEquipment(equipmentSlot.POCKET)

    -- H.A.M. outfit
    local fullHam =
        head == config.Obj.HAM_HOOD.configName
        and cape == config.Obj.HAM_CLOAK.configName
        and amulet == config.Obj.HAM_BADGE.configName
        and body == config.Obj.HAM_SHIRT.configName
        and legs == config.Obj.HAM_ROBE.configName
        and hands == config.Obj.HAM_GLOVES.configName
        and feet == config.Obj.HAM_BOOTS.configName

    -- Partyhat
    local partyhat =
        head == config.Obj.RED_PARTYHAT.configName
        or head == config.Obj.YELLOW_PARTYHAT.configName
        or head == config.Obj.BLUE_PARTYHAT.configName
        or head == config.Obj.GREEN_PARTYHAT.configName
        or head == config.Obj.PURPLE_PARTYHAT.configName
        or head == config.Obj.WHITE_PARTYHAT.configName
        or head == config.Obj.WHITE_PARTYHAT.configName
        or head == config.Obj.GOLDEN_PARTY_HAT.configName
        or head == config.Obj.BLACK_PARTYHAT.configName
        or head == config.Obj.Q200_CHROMATIC_PARTYHAT_FORKEEPS.configName

    -- Santa hat
    local santaHat =
        head == config.Obj.SANTA_HAT.configName
        or head == config.Obj.XMAS13_PROMO_BLACK_SANTAHAT.configName
        or head == config.Obj.SANTA_HAT_WITH_BEARD.configName
        or head == config.Obj.XMAS21_GREEN_SANTAHAT.configName
        or head == config.Obj.XMAS21_GREEN_SANTAHAT_WITH_BEARD.configName
        or head == config.Obj.XMAS23_PURPLE_SANTAHAT.configName
        or head == config.Obj.XMAS23_PURPLE_SANTAHAT_WITH_BEARD.configName
        or head == config.Obj.XMAS24_PINK_SANTAHAT.configName
        or head == config.Obj.XMAS24_PINK_SANTAHAT_WITH_BEARD.configName
        or head == config.Obj.XMAS24_AURORA_SANTAHAT.configName
        or head == config.Obj.XMAS24_AURORA_SANTAHAT_WITH_BEARD.configName
        or head == config.Obj.XMAS25_YELLOW_SANTAHAT.configName
        or head == config.Obj.XMAS25_YELLOW_SANTAHAT_WITH_BEARD.configName
        or head == config.Obj.XMAS25_BLUE_SANTAHAT.configName
        or head == config.Obj.XMAS25_BLUE_SANTAHAT_WITH_BEARD.configName
        or head == config.Obj.XMAS25_FESTIVE_AURORA_SANTAHAT_WITH_BEARD.configName

    -- Hallowe'en mask
    local halloweenMask =
        head == config.Obj.HALLOWEENMASK_BLUE.configName
        or head == config.Obj.HALLOWEENMASK_GREEN.configName
        or head == config.Obj.HALLOWEENMASK_RED.configName
        or head == config.Obj.HALLOWEENMASK_PINK.configName
        or head == config.Obj.TRH175_HALLOWEENMASK_PURPLE.configName
        or head == config.Obj.TRH175_HALLOWEENMASK_SOUL_DYE.configName
        or head == config.Obj.TRH175_HALLOWEENMASK_YELLOW.configName
        or head == config.Obj.HALLOWEEN23_HALLOWEENMASK_ORANGE.configName

    -- Fire cape
    local fireCape = cape == config.Obj.TZHAAR_CAPE_FIRE.configName

    -- Kiln cape
    local kilnCape =
        cape == config.Obj.TZKILN_TOKHAAR_CAPE.configName
        or cape == config.Obj.TZKILN_TOKHAAR_CAPE_MAGIC.configName
        or cape == config.Obj.TZKILN_TOKHAAR_CAPE_RANGED.configName
        or cape == config.Obj.TZKILN_TOKHAAR_CAPE_NECROMANCY.configName

    -- Zuk cape
    local zukCape =
        cape == config.Obj.EGWD_FUL_BOSS_MELEE_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_MAGIC_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_RANGED_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_NECROMANCY_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_FLAWLESS_CAPE.configName

    -- Hybrid zyk cape
    local hybridZukCape = cape == config.Obj.EGWD_FUL_BOSS_FLAWLESS_CAPE.configName

    -- Skillcape
    local skillcape = objectHasParam(cape, config.Param.SKILLCAPE)

    -- Max cape
    local maxCape =
        cape == config.Obj.SKILLCAPE_MAX.configName
        or cape == config.Obj.SKILLCAPE_MAX_HOODED.configName

    -- Master max cape
    local masterMaxCape =
        cape == config.Obj.SKILLCAPE_120_ALL.configName
        or cape == config.Obj.SKILLCAPE_120_ALL_HOODED.configName

    -- Comp cape
    local compCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_HOODED.configName

    -- Master comp cape
    local masterCompCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST_120_ALL.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_120_ALL_HOODED.configName

    -- Trimmed comp cape
    local trimmedCompCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE_HOODED.configName

    -- Master trimmed comp cape
    local masterTrimmedCompCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE_120_ALL.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE_120_ALL_HOODED.configName

    -- Whip weapons
    local whip = string.find(tostring(mainHand), "WHIP") ~= nil

    -- Misc.
    local charmingImp = pocket == config.Obj.RAND_REWARD_CHARMING_IMP.configName

    return {
        slots = {
            head = head,
            cape = cape,
            amulet = amulet,
            mainHand = mainHand,
            body = body,
            offhand = offhand,
            legs = legs,
            hands = hands,
            feet = feet,
            ring = ring,
            quiver = quiver,
            pocket = pocket,
        },
        special = {
            -- Weapons
            whip = whip,

            -- Outfits
            fullHam = fullHam,

            -- Rares
            partyhat = partyhat,
            santaHat = santaHat,
            halloweenMask = halloweenMask,

            -- Capes of accomplishment/distinction
            skillcape = skillcape,
            maxCape = maxCape,
            masterMaxCape = masterMaxCape,
            compCape = compCape,
            masterCompCape = masterCompCape,
            trimmedCompCape = trimmedCompCape,
            masterTrimmedCompCape = masterTrimmedCompCape,

            -- Capes
            fireCape = fireCape,
            kilnCape = kilnCape,
            zukCape = zukCape,
            hybridZukCape = hybridZukCape,

            -- Misc.
            charmingImp = charmingImp
        }
    } --[[@as EquipmentState]]
end

return {
    getEquipmentState = getEquipmentState
}
