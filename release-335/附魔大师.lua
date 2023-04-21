-- Made by Foereaper
-- Fixed by rochet
-- edit by Clotic Updated with Ranged bows and added some other enchants

local npcid = 302001 -- ID for npc

local T = {
    ["Menu"] = {
        {"头部", 0},
        {"肩膀", 2},
        {"披风", 14},
        {"胸部", 4},
        {"护腕", 8},
        {"手套", 9},
        {"腰带", 5},
        {"腿部", 6},
        {"脚", 7},
        {"主手武器", 15},
        {"双手武器", 151},
        {"副手武器", 16},
        {"盾牌", 161},
        {"远程武器", 17}

    },
    [0] = {
        -- 头部
        {"+30 法术强度，+20 爆击等级", 3820, false},
        {"+30 法术强度，每5秒法力回复+10", 3819, false},
        {"+37 耐力，+20 防御等级", 3818, false},
        {"+50 攻击强度，+20 爆击等级", 3817, false},
        {"+30 耐力，+25 韧性等级", 3842, false},
        {"+50 攻击强度，+20 韧性等级", 3795, false},
        {"+29 法术强度，+20 韧性等级", 3797, false}
    },
    [2] = {
        -- 肩膀
        {"+40 攻击强度，+15 韧性等级", 3793, false},
        {"+23 法术强度，+15 韧性等级", 3794, false},
        {"+30 耐力，+15 韧性等级", 3852, false},
        {"+40 攻击强度，+15 爆击等级", 3808, false},
        {"+24 法术强度，每5秒法力回复+8", 3809, false},
        {"+20 躲闪等级，+15 防御等级", 3811, false},
        {"+24 法术强度，+15 爆击等级", 3810, false},
        {"+26 攻击强度，+14 爆击等级", 2717, false},
        {"+15 法术强度，+14 爆击等级", 2721, false},
        {"+30 攻击强度", 2606, false}
    },
    [4] = {
        -- 胸甲
        {"+10 所有属性", 3832, false},
        {"+275 生命值", 3297, false},
        {"每5秒法力回复+8", 2381, false},
        {"+20 韧性等级", 3245, false},
        {"+22 防御等级", 1953, false}
    },
    [5] = {
        --腰带
        {"腰带插槽", 3729, false}
    },
    [6] = {
        -- 腿部
        {"+40 韧性等级，+28 耐力", 3853, false},
        {"+55 耐力，+22 敏捷", 3822, false},
        {"+75 攻击强度，+22 爆击等级", 3823, false},
        {"+50 法术强度，+20 精神", 3719, false},
        {"+50 法术强度，+30 耐力", 3721, false}
    },
    [7] = {
        -- 鞋
        {"+32 攻击强度", 1597, false},
        {"+15 耐力，速度略微提高", 3232, false},
        {"+16 敏捷", 983, false},
        {"+18 精神", 1147, false},
        {"+7生命值，每5秒法力回复+7", 3244, false},
        {"+12 命中等级，+12 爆击等级", 3826, false},
        {"+22 耐力", 1075, false}
    },
    [8] = {
        -- 护腕
        {"护腕插槽(锻造)", 3717, false},
        {"+40 耐力", 3850, false},
        {"+30 法术强度", 2332, false},
        {"+50 攻击强度", 3845, false},
        {"+18 精神", 1147, false},
        {"+15 精准等级", 3231, false},
        {"+6 所有属性", 2661, false},
        {"+16 智力", 1119, false}

    },
    [9] = {
        -- 手套
        {"手套插槽", 3723, false},
        {"+2% 坐骑速度", 930, false},
        {"+16 爆击等级", 3249, false},
        {"+2% 威胁，+10 招架等级", 3253, false},
        {"+44 攻击强度", 1603, false},
        {"+20 敏捷", 3222, false},
        {"+20 命中等级", 3234, false},
        {"+15 精准等级", 3231, false},
        {"+28 法术强度", 3246, false}

    },
    [14] = {
        -- 披风
        {"强化潜行，+10 敏捷", 3256, false},
        {"+10 精神，威胁降低2%", 3296, false},
        {"+16 防御等级", 1951, false},
        {"+23 急速等级", 3831, false},
        {"+225 护甲值", 3294, false},
        {"+22 敏捷", 1099, false},
        {"+20 奥术抗性", 1262, false}
    },
    [15] = {
        -- 主手
        {"十字军", 1900, false},
        {"+50 耐力", 3851, false},
        {"+25 命中等级，+25 爆击等级", 3788, false},
        {"狂暴", 3789, false},
        {"黑魔法", 3790, false},
        {"+63 法术强度", 3834, false},
        {"+65 攻击强度", 3833, false},
        {"破冰武器", 3239, false},
        {"生命护卫", 3241, false},
        {"吸血", 3870, false},
        {"利刃防护", 3869, false},
        {"+26 敏捷", 1103, false},
        {"+45 精神", 3844, false},
        {"斩杀", 3225, false},
        {"猫鼬", 2673, false},
        -- Two-Handed
        {"+110 攻击强度", 3827, true},
        {"+140 对亡灵攻击强度", 3247, true},
        {"巨人杀手", 3251, true},
        {"+81 法术强度", 3854, true}

    },
    [16] = {
        -- 副手
        {"+50 耐力", 3851, false},
        {"+25 命中等级，+25 爆击等级", 3788, false},
        {"狂暴", 3789, false},
        {"黑魔法", 3790, false},
        {"+63 法术强度", 3834, false},
        {"+65 攻击强度", 3833, false},
        {"破冰武器", 3239, false},
        {"生命护卫", 3241, false},
        {"吸血", 3870, false},
        {"利刃防护", 3869, false},
        {"+26 敏捷", 1103, false},
        {"+45 精神", 3844, false},
        {"斩杀", 3225, false},
        {"猫鼬", 2673, false},
        -- Shields
        {"+20 防御等级", 1952, true},
        {"+25 智力", 1128, true},
        {"+15 盾牌格挡等级", 2655, true},
        {"+12 韧性等级", 3229, true},
        {"+18 耐力", 1071, true},
        {"+36 格挡值", 2653, true},

    },
    [17] = {
		--远程
        {"瞄准镜（+15 伤害）", 3843, false},
        {"+40 远程急速等级", 3607, false},
        {"+40 远程爆击等级", 3608, false}
        -- {"Khorium Scope", 2723, false}

    }
}
local pVar = {}

function Enchanter(event, player, unit)
    pVar[player:GetName()] = nil

    for _, v in ipairs(T["Menu"]) do
        player:GossipMenuAddItem(3, "|cFFffffff " .. v[1] .. ".|R", 0, v[2])
    end
    player:GossipSendMenu(1, unit)
end

function EnchanterSelect(event, player, unit, sender, intid, code)
    if (intid < 500) then
        local ID = intid
        local f
        if (intid == 161 or intid == 151) then
            ID = math.floor(intid / 10)
            f = true
        end
        pVar[player:GetName()] = intid
        if (T[ID]) then
            for i, v in ipairs(T[ID]) do
                if ((not f and not v[3]) or (f and v[3])) then
                    player:GossipMenuAddItem(3, "|cFFffffff " .. v[1] .. ".|R", 0, v[2])
                end
            end
        end
        player:GossipMenuAddItem(3, "[返回]", 0, 500)
        player:GossipSendMenu(1, unit)
    elseif (intid == 500) then
        Enchanter(event, player, unit)
    elseif (intid >= 900) then
        local ID = pVar[player:GetName()]
        if (ID == 161 or ID == 151) then
            ID = math.floor(ID / 10)
        end
        for k, v in pairs(T[ID]) do
            if v[2] == intid then
                local item = player:GetEquippedItemBySlot(ID)
                if item then
                    if v[3] then
                        local WType = item:GetSubClass()
                        if pVar[player:GetName()] == 151 then
                            if (WType == 1 or WType == 5 or WType == 6 or WType == 8 or WType == 10) then
                                item:ClearEnchantment(0, 0)
                                item:SetEnchantment(intid, 0, 0)
                            else
                                player:SendAreaTriggerMessage("没有装备双手武器!")
                            end
                        elseif pVar[player:GetName()] == 161 then
                            if (WType == 6) then
                                item:ClearEnchantment(0, 0)
                                item:SetEnchantment(intid, 0, 0)
                            else
                                player:SendAreaTriggerMessage("没有装备盾牌!")
                            end
                        elseif pVar[player:GetName()] == 17 then
                            if (WType == 2 or WType == 3 or Wtype == 18) then
                                item:ClearEnchantment(0, 0)
                                item:SetEnchantment(intid, 0, 0)
                            else
                                player:SendAreaTriggerMessage("没有装备远程武器!")
                            end
                        end
                    else
                        item:ClearEnchantment(0, 0)
                        item:SetEnchantment(intid, 0, 0)
                        player:CastSpell(player, 36937)
                    end
                else
                    player:SendAreaTriggerMessage("该部位没有装备!")
                end
            end
        end
        EnchanterSelect(event, player, unit, sender, pVar[player:GetName()], nil)
    end
end

RegisterCreatureGossipEvent(npcid, 1, Enchanter)
RegisterCreatureGossipEvent(npcid, 2, EnchanterSelect)
