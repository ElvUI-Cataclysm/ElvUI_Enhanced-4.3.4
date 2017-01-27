local E, L, V, P, G = unpack(ElvUI);
local M = E:NewModule('MiscEnh', 'AceHook-3.0', 'AceEvent-3.0');

E.MiscEnh = M;

function M:LoadDeclineDuel()
	if(not E.db.general.declineduel) then return end

	local DeclineDuel = CreateFrame("Frame")
	DeclineDuel:RegisterEvent("DUEL_REQUESTED")
	DeclineDuel:SetScript("OnEvent", function(_, event, name)
		if(event == "DUEL_REQUESTED") then
			StaticPopup_Hide("DUEL_REQUESTED")
			CancelDuel()
			RaidNotice_AddMessage(RaidWarningFrame, L["Declined duel request from "]..name, {r = 0.41, g = 0.8, b = 0.94}, 3)
			print(format("|cffffff00"..L["Declined duel request from "]..name.."."))
		end
	end)
end

function M:LoadAutoRelease()
	if(not E.private.general.pvpAutoRelease) then return end

	local autoreleasepvp = CreateFrame("frame")
	autoreleasepvp:RegisterEvent("PLAYER_DEAD")
	autoreleasepvp:SetScript("OnEvent", function(self, event)
		local inInstance, instanceType = IsInInstance()
		if(inInstance and (instanceType == "pvp")) then
			local soulstone = GetSpellInfo(20707)
			if((E.myclass ~= "SHAMAN") and not (soulstone and UnitBuff("player", soulstone))) then
				RepopMe()
			end
		end
	end);
end

function M:UpdateMoverTransparancy()
	local mover;
	for name, _ in pairs(E.CreatedMovers) do
		mover = _G[name];
		if(mover) then
			mover:SetAlpha(E.db.general.moverTransparancy);
		end
	end
end

function M:LoadMoverTransparancy()
	hooksecurefunc(E, "CreateMover", function(_, parent)
		parent.mover:SetAlpha(E.db.general.moverTransparancy);
	end);

	self:UpdateMoverTransparancy();
end

function M:Initialize()
	self:LoadAutoRelease()
	self:LoadWatchedFaction()
	self:LoadMoverTransparancy()
	self:LoadDeclineDuel()
end

E:RegisterModule(M:GetName())