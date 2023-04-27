

local NPC_Entry = 301013
local menu_icon = 10
local menu_1_msg = "让我直接满级并去达拉然吧"
local menu_2_msg = "我想体验练级!"
local menu_3_msg = "我想看看你的货物。"

-- 专家级骑术,寒冷飞行,幽灵虎,黑虫子,机械路霸,JJC龙,uld成就龙,猛犸象
local ride_spell = {34091,54197,42777,40192,26656,55531,64927,63956,61447}
-- 4个包
local add_bag_item = 51809
-- 88888G
local add_gold = 888880000
-- 武器技能 
local weapon_skill = {173,54,44,43,136,95,45,228,226,46,473,160,172,55,118,176,162,229}
-- 烹饪/珠宝/200/213牌子各500个
local add_p_item = {41596,43016,40752,40753}
-- 一套猎人装备
local add_hunter_item = {48272,48270,48274,48271,50114,47989,47311,47296,48007,47282,50198,45609,48056,47267,47257,47988}


local add_paizi_msg = "我需要50个"
local add_paizi = {
	{"英雄纹章-200等级",40752},
	{"勇气纹章-213等级",40753},
	{"征服纹章-226等级",45624},
	{"凯旋纹章-245等级",47241},
	{"寒冰纹章-264等级",49426}
}

local CLASS_DEATH_KNIGHT	= 6		--死亡骑士

local RACE_NONE               = 0  -- SKIP
local RACE_HUMAN              = 1  -- TITLE Human
local RACE_ORC                = 2  -- TITLE Orc
local RACE_DWARF              = 3  -- TITLE Dwarf
local RACE_NIGHTELF           = 4  -- TITLE Night Elf
local RACE_UNDEAD_PLAYER      = 5  -- TITLE Undead
local RACE_TAUREN             = 6  -- TITLE Tauren
local RACE_GNOME              = 7  -- TITLE Gnome
local RACE_TROLL              = 8  -- TITLE Troll
local RACE_BLOODELF           = 10 -- TITLE Blood Elf
local RACE_DRAENEI            = 11 -- TITLE Draenei
local raceQuest22 = {
	[RACE_TAUREN]=12739,
	[RACE_HUMAN]=12742,
	[RACE_NIGHTELF]=12743,
	[RACE_DWARF]=12744,
	[RACE_GNOME]=12745,
	[RACE_DRAENEI]=12746,
	[RACE_BLOODELF]=12747,
	[RACE_ORC]=12748,
	[RACE_TROLL]=12749,
	[RACE_UNDEAD_PLAYER]=12750
}
local HORDE = 1
local ALLIANCE = 0
local teamQuest32 = {
	[HORDE]=13189,
	[ALLIANCE]=13188
}

-- 给玩家学习骑术，给88888G，给包
local function default_bonus(event, player, creature, intid1, slotid)
	local curMoney = player:GetCoinage()
	if curMoney < 888880000 then
		player:ModifyMoney(add_gold - curMoney)
	end
	for i,v in ipairs(ride_spell) do
		player:LearnSpell(v)
	end
	player:AddItem(add_bag_item, 4)
	
end

--学习武器技能, 给牌子
local function max_level_bonus(event, player, creature, intid1, slotid)
	player:SetLevel(80)
	for i,v in ipairs(weapon_skill) do
		player:SetSkill(v,200,400,400)
	end
	for i,v in ipairs(add_p_item) do
		player:AddItem(v,500)
	end
end

local function dk_up(event, player, creature, intid1, slotid)
	prace = player:GetRace()
	pteam = player:GetTeam()
	--player:SendBroadcastMessage(string.format("prace=%d pteam=%d",prace,pteam))
	local a={12593,12619,12842,12848,12636,12641,12657,12678,12679,12680,12687,12698,12701,12706,12716,12719,12720,12722,12724,12725,12727,12733,raceQuest22[prace],12751,12754,12755,12756,12757,12779,12801,13165,13166,teamQuest32[pteam]}
	player:SendBroadcastMessage(string.format("a[22]=%d a[32]=%d",a[22],a[32]))
	if slotid == 1 then
		for i,v in ipairs(a) do
			player:AddQuest(v)
			player:CompleteQuest(v)
			player:RewardQuest(v)
			
		end
		---------these are alternate reward items from quest 12679, item 39320 is chosen by default as the reward
		player:AddItem(38664)--Sky Darkener's Shroud of the Unholy
		player:AddItem(39322)--Shroud of the North Wind

		----------these are alternate reward items from quest 12801, item 38633 is chosen by default as the reward
		player:AddItem(38632)--Greatsword of the Ebon Blade
		player:SetLevel(58)
	end

end

--毛50个牌子
local function add_50_paizi(event, player, creature, intid1, paiziId)
	if paiziId == 49426 then
		player:SendBroadcastMessage("264的牌子现在当然是不可能发的啦！")
	else
		player:AddItem(paiziId, 50)
	end
	player:GossipComplete()
end

local function OnGossipHello(event, player, creature)
	player:GossipMenuAddItem(menu_icon, menu_1_msg, 0, 101)
	player:GossipMenuAddItem(menu_icon, menu_2_msg, 0, 102)
	for i,v in ipairs(add_paizi) do
		player:GossipMenuAddItem(menu_icon, add_paizi_msg..v[1], 0, v[2])
	end
	player:GossipMenuAddItem(menu_icon, "给我准备一套猎人小弟穿的装备吧...", 0, 105)
	player:GossipMenuAddItem(menu_icon, menu_3_msg, 0, 103)
	player:GossipMenuAddItem(menu_icon, "再见", 0, 104)
	player:GossipSendMenu(100, creature, 1)
end


local function OnGossipSelect(event, player, creature, intid1, slotid)
	if slotid == 101 then
		pclass = player:GetClass()
		if (CLASS_DEATH_KNIGHT == pclass) then
			dk_up(event, player, creature, intid1, 1)
		end
		
		default_bonus(event, player, creature, intid1, slotid)
		max_level_bonus(event, player, creature, intid1, slotid)
		player:SetTaxiCheat(true)
		-- 传送达拉然
		local v={0,"|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t|cff00ff00达拉然",	571,	5809.55,	503.975,	657.526,	2.38338,	0,	70,	100000}
		local map,mapid,x,y,z,o=v[2],v[3],v[4], v[5], v[6],v[7] or 0
		player:Teleport(mapid,x,y,z,o)
		player:SaveToDB()
	elseif slotid == 102 then
		default_bonus(event, player, creature, intid1, slotid)
		local plevel = player:GetLevel()
		for i,v in ipairs(weapon_skill) do
			player:SetSkill(v,200, plevel * 5, plevel * 5)
		end
		player:SetTaxiCheat(true)
		player:SendBroadcastMessage("使用 .XP Set 3 可以把经验获取倍率设置为3，也可以.XP Set 10 把经验获取倍率设置为10，享受你的旅程吧，年轻人")
		player:SaveToDB()
	elseif slotid == 103 then
		player:SendListInventory(creature)
	elseif slotid == 104 then
		-- do nothing
	elseif slotid == 105 then
		for i,v in ipairs(add_hunter_item) do
			player:AddItem(v)
		end
	else
		add_50_paizi(event, player, creature, intid1, slotid)
	end
	player:GossipComplete()
end

RegisterCreatureGossipEvent(NPC_Entry, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_Entry, 2, OnGossipSelect)




