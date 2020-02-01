local E, L, V, P, G = unpack(ElvUI)
local EE = E:NewModule("ElvUI_Enhanced")
local EP = E.Libs.EP

local addonName = ...

local format = format

function EE:ColorizeSettingName(name)
	return format("|cffff8000%s|r", name)
end

function EE:DBConversions()
	if E.db.enhanced.general.trainAllButton ~= nil then
		E.db.enhanced.general.trainAllSkills = E.db.enhanced.general.trainAllButton
		E.db.enhanced.general.trainAllButton = nil
	end

	if E.private.skins.animations ~= nil then
		E.private.enhanced.animatedAchievementBars = E.private.skins.animations
		E.private.skins.animations = nil
	end

	if E.private.enhanced.blizzard and E.private.enhanced.blizzard.deathRecap ~= nil then
		E.private.enhanced.deathRecap = E.private.enhanced.blizzard.deathRecap
		E.private.enhanced.blizzard.deathRecap = nil
	end

	if P.unitframe.units.player.portrait.detachFromFrame ~= nil then
		E.db.enhanced.unitframe.detachPortrait.player.enable = P.unitframe.units.player.portrait.detachFromFrame
		E.db.enhanced.unitframe.detachPortrait.player.width = P.unitframe.units.player.portrait.detachedWidth
		E.db.enhanced.unitframe.detachPortrait.player.height = P.unitframe.units.player.portrait.detachedHeight
		E.db.enhanced.unitframe.detachPortrait.target.enable = P.unitframe.units.target.portrait.detachFromFrame
		E.db.enhanced.unitframe.detachPortrait.target.width = P.unitframe.units.target.portrait.detachedWidth
		E.db.enhanced.unitframe.detachPortrait.target.height = P.unitframe.units.target.portrait.detachedHeight

		P.unitframe.units.player.portrait.detachFromFrame = nil
		P.unitframe.units.player.portrait.detachedWidth = nil
		P.unitframe.units.player.portrait.detachedHeight = nil
		P.unitframe.units.target.portrait.detachFromFrame = nil
		P.unitframe.units.target.portrait.detachedWidth = nil
		P.unitframe.units.target.portrait.detachedHeight = nil
	end

	if E.db.enhanced.nameplates.cacheUnitClass ~= nil then
		E.db.enhanced.nameplates.classCache = true
	end

	if EnhancedDB and EnhancedDB.UnitClass and next(EnhancedDB.UnitClass) then
		EnhancedDB.UnitClass[UNKNOWN] = nil
	end
end

function EE:Initialize()
	EnhancedDB = EnhancedDB or {}

	EE.version = GetAddOnMetadata("ElvUI_Enhanced", "Version")

	EE:DBConversions()

	EP:RegisterPlugin(addonName, EE.GetOptions)

	if E.db.general.loginmessage then
		E:Print(format(L["ENH_LOGIN_MSG"], E.media.hexvaluecolor, EE.version))
	end
end

local function InitializeCallback()
	EE:Initialize()
end

E:RegisterModule(EE:GetName(), InitializeCallback)