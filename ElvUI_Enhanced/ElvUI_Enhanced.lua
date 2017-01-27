local E, L, V, P, G = unpack(ElvUI);
local ENH = E:NewModule("ENH", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

ENH.version = GetAddOnMetadata("ElvUI_Enhanced", "Version")

function ENH:Initialize()
	if(E.db.general.loginmessage) then
		print(format(L['ENH_LOGIN_MSG'], E["media"].hexvaluecolor, ENH.version))
	end	
end

E:RegisterModule(ENH:GetName())