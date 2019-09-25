local E, _, V, P, G = unpack(ElvUI)
local L = E.Libs.ACL:GetLocale("ElvUI", E.global.general.locale)
local EE = E:GetModule("ElvUI_Enhanced")
local M = E:GetModule("Enhanced_Misc")
local ETA = E:GetModule("Enhanced_TrainAll")
local EUB = E:GetModule("Enhanced_UndressButtons")
local EAL = E:GetModule("Enhanced_AlreadyKnown")

function EE:GeneralOptions()
	local config = {
		type = "group",
		name = L["General"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["General"]
			},
			pvpAutoRelease = {
				order = 2,
				type = "toggle",
				name = L["PvP Autorelease"],
				desc = L["Automatically release body when killed inside a battleground."],
				get = function(info) return E.db.enhanced.general.pvpAutoRelease end,
				set = function(info, value)
					E.db.enhanced.general.pvpAutoRelease = value
					M:AutoRelease()
				end
			},
			autoRepChange = {
				order = 3,
				type = "toggle",
				name = L["Track Reputation"],
				desc = L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."],
				get = function(info) return E.db.enhanced.general.autoRepChange end,
				set = function(info, value)
					E.db.enhanced.general.autoRepChange = value
					M:WatchedFaction()
				end
			},
			showQuestLevel = {
				order = 4,
				type = "toggle",
				name = L["Show Quest Level"],
				desc = L["Display quest levels at Quest Log."],
				get = function(info) return E.db.enhanced.general.showQuestLevel end,
				set = function(info, value)
					E.db.enhanced.general.showQuestLevel = value
					M:QuestLevelToggle()
				end
			},
			selectQuestReward = {
				order = 5,
				type = "toggle",
				name = L["Select Quest Reward"],
				desc = L["Automatically select the quest reward with the highest vendor sell value."],
				get = function(info) return E.db.enhanced.general.selectQuestReward end,
				set = function(info, value) E.db.enhanced.general.selectQuestReward = value end
			},
			declineduel = {
				order = 6,
				type = "toggle",
				name = L["Decline Duel"],
				desc = L["Auto decline all duels"],
				get = function(info) return E.db.enhanced.general.declineduel end,
				set = function(info, value)
					E.db.enhanced.general.declineduel = value
					M:DeclineDuel()
				end
			},
			declineParty = {
				order = 7,
				type = "toggle",
				name = L["Decline Party"],
				desc = L["Auto decline party invites"],
				get = function(info) return E.db.enhanced.general.declineParty end,
				set = function(info, value)
					E.db.enhanced.general.declineParty = value
					M:DeclineParty()
				end
			},
			hideZoneText = {
				order = 8,
				type = "toggle",
				name = L["Hide Zone Text"],
				get = function(info) return E.db.enhanced.general.hideZoneText end,
				set = function(info, value)
					E.db.enhanced.general.hideZoneText = value
					M:HideZone()
				end
			},
			trainAllButton = {
 				order = 9,
 				type = "toggle",
				name = L["Train All Button"],
				desc = L["Add button to Trainer frame with ability to train all available skills in one click."],
				get = function(info) return E.db.enhanced.general.trainAllButton end,
				set = function(info, value)
					E.db.enhanced.general.trainAllButton = value
					ETA:ToggleState()
				end
			},
			undressButton = {
				order = 10,
				type = "toggle",
				name = L["Undress Button"],
				desc = L["Add button to Dressing Room frame with ability to undress model."],
				get = function(info) return E.db.enhanced.general.undressButton end,
				set = function(info, value)
					E.db.enhanced.general.undressButton = value
					EUB:ToggleState()
				end
			},
			alreadyKnown = {
				order = 11,
				type = "toggle",
				name = L["Already Known"],
				desc = L["Colorizes recipes, mounts & pets that are already known"],
				get = function(info) return E.db.enhanced.general.alreadyKnown end,
				set = function(info, value)
					E.db.enhanced.general.alreadyKnown = value
					EAL:ToggleState()
				end
			},
			altBuyMaxStack = {
				order = 12,
				type = "toggle",
				name = L["Alt-Click Merchant"],
				desc = L["Holding Alt key while buying something from vendor will now buy an entire stack."],
				get = function(info) return E.db.enhanced.general.altBuyMaxStack end,
				set = function(info, value)
					E.db.enhanced.general.altBuyMaxStack = value
					M:BuyStackToggle()
				end
			},
			merchantItemLevel = {
				order = 13,
				type = "toggle",
				name = L["Merchant ItemLevel"],
				desc = L["Display the item level on the MerchantFrame, to change the font you have to set it in ElvUI - Bags - ItemLevel"],
				get = function(info) return E.db.enhanced.general.merchantItemLevel end,
				set = function(info, value)
					E.db.enhanced.general.merchantItemLevel = value
					M:MerchantItemLevel()
				end
			},
			questItemLevel = {
				order = 14,
				type = "toggle",
				name = L["Quest ItemLevel"],
				desc = L["Display the item level on the Quest frames, to change the font you have to set it in ElvUI - Bags - ItemLevel"],
				get = function(info) return E.db.enhanced.general.questItemLevel end,
				set = function(info, value)
					E.db.enhanced.general.questItemLevel = value
					M:QuestItemLevel()
					E:StaticPopup_Show("PRIVATE_RL")
				end
			},
			moverTransparancy = {
				order = 15,
				type = "range",
				isPercent = true,
				name = L["Mover Transparency"],
				desc = L["Changes the transparency of all the movers."],
				min = 0, max = 1, step = 0.01,
				get = function(info) return E.db.enhanced.general.moverTransparancy end,
				set = function(info, value)
					E.db.enhanced.general.moverTransparancy = value
					M:UpdateMoverTransparancy()
				end
			}
		}
	}

	return config
end