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
			args = {}
		}
	end

	E.Options.args.elvuiPlugins.args.enhanced = {
		type = "group",
		childGroups = "tab",
		name = "|r|cffff7000E|r|cffe5e3e3nhanced",
		args = {
			generalGroup = EE:GeneralOptions(),
			blizzardGroup = EE:BlizzardOptions(),
			chatGroup = EE:ChatOptions(),
			minimapGroup = EE:MinimapOptions(),
			mapGroup = EE:MapOptions(),
			namePlatesGroup = EE:NamePlatesOptions(),
			tooltipGroup = EE:TooltipOptions(),
			unitframesGroup = EE:UnitFrameOptions(),
			miscGroup = EE:MiscOptions()
		}
	}

	E.Options.args.elvuiPlugins.args.enhanced.args.generalGroup.order = 1
	E.Options.args.elvuiPlugins.args.enhanced.args.blizzardGroup.order = 2
end