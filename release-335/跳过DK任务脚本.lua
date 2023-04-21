

local NPC_Entry = 302000
local menu_icon = 10
local menu_1_msg = "跳过DK任务并传送到达拉然"
local menu_2_msg = "很显然你不是一名死亡骑士"
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

local function OnGossipHello(event, player, creature)
	pclass = player:GetClass()
	player:SendBroadcastMessage(pclass)
	if (CLASS_DEATH_KNIGHT == pclass) then
		player:GossipMenuAddItem(menu_icon, menu_1_msg, 0, 1)
	else
		player:GossipMenuAddItem(menu_icon, menu_2_msg, 0, 2)
	end
	player:GossipMenuAddItem(menu_icon, "再见", 0, 0)
	player:GossipSendMenu(100, creature, 1)
end

local function OnGossipSelect(event, player, creature, intid1, slotid)
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
		local v={0,"|cFF006400[中立]|r |TInterface/ICONS/Spell_Arcane_TeleportDalaran:35:35|t|cff00ff00达拉然",	571,	5809.55,	503.975,	657.526,	2.38338,	0,	70,	100000}
		local map,mapid,x,y,z,o=v[2],v[3],v[4], v[5], v[6],v[7] or 0
		player:Teleport(mapid,x,y,z,o)
	else
	end

end

RegisterCreatureGossipEvent(NPC_Entry, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_Entry, 2, OnGossipSelect)




