local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")
local RM = E:GetModule("RaidMarkerBar")
local PD = E:GetModule("Enhanced_PaperDoll")
local LOC = E:GetModule("Enhanced_LoseControl")

function EE:MiscOptions()
	local config = {
		type = "group",
		name = L["MISCELLANEOUS"],
		get = function(info) return E.db.enhanced.raidmarkerbar[info[#info]] end,	
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["MISCELLANEOUS"]
			},
			equipment = {
				order = 2,
				type = "group",
				name = L["Equipment"],
				childGroups = "tab",
				get = function(info) return E.db.enhanced.equipment[info[#info]] end,
				set = function(info, value) E.db.enhanced.equipment[info[#info]] = value end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Equipment"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["ENABLE"],
						set = function(info, value)
							E.db.enhanced.equipment[info[#info]] = value
							PD:ToggleState()
						end
					},
					durability = {
						order = 2,
						type = "group",
						name = L["DURABILITY"],
						get = function(info) return E.db.enhanced.equipment.durability[info[#info]] end,
						set = function(info, value)
							E.db.enhanced.equipment.durability[info[#info]] = value
							PD:UpdatePaperDoll("player")
							PD:UpdateInfoText("Character")
							PD:UpdateInfoText("Inspect")
						end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["DURABILITY"]
							},
							info = {
								order = 2,
								type = "description",
								name = L["DURABILITY_DESC"]
							},
							enable = {
								order = 3,
								type = "toggle",
								name = L["ENABLE"],
								desc = L["Enable/Disable the display of durability information on the character screen."],
								disabled = function() return not E.db.enhanced.equipment.enable end
							},
							onlydamaged = {
								order = 4,
								type = "toggle",
								name = L["Damaged Only"],
								desc = L["Only show durabitlity information for items that are damaged."],
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							},
							spacer = {
								order = 5,
								type = "description",
								name = " "
							},
							position = {
								order = 6,
								type = "select",
								name = L["Position"],
								values = {
									["TOP"] = L["Top"],
									["BOTTOM"] = L["Bottom"],
									["TOPLEFT"] = L["Top Left"],
									["TOPRIGHT"] = L["Top Right"],
									["BOTTOMLEFT"] = L["Bottom Left"],
									["BOTTOMRIGHT"] = L["Bottom Right"]
								},
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							},
							xOffset = {
								order = 7,
								type = "range",
								name = L["xOffset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							},
							yOffset = {
								order = 8,
								type = "range",
								name = L["yOffset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							},
							font = {
								order = 9,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font,
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							},
							fontSize = {
								order = 10,
								type = "range",
								name = L["FONT_SIZE"],
								min = 6, max = 36, step = 1,
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							},
							fontOutline = {
								order = 11,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["NONE"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								},
								disabled = function() return not E.db.enhanced.equipment.durability.enable or not E.db.enhanced.equipment.enable end
							}
						}
					},
					itemlevel = {
						order = 3,
						type = "group",
						name = L["Item Level"],
						get = function(info) return E.db.enhanced.equipment.itemlevel[info[#info]] end,
						set = function(info, value)
							E.db.enhanced.equipment.itemlevel[info[#info]] = value
							PD:UpdatePaperDoll("player")
							PD:UpdateInfoText("Character")
							PD:UpdateInfoText("Inspect")
						end,
						args = {
							header = {
								order = 1,
								type = "header",
								name = L["Item Level"]
							},
							info = {
								order = 2,
								type = "description",
								name = L["ITEMLEVEL_DESC"]
							},
							enable = {
								order = 3,
								type = "toggle",
								name = L["ENABLE"],
								desc = L["Enable/Disable the display of item levels on the character screen."],
								disabled = function() return not E.db.enhanced.equipment.enable end
							},
							qualityColor = {
								order = 4,
								type = "toggle",
								name = L["Quality Color"],
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							},
							spacer = {
								order = 5,
								type = "description",
								name = " "
							},
							position = {
								order = 6,
								type = "select",
								name = L["Position"],
								values = {
									["TOP"] = L["Top"],
									["BOTTOM"] = L["Bottom"],
									["TOPLEFT"] = L["Top Left"],
									["TOPRIGHT"] = L["Top Right"],
									["BOTTOMLEFT"] = L["Bottom Left"],
									["BOTTOMRIGHT"] = L["Bottom Right"]
								},
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							},
							xOffset = {
								order = 7,
								type = "range",
								name = L["xOffset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							},
							yOffset = {
								order = 8,
								type = "range",
								name = L["yOffset"],
								min = -50, max = 50, step = 1,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							},
							font = {
								order = 9,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							},
							fontSize = {
								order = 10,
								type = "range",
								name = L["FONT_SIZE"],
								min = 6, max = 36, step = 1,
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							},
							fontOutline = {
								order = 11,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["NONE"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								},
								disabled = function() return not E.db.enhanced.equipment.itemlevel.enable or not E.db.enhanced.equipment.enable end
							}
						}
					}
				}
			},
			loseControl = {
				order = 4,
				type = "group",
				name = L["Lose Control"],
				get = function(info) return E.db.enhanced.loseControl[info[#info]] end,
				set = function(info, value)
					E.db.enhanced.loseControl[info[#info]] = value
					LOC:UpdateSettings()
				end,
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Lose Control"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["ENABLE"],
						get = function(info) return E.private.enhanced.loseControl.enable end,
						set = function(info, value)
							E.private.enhanced.loseControl.enable = value
							LOC:ToggleState()
						end
					},
					compactMode = {
						order = 3,
						type = "toggle",
						name = L["Compact mode"],
						disabled = function() return not E.private.enhanced.loseControl.enable end
					},
					iconSize = {
						order = 4,
						type = "range",
						min = 30, max = 120, step = 1,
						name = L["Icon Size"],
						disabled = function() return not E.private.enhanced.loseControl.enable end
					},
					typeGroup = {
						order = 5,
						type = "group",
						name = TYPE,
						guiInline = true,
						get = function(info) return E.db.enhanced.loseControl[info[#info]] end,
						set = function(info, value) E.db.enhanced.loseControl[info[#info]] = value end,
						disabled = function() return not E.private.enhanced.loseControl.enable end,
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
			},
			raidMarkerBar = {
				order = 5,
				type = "group",
				name = L["Raid Markers"],
				get = function(info) return E.db.enhanced.raidmarkerbar[info[#info]] end,	
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Raid Markers"]
					},
					enable = {
						order = 2,
						type = "toggle",
						name = L["ENABLE"],
						desc = L["Display a quick action bar for raid targets and world markers."],
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.enable = value
							RM:Visibility()
						end
					},
					reverse = {
						order = 3,
						type = "toggle",
						name = L["Reverse"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.reverse = value
							RM:UpdateBar()
						end
					},
					backdrop = {
						order = 4,
						type = "toggle",
						name = L["Backdrop"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.backdrop = value
							RM:Backdrop()
						end
					},
					transparentButtons = {
						order = 5,
						type = "toggle",
						name = L["Transparent Buttons"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.transparentButtons = value
							RM:ButtonBackdrop()
						end
					},
					transparentBackdrop = {
						order = 6,
						type = "toggle",
						name = L["Transparent Backdrop"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.transparentBackdrop = value
							RM:Backdrop()
						end
					},
					spacer = {
						order = 7,
						type = "description",
						name = " "
					},
					buttonSize = {
						order = 8,
						type = "range",
						name = L["Button Size"],
						min = 16, max = 60, step = 1,
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.buttonSize = value
							RM:UpdateBar()
						end
					},
					spacing = {
						order = 9,
						type = "range",
						name = L["Button Spacing"],
						min = 0, max = 20, step = 1,
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.spacing = value
							RM:UpdateBar()
						end
					},
					spacer2 = {
						order = 10,
						type = "description",
						name = " "
					},
					orientation = {
						order = 11,
						type = "select",
						name = L["Orientation"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						values = {
							["HORIZONTAL"] = L["Horizontal"],
							["VERTICAL"] = L["Vertical"]
						},
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.orientation = value
							RM:UpdateBar()
						end
					},
					modifier = {
						order = 12,
						type = "select",
						name = L["Modifier Key"],
						desc = L["Set the modifier key for placing world markers."],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.modifier = value
							RM:UpdateWorldMarkersAndTooltips()
						end,
						values = {
							["shift-"] = L["SHIFT_KEY"],
							["ctrl-"] = L["CTRL_KEY"],
							["alt-"] = L["ALT_KEY"]
						}
					},
					visibility = {
						order = 13,
						type = "select",
						name = L["Visibility"],
						disabled = function() return not E.db.enhanced.raidmarkerbar.enable end,
						values = {
							["DEFAULT"] = L["DEFAULT"],
							["INPARTY"] = L["GROUP"],
							["ALWAYS"] = L["ALWAYS"],
							["CUSTOM"] = L["CUSTOM"]
						},
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.visibility = value
							RM:Visibility()
						end
					},
					customVisibility = {
						order = 14,
						type = "input",
						width = "full",
						name = L["Visibility State"],
						disabled = function() return E.db.enhanced.raidmarkerbar.visibility ~= "CUSTOM" or not E.db.enhanced.raidmarkerbar.enable end,
						set = function(info, value)
							E.db.enhanced.raidmarkerbar.customVisibility = value
							RM:Visibility()
						end
					}
				}
			}
		}
	}

	return config
end