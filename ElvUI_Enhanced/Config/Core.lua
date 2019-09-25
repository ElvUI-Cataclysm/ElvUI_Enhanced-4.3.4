local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")

local IsAddOnLoaded = IsAddOnLoaded

function EE:GetOptions()
	local ACD = E.Libs.AceConfigDialog

	if not E.Options.args.elvuiPlugins then
		E.Options.args.elvuiPlugins = {
			order = 50,
			type = "group",
			name = "|cffff7000E|r|cffe5e3e3lvUI |r|cffff7000P|r|cffe5e3e3lugins|r",
			args = {
				header = {
					order = 0,
					type = "header",
					name = "|cffff7000E|r|cffe5e3e3lvUI |r|cffff7000P|r|cffe5e3e3lugins|r"
				},
				enhancedShortcut = {
					type = "execute",
					name = EE:ColorizeSettingName(L["Enhanced"]),
					func = function()
						if IsAddOnLoaded("ElvUI_OptionsUI") then
							ACD:SelectGroup("ElvUI", "elvuiPlugins", "enhanced", "generalGroup")
						end
					end
				}
			}
		}
	elseif not E.Options.args.elvuiPlugins.args.enhancedShortcut then
		E.Options.args.elvuiPlugins.args.enhancedShortcut = {
			type = "execute",
			name = EE:ColorizeSettingName(L["Enhanced"]),
			func = function()
				if IsAddOnLoaded("ElvUI_OptionsUI") then
					ACD:SelectGroup("ElvUI", "elvuiPlugins", "enhanced", "generalGroup")
				end
			end
		}
	end

	E.Options.args.elvuiPlugins.args.enhanced = {
		type = "group",
		childGroups = "tab",
		name = EE:ColorizeSettingName("Enhanced"),
		args = {
			header = {
				order = 0,
				type = "header",
				name = L["Enhanced"]
			},
			generalGroup = EE:GeneralOptions(),
			actionbarGroup = EE:ActionbarOptions(),
			blizzardGroup = EE:BlizzardOptions(),
			chatGroup = EE:ChatOptions(),
			minimapGroup = EE:MinimapOptions(),
			namePlatesGroup = EE:NamePlatesOptions(),
			tooltipGroup = EE:TooltipOptions(),
			unitframesGroup = EE:UnitFrameOptions(),
			miscGroup = EE:MiscOptions()
		}
	}

	E.Options.args.elvuiPlugins.args.enhanced.args.generalGroup.order = 1
	E.Options.args.elvuiPlugins.args.enhanced.args.blizzardGroup.order = 2
end