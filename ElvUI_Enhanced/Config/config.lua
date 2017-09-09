local E, L, V, P, G = unpack(ElvUI);
local addon = E:GetModule("ElvUI_Enhanced");

local format = string.format
local tsort = table.sort

local function ColorizeSettingName(settingName)
	return format("|cffff8000%s|r", settingName);
end

-- General
local function GeneralOptions()
	local M = E:GetModule("Enhanced_Misc");

	local config = {
		order = 1,
		type = "group",
		name = L["General"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["General"])
			},
			pvpAutoRelease = {
				order = 2,
				type = "toggle",
				name = L["PvP Autorelease"],
				desc = L["Automatically release body when killed inside a battleground."],
				get = function(info) return E.db.enhanced.general.pvpAutoRelease; end,
				set = function(info, value) E.db.enhanced.general.pvpAutoRelease = value; M:AutoRelease(); end
			},
			autoRepChange = {
				order = 3,
				type = "toggle",
				name = L["Track Reputation"],
				desc = L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."],
				get = function(info) return E.db.enhanced.general.autoRepChange; end,
				set = function(info, value) E.db.enhanced.general.autoRepChange = value; M:WatchedFaction(); end
			},
			showQuestLevel = {
				order = 4,
				type = "toggle",
				name = L["Show Quest Level"],
				desc = L["Display quest levels at Quest Log."],
				get = function(info) return E.db.general.showQuestLevel; end,
				set = function(info, value) E.db.general.showQuestLevel = value; end
			},
			selectQuestReward = {
				order = 5,
				type = "toggle",
				name = L["Select Quest Reward"],
				desc = L["Automatically select the quest reward with the highest vendor sell value."],
				get = function(info) return E.private.general.selectQuestReward end,
				set = function(info, value) E.private.general.selectQuestReward = value; end
			},
			declineduel = {
				order = 6,
				type = "toggle",
				name = L["Decline Duel"],
				desc = L["Auto decline all duels"],
				get = function(info) return E.db.enhanced.general.declineduel; end,
				set = function(info, value) E.db.enhanced.general.declineduel = value; M:LoadDeclineDuel() end
			},
			originalCloseButton = {
				order = 7,
				type = "toggle",
				name = L["Original Close Button"],
				get = function(info) return E.db.enhanced.general.originalCloseButton end,
				set = function(info, value) E.db.enhanced.general.originalCloseButton = value E:StaticPopup_Show("CONFIG_RL") end
			},
			hideZoneText = {
				order = 8,
				type = "toggle",
				name = L["Hide Zone Text"],
				get = function(info) return E.db.enhanced.general.hideZoneText end,
				set = function(info, value) E.db.enhanced.general.hideZoneText = value M:HideZone() end
			},
			animations = {
				order = 9,
				type = "toggle",
				name = L["Skin Animations"],
				get = function(info) return E.private.skins.animations; end,
				set = function(info, value) E.private.skins.animations = value; end
			},
			moverTransparancy = {
				order = 10,
				type = "range",
				isPercent = true,
				name = L["Mover Transparency"],
				desc = L["Changes the transparency of all the movers."],
				min = 0, max = 1, step = 0.01,
				get = function(info) return E.db.enhanced.general.moverTransparancy; end,
				set = function(info, value) E.db.enhanced.general.moverTransparancy = value M:UpdateMoverTransparancy(); end
			}
		}
	};
	return config;
end

-- Actionbars
local function ActionbarOptions()
	local EAB = E:GetModule("Enhanced_ActionBars")
	local ETAB = E:GetModule("Enhanced_TransparentActionbars")

	local config = {
		order = 1.5,
		type = "group",
		name = L["ActionBars"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["ActionBars"])
			},
			equipped = {
				order = 2,
				type = "group",
				name = L["Equipped Item Border"],
				guiInline = true,
				args = {
					equipped = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						get = function(info) return E.db.enhanced.actionbars[ info[#info] ] end,
						set = function(info, value) E.db.enhanced.actionbars[ info[#info] ] = value; EAB:UpdateCallback(); E:GetModule("ActionBars"):UpdateButtonSettings() end
					},
					equippedColor = {
						order = 2,
						type = "color",
						name = L["Border Color"],
						get = function(info)
							local t = E.db.enhanced.actionbars[ info[#info] ]
							local d = P.enhanced.actionbars[ info[#info] ]
							return t.r, t.g, t.b, t.a, d.r, d.g, d.b
						end,
						set = function(info, r, g, b)
							local t = E.db.enhanced.actionbars[ info[#info] ]
							t.r, t.g, t.b = r, g, b
							E:GetModule("ActionBars"):UpdateButtonSettings()
						end,
						disabled = function() return not E.db.enhanced.actionbars.equipped end
					}
				}
			},
			transparentActionbars = {
				order = 3,
				type = "group",
				name = L["Transparent ActionBars"],
				guiInline = true,
				get = function(info) return E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] end,
				set = function(info, value) E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] = value; end,
				args = {
					transparentBackdrops = {
						order = 1,
						type = "toggle",
						name = L["Transparent Backdrop"],
						desc = L["Sets actionbars' backgrounds to transparent template."],
						set = function(info, value) E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] = value; ETAB:BarsBackdrop() end
					},
					transparentButtons = {
						order = 2,
						type = "toggle",
						name = L["Transparent Buttons"],
						desc = L["Sets actionbars buttons' backgrounds to transparent template."],
						set = function(info, value) E.db.enhanced.actionbars.transparentActionbars[ info[#info] ] = value; ETAB:ButtonsBackdrop() end
					}
				}
			}
		}
	}
	return config;
end

-- Chat
local function ChatOptions()
	local config = {
		order = 2,
		type = "group",
		name = L["Chat"],
		args = {
			header = {
				order = 0,
				type = "header",
				name = ColorizeSettingName(L["Chat"])
			},
			dpsLinks = {
				order = 1,
				type = "toggle",
				name = L["Filter DPS meters Spam"],
				desc = L["Replaces long reports from damage meters with a clickable hyperlink to reduce chat spam.\nWorks correctly only with general reports such as DPS or HPS. May fail to filter te report of other things"],
				get = function(info) return E.db.enhanced.chat.dpsLinks; end,
				set = function(info, value) E.db.enhanced.chat.dpsLinks = value; E:GetModule("Enhanced_DPSLinks"):UpdateSettings(); end
			}
		}
	};
	return config;
end

-- Datatext
local function DataTextsOptions()
	local config = {
		order = 3,
		type = "group",
		name = L["DataTexts"],
		args = {
			header = {
				order = 0,
				type = "header",
				name = ColorizeSettingName(L["DataTexts"])
			},
			timeColorEnch = {
				order = 1,
				type = "toggle",
				name = L["Enhanced Time Color"],
				get = function(info) return E.db.enhanced.datatexts.timeColorEnch; end,
				set = function(info, value) E.db.enhanced.datatexts.timeColorEnch = value; E:GetModule("Enhanced_DatatextTime"):UpdateSettings(); end
			}
		}
	};
	return config;
end

-- Equipment
local function EquipmentOptions()
	local PD = E:GetModule("PaperDoll")

	local config = {
		order = 4,
		type = "group",
		name = L["Equipment"],
		get = function(info) return E.db.enhanced.equipment[info[#info]] end,
		set = function(info, value) E.db.enhanced.equipment[info[#info]] = value end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Equipment"])
			},
			durability = {
				order = 2,
				type = "group",
				name = DURABILITY,
				guiInline = true,
				get = function(info) return E.db.enhanced.equipment.durability[info[#info]] end,
				set = function(info, value) E.db.enhanced.equipment.durability[info[#info]] = value PD:UpdatePaperDoll() PD:UpdatePaperDoll("player") PD:UpdateInfoText("Character") PD:UpdateInfoText("Inspect") end,
				args = {
					info = {
						order = 1,
						type = "description",
						name = L["DURABILITY_DESC"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["Enable"],
						desc = L["Enable/Disable the display of durability information on the character screen."]
					},
					onlydamaged = {
						order = 3,
						type = "toggle",
						name = L["Damaged Only"],
						desc = L["Only show durabitlity information for items that are damaged."],
						disabled = function() return not E.db.enhanced.equipment.durability.enable end
					},
					spacer = {
						order = 4,
						type = "description",
						name = " "
					},
					position = {
						order = 5,
						type = "select",
						name = L["Position"],
						values = {
							["TOP"] = "TOP",
							["TOPLEFT"] = "TOPLEFT",
							["TOPRIGHT"] = "TOPRIGHT",
							["BOTTOM"] = "BOTTOM",
							["BOTTOMLEFT"] = "BOTTOMLEFT",
							["BOTTOMRIGHT"] = "BOTTOMRIGHT"
						},
						disabled = function() return not E.db.enhanced.equipment.durability.enable end
					},
					xOffset = {
						order = 6,
						type = "range",
						name = L["X-Offset"],
						min = -50, max = 50, step = 1,
						disabled = function() return not E.db.enhanced.equipment.durability.enable end
					},
					yOffset = {
						order = 7,
						type = "range",
						name = L["Y-Offset"],
						min = -50, max = 50, step = 1,
						disabled = function() return not E.db.enhanced.equipment.durability.enable end
					}
				}
			},
			itemlevel = {
				order = 3,
				type = "group",
				name = STAT_AVERAGE_ITEM_LEVEL,
				guiInline = true,
				get = function(info) return E.db.enhanced.equipment.itemlevel[info[#info]] end,
				set = function(info, value) E.db.enhanced.equipment.itemlevel[info[#info]] = value PD:UpdatePaperDoll() PD:UpdatePaperDoll("player") PD:UpdateInfoText("Character") PD:UpdateInfoText("Inspect") end,
				args = {
					info = {
 						order = 1,
						type = "description",
						name = L["ITEMLEVEL_DESC"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["Enable"],
						desc = L["Enable/Disable the display of item levels on the character screen."]
					},
					qualityColor = {
 						order = 3,
						type = "toggle",
						name = L["Quality Color"],
						disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
					},
					spacer = {
						order = 4,
						type = "description",
						name = " "
					},
					position = {
						order = 5,
						type = "select",
						name = L["Position"],
						values = {
							["TOP"] = "TOP",
							["TOPLEFT"] = "TOPLEFT",
							["TOPRIGHT"] = "TOPRIGHT",
							["BOTTOM"] = "BOTTOM",
							["BOTTOMLEFT"] = "BOTTOMLEFT",
							["BOTTOMRIGHT"] = "BOTTOMRIGHT"
						},
						disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
					},
					xOffset = {
						order = 6,
						type = "range",
						name = L["X-Offset"],
						min = -50, max = 50, step = 1,
						disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
					},
					yOffset = {
						order = 7,
						type = "range",
						name = L["Y-Offset"],
						min = -50, max = 50, step = 1,
						disabled = function() return not E.db.enhanced.equipment.itemlevel.enable end
					}
				}
			},
			fontGroup = {
				order = 4,
				type = "group",
				name = L["Font"],
				guiInline = true,
				get = function(info) return E.db.enhanced.equipment[info[#info]] end,
				set = function(info, value) E.db.enhanced.equipment[info[#info]] = value; PD:UpdateInfoText("Character"); PD:UpdateInfoText("Inspect"); end,
				args = {
					font = {
						order = 1,
						type = "select",
						dialogControl = "LSM30_Font",
						name = L["Font"],
						values = AceGUIWidgetLSMlists.font
					},
					fontSize = {
						order = 2,
						type = "range",
						name = FONT_SIZE,
						min = 6, max = 36, step = 1
					},
					fontOutline = {
						order = 3,
						type = "select",
						name = L["Font Outline"],
						values = {
							["NONE"] = NONE,
							["OUTLINE"] = "OUTLINE",
							["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
							["THICKOUTLINE"] = "THICKOUTLINE"
						}
					}
				}
			}
		}
	}

	return config;
end

-- Minimap
local function MinimapOptions()
	local config = {
		order = 5,
		type = "group",
		name = L["Minimap"],
		get = function(info) return E.db.enhanced.minimap[info[#info]] end,
		set = function(info, value) E.db.enhanced.minimap[info[#info]] = value; E:GetModule("Minimap"):UpdateSettings(); end,
		disabled = function() return not E.private.general.minimap.enable end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Minimap"])
			},
			location = {
				order = 2,
				type = "toggle",
				name = L["Location Panel"],
				desc = L["Toggle Location Panel."],
				set = function(info, value)
					E.db.enhanced.minimap[info[#info]] = value;
					E:GetModule("Enhanced_MinimapLocation"):UpdateSettings();
				end
			},
			locationdigits = {
				order = 3,
				type = "range",
				name = L["Location Digits"],
				desc = L["Number of digits for map location."],
				min = 0, max = 2, step = 1,
				disabled = function() return not (E.db.enhanced.minimap.location and E.db.general.minimap.locationText == "ABOVE") end
			},
			hideincombat = {
				order = 4,
				type = "toggle",
				name = L["Combat Hide"],
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
	};
	E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText.values = {
		["MOUSEOVER"] = L["Minimap Mouseover"],
		["SHOW"] = L["Always Display"],
		["ABOVE"] = ColorizeSettingName(L["Above Minimap"]),
		["HIDE"] = L["Hide"]
	};
	config.args.locationText = E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText
	return config;
end

-- Nameplates
local function NamePlatesOptions()
	local config = {
		order = 6,
		type = "group",
		name = L["NamePlates"],
		get = function(info) return E.db.enhanced.nameplates[info[#info]] end,
		args = {
			header = {
				order = 0,
				type = "header",
				name = ColorizeSettingName(L["NamePlates"])
			},
			cacheUnitClass = {
				order = 1,
				type = "toggle",
				name = L["Cache Unit Class"],
				set = function(info, value) E.db.enhanced.nameplates[info[#info]] = value; E:GetModule("Enhanced_NamePlates"):CacheUnitClass(); E:GetModule("NamePlates"):ConfigureAll(); end,
			},
			smooth = {
				type = "toggle",
				order = 2,
				name = L["Smooth Bars"],
				desc = L["Bars will transition smoothly."],
				set = function(info, value) E.db.enhanced.nameplates[ info[#info] ] = value; E:GetModule("NamePlates"):ConfigureAll(); end
			},
			smoothSpeed = {
				type = "range",
				order = 3,
				name = L["Animation Speed"],
				desc = L["Speed in seconds"],
				min = 0.1, max = 3, step = 0.01,
				disabled = function() return not E.db.enhanced.nameplates.smooth; end,
				set = function(info, value) E.db.enhanced.nameplates[ info[#info] ] = value; E:GetModule("NamePlates"):ConfigureAll(); end
			},
		}
	};
	return config;
end

-- Tooltip
local function TooltipOptions()
	local config = {
		order = 7,
		type = "group",
		name = L["Tooltip"],
		get = function(info) return E.db.enhanced.tooltip[info[#info]] end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Tooltip"])
			},
			itemQualityBorderColor = {
 				order = 2,
				type = "toggle",
				name = L["Item Border Color"],
				desc = L["Colorize the tooltip border based on item quality."],
				get = function(info) return E.db.enhanced.tooltip.itemQualityBorderColor end,
				set = function(info, value) E.db.enhanced.tooltip.itemQualityBorderColor = value; E:GetModule("Enhanced_ItemBorderColor"):ToggleState(); end
			},
			tooltipIcon = {
				order = 3,
				type = "group",
				name = L["Tooltip Icon"],
				guiInline = true,
				args = {
					tooltipIcon = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						desc = L["Show/Hides an Icon for Spells and Items on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.enable; end,
						set = function(info, value) E.db.enhanced.tooltip.tooltipIcon.enable = value; end
					},
					spacer = {
						order = 2,
						type = "description",
						name = "",
						width = "full"
					},
					tooltipIconSpells = {
						order = 3,
						type = "toggle",
						name = SPELLS,
						desc = L["Show/Hides an Icon for Spells on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.tooltipIconSpells; end,
						set = function(info, value) E.db.enhanced.tooltip.tooltipIcon.tooltipIconSpells = value; end,
						disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
					},
					tooltipIconItems = {
						order = 4,
						type = "toggle",
						name = ITEMS,
						desc = L["Show/Hides an Icon for Items on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.tooltipIconItems; end,
						set = function(info, value) E.db.enhanced.tooltip.tooltipIcon.tooltipIconItems = value; end,
						disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
					},
					tooltipIconAchievements = {
						order = 5,
						type = "toggle",
						name = ACHIEVEMENTS,
						desc = L["Show/Hides an Icon for Achievements on the Tooltip."],
						get = function(info) return E.db.enhanced.tooltip.tooltipIcon.tooltipIconAchievements; end,
						set = function(info, value) E.db.enhanced.tooltip.tooltipIcon.tooltipIconAchievements = value; end,
						disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
					}
				}
			},
			progressInfo = {
				order = 4,
				type = "group",
				name = L["Progress Info"],
				guiInline = true,
				get = function(info) return E.db.enhanced.tooltip.progressInfo[info[#info]]; end,
				set = function(info, value) E.db.enhanced.tooltip.progressInfo[info[#info]] = value; end,
				args = {
					enable = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						set = function(info, value) E.db.enhanced.tooltip.progressInfo[info[#info]] = value; E:GetModule("Enhanced_ProgressionInfo"):ToggleState(); end
					},
					checkPlayer = {
						order = 2,
						type = "toggle",
						name = L["Check Player"],
						disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end
					},
					modifier = {
						order = 3,
						type = "select",
						name = L["Visibility"],
						set = function(info, value) E.db.enhanced.tooltip.progressInfo[info[#info]] = value; E:GetModule("Enhanced_ProgressionInfo"):UpdateModifier(); end,
						values = {
							["ALL"] = ALWAYS,
							["SHIFT"] = SHIFT_KEY,
							["ALT"] = ALT_KEY,
							["CTRL"] = CTRL_KEY
						},
						disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end
					},
					tiers = {
						order = 4,
						type = "group",
						name = L["Tiers"],
						get = function(info) return E.db.enhanced.tooltip.progressInfo.tiers[info[#info]]; end,
						set = function(info, value) E.db.enhanced.tooltip.progressInfo.tiers[info[#info]] = value; E:GetModule("Enhanced_ProgressionInfo"):UpdateSettings() end,
						disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end,
						args = {
							DS = {
								order = 1,
								type = "toggle",
								name = L["Dragon Soul"]
							},
							FL = {
								order = 2,
								type = "toggle",
								name = L["Firelands"]
							},
							BH = {
								order = 3,
								type = "toggle",
								name = L["Baradin Hold"]
							},
							TOTFW = {
								order = 4,
								type = "toggle",
								name = L["Throne of the Four Winds"]
							},
							BT = {
								order = 5,
								type = "toggle",
								name = L["Bastion of Twilight"]
							},
							BWD = {
								order = 6,
								type = "toggle",
								name = L["Blackwing Descend"]
							}
						}
					}
				}
			}
		}
	};

	return config;
end

-- WatchFrame
local function WatchFrameOptions()
	local WF = E:GetModule("Enhanced_WatchFrame");

	local choices = {
		["NONE"] = NONE,
		["COLLAPSED"] = L["Collapsed"],
		["HIDDEN"] = L["Hidden"]
	};

	local config = {
		order = 8,
		type = "group",
		name = L["Objective Frame"],
		get = function(info) return E.db.enhanced.watchframe[info[#info]] end,
		set = function(info, value) E.db.enhanced.watchframe[info[#info]] = value; WF:UpdateSettings(); end,
		args = {
			header = {
				order = 0,
				type = "header",
				name = ColorizeSettingName(L["Objective Frame"])
			},
			intro = {
				order = 1,
				type = "description",
				name = L["WATCHFRAME_DESC"]
			},
			enable = {
				order = 2,
				type = "toggle",
				name = L["Enable"]
			},
			settings = {
				order = 3,
				type = "group",
				name = L["Visibility State"],
				guiInline = true,
				get = function(info) return E.db.enhanced.watchframe[info[#info]] end,
				set = function(info, value) E.db.enhanced.watchframe[info[#info]] = value; WF:ChangeState(); end,
				disabled = function() return not E.db.enhanced.watchframe.enable; end,
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
						name = L["Arena"],
						values = choices
					},
					party = {
						order = 4,
						type = "select",
						name = L["Party"],
						values = choices
					},
					raid = {
						order = 5,
						type = "select",
						name = L["Raid"],
						values = choices
					}
				}
			}
		}
	};
	return config;
end

-- Loss Control
local function LoseControlOptions()
	local config = {
		order = 7,
		type = "group",
		name = L["Lose Control"],
		get = function(info) return E.db.enhanced.tooltip[info[#info]] end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["Lose Control"])
			},
			enable = {
				order = 2,
				type = "toggle",
				name = L["Enable"],
				get = function(info) return E.private.loseofcontrol.enable end,
				set = function(info, value) E.private.loseofcontrol.enable = value; E:StaticPopup_Show("PRIVATE_RL"); end
			},
			typeGroup = {
				order = 3,
				type = "group",
				name = TYPE,
				guiInline = true,
				get = function(info) return E.db.enhanced.loseofcontrol[ info[#info] ]; end,
				set = function(info, value) E.db.enhanced.loseofcontrol[ info[#info] ] = value; end,
				disabled = function() return not E.private.loseofcontrol.enable; end,
				args = {
					CC = {
						type = "toggle",
						name = L["CC"]
					},
					PvE = {
						type = "toggle",
						name = L["PvE"]
					},
					Silence = {
						type = "toggle",
						name = L["Silence"]
					},
					Disarm = {
						type = "toggle",
						name = L["Disarm"]
					},
					Root = {
						type = "toggle",
						name = L["Root"]
					},
					Snare = {
						type = "toggle",
						name = L["Snare"]
					}
				}
			}
		}
	};
	return config;
end

local function UnitFrameOptions()
	local TC = E:GetModule("TargetClass")

	local config = {
		order = 10,
		type = "group",
		name = L["UnitFrames"],
		childGroups = "tab",
		args = {
			header = {
				order = 1,
				type = "header",
				name = ColorizeSettingName(L["UnitFrames"])
			},
			general = {
				order = 2,
				type = "group",
				name = L["General"],
				guiInline = true,
				args = {
					hideRoleInCombat = {
						order = 2,
						type = "toggle",
						name = L["Hide Role Icon in combat"],
						desc = L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."],
						get = function(info) return E.db.enhanced.unitframe.hideRoleInCombat end,
						set = function(info, value) E.db.enhanced.unitframe.hideRoleInCombat = value; E:StaticPopup_Show("PRIVATE_RL"); end
					}
				}
			},
			player = {
				order = 3,
				type = "group",
				name = L["Player"],
				args = {
					animatedLoss = {
						order = 1,
						type = "group",
						name = L["Animated Loss"],
						get = function(info) return E.db.unitframe.units["player"]["animatedLoss"][ info[#info] ]; end,
						set = function(info, value) E.db.unitframe.units["player"]["animatedLoss"][ info[#info] ] = value; E:GetModule("UnitFrames"):CreateAndUpdateUF("player"); end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Animated Loss"]
							},
							enable = {
								order = 2,
								type = "toggle",
								name = L["Enable"]
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							duration = {
								order = 4,
								type = "range",
								name = L["Duration"],
								min = 0.01, max = 1.50, step = 0.01
							},
							startDelay = {
								order = 5,
								type = "range",
								name = L["Start Delay"],
								min = 0.01, max = 1.00, step = 0.01
							},
							pauseDelay = {
								order = 6,
								type = "range",
								name = L["Pause Delay"],
								min = 0.01, max = 0.30, step = 0.01
							},
							postponeDelay = {
								order = 7,
								type = "range",
								name = L["Postpone Delay"],
								min = 0.01, max = 0.30, step = 0.01
							}
						}
					},
					detachPortrait = {
						order = 2,
						type = "group",
						name = L["Portrait"],
						get = function(info) return E.db.unitframe.units["player"]["portrait"][ info[#info] ]; end,
						set = function(info, value) E.db.unitframe.units["player"]["portrait"][ info[#info] ] = value; E:GetModule("UnitFrames"):CreateAndUpdateUF("player"); end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Portrait"]
							},
							detachFromFrame = {
								order = 2,
								type = "toggle",
								name = L["Detach From Frame"]
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							detachedWidth = {
								order = 4,
								type = "range",
								name = L["Detached Width"],
								min = 10, max = 600, step = 1,
							},
							detachedHeight = {
								order = 5,
								type = "range",
								name = L["Detached Height"],
								min = 10, max = 600, step = 1,
							}
						}
					}
				}
			},
			target = {
				order = 4,
				type = "group",
				name = L["Target"],
				args = {
					classIcon = {
						order = 1,
						type = "group",
						name = L["Class Icons"],
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Class Icons"]
							},
							enable = {
								order = 2,
								type = "toggle",
								name = L["Enable"],
								desc = L["Show class icon for units."],
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.enable end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.enable = value; TC:ToggleSettings() end
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							size = {
								order = 4,
								type = "range",
								name = L["Size"],
								desc = L["Size of the indicator icon."],
								min = 16, max = 40, step = 1,
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.size end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.size = value; TC:ToggleSettings() end
							},
							xOffset = {
								order = 5,
								type = "range",
								name = L["xOffset"],
								min = -100, max = 100, step = 1,
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.xOffset end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.xOffset = value; TC:ToggleSettings() end
							},
							yOffset = {
								order = 6,
								type = "range",
								name = L["yOffset"],
								min = -80, max = 40, step = 1,
								get = function(info) return E.db.enhanced.unitframe.units.target.classicon.yOffset end,
								set = function(info, value) E.db.enhanced.unitframe.units.target.classicon.yOffset = value; TC:ToggleSettings() end
							}
						}
					},
					detachPortrait = {
						order = 2,
						type = "group",
						name = L["Portrait"],
						get = function(info) return E.db.unitframe.units["target"]["portrait"][ info[#info] ]; end,
						set = function(info, value) E.db.unitframe.units["target"]["portrait"][ info[#info] ] = value; E:GetModule("UnitFrames"):CreateAndUpdateUF("target"); end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Portrait"]
							},
							detachFromFrame = {
								order = 2,
								type = "toggle",
								name = L["Detach From Frame"]
							},
							spacer = {
								order = 3,
								type = "description",
								name = " "
							},
							detachedWidth = {
								order = 4,
								type = "range",
								name = L["Detached Width"],
								min = 10, max = 600, step = 1
							},
							detachedHeight = {
								order = 5,
								type = "range",
								name = L["Detached Height"],
								min = 10, max = 600, step = 1
							}
						}
					}
				}
			}
		}
	}
	return config
end

function addon:GetOptions()
	E.Options.args.enhanced = {
		order = 50,
		type = "group",
		childGroups = "tab",
		name = ColorizeSettingName("Enhanced"),
		args = {
			generalGroup = GeneralOptions(),
			actionbarGroup = ActionbarOptions(),
			chatGroup = ChatOptions(),
			datatextsGroup = DataTextsOptions(),
			equipmentGroup = EquipmentOptions(),
			minimapGroup = MinimapOptions(),
			namePlatesGroup = NamePlatesOptions(),
			tooltipGroup = TooltipOptions(),
			unitframesGroup = UnitFrameOptions(),
			losecontrolGroup = LoseControlOptions(),
			watchFrameGroup = WatchFrameOptions(),
		}
	};
end