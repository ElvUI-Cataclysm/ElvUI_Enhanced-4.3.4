local E, L, V, P, G = unpack(ElvUI)

P.enhanced = {
	general = {
		pvpAutoRelease = false,
		autoRepChange = false,
		merchant = false,
		merchantItemLevel = false,
		moverTransparancy = 1,
		showQuestLevel = false,
		questItemLevel = false,
		selectQuestReward = false,
		declineduel = false,
		declineParty = false,
		hideZoneText = false,
		trainAllSkills = false,
		undressButton = false,
		alreadyKnown = false
	},
	actionbars = {
		pet = {
			checkedBorder = false,
			checkedBorderColor = {r = 1, g = 0.56, b = 0},
			autoCastBorder = false,
			autoCastBorderColor = {r = 1, g = 0, b = 0}
		}
	},
	blizzard = {
		errorFrame = {
			enable = false,
			width = 300,
			height = 60,
			font = "PT Sans Narrow",
			fontSize = 12,
			fontOutline = "NONE"
		}
	},
	chat = {
		dpsLinks = false
	},
	equipment = {
		enable = false,
		durability = {
			enable = true,
			onlydamaged = true,
			position = "TOPRIGHT",
			xOffset = 0,
			yOffset = -2,
			font = "Homespun",
			fontSize = 10,
			fontOutline = "MONOCHROMEOUTLINE"
		},
		itemlevel = {
			enable = true,
			qualityColor = true,
			position = "BOTTOMRIGHT",
			xOffset = -2,
			yOffset = 2,
			font = "Homespun",
			fontSize = 10,
			fontOutline = "MONOCHROMEOUTLINE"
		}
	},
	minimap = {
		location = false,
		showlocationdigits = true,
		locationdigits = 1,
		hideincombat = false,
		fadeindelay = 5
	},
	nameplates = {
		classCache = false,
		chatBubbles = false,
		titleCache = false,
		smoothBars = {
			enable = false,
			smoothingAmount = 0.3
		},
		guild = {
			font = "PT Sans Narrow",
			fontSize = 11,
			fontOutline = "OUTLINE",
			color = {r = 1, g = 1, b = 1},
			separator = " "
		},
		npc = {
			font = "PT Sans Narrow",
			fontSize = 11,
			fontOutline = "OUTLINE",
			color = {r = 1, g = 1, b = 1},
			separator = " "
		}
	},
	tooltip = {
		itemQualityBorderColor = false,
		tooltipIcon = {
			enable = false,
			tooltipIconSpells = true,
			tooltipIconItems = true,
			tooltipIconAchievements = true
		},
		progressInfo = {
			enable = false,
			checkPlayer = false,
			modifier = "SHIFT",
			tiers = {
				["DS"] = true,
				["FL"] = true,
				["BH"] = true,
				["TOTFW"] = true,
				["BT"] = true,
				["BWD"] = true
			}
		}
	},
	loseControl = {
		iconSize = 60,
		compactMode = false,
		CC = true,
		PvE = true,
		Silence = true,
		Disarm = true,
		Root = false,
		Snare = false
	},
	unitframe = {
		detachPortrait = {
			player = {
				enable = false,
				width = 54,
				height = 54
			},
			target = {
				enable = false,
				width = 54,
				height = 54
			}
		},
		units = {
			target = {
				classicon = {
					enable = false,
					size = 28,
					xOffset = -58,
					yOffset = -22
				}
			}
		}
	},
	watchframe = {
		enable = false,
		city = "COLLAPSED",
		pvp = "HIDDEN",
		arena = "HIDDEN",
		party = "COLLAPSED",
		raid = "COLLAPSED"
	},
	raidmarkerbar = {
		enable = false,
		backdrop = true,
		transparentButtons = false,
		transparentBackdrop = false,
		buttonSize = 22,
		spacing = 1,
		orientation = "HORIZONTAL",
		reverse = false,
		modifier = "shift-",
		visibility = "DEFAULT",
		customVisibility = "[noexists, nogroup] hide;show"
	}
}