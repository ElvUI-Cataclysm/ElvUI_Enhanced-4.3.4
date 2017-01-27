local E, L, V, P, G = unpack(ElvUI);

-- General
P.general.minimap.locationText = "ABOVE";
P.general.moverTransparancy = .8;
P.general.declineduel = false;
P.general.alreadyknown = true;

-- Loss Control
P.loseofcontrol = { 
	CC = true,
	PvE = true,
	Silence = true,
	Disarm = true,
	Root = false,
	Snare = true
};

-- Nameplates
P.nameplate.showthreat = false;

-- Unitframes
P["unitframe"]["hideroleincombat"] = false
P["unitframe"]["units"]["target"]["classicon"] = {
	["enable"] = false,
	["size"] = 28,
	["xOffset"] = -58,
	["yOffset"] = -22
}

P.unitframe.units.player.portrait.detachFromFrame = false;
P.unitframe.units.player.portrait.detachedWidth = 54;
P.unitframe.units.player.portrait.detachedHeight = 54;

P.unitframe.units.target.portrait.detachFromFrame = false;
P.unitframe.units.target.portrait.detachedWidth = 54;
P.unitframe.units.target.portrait.detachedHeight = 54;

P.unitframe.units.player.animatedLoss = {
	enable = false,
	duration = .75,
	startDelay = .2,
	pauseDelay = .05,
	postponeDelay = .05,
	postponeDelay = .05
};

-- Watch Frame
P.watchframe = {
	["city"] = "COLLAPSED",
	["pvp"] = "HIDDEN",
	["arena"] = "HIDDEN",
	["party"] = "COLLAPSED",
	["raid"] = "COLLAPSED"
};