local E, L, V, P, G = unpack(ElvUI);
local DT = E:GetModule("DataTexts");

local floor = math.floor;
local join = string.join;

local displayString = "";
local lastPanel;

local slots = {
	[1] = {"HeadSlot", HEADSLOT},
	[2] = {"NeckSlot", NECKSLOT},
	[3] = {"ShoulderSlot", SHOULDERSLOT},
	[4] = {"BackSlot", BACKSLOT},
	[5] = {"ChestSlot", CHESTSLOT},
	[6] = {"WristSlot", WRISTSLOT},
	[7] = {"HandsSlot", HANDSSLOT},
	[8] = {"WaistSlot", WAISTSLOT},
	[9] = {"LegsSlot", LEGSSLOT},
	[10] = {"FeetSlot", FEETSLOT},
	[11] = {"Finger0Slot", FINGER0SLOT_UNIQUE},
	[12] = {"Finger1Slot", FINGER1SLOT_UNIQUE},
	[13] = {"Trinket0Slot", TRINKET0SLOT_UNIQUE},
	[14] = {"Trinket1Slot", TRINKET1SLOT_UNIQUE},
	[15] = {"MainHandSlot", MAINHANDSLOT},
	[16] = {"SecondaryHandSlot", SECONDARYHANDSLOT},
	[17] = {"RangedSlot", RANGEDSLOT}
};

local levelColors = {
	[0] = {1, 0, 0},
	[1] = {0, 1, 0},
	[2] = {1, 1, .5}
};

local function OnEvent(self)
	local total, equipped = GetAverageItemLevel();
	self.text:SetFormattedText(displayString, ITEM_LEVEL_ABBR, floor(equipped), floor(total));

	lastPanel = self;
end

local function OnEnter(self)
	local total, equipped = GetAverageItemLevel();
	local color;

	DT:SetupTooltip(self);
	DT.tooltip:AddDoubleLine(L["Equipped"], floor(equipped), 1, 1, 1, 1, 1, 0);
	DT.tooltip:AddDoubleLine(L["Total"], floor(total), 1, 1, 1, 1, 1, 0);
	DT.tooltip:AddLine(" ");

	for i = 1, 17 do
		if(slots[i]) then
			local item = GetInventoryItemLink("player", GetInventorySlotInfo(slots[i][1]));
			if(item) then
				local _, _, quality, iLevel = GetItemInfo(item)
				local r, g, b = GetItemQualityColor(quality)

				color = levelColors[(iLevel < equipped - 5 and 0 or (iLevel > equipped + 5 and 1 or 2))];
				DT.tooltip:AddDoubleLine(slots[i][2], iLevel, r, g, b, color[1], color[2], color[3]);
			end
		end
	end

	DT.tooltip:Show();
end

local function OnClick(self, btn)
	if(btn == "LeftButton") then
		ToggleCharacter("PaperDollFrame")
	else
		OnEvent(self)
	end
end

local function ValueColorUpdate(hex)
	displayString = join("", "%s: ", hex, "%d/%d|r");

	if(lastPanel ~= nil) then 
		OnEvent(lastPanel); 
	end
end
E["valueColorUpdateFuncs"][ValueColorUpdate] = true;

DT:RegisterDatatext("Item Level", {"PLAYER_ENTERING_WORLD", "PLAYER_EQUIPMENT_CHANGED", "UNIT_INVENTORY_CHANGED"}, OnEvent, nil, OnClick, OnEnter);