local E, L, V, P, G = unpack(ElvUI);

-- General
V.general.pvpautorelease = false;
V.general.autorepchange = false;
V.general.showQuestLevel = true;

-- Minimap
V.general.minimap.hideincombat = false;
V.general.minimap.fadeindelay = 5;
V.general.minimap.locationdigits = 1;

-- Equipment
V.equipment = {
	durability = {
		enable = false,
		onlydamaged = false
	},
	itemlevel = {
		enable = false
	}
};

-- Loss Control
V.loseofcontrol = {
	enable = false
};

-- Skins
V.skins.animations = true;

-- WatchFrame
V.watchframe = {
	enable = true
};