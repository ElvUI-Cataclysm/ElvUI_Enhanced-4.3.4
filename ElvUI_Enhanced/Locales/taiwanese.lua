local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhTW")
if not L then return; end

-- DESC locales
L["ENH_LOGIN_MSG"] = "您正在使用 |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(Cataclysm)|r version %s%s|r."
L["DURABILITY_DESC"] = "調整設置人物窗口裝備耐久度顯示."
L["ITEMLEVEL_DESC"] = "調整在角色資訊上顯示物品裝等的各種設定."

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
L["Death Recap"] = true;
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Equipment
L["Damaged Only"] = "受損顯示"
L["Equipment"] = "自動換裝"
L["Enable/Disable the display of durability information on the character screen."] = "開啓/關閉 人物窗口裝備耐久度顯示."
L["Enable/Disable the display of item levels on the character screen."] = "在角色資訊上顯示各裝備裝等"
L["Only show durabitlity information for items that are damaged."] = "只在裝備受損時顯示耐久度."

-- General
L["Already Known"] = true;
L["Auto decline all duels"] = "自動拒絕決鬥請求"
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "當你獲得某個陣營的聲望時, 將自動追蹤此陣營的聲望至經驗值欄位." 
L["Automatically release body when killed inside a battleground."] = "在戰場死亡後自動釋放靈魂."
L["Changes the transparency of all the movers."] = "改變所有定位器的透明度"
L["Colorizes recipes, mounts & pets that are already known"] = "已學習的圖紙及已收集的坐騎和寵物上色"
L["Decline Duel"] = true;
L["Declined duel request from "] = "已拒絕決鬥請求自"
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = "定位器透明度"
L["PvP Autorelease"] = "PVP自動釋放靈魂"
L["Show Quest Level"] = true;
L["Track Reputation"] = "聲望追蹤"

-- Loss Control
L["CC"] = "控制類技能"
L["Disarm"] = "繳械類技能"
L["Lose Control"] = true;
L["PvE"] = "PvE"
L["Root"] = "定身類技能"
L["Silence"] = "沉默類技能"
L["Snare"] = "減速類技能"

-- Maps
L["Above Minimap"] = "小地圖之上"
L["FadeIn Delay"] = "隱藏延遲"
L["Hide minimap while in combat."] = "戰鬥中隱藏小地圖"
L["Location Digits"] = "坐標位數"
L["Number of digits for map location."] = "坐標顯示的小數位數"
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "戰鬥開始後隱藏小地圖前的延遲時間 (0=停用)"

-- Misc
L["Animations"] = true;
L["Undress"] = "無裝備"

-- Movers
L["Loss Control Icon"] = "失去控制圖示"
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Nameplates
L["Display threat level as text on targeted, boss or mouseover nameplate."] = "在首領或鼠標懸停的血條上顯示威脅等級文字."
L["Threat Text"] = "威脅值文字"

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = true;
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = true;
L["Show class icon for units."] = "顯是職業圖標"

--Watch Frame
L["Arena"] = "競技場"
L["City (Resting)"] = "城市 (休息)"
L["Collapsed"] = "收起"
L["Hidden"] = "隱藏"
L["Party"] = "隊伍"
L["PvP"] = true;
L["Raid"] = "團隊"