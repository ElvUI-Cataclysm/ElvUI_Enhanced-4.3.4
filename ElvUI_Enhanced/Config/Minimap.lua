local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")
local EML = E:GetModule("Enhanced_MinimapLocation")
local MM = E:GetModule("Minimap")

function EE:MinimapOptions()
	local config = {
		type = "group",
		name = L["Minimap"],
		get = function(info) return E.db.enhanced.minimap[info[#info]] end,
		set = function(info, value)
			E.db.enhanced.minimap[info[#info]] = value
			MM:UpdateSettings()
		end,
		disabled = function() return not E.private.general.minimap.enable end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["Minimap"]
			},
			location = {
				order = 2,
				type = "toggle",
				name = L["Location Panel"],
				desc = L["Toggle Location Panel."],
				set = function(info, value)
					E.db.enhanced.minimap[info[#info]] = value
					EML:UpdateSettings()
				end
			},
			locationdigits = {
				order = 3,
				type = "range",
				name = L["Location Digits"],
				desc = L["Number of digits for map location."],
				min = 0, max = 2, step = 1,
				disabled = function() return not (E.db.enhanced.minimap.location and E.db.general.minimap.locationText == "ABOVE" and E.db.enhanced.minimap.showlocationdigits) end
			},
			hideincombat = {
				order = 4,
				type = "toggle",
				name = L["Hide In Combat"],
				desc = L["Hide minimap while in combat."],
			},
			fadeindelay = {
				order = 5,
				type = "range",
				name = L["FadeIn Delay"],
				desc = L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"],
				min = 0, max = 20, step = 1,
				disabled = function() return not E.db.enhanced.minimap.hideincombat end
			}
		}
	}
	E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText.values = {
		["MOUSEOVER"] = L["Minimap Mouseover"],
		["SHOW"] = L["Always Display"],
		["ABOVE"] = EE:ColorizeSettingName(L["Above Minimap"]),
		["HIDE"] = L["HIDE"]
	}
	config.args.locationText = E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText

	return config
end