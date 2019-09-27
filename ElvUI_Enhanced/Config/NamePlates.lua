local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")
local NP = E:GetModule("NamePlates")
local ENP = E:GetModule("Enhanced_NamePlates")

function EE:NamePlatesOptions()
	local config = {
		type = "group",
		name = L["NamePlates"],
		get = function(info) return E.db.enhanced.nameplates[info[#info]] end,
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["NamePlates"]
			},
			classCache = {
				order = 2,
				type = "toggle",
				name = L["Cache Unit Class"],
				set = function(info, value)
					E.db.enhanced.nameplates[info[#info]] = value
					ENP:UpdateAllSettings()
				end
			},
			chatBubbles = {
				order = 3,
				type = "toggle",
				name = L["Chat Bubbles"],
				set = function(info, value)
					E.db.enhanced.nameplates[info[#info]] = value
					ENP:UpdateAllSettings()
					NP:ConfigureAll()
				end
			},
			smoothBars = {
				order = 4,
				type = "group",
				name = L["Smooth Bars"],
				get = function(info) return E.db.enhanced.nameplates.smoothBars[info[#info]] end,
				guiInline = true,
				args = {
					enable = {
						order = 1,
						type = "toggle",
						name = L["ENABLE"],
						desc = L["Bars will transition smoothly."],
						set = function(info, value)
							E.db.enhanced.nameplates.smoothBars[info[#info]] = value
							NP:ConfigureAll()
						end
					},
					smoothingAmount = {
						order = 2,
						type = "range",
						name = L["Smoothing Amount"],
						desc = L["Controls the speed at which smoothed bars will be updated."],
						min = 0.1, max = 3, step = 0.10,
						disabled = function() return not E.db.enhanced.nameplates.smoothBars.enable end,
						set = function(info, value)
							E.db.enhanced.nameplates.smoothBars[info[#info]] = value
							NP:ConfigureAll()
						end
					}
				}
			},
			titleCacheGroup = {
				order = 5,
				type = "group",
				name = L["Cache Unit Guilds / NPC Titles"],
				guiInline = true,
				get = function(info) return E.db.enhanced.nameplates[info[#info]] end,
				args = {
					titleCache = {
						order = 1,
						type = "toggle",
						name = L["ENABLE"],
						set = function(info, value)
							E.db.enhanced.nameplates[info[#info]] = value
							ENP:UpdateAllSettings()
							NP:ConfigureAll()
						end
					},
					guildGroup = {
						order = 3,
						type = "group",
						name = L["GUILD"],
						guiInline = true,
						get = function(info) return E.db.enhanced.nameplates.guild[info[#info]] end,
						set = function(info, value)
							E.db.enhanced.nameplates.guild[info[#info]] = value
							NP:ConfigureAll()
						end,
						disabled = function() return not E.db.enhanced.nameplates.titleCache end,
						args = {
							font = {
								order = 1,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = AceGUIWidgetLSMlists.font,
							},
							fontSize = {
								order = 2,
								type = "range",
								name = L["FONT_SIZE"],
								min = 4, max = 33, step = 1,
							},
							fontOutline = {
								order = 3,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["NONE"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								}
							},
							color = {
								order = 4,
								type = "color",
								name = L["COLOR"],
								get = function(info)
									local t = E.db.enhanced.nameplates.guild[info[#info]]
									local d = P.enhanced.nameplates.guild[info[#info]]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.nameplates.guild[info[#info]]
									t.r, t.g, t.b = r, g, b
									NP:ConfigureAll()
								end,
							},
							separator = {
								order = 5,
								type = "select",
								name = L["Separator"],
								values = {
									[" "] = L["NONE"],
									["<"] = "< >",
									["("] = "( )",
									["["] = "[ ]",
									["{"] = "{ }"
								}
							}
						}
					},
					npcGroup = {
						order = 3,
						type = "group",
						name = L["NPC"],
						guiInline = true,
						get = function(info) return E.db.enhanced.nameplates.npc[info[#info]] end,
						set = function(info, value)
							E.db.enhanced.nameplates.npc[info[#info]] = value
							NP:ConfigureAll()
						end,
						disabled = function() return not E.db.enhanced.nameplates.titleCache end,
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
								name = L["FONT_SIZE"],
								min = 4, max = 33, step = 1
							},
							fontOutline = {
								order = 3,
								type = "select",
								name = L["Font Outline"],
								values = {
									["NONE"] = L["NONE"],
									["OUTLINE"] = "OUTLINE",
									["MONOCHROMEOUTLINE"] = "MONOCROMEOUTLINE",
									["THICKOUTLINE"] = "THICKOUTLINE"
								}
							},
							color = {
								order = 4,
								type = "color",
								name = L["COLOR"],
								get = function(info)
									local t = E.db.enhanced.nameplates.npc[info[#info]]
									local d = P.enhanced.nameplates.npc[info[#info]]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.nameplates.npc[info[#info]]
									t.r, t.g, t.b = r, g, b
									NP:ConfigureAll()
								end
							},
							separator = {
								order = 5,
								type = "select",
								name = L["Separator"],
								values = {
									[" "] = L["NONE"],
									["<"] = "< >",
									["("] = "( )"
								}
							}
						}
					}
				}
			}
		}
	}

	return config
end