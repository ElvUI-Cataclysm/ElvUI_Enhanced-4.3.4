local E, L, V, P, G = unpack(ElvUI);
local DT = E:GetModule("DataTexts")

local format, join = string.format, string.join
local floor = math.floor;

local GetTime = GetTime;
local IsSpellKnown = IsSpellKnown;
local READY = READY

local displayString = ""
local lastPanel;
local red = "|cffb11919";
local texture = format("|T%s:14:14:0:0:64:64:4:60:4:60|t", GetSpellTexture(20608));

local function OnUpdate(self)
	if(E.myclass == "SHAMAN") then
		local isKnown = IsSpellKnown(20608, false);
		if(not isKnown) then return; end

		local s, d = GetSpellCooldown(20608);
		if(s > 0 and d > 0) then 
			self.text:SetFormattedText(texture.." "..red..format("%d:%02d", floor((d-(GetTime()-s))/60), floor((d-(GetTime()-s))%60)).."|r");
		else
			self.text:SetFormattedText(texture.." "..displayString, L["Ready!"]);
		end
	end
end

local function OnEnter(self)
	if(E.myclass ~= "SHAMAN") then

		DT:SetupTooltip(self);

		DT.tooltip:AddLine(L["You are not playing a |cff0070DEShaman|r, datatext disabled."], 1, 1, 1);
		DT.tooltip:Show();
	else
		return;
	end
end

local function OnEvent(self, event)
	if(E.myclass == "SHAMAN") then
		local isKnown = IsSpellKnown(20608, false);
		if(not isKnown) then
			self.text:SetFormattedText(texture.." "..displayString, L["Not Learned!"]);
		else
			if(event == "SPELL_UPDATE_COOLDOWN") then
				self:SetScript("OnUpdate", OnUpdate);
			elseif(not self.text:GetText()) then
				local s, d = GetSpellCooldown(20608);
				if(s > 0 and d > 0) then 
					self.text:SetFormattedText(texture.." "..red..format("%d:%02d", floor((d-(GetTime()-s))/60), floor((d-(GetTime()-s))%60)).."|r");
				else
					self.text:SetFormattedText(texture.." "..displayString, L["Ready!"]);
				end
			end
		end
	else
		self.text:SetFormattedText(red..L["Datatext Disabled"].."!|r");
	end
	lastPanel = self;
end

local function ValueColorUpdate(hex)
	displayString = join("", hex, "%s|r");

	if(lastPanel ~= nil) then OnEvent(lastPanel) end
end
E["valueColorUpdateFuncs"][ValueColorUpdate] = true

DT:RegisterDatatext("Reincarnation", {"PLAYER_ENTERING_WORLD", "SPELL_UPDATE_COOLDOWN"}, OnEvent, OnUpdate, nil, OnEnter)