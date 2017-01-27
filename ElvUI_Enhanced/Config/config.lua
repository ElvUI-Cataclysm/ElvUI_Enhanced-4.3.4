local addonName = ...;
local E, L, V, P, G = unpack(ElvUI);
local EO = E:NewModule("EnhancedOptions", "AceEvent-3.0");
local EP = LibStub("LibElvUIPlugin-1.0");

local function ColorizeSettingName(settingName)
	return ("|cffff8000%s|r"):format(settingName);
end

-- General
function EO:GeneralOptions()
	local PD = E:GetModule("PaperDoll");

	E.Options.args.general.args.losscontrol = {
		order = 12,
		type = "group",
		name = ColorizeSettingName(L["Lose Control"]),
		args = {
			losecontrolHeader = {
				order = 1,
				type = "header",
				name = L["Lose Control"]
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
				get = function(info) return E.db.loseofcontrol[ info[#info] ]; end,
				set = function(info, value) E.db.loseofcontrol[ info[#info] ] = value; end,
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

	E.Options.args.general.args.equipment = {
		order = 13,
		type = "group",
		name = ColorizeSettingName(L["Equipment"]),
		get = function(info) return E.private.equipment[ info[#info] ]; end,
		set = function(info, value) E.private.equipment[ info[#info] ] = value; end,
		args = {
			equipmentHeader = {
				order = 1,
				type = "header",
				name = L["Equipment"]
			},
			intro = {
				order = 2,
				type = "description",
				name = L["DURABILITY_DESC"]
			},
			durability = {
				order = 3,
				type = "group",
				name = DURABILITY,
				guiInline = true,
				get = function(info) return E.private.equipment.durability[ info[#info] ]; end,
				set = function(info, value) E.private.equipment.durability[ info[#info] ] = value PD:UpdatePaperDoll(); end,
				args = {
					enable = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						desc = L["Enable/Disable the display of durability information on the character screen."]
					},
					onlydamaged = {
						order = 2,
						type = "toggle",
						name = L["Damaged Only"],
						desc = L["Only show durabitlity information for items that are damaged."],
						disabled = function() return not E.private.equipment.durability.enable; end
					}
				}
			},
			intro2 = {
				order = 4,
				type = "description",
				name = L["ITEMLEVEL_DESC"]
			},
			itemlevel = {
				order = 5,
				type = "group",
				name = L["Item Level"],
				guiInline = true,
				get = function(info) return E.private.equipment.itemlevel[ info[#info] ]; end,
				set = function(info, value) E.private.equipment.itemlevel[ info[#info] ] = value PD:UpdatePaperDoll(); end,
				args = {
					enable = {
						order = 1,
						type = "toggle",
						name = L["Enable"],
						desc = L["Enable/Disable the display of item levels on the character screen."]
					}
				}
			}
		}
	};
end

-- Nameplates
function EO:NameplateOptions()
	E.Options.args.nameplate.args.general.args.showthreat = {
		order = 10,
		type = "toggle",
		name = ColorizeSettingName(L["Threat Text"]),
		desc = L["Display threat level as text on targeted, boss or mouseover nameplate."]
	}
end

-- Maps
function EO:MapOptions()
	E.Options.args.maps.args.minimap.args.generalGroup.args.spacer = {
		order = 3,
		type = "description",
		name = "",
		width = "full"
	};

	E.Options.args.maps.args.minimap.args.generalGroup.args.hideincombat = {
		order = 4,
		type = "toggle",
		name = ColorizeSettingName(L["Hide in Combat"]),
		desc = L["Hide minimap while in combat."],
		get = function(info) return E.private.general.minimap.hideincombat; end,
		set = function(info, value) E.private.general.minimap.hideincombat = value; E:GetModule("Minimap"):UpdateSettings(); end
	};

	E.Options.args.maps.args.minimap.args.generalGroup.args.fadeindelay = {
		order = 5,
		type = "range",
		name = ColorizeSettingName(L["FadeIn Delay"]),
		desc = L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"],
		min = 0, max = 20, step = 1,
		get = function(info) return E.private.general.minimap.fadeindelay; end,
		set = function(info, value) E.private.general.minimap.fadeindelay = value; end,
		disabled = function() return not E.private.general.minimap.hideincombat; end
	};

	E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationdigits = {
		order = 2.1,
		type = "range",
		name = ColorizeSettingName(L["Location Digits"]),
		desc = L["Number of digits for map location."],
		min = 0, max = 2, step = 1,
		get = function(info) return E.private.general.minimap.locationdigits; end,
		set = function(info, value) E.private.general.minimap.locationdigits = value; E:GetModule("Minimap"):UpdateSettings(); end,
		disabled = function() return E.db.general.minimap.locationText ~= "ABOVE"; end
	};

	E.Options.args.maps.args.minimap.args.locationTextGroup.args.spacer = {
		order = 2.2,
		type = "description",
		name = "",
		desc = L["Number of digits for map location."],
		width = "full"
	};

	E.Options.args.maps.args.minimap.args.locationTextGroup.args.locationText.values = {
		["MOUSEOVER"] = L["Minimap Mouseover"],
		["SHOW"] = L["Always Display"],
		["ABOVE"] = ColorizeSettingName(L["Above Minimap"]),
		["HIDE"] = L["Hide"]
	};
end

-- Misc
function EO:MiscOptions()
	local M = E:GetModule("MiscEnh")

	E.Options.args.general.args.general.args.alreadyknown = {
		order = 16.1,
		type = "toggle",
		name = ColorizeSettingName(L["Already Known"]),
		desc = L["Colorizes recipes, mounts & pets that are already known"],
		get = function(info) return E.db.general.alreadyknown; end,
		set = function(info, value) E.db.general.alreadyknown = value; E:StaticPopup_Show("PRIVATE_RL"); end
	};

	E.Options.args.general.args.general.args.pvpautorelease = {
		order = 16.2,
		type = "toggle",
		name = ColorizeSettingName(L["PvP Autorelease"]),
		desc = L["Automatically release body when killed inside a battleground."],
		get = function(info) return E.private.general.pvpautorelease; end,
		set = function(info, value) E.private.general.pvpautorelease = value; E:StaticPopup_Show("PRIVATE_RL"); end
	};

	E.Options.args.general.args.general.args.declineduel = {
		order = 16.3,
		type = "toggle",
		name = ColorizeSettingName(L["Decline Duel"]),
		desc = L["Auto decline all duels"],
		get = function(info) return E.db.general.declineduel; end,
		set = function(info, value) E.db.general.declineduel = value; E:StaticPopup_Show("PRIVATE_RL"); end
	};

	E.Options.args.general.args.general.args.autorepchange = {
		order = 16.4,
		type = "toggle",
		name = ColorizeSettingName(L["Track Reputation"]),
		desc = L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."],
		get = function(info) return E.private.general.autorepchange; end,
		set = function(info, value) E.private.general.autorepchange = value; end
	};

	E.Options.args.general.args.general.args.showQuestLevel = {
		order = 16.5,
		type = "toggle",
		name = ColorizeSettingName(L["Show Quest Level"]),
		desc = L["Display quest levels at Quest Log."],
		get = function(info) return E.private.general.showQuestLevel; end,
		set = function(info, value) E.private.general.showQuestLevel = value; end
	};

	E.Options.args.general.args.general.args.spacer = {
		order = 16.6,
		type = "description",
		name = "",
		width = "full"
	};

	E.Options.args.general.args.general.args.moverTransparancy = {
		order = 16.7,
		type = "range",
		isPercent = true,
		name = ColorizeSettingName(L["Mover Transparency"]),
		desc = L["Changes the transparency of all the movers."],
		min = 0, max = 1, step = 0.01,
		set = function(info, value) E.db.general.moverTransparancy = value M:UpdateMoverTransparancy(); end,
		get = function(info) return E.db.general.moverTransparancy; end
	};
end

-- Skins
function EO:SkinsOptions()
	E.Options.args.skins.args.animations = {
		order = 3.1,
		type = "toggle",
		name = ColorizeSettingName(L["Animations"]),
		get = function(info) return E.private.skins.animations; end,
		set = function(info, value) E.private.skins.animations = value; end
	};
end

-- Unitframes
function EO:UnitFramesOptions()
	local TC = E:GetModule("TargetClass")
	E.Options.args.unitframe.args.target.args.classicon = {
		order = 1002,
		type = "group",
		name = ColorizeSettingName(L["Class Icons"]),
		get = function(info) return E.db.unitframe.units["target"]["classicon"][ info[#info] ] end,
		set = function(info, value) E.db.unitframe.units["target"]["classicon"][ info[#info] ] = value; TC:ToggleSettings() end,
		args = {
			enable = {
				type = "toggle",
				order = 1,
				name = L["Enable"],
				desc = L["Show class icon for units."]
			},
			size = {
				order = 4,
				type = "range",
				name = L["Size"],
				desc = L["Size of the indicator icon."],
				min = 16, max = 40, step = 1
			},
			xOffset = {
				order = 5,
				type = "range",
				name = L["xOffset"],
				min = -100, max = 100, step = 1
			},
			yOffset = {
				order = 6,
				type = "range",
				name = L["yOffset"],
				min = -80, max = 40, step = 1
			}
		}
	}

	E.Options.args.unitframe.args.general.args.generalGroup.args.hideroleincombat = {
		order = 7,
		name = ColorizeSettingName(L["Hide Role Icon in combat"]),
		desc = L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."],
		type = "toggle",
		set = function(info, value) E.db.unitframe[ info[#info] ] = value; E:StaticPopup_Show("PRIVATE_RL"); end
	};

	E.Options.args.unitframe.args.player.args.animatedLoss = {
		order = 150,
		type = "group",
		name = ColorizeSettingName(L["Animated Loss"]),
		get = function(info) return E.db.unitframe.units["player"]["animatedLoss"][ info[#info] ]; end,
		set = function(info, value) E.db.unitframe.units["player"]["animatedLoss"][ info[#info] ] = value; E:GetModule("UnitFrames"):CreateAndUpdateUF("player"); end,
		args = {
			enable = {
				order = 1,
				type = "toggle",
				name = L["Enable"]
			},
			duration = {
				order = 2,
				type = "range",
				name = L["Duration"],
				min = 0.01, max = 1.50, step = 0.01
			},
			startDelay = {
				order = 3,
				type = "range",
				name = L["Start Delay"],
				min = 0.01, max = 1.00, step = 0.01
			},
			pauseDelay = {
				order = 4,
				type = "range",
				name = L["Pause Delay"],
				min = 0.01, max = 0.30, step = 0.01
			},
			postponeDelay = {
				order = 5,
				type = "range",
				name = L["Postpone Delay"],
				min = 0.01, max = 0.30, step = 0.01
			}
		}
	};

	E.Options.args.unitframe.args.player.args.portrait.args.detachFromFrame = {
		order = 9,
		type = "toggle",
		name = ColorizeSettingName(L["Detach From Frame"])
	};
	E.Options.args.unitframe.args.player.args.portrait.args.detachedWidth = {
		order = 10,
		type = "range",
		name = ColorizeSettingName(L["Detached Width"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.player.portrait.detachFromFrame; end
	};
	E.Options.args.unitframe.args.player.args.portrait.args.detachedHeight = {
		order = 11,
		type = "range",
		name = ColorizeSettingName(L["Detached Height"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.player.portrait.detachFromFrame; end
	};

	E.Options.args.unitframe.args.target.args.portrait.args.detachFromFrame = {
		order = 9,
		type = "toggle",
		name = ColorizeSettingName(L["Detach From Frame"])
	};
	E.Options.args.unitframe.args.target.args.portrait.args.detachedWidth = {
		order = 10,
		type = "range",
		name = ColorizeSettingName(L["Detached Width"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.target.portrait.detachFromFrame; end
	};
	E.Options.args.unitframe.args.target.args.portrait.args.detachedHeight = {
		order = 11,
		type = "range",
		name = ColorizeSettingName(L["Detached Height"]),
		min = 10, max = 600, step = 1,
		disabled = function() return not E.db.unitframe.units.target.portrait.detachFromFrame; end
	};
end

-- Watch Frame
function EO:WatchFrame()
	local WF = E:GetModule("WatchFrame")

	E.Options.args.general.args.watchFrame.args.watchFrameVisibility = {
		type = "group",
		name = ColorizeSettingName(L["Visibility State"]),
		guiInline = true,
		get = function(info) return E.private.watchframe[ info[#info] ] end,
		set = function(info, value) E.private.watchframe[ info[#info] ] = value; WF:UpdateSettings() end,
		args = {
			enable = {
				order = 1,
				type = "toggle",
				name = L["Enable"],
				get = function(info) return E.private.watchframe[ info[#info] ] end,
				set = function(info, value) E.private.watchframe[ info[#info] ] = value; E:GetModule('WatchFrame'):UpdateSettings(); end
			},
			city = {
				order = 2,
				type = "select",
				name = L["City (Resting)"],
				disabled = function() return not E.private.watchframe.enable end,
				get = function(info) return E.db.watchframe[ info[#info] ] end,
				set = function(info, value) E.db.watchframe[ info[#info] ] = value end,
				values = {
					["NONE"] = L["None"],
					["COLLAPSED"] = L["Collapsed"],
					["HIDDEN"] = L["Hidden"]
				}
			},
			pvp = {
				order = 3,
				type = "select",
				name = L["PvP"],
				disabled = function() return not E.private.watchframe.enable end,
				get = function(info) return E.db.watchframe[ info[#info] ] end,
				set = function(info, value) E.db.watchframe[ info[#info] ] = value end,
				values = {
					["NONE"] = L["None"],
					["COLLAPSED"] = L["Collapsed"],
					["HIDDEN"] = L["Hidden"]
				}
			},
			arena = {
				order = 4,
				type = "select",
				name = L["Arena"],
				disabled = function() return not E.private.watchframe.enable end,
				get = function(info) return E.db.watchframe[ info[#info] ] end,
				set = function(info, value) E.db.watchframe[ info[#info] ] = value end,
				values = {
					["NONE"] = L["None"],
					["COLLAPSED"] = L["Collapsed"],
					["HIDDEN"] = L["Hidden"]
				}
			},
			party = {
				order = 5,
				type = "select",
				name = L["Party"],
				disabled = function() return not E.private.watchframe.enable end,
				get = function(info) return E.db.watchframe[ info[#info] ] end,
				set = function(info, value) E.db.watchframe[ info[#info] ] = value end,
				values = {
					["NONE"] = L["None"],
					["COLLAPSED"] = L["Collapsed"],
					["HIDDEN"] = L["Hidden"]
				}
			},
			raid = {
				order = 6,
				type = "select",
				name = L["Raid"],
				disabled = function() return not E.private.watchframe.enable end,
				get = function(info) return E.db.watchframe[ info[#info] ] end,
				set = function(info, value) E.db.watchframe[ info[#info] ] = value end,
				values = {
					["NONE"] = L["None"],
					["COLLAPSED"] = L["Collapsed"],
					["HIDDEN"] = L["Hidden"]
				}
			}
		}
	}
end

function EO:GetOptions()
	EO:GeneralOptions()
	EO:MapOptions()
	EO:MiscOptions()
	EO:SkinsOptions()
	EO:NameplateOptions()
	EO:UnitFramesOptions()
	EO:WatchFrame()
end

function EO:Initialize()
	EP:RegisterPlugin(addonName, EO.GetOptions);
end

E:RegisterModule(EO:GetName());