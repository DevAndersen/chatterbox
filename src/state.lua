local regionState = require("src/regionState")

-- Equipment slot IDs (config.Enum.WORNITEMS_SLOT_NAME.values)
local equipmentSlots = {
    Head = 1, -- Helmet
    Cape = 2, -- Cape
    Amulet = 3, -- Amulet
    MainHand = 4, -- Weapon / Main-hand
    Body = 5, -- Body
    Offhand = 6, -- Shield / Off-hand
    Legs = 8, -- Legs
    Hands = 10, -- Hands
    Feet = 11, -- Feet
    Ring = 13, -- Ring
    Quiver = 14, -- Quiver
    Aura = 15, -- Aura
    Pocket = 18, -- Pocket
}

function getEquipment(slot)
    local wornEquipment = Inventory.Find(id.Inv.WORN)
    local objInSlot = wornEquipment:GetSlots(0)[slot].obj

    if objInSlot.id == -1 then
        return nil
    end

    return objInSlot.configName
end

function objectHasParam(objectConfig, param)
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

local getState = function()
    -- Coin pouch
    local currencyPouchGp = Inventory.Find(config.Inv.MONEY_POUCH):GetTotal(id.Obj.COINS)
    local currencyPouchGpb = Inventory.Find(config.Inv.MONEY_POUCH):GetTotal(id.Obj.COINS_B) * 1000000000
    local coins = currencyPouchGp + currencyPouchGpb

    -- Equipment slots
    local head = getEquipment(equipmentSlots.Head)
    local cape = getEquipment(equipmentSlots.Cape)
    local amulet = getEquipment(equipmentSlots.Amulet)
    local mainHand = getEquipment(equipmentSlots.MainHand)
    local body = getEquipment(equipmentSlots.Body)
    local offhand = getEquipment(equipmentSlots.Offhand)
    local legs = getEquipment(equipmentSlots.Legs)
    local hands = getEquipment(equipmentSlots.Hands)
    local feet = getEquipment(equipmentSlots.Feet)
    local ring = getEquipment(equipmentSlots.Ring)
    local quiver = getEquipment(equipmentSlots.Quiver)
    local pocket = getEquipment(equipmentSlots.Pocket)

    -- H.A.M. outfit check
    local fullHam =
        head == config.Obj.HAM_HOOD.configName
        and cape == config.Obj.HAM_CLOAK.configName
        and amulet == config.Obj.HAM_BADGE.configName
        and body == config.Obj.HAM_SHIRT.configName
        and legs == config.Obj.HAM_ROBE.configName
        and hands == config.Obj.HAM_GLOVES.configName
        and feet == config.Obj.HAM_BOOTS.configName

    -- Partyhat check
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

    -- Santa hat check
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

    -- Hallowe'en mask check
    local halloweenMask =
        head == config.Obj.HALLOWEENMASK_BLUE.configName
        or head == config.Obj.HALLOWEENMASK_GREEN.configName
        or head == config.Obj.HALLOWEENMASK_RED.configName
        or head == config.Obj.HALLOWEENMASK_PINK.configName
        or head == config.Obj.TRH175_HALLOWEENMASK_PURPLE.configName
        or head == config.Obj.TRH175_HALLOWEENMASK_SOUL_DYE.configName
        or head == config.Obj.TRH175_HALLOWEENMASK_YELLOW.configName
        or head == config.Obj.HALLOWEEN23_HALLOWEENMASK_ORANGE.configName

    -- Ironman status
    local isIronman = var.VarPlayer.IRONMAN_ENABLED.value
    local isHardcoreIronman = var.VarPlayer.HARDCORE_ENABLED.value

    -- Misc.
    local hasExaminedRimmingtonBench = var.VarPlayer.XMAS16_BASEPERM2.value ~= 0 -- Examined the Rimmington ninja bench
    local isDead = var.VarPlayer.LIFEPOINTS.value < 1
    local charmingImp = pocket == config.Obj.RAND_REWARD_CHARMING_IMP.configName
    local fixedDevice = mainHand == config.Obj.MOURNING_PAINT_GUN.configName

    local fireCape = cape == config.Obj.TZHAAR_CAPE_FIRE.configName

    -- Kiln cape check
    local kilnCape =
        cape == config.Obj.TZKILN_TOKHAAR_CAPE.configName
        or cape == config.Obj.TZKILN_TOKHAAR_CAPE_MAGIC.configName
        or cape == config.Obj.TZKILN_TOKHAAR_CAPE_RANGED.configName
        or cape == config.Obj.TZKILN_TOKHAAR_CAPE_NECROMANCY.configName

    -- Zuk cape check
    local zukCape =
        cape == config.Obj.EGWD_FUL_BOSS_MELEE_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_MAGIC_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_RANGED_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_NECROMANCY_CAPE.configName
        or cape == config.Obj.EGWD_FUL_BOSS_FLAWLESS_CAPE.configName

    -- Hybrid zyk cape check
    local zukHybridCape = cape == config.Obj.EGWD_FUL_BOSS_FLAWLESS_CAPE.configName

    local skillcape = objectHasParam(cape, config.Param.SKILLCAPE)

    -- Max cape check
    local maxCape =
        cape == config.Obj.SKILLCAPE_MAX.configName
        or cape == config.Obj.SKILLCAPE_MAX_HOODED.configName

    -- Master max cape check
    local masterMaxCape =
        cape == config.Obj.SKILLCAPE_120_ALL.configName
        or cape == config.Obj.SKILLCAPE_120_ALL_HOODED.configName

    -- Comp cape check
    local compCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_HOODED.configName

    -- Master comp cape check
    local masterCompCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST_120_ALL.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_120_ALL_HOODED.configName

    -- Trimmed comp cape check
    local trimmedCompCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE_HOODED.configName

    -- Master trimmed comp cape check
    local masterTrimmedCompCape =
        cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE_120_ALL.configName
        or cape == config.Obj.SKILLCAPE_COMPLETIONIST_INSANE_120_ALL_HOODED.configName

    return {
        -- Todo: Turn skills into their own table
        attackLevel = Player.GetLevelGameplay(SkillType.ATTACK),
        strengthLevel = Player.GetLevelGameplay(SkillType.STRENGTH),
        thievingLevel = Player.GetLevelGameplay(SkillType.THIEVING),
        cookingLevel = Player.GetLevelGameplay(SkillType.COOKING),
        slayerLevel = Player.GetLevelGameplay(SkillType.SLAYER),

        coins = coins,
        completedTheGrandTree = config.Quest.FromID(id.Quest.THEGRANDTREE).hasFinishedQuest,
        completedWhileGuthixSleeps = config.Quest.FromID(id.Quest.WHILE_GUTHIX_SLEEPS).hasFinishedQuest,
        fullHam = fullHam,
        partyhat = partyhat,
        santaHat = santaHat,
        halloweenMask = halloweenMask,
        isIronman = isIronman,
        isHardcoreIronman = isHardcoreIronman,
        hasExaminedRimmingtonBench = hasExaminedRimmingtonBench,
        isDead = isDead,
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
        region = regionState.getRegionState(),
    }
end

return
{
    getState=getState
}
