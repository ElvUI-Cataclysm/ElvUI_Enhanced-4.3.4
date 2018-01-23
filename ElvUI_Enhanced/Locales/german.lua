local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "deDE")
if not L then return end

-- DESC locales
L["ENH_LOGIN_MSG"] = "Sie verwenden |cff1784d1ElvUI|r |cff1784d1Enhanced|r |cffff8000(Cataclysm)|r Version %s%s|r."
L["DURABILITY_DESC"] = "Passen Sie die Einstellungen für die Haltbarkeit im Charakterfenster an."
L["ITEMLEVEL_DESC"] = "Passen Sie die Einstellungen für die Anzeige von Gegenstandsstufen im Charakterfenster an."
L["WATCHFRAME_DESC"] = "Passen Sie die Einstellungen des Watchframe (Questlog) nach ihren Wünschen an."

-- Actionbars
L["Equipped Item Border"] = "Rahmen der angelegten Items"
L["Sets actionbars' backgrounds to transparent template."] = "Setzt den Aktionsleisten Hintergrund transparent."
L["Sets actionbars buttons' backgrounds to transparent template."] = "Setzt die Aktionsleisten Tasten transparent."
L["Transparent ActionBars"] = "Transparente Aktionsleisten"
L["Transparent Backdrop"] = "Transparenter Hintergrund"
L["Transparent Buttons"] = "Transparente Tasten"

-- AddOn List
L["Enable All"] = "Alle aktivieren"
L["Dependencies: "] = "Abhängigkeiten"
L["Disable All"] = "Alle deaktivieren"
L["Load AddOn"] = "Lade AddOn"
L["Requires Reload"] = "Benötigt Reload"

-- Animated Loss
L["Animated Loss"] = true;
L["Pause Delay"] = true;
L["Start Delay"] = true;
L["Postpone Delay"] = true;

-- Chat
L["Filter DPS meters Spam"] = "Spam von DPS-Metern filtern"
L["Replaces long reports from damage meters with a clickable hyperlink to reduce chat spam.\nWorks correctly only with general reports such as DPS or HPS. May fail to filter te report of other things"] = true;

-- Datatext
L["Combat Indicator"] = "Kampfanzeige"
L["Distance"] = "Entfernung"
L["Enhanced Time Color"] = "Erweiterte Zeit-Färbung"
L["Equipped"] = "Angelegt"
L["In Combat"] = "Im Kampf"
L["New Mail"] = "Neue Post"
L["No Mail"] = "Keine Post"
L["Out of Combat"] = "Außerhalb des Kampfes"
L["Reincarnation"] = "Wiederbelebung"
L["Target Range"] = "Zielreichweite"
L["Total"] = "Gesamt"

-- Death Recap
L["%s %s"] = true;
L["%s by %s"] = "%s durch %s"
L["%s sec before death at %s%% health."] = "%s Sekunden vor Tod bei %s%% Gesundheit."
L["(%d Absorbed)"] = "(%d Absorbiert)"
L["(%d Blocked)"] = "(%d Geblockt)"
L["(%d Overkill)"] = "(%d Über dem Tod)"
L["(%d Resisted)"] = "(%d Widerstanden)"
L["Death Recap unavailable."] = "Todesursache nicht verfügbar."
L["Death Recap"] = "Todesursache"
L["Killing blow at %s%% health."] = "Todesstoß bei %s%% Gesundheit."
L["Recap"] = "Zusammenfassung"
L["You died."] = "Du bist gestorben."

-- Decline Duels
L["Auto decline all duels"] = "Auto-Ablehnen von allen Duellen"
L["Decline Duel"] = "Duell ablehnen"
L["Declined duel request from "] = "Duellaufforderung abgelehnt von "

-- Equipment
L["Damaged Only"] = "Nur Beschädigte"
L["Enable/Disable the display of durability information on the character screen."] = "Anzeige der Haltbarkeit im Charakterfenster."
L["Enable/Disable the display of item levels on the character screen."] = "Anzeige von Gegenstandsstufen im Charakterfenster aktivieren / deaktivieren."
L["Equipment"] = "Ausrüstung"
L["Only show durabitlity information for items that are damaged."] = "Nur die Haltbarkeit für beschädigte Ausrüstungsteile anzeigen."
L["Quality Color"] = "Qualitätsfarbe"

-- General
L["Add button to Dressing Room frame with ability to undress model."] = true;
L["Add button to Trainer frame with ability to train all available skills in one click."] = true;
L["Alt-Click Merchant"] = true;
L["Already Known"] = true;
L["Automatically change your watched faction on the reputation bar to the faction you got reputation points for."] = "Ändere automatisch die beobachtete Fraktion auf der Erfahrungsleiste zu der Fraktion für die Sie grade Rufpunkte erhalten haben."
L["Automatically release body when killed inside a battleground."] = "Gibt automatisch Ihren Geist frei, wenn Sie auf dem Schlachtfeld getötet wurden."
L["Automatically select the quest reward with the highest vendor sell value."] = "Wählt automatisch die Questbelohnung mit dem höchsten Wiederverkaufswert beim Händler"
L["Changes the transparency of all the movers."] = "Ändere die Transparenz aller Ankerpukte"
L["Colorizes recipes, mounts & pets that are already known"] = "Rezepte, Reittiere und Begleiter einfärben, die bereits bekannt sind"
L["Display quest levels at Quest Log."] = "Questlevel im Questlog anzeigen."
L["Hide Zone Text"] = "Zonentext verstecken"
L["Holding Alt key while buying something from vendor will now buy an entire stack."] = true;
L["Mover Transparency"] = "Transparenz Ankerpunkte"
L["PvP Autorelease"] = "Automatische Freigabe im PvP"
L["Select Quest Reward"] = "Wähle Questbelohnung"
L["Show Quest Level"] = "Zeige Questlevel"
L["Track Reputation"] = "Ruf beobachten"
L["Undress"] = "Ausziehen"

-- Nameplates
L["Bars will transition smoothly."] = "Balken werden sanft übergehen"
L["Cache Unit Class"] = true;
L["Smooth Bars"] = "Sanfte Balken"

-- Minimap
L["Above Minimap"] = "Oberhalb der Minimap"
L["Combat Hide"] = true;
L["FadeIn Delay"] = "Einblendungsverzögerung"
L["Hide minimap while in combat."] = "Ausblenden der Minimap während des Kampfes."
L["Show Location Digits"] = true
L["Toggle Location Digits."] = true
L["Location Digits"] = "Koordinaten Nachkommastellen"
L["Location Panel"] = "Standort-Panel"
L["Number of digits for map location."] = "Anzahl der Nachkommastellen der Koordinaten."
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "Die Zeit vor dem wieder Einblenden der Minimap nach dem Kampf. (0 = deaktiviert)"
L["Toggle Location Panel."] = "Umschalten des Standort-Panels"

-- Tooltip
L["Baradin Hold"] = true;
L["Bastion of Twilight"] = true;
L["Blackwing Descend"] = true;
L["Check Player"] = true;
L["Colorize the tooltip border based on item quality."] = "Färbe den Tooltip-Rahmen basierend auf der Gegenstandsqualität"
L["Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit."] = true;
L["Dragon Soul"] = true;
L["Firelands"] = true;
L["Item Border Color"] = "Gegenstandsrahmen-Farbe"
L["Progress Info"] = true;
L["Show/Hides an Icon for Achievements on the Tooltip."] = "Icon für Erfolge am Tooltip anzeigen oder ausblenden."
L["Show/Hides an Icon for Items on the Tooltip."] = "Icon für Gegenstände am Tooltip anzeigen oder ausblenden."
L["Show/Hides an Icon for Spells on the Tooltip."] = "Icon für Zauber am Tooltip anzeigen oder ausblenden."
L["Show/Hides an Icon for Spells and Items on the Tooltip."] = "Icon für Zauber oder Gegenstände am Tooltip anzeigen oder ausblenden."
L["Throne of the Four Winds"] = true;
L["Tiers"] = true;
L["Tooltip Icon"] = true;

-- Movers
L["Loss Control Icon"] = "Kontrollverlust-Icon"
L["Player Portrait"] = "Spieler-Portrait"
L["Target Portrait"] = "Ziel-Portrait"

-- Loss Control
L["CC"] = "CC"
L["Disarm"] = "Entwaffnen"
L["Lose Control"] = true;
L["PvE"] = "PvE"
L["Root"] = "Wurzeln"
L["Silence"] = "Stille"
L["Snare"] = "Verlangsamung"

-- Skins
L["Achievements Animated Bars"] = true
L["Close Button"] = true
L["Original Close Button"] = true
L["Use blizzard close buttons, but desaturated"] = true

-- Raid Marks
L["Raid Markers"] = "Schlachtzugs-Markierungen"
L["Click to clear the mark."] = "Klicken um die Marker zu löschen."
L["Click to mark the target."] = "Klicken um ein Ziel zu markieren."
L["%sClick to remove all worldmarkers."] = "%sKlicken um alle Weltmarkierungen zu entfernen."
L["%sClick to place a worldmarker."] = "%sKlicken um ein Weltmarker zu setzen."
L["Raid Marker Bar"] = "Schlachtzugs-Markierungs-Leiste"
L["Reverse"] = "Umkehren"
L["Modifier Key"] = "Modifier Taste"
L["Set the modifier key for placing world markers."] = "Setzt eine modifierungs Taste um eine Weltmarkierung zu setzen."

-- Unitframes
L["All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat."] = "Alle Rollensymbole (Schaden/Heiler/Tank) auf den Einheitenfenstern werden versteckt, wenn der Charakter sich im Kampf befindet."
L["Class Icons"] = "Klassensymbole"
L["Detached Height"] = "Höhe loslösen"
L["Hide Role Icon in combat"] = "Verstecke Rollensymbol im Kampf"
L["Show class icon for units."] = "Zeige Klassensymbole für Einheiten"
L["Target"] = "Ziel"

-- WatchFrame
L["Arena"] = "Arena"
L["City (Resting)"] = "Stadt (erholend)"
L["Collapsed"] = "Eingeklappt"
L["Hidden"] = "Versteckt"
L["Party"] = "Gruppe"
L["PvP"] = "PvP"
L["Raid"] = "Schlachtzug"