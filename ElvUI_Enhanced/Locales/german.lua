local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "deDE")
if not L then return; end

-- DESC locales
L["ENH_LOGIN_MSG"] = "Sie verwenden |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(Cataclysm)|r Version %s%s|r."
L["DURABILITY_DESC"] = "Passen Sie die Einstellungen für die Haltbarkeit im Charakterfenster an."
L["ITEMLEVEL_DESC"] = "Passen Sie die Einstellungen für die Anzeige von Gegenstandsstufen im Charakterfenster an."

-- Animated Loss
L["Animated Loss"] = true;
L["Pause Delay"] = true;
L["Start Delay"] = true;
L["Postpone Delay"] = true;

-- Datatext
L["Datatext Disabled"] = true;
L["Equipped"] = true;
L["In Combat"] = true;
L["New Mail"] = "Neue Post"
L["No Mail"] = "Keine Post"
L["Not Learned"] = true;
L["Out of Combat"] = true;
L["Ready"] = true;
L["Total"] = "Gesamt"
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
L["Death Recap"] = "Todesursache"
L["Killing blow at %s%% health."] = true;
L["Recap"] = true;
L["You died."] = true;

-- Equipment
L["Damaged Only"] = "Nur Beschädigte"
L["Equipment"] = "Ausrüstung"
L["Enable/Disable the display of durability information on the character screen."] = "Anzeige der Haltbarkeit im Charakterfenster."
L["Enable/Disable the display of item levels on the character screen."] = "Anzeige von Gegenstandsstufen im Charakterfenster aktivieren / deaktivieren."
L["Only show durabitlity information for items that are damaged."] = "Nur die Haltbarkeit für beschädigte Ausrüstungsteile anzeigen."

-- General
L["Already Known"] = true;
L["Auto decline all duels"] = true;
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "Ändere automatisch die beobachtete Fraktion auf der Erfahrungsleiste zu der Fraktion für die Sie grade Rufpunkte erhalten haben."
L["Automatically release body when killed inside a battleground."] = "Gibt automatisch Ihren Geist frei, wenn Sie auf dem Schlachtfeld getötet wurden."
L["Changes the transparency of all the movers."] = "Konfiguriere die Einstellungen der Transparenz der Ankerpukte"
L["Colorizes recipes, mounts & pets that are already known"] = "Färbe Rezepte, Reittiere & Haustiere die Du bereits kennst"
L["Decline Duel"] = true;
L["Declined duel request from "] = "Duellaufforderung abgelehnt von "
L["Display quest levels at Quest Log."] = true;
L["Mover Transparency"] = "Transparenz Ankerpunkte"
L["PvP Autorelease"] = "Automatische Freigabe im PvP"
L["Show Quest Level"] = true;
L["Track Reputation"] = "Ruf beobachten"

-- Loss Control
L["CC"] = "CC"
L["Disarm"] = "Entwaffnen"
L["Lose Control"] = true;
L["PvE"] = "PvE"
L["Root"] = "Wurzeln"
L["Silence"] = "Stille"
L["Snare"] = "Verlangsamung"

-- Maps
L["Above Minimap"] = "Oberhalb der Minimap"
L["FadeIn Delay"] = "Einblendungsverzögerung"
L["Hide minimap while in combat."] = "Ausblenden der Minimap während des Kampfes."
L["Location Digits"] = "Koordinaten Nachkommastellen"
L["Number of digits for map location."] = "Anzahl der Nachkommastellen der Koordinaten."
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "Die Zeit vor dem wieder Einblenden der Minimap nach dem Kampf. (0 = deaktiviert)"

-- Misc
L["Animations"] = true;
L["Undress"] = "Ausziehen"

-- Movers
L["Loss Control Icon"] = "Kontrollverlustsymbol"
L["Player Portrait"] = true;
L["Target Portrait"] = true;

-- Nameplates
L["Display threat level as text on targeted, boss or mouseover nameplate."] = " Bedrohung als Text auf der Namensplakette des Ziels anzeigen."
L["Threat Text"] = "Bedrohungstext"

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = "Alle Rollensymbole (Schaden/Heiler/Tank) auf den Einheitenfenstern werden versteckt, wenn der Charakter sich im Kampf befindet."
L["Detached Height"] = true;
L["Hide Role Icon in combat"] = "Verstecke Rollensymbol im Kampf"
L["Show class icon for units."] = "Zeige Klassensymbole für Einheiten"

--Watch Frame
L["Arena"] = "Arena"
L["City (Resting)"] = "Stadt (erholend)"
L["Collapsed"] = "Eingeklappt"
L["Hidden"] = "Versteckt"
L["Party"] = "Gruppe"
L["PvP"] = "PvP"
L["Raid"] = "Schlachtzug"