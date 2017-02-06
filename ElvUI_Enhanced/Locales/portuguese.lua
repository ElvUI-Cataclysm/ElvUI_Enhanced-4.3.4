local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "ptBR")
if not L then return; end

-- DESC locales
L["ENH_LOGIN_MSG"] = "Você está a usar |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(Cataclysm)|r versão %s%s|r."
L["DURABILITY_DESC"] = "Ajuste as opções para a informação de durabilidade no ecrã de informação do personagem."
L["ITEMLEVEL_DESC"] = "Adjust the settings for the item level information on the character screen."

-- Animated Loss
L["Animated Loss"] = true;
L["Pause Delay"] = true;
L["Start Delay"] = true;
L["Postpone Delay"] = true;

-- Datatext
L["Datatext Disabled"] = true;
L["Equipped"] = true;
L["In Combat"] = true;
L["New Mail"] = true;
L["No Mail"] = true;
L["Not Learned"] = true;
L["Out of Combat"] = true;
L["Ready"] = true;
L["Total"] = "Total"
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
L["Damaged Only"] = "Só Danificados"
L["Equipment"] = "Equipamento"
L["Enable/Disable the display of durability information on the character screen."] = "Activar/desactivar a informação de durabilidade no ecrã de informação do personagem."
L["Enable/Disable the display of item levels on the character screen."] = true;
L["Only show durabitlity information for items that are damaged."] = "Só mostrar informação de durabilidade para itens danificados."

-- General
L["Auto decline all duels"] = true;
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "Mudar automaticamente a facção controlada para a facção na qual acabou de ganhar pontos de reputação." 
L["Automatically release body when killed inside a battleground."] = "Automaticamente libertar o corpo quando morto num campo de batalha."
L["Changes the transparency of all the movers."] = true;
L["Colorizes recipes, mounts & pets that are already known"] = true;
L["Decline Duel"] = true;
L["Declined duel request from "] = true;
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = true;
L["PvP Autorelease"] = "Auto-libertar em JxJ"
L["Show Quest Level"] = true;
L["Track Reputation"] = "Controlar Reputação"

-- Loss Control
L["CC"] = true;
L["Disarm"] = true;
L["Lose Control"] = true;
L["PvE"] = true;
L["Root"] = true;
L["Silence"] = true;
L["Snare"] = true;

-- Maps
L["Above Minimap"] = true;
L["FadeIn Delay"] = true;
L["Hide minimap while in combat."] = true;
L["Location Digits"] = true;
L["Number of digits for map location."] = true;
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = true;

-- Misc
L["Animations"] = true;
L["Undress"] = true;

-- Movers
L["Loss Control Icon"] = "Ícone de Perda de Controle"
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Nameplates
L["Display threat level as text on targeted, boss or mouseover nameplate."] = true;
L["Threat Text"] = true;

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