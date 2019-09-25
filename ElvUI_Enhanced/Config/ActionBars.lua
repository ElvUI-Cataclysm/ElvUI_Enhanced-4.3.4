local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")
local AB = E:GetModule("ActionBars")

function EE:ActionbarOptions()
	local config = {
		type = "group",
		name = L["ActionBars"],
		childGroups = "tab",
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["ActionBars"]
			},
			pet = {
				order = 2,
				type = "group",
				name = L["Pet Bar"],
				args = {
					header = {
						order = 1,
						type = "header",
						name = L["Pet Bar"],
					},
					checked = {
						order = 2,
						type = "group",
						name = L["Checked Border"],
						guiInline = true,
						args = {
							checkedBorder = {
								order = 1,
								type = "toggle",
								name = L["ENABLE"],
								desc = L["Replaces the checked textures with colored borders."],
								get = function(info) return E.db.enhanced.actionbars.pet[info[#info]] end,
								set = function(info, value) E.db.enhanced.actionbars.pet[info[#info]] = value AB:UpdatePet() end
							},
							checkedBorderColor = {
								order = 2,
								type = "color",
								name = L["Border Color"],
								get = function(info)
									local t = E.db.enhanced.actionbars.pet[info[#info]]
									local d = P.enhanced.actionbars.pet[info[#info]]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.actionbars.pet[info[#info]]
									t.r, t.g, t.b = r, g, b
									AB:UpdatePet()
								end,
								disabled = function() return not E.db.enhanced.actionbars.pet.checkedBorder end
							}
						},
						disabled = function() return not E.private.actionbar.enable or not E.db.actionbar.barPet.enabled end
					},
					autoCast = {
						order = 3,
						type = "group",
						name = L["AutoCast Border"],
						guiInline = true,
						args = {
							autoCastBorder = {
								order = 1,
								type = "toggle",
								name = L["ENABLE"],
								desc = L["Replaces the auto cast textures with colored borders."],
								get = function(info) return E.db.enhanced.actionbars.pet[info[#info]] end,
								set = function(info, value)
									E.db.enhanced.actionbars.pet[info[#info]] = value
									AB:UpdatePet()
								end
							},
							autoCastBorderColor = {
								order = 2,
								type = "color",
								name = L["Border Color"],
								get = function(info)
									local t = E.db.enhanced.actionbars.pet[info[#info]]
									local d = P.enhanced.actionbars.pet[info[#info]]
									return t.r, t.g, t.b, t.a, d.r, d.g, d.b
								end,
								set = function(info, r, g, b)
									local t = E.db.enhanced.actionbars.pet[info[#info]]
									t.r, t.g, t.b = r, g, b
									AB:UpdatePet()
								end,
								disabled = function() return not E.db.enhanced.actionbars.pet.autoCastBorder end
							}
						},
						disabled = function() return not E.private.actionbar.enable or not E.db.actionbar.barPet.enabled end
					}
				}
			}
		}
	}

	return config
end