local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")
local B = E:GetModule("Enhanced_Blizzard")
local WF = E:GetModule("Enhanced_WatchFrame")

local choices = {
	["NONE"] = L["NONE"],
	["COLLAPSED"] = L["Collapsed"],
	["HIDDEN"] = L["Hidden"]
}

function EE:BlizzardOptions()
	local config = {
		type = "group",
		name = L["BlizzUI Improvements"],
		get = function(info) return E.private.enhanced[info[#info]] end,
		set = function(info, value)
			E.private.enhanced[info[#info]] = value
			E:StaticPopup_Show("PRIVATE_RL")
		end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["BlizzUI Improvements"]
			},
			general = {
				order = 2,
				type = "group",
				name = L["General"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["General"]
					},
					deathRecap = {
						order = 2,
						type = "toggle",
						name = L["Death Recap"]
					},
					animatedAchievementBars = {
						order = 3,
						type = "toggle",
						name = L["Animated Achievement Bars"]
					}
				}
			},
			errorFrame = {
				order = 3,
				type = "group",
				name = L["Error Frame"],
				get = function(info) return E.db.enhanced.blizzard.errorFrame[info[#info]] end,
				set = function(info, value)
					E.db.enhanced.blizzard.errorFrame[info[#info]] = value
					B:ErrorFrameSize()
				end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Error Frame"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["ENABLE"],
						set = function(info, value)
							E.db.enhanced.blizzard.errorFrame[info[#info]] = value
							B:CustomErrorFrameToggle()
						end
					},
					spacer = {
						order = 3,
						type = "description",
						name = " "
					},
					width = {
						order = 4,
						type = "range",
						min = 100, max = 1000, step = 1,
						name = L["Width"],
						desc = L["Set the width of Error Frame. Too narrow frame may cause messages to be split in several lines"],
						disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
					},
					height = {
						order = 5,
						type = "range",
						min = 30, max = 300, step = 1,
						name = L["Height"],
						desc = L["Set the height of Error Frame. Higher frame can show more lines at once."],
						disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
					},
					font = {
						order = 6,
						type = "select",
						dialogControl = "LSM30_Font",
						name = L["Font"],
						values = AceGUIWidgetLSMlists.font,
						disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
					},
					fontSize = {
						order = 7,
						type = "range",
						min = 6, max = 36, step = 1,
						name = L["FONT_SIZE"],
						disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
					},
					fontOutline = {
						order = 8,
						type = "select",
						name = L["Font Outline"],
						values = {
							["NONE"] = L["NONE"],
							["OUTLINE"] = "OUTLINE",
							["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
							["THICKOUTLINE"] = "THICKOUTLINE"
						},
						disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
					}
				}
			},
			watchframe = {
				order = 4,
				type = "group",
				name = L["Objective Frame"],
				get = function(info) return E.db.enhanced.watchframe[info[#info]] end,
				set = function(info, value)
					E.db.enhanced.watchframe[info[#info]] = value
					WF:UpdateSettings()
				end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Objective Frame"]
					},
					intro = {
						order = 2,
						type = "description",
						name = L["WATCHFRAME_DESC"]
					},
					enable = {
						order = 3,
						type = "toggle",
						name = L["ENABLE"]
					},
					settings = {
						order = 4,
						type = "group",
						name = L["Visibility State"],
						guiInline = true,
						get = function(info) return E.db.enhanced.watchframe[info[#info]] end,
						set = function(info, value)
							E.db.enhanced.watchframe[info[#info]] = value
							WF:ChangeState()
						end,
						disabled = function() return not E.db.enhanced.watchframe.enable end,
						args = {
							city = {
								order = 1,
								type = "select",
								name = L["City (Resting)"],
								values = choices
							},
							pvp = {
								order = 2,
								type = "select",
								name = L["PvP"],
								values = choices
							},
							arena = {
								order = 3,
								type = "select",
								name = L["ARENA"],
								values = choices
							},
							party = {
								order = 4,
								type = "select",
								name = L["PARTY"],
								values = choices
							},
							raid = {
								order = 5,
								type = "select",
								name = L["RAID"],
								values = choices
							}
						}
					}
				}
			}
		}
	}

	return config
end