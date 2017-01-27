local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhCN")
if not L then return; end

-- DESC locales
L["ENH_LOGIN_MSG"] = "您正在使用 |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(Cataclysm)|r version %s%s|r."
L["DURABILITY_DESC"] = "调整设置人物窗口装备耐久度显示."
L["ITEMLEVEL_DESC"] = "Adjust the settings for the item level information on the character screen."

-- Animated Loss
L["Animated Loss"] = true;
L["Pause Delay"] = true;
L["Start Delay"] = true;
L["Postpone Delay"] = true;

-- Datatext
L["Datatext Disabled"] = true;
L["In Combat"] = true;
L["New Mail"] = true;
L["No Mail"] = true;
L["Not Learned"] = true;
L["Out of Combat"] = true;
L["Ready"] = true;
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
L["Death Recap"] = "死亡回放"
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Equipment
L["Damaged Only"] = "受损显示"
L["Equipment"] = "自动换装"
L["Enable/Disable the display of durability information on the character screen."] = "开启/关闭 人物窗口装备耐久度显示."
L["Enable/Disable the display of item levels on the character screen."] = true;
L["Only show durabitlity information for items that are damaged."] = "只在装备受损时显示耐久度."

-- General
L["Already Known"] = true;
L["Auto decline all duels"] = "自动拒绝决斗请求"
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "当你获得某个阵营的声望时, 将自动追踪此阵营的声望至经验栏位." 
L["Automatically release body when killed inside a battleground."] = "在战场死亡后自动释放灵魂."
L["Changes the transparency of all the movers."] = true;
L["Colorizes recipes, mounts & pets that are already known"] = "已学习的图纸及已收集的坐骑和宠物上色"
L["Decline Duel"] = true;
L["Declined duel request from "] = "已拒绝决斗请求自"
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = true;
L["PvP Autorelease"] = "PVP自动释放灵魂"
L["Show Quest Level"] = true;
L["Track Reputation"] = "声望追踪"

-- Loss Control
L["CC"] = "控制类技能"
L["Disarm"] = "缴械类技能"
L["Lose Control"] = true;
L["PvE"] = "PvE"
L["Root"] = "定身类技能"
L["Silence"] = "沉默类技能"
L["Snare"] = "减速类技能"

-- Maps
L["Above Minimap"] = true;
L["FadeIn Delay"] = true;
L["Hide minimap while in combat."] = true;
L["Location Digits"] = true;
L["Number of digits for map location."] = true;
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = true;

-- Misc
L["Animations"] = true;
L["Undress"] = "无装备"

-- Movers
L["Loss Control Icon"] = "失去控制图标"
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Nameplates
L["Display threat level as text on targeted, boss or mouseover nameplate."] = "在首领或鼠标悬停的血条上显示威胁值文字."
L["Threat Text"] = "威胁值文字"

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = true;
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = true;
L["Show class icon for units."] = true;

--Watch Frame
L["Arena"] = true;
L["City (Resting)"] = true;
L["Collapsed"] = true;
L["Hidden"] = true;
L["Party"] = true;
L["PvP"] = true;
L["Raid"] = true;