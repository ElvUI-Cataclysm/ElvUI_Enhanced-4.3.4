local E, L, V, P, G = unpack(ElvUI);

local function questlevel()
	if not E.db.general.showQuestLevel then return; end

	local buttons = QuestLogScrollFrame.buttons;
	local numButtons = #buttons;
	local scrollOffset = HybridScrollFrame_GetOffset(QuestLogScrollFrame);
	local numEntries, numQuests = GetNumQuestLogEntries();

	for i = 1, numButtons do
		local questIndex = i + scrollOffset;
		local questLogTitle = buttons[i];
		if(questIndex <= numEntries) then
			local title, level, _, _, isHeader = GetQuestLogTitle(questIndex);
			if(not isHeader) then
				questLogTitle:SetText("[" .. level .. "] " .. title);
				QuestLogTitleButton_Resize(questLogTitle);
			end
		end
	end
end

hooksecurefunc("QuestLog_Update", questlevel)
QuestLogScrollFrameScrollBar:HookScript("OnValueChanged", questlevel)