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

    -- Ironman status
    local isIronman = var.VarPlayer.IRONMAN_ENABLED.value
    local isHardcoreIronman = var.VarPlayer.HARDCORE_ENABLED.value

    -- Misc.
    local hasExaminedRimmingtonBench = var.VarPlayer.XMAS16_BASEPERM2.value ~= 0 -- Examined the Rimmington ninja bench
    local isDead = var.VarPlayer.LIFEPOINTS.value < 1

    return {
        attackLevel = Player.GetLevelGameplay(SkillType.ATTACK),
        strengthLevel = Player.GetLevelGameplay(SkillType.STRENGTH),
        thievingLevel = Player.GetLevelGameplay(SkillType.THIEVING),
        cookingLevel = Player.GetLevelGameplay(SkillType.COOKING),
        coins = coins,
        completedTheGrandTree = config.Quest.FromID(id.Quest.THEGRANDTREE).hasFinishedQuest,
        completedWhileGuthixSleeps = config.Quest.FromID(id.Quest.WHILE_GUTHIX_SLEEPS).hasFinishedQuest,
        fullHam = fullHam,
        partyhat = partyhat,
        santaHat = santaHat,
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
        quiver  = quiver,
    }
end

return
{
    getState=getState
}
