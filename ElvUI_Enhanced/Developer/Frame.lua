SLASH_ANALYZE1 = "/analyze"
SlashCmdList.ANALYZE = function(arg)
	if arg ~= "" then
		arg = _G[arg]
	else
		arg = GetMouseFocus()
	end

	if arg ~= nil then
		FRAME = arg -- Set the global variable FRAME to = whatever we are mousing over to simplify messing with frames that have no name.
	end

	if arg ~= nil and arg:GetName() ~= nil then
		ChatFrame1:AddMessage("|cffCC0000----------------------------")
		ChatFrame1:AddMessage(arg:GetName())

		for _, child in ipairs({arg:GetChildren()}) do
			if child and child:GetName() then
				ChatFrame1:AddMessage("--"..child:GetName())
			end
		end

		ChatFrame1:AddMessage("|cffCC0000----------------------------")
	end
end

SLASH_PROFILE1 = "/profile"
SlashCmdList.PROFILE = function()
	if GetCVar("scriptProfile") == "1" then
		SetCVar("scriptProfile", "0")
	else
		SetCVar("scriptProfile", "1")
	end

	ReloadUI()
end