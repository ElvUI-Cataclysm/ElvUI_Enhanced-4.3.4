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
	local myPlate = self.CreatedPlates[frame]
	if not myPlate then return end

	if(not myPlate.threatInfo) then
		myPlate.threatInfo = myPlate.HealthBar:CreateFontString(nil, "OVERLAY");
		myPlate.threatInfo:SetPoint("BOTTOMLEFT", myPlate.HealthBar, "BOTTOMLEFT", 1, 0);
		myPlate.threatInfo:SetJustifyH("LEFT");
	end
	myPlate.threatInfo:FontTemplate(LSM:Fetch("font", NP.db.font), NP.db.fontSize, NP.db.fontOutline);
end);

hooksecurefunc(NP, "GetThreatReaction", function(self, frame)
	local myPlate = self.CreatedPlates[frame]
	if not myPlate then return end

	if(myPlate.threatInfo) then
		myPlate.threatInfo:SetText();

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
					myPlate.threatInfo:SetFormattedText("%s%.0f%%|r", Hex(GetThreatStatusColor(status)), percent);
				else
					myPlate.threatInfo:SetFormattedText("|cFF808080%s|r", L["None"]);
				end
			end
		end
	end
end);