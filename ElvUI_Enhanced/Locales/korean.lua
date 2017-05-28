local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "koKR")
if not L then return end

-- DESC locales
L["ENH_LOGIN_MSG"] = "You are using |cff1784d1ElvUI Enhanced|r |cffff8000(Cataclysm)|r version %s%s|r."
L["EQUIPMENT_DESC"] = "Adjust the settings for switching your gear set when you change specialization or enter a battleground."
L["DURABILITY_DESC"] = "Adjust the settings for the durability information on the character screen."
L["ITEMLEVEL_DESC"] = "Adjust the settings for the item level information on the character screen."
L["WATCHFRAME_DESC"] = "Adjust the settings for the visibility of the watchframe (questlog) to your personal preference."

-- Actionbars
L["Sets actionbars' backgrounds to transparent template."] = true;
L["Sets actionbars buttons' backgrounds to transparent template."] = true;
L["Transparent ActionBars"] = true;
L["Transparent Backdrop"] = true;
L["Transparent Buttons"] = true;

-- Animated Loss
L["Animated Loss"] = true;
L["Pause Delay"] = true;
L["Start Delay"] = true;
L["Postpone Delay"] = true;

-- Chat
L["Replaces long reports from damage meters with a clickeble hyperlink to reduce chat spam."] = true;

-- Datatext
L["Datatext Disabled"] = true;
L["Distance"] = true;
L["Enhanced Time Color"] = true;
L["Equipped"] = true;
L["In Combat"] = true;
L["New Mail"] = true;
L["No Mail"] = true;
L["Not Learned!"] = true;
L["Out of Combat"] = true;
L["Ready!"] = true;
L["Total"] = "합계"
L["You are not playing a |cff0070DEShaman|r, datatext disabled."] = true;

-- Death Recap
L["%s %s"] = true;
L["%s by %s"] = true;
L["%s sec before death at %s%% health."] = true;
L["(%d Absorbed)"] = true;
L["(%d Blocked)"] = true;
L["(%d Overkill)"] = true;
L["(%d Resisted)"] = true;
L["Death Recap unavailable."] = true;
L["Death Recap"] = true;
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Decline Duels
L["Auto decline all duels"] = true;
L["Decline Duel"] = true;
L["Declined duel request from "] = true;

-- Equipment
L["Choose the equipment set to use for your primary specialization."] = true;
L["Choose the equipment set to use for your secondary specialization."] = true;
L["Choose the equipment set to use when you enter a battleground or arena."] = true;
L["Damaged Only"] = true;
L["Enable/Disable the battleground switch."] = true;
L["Enable/Disable the display of durability information on the character screen."] = true;
L["Enable/Disable the display of item levels on the character screen."] = true;
L["Enable/Disable the specialization switch."] = true;
L["Equipment Set Overlay"] = true;
L["Equipment Set"] = true;
L["Equipment"] = true;
L["No Change"] = true;
L["Only show durabitlity information for items that are damaged."] = true;
L["Show the associated equipment sets for the items in your bags (or bank)."] = true;
L["Specialization"] = true
L["You have equipped equipment set: "] = true;

-- General
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = true;
L["Automatically release body when killed inside a battleground."] = true;
L["Automatically select the quest reward with the highest vendor sell value."] = true;
L["Changes the transparency of all the movers."] = true;
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Display quest levels at Quest Log."] = true;
L["Hide Zone Text"] = true;
L["Mover Transparency"] = true;
L["PvP Autorelease"] = true;
L["Select Quest Reward"] = true;
L["Show Quest Level"] = true;
L["Track Reputation"] = true;

-- Nameplates
L["Bars will transition smoothly."] = true;
L["Cache Unit Class"] = true;
L["Smooth Bars"] = true;

-- Minimap
L["Above Minimap"] = true;
L["FadeIn Delay"] = true;
L["Hide minimap while in combat."] = true;
L["Location Digits"] = true;
L["Location Panel"] = true;
L["Number of digits for map location."] = true;
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = true;
L["Toggle Location Panel."] = true;

-- Tooltip
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Enable Achievements"] = true;
L["Enable Items"] = true;
L["Enable Spell"] = true;
L["Progression Info"] = true;
L["Show/Hides an Icon for Achievements on the Tooltip."] = true;
L["Show/Hides an Icon for Items on the Tooltip."] = true;
L["Show/Hides an Icon for Spells on the Tooltip."] = true;
L["Show/Hides an Icon for Spells and Items on the Tooltip."] = true;
L["Tooltip Icon"] = true;

-- Misc
L["Skin Animations"] = true;
L["Undress"] = true;

-- Movers
L["Loss Control Icon"] = "제어손실 표시"
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Loss Control
L["CC"] = "군중제어"
L["Disarm"] = "무장 해제"
L["Lose Control"] = true;
L["PvE"] = "PvE"
L["Root"] = "뿌리묶기"
L["Silence"] = "침묵"
L["Snare"] = "덫"

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = true;
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = true;
L["Show class icon for units."] = true;

-- WatchFrame
L["Hidden"] = true;
L["Collapsed"] = true;
L["City (Resting)"] = true;
L["PvP"] = true;
L["Arena"] = true;
L["Party"] = true;
L["Raid"] = true;