local E, L, V, P, G = unpack(ElvUI);
local NP = E:GetModule("NamePlates");
local LSM = LibStub("LibSharedMedia-3.0");

local select = select;
local format = string.format;

local UnitCanAttack, UnitDetailedThreatSituation, GetThreatStatusColor = UnitCanAttack, UnitDetailedThreatSituation, GetThreatStatusColor;
local UnitGUID = UnitGUID;

function Hex(r, g, b)
	return format("|cFF%02x%02x%02x", r * 255, g * 255, b * 255);
end

NP.GroupMembers = {};

hooksecurefunc(NP, "CreatePlate", function(self, frame)
	if(not frame.threatInfo) then
		frame.threatInfo = frame.HealthBar:CreateFontString(nil, "OVERLAY");
		frame.threatInfo:SetPoint("BOTTOMLEFT", frame.HealthBar, "BOTTOMLEFT", 1, 2);
		frame.threatInfo:SetJustifyH("LEFT");
	end
	frame.threatInfo:FontTemplate(LSM:Fetch("font", NP.db.font), NP.db.fontSize, NP.db.fontOutline);
end);

hooksecurefunc(NP, "GetThreatReaction", function(self, frame)
	if(frame.threatInfo) then
		frame.threatInfo:SetText();

		if(NP.db.showthreat) then
			local unit = frame.unit;
			if(not unit) then
				for i = 1, 4 do
					if(frame.guid == UnitGUID(("boss%d"):format(i))) then
						unit = ("boss%d"):format(i);
						break;
					end
				end
			end

			if(unit and not UnitIsPlayer(unit) and UnitCanAttack("player", unit)) then
				local status, percent = select(2, UnitDetailedThreatSituation("player", unit));
				if(status) then
					frame.threatInfo:SetFormattedText("%s%.0f%%|r", Hex(GetThreatStatusColor(status)), percent);
				else
					frame.threatInfo:SetFormattedText("|cFF808080%s|r", L["None"]);
				end
			end
		end
	end
end);