local E, L, V, P, G = unpack(ElvUI)
local AL = E:NewModule("AlreadyKnown")

local _G = _G
local match = string.match
local ceil, fmod = math.ceil, math.fmod

local hooksecurefunc = hooksecurefunc
local CreateFrame = CreateFrame
local IsAddOnLoaded = IsAddOnLoaded
local GetItemInfo = GetItemInfo
local GetMerchantItemInfo = GetMerchantItemInfo
local GetMerchantNumItems = GetMerchantNumItems
local GetBuybackItemInfo = GetBuybackItemInfo
local GetBuybackItemLink = GetBuybackItemLink
local GetNumBuybackItems = GetNumBuybackItems
local GetAuctionItemClasses = GetAuctionItemClasses
local GetAuctionItemInfo = GetAuctionItemInfo
local GetAuctionItemLink = GetAuctionItemLink
local GetGuildBankItemInfo = GetGuildBankItemInfo
local GetGuildBankItemLink = GetGuildBankItemLink
local ITEM_SPELL_KNOWN = ITEM_SPELL_KNOWN

local knowncolor = {r = 0.1, g = 1.0, b = 0.2}
local IsAlreadyKnown

local tooltip = CreateFrame("GameTooltip")
tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

do
	local knowns = {}
	local _, _, _, consumable, glyph, _, recipe, _, miscallaneous = GetAuctionItemClasses()
	local knowables = { 
		[consumable] = true,
		[glyph] = true,
		[recipe] = true,
		[miscallaneous] = true
	}

	local lines = {}
	for i = 1, 40 do
		lines[i] = tooltip:CreateFontString()
		tooltip:AddFontStrings(lines[i], tooltip:CreateFontString())
	end

	function IsAlreadyKnown(itemLink)
		if not itemLink then return end

		local itemID = itemLink:match("item:(%d+):")
		if knowns[itemID] then return true end

		local _, _, _, _, _, itemType = GetItemInfo(itemLink)
		if not knowables[itemType] then return end

		tooltip:ClearLines()
		tooltip:SetHyperlink(itemLink)

		for i = 1, tooltip:NumLines() do
			if lines[i]:GetText() == ITEM_SPELL_KNOWN then
				knowns[itemID] = true
				return true
			end
		end
	end
end

-- Merchant
local function MerchantFrame_UpdateMerchantInfo()
	local numItems = GetMerchantNumItems()

	for i = 1, MERCHANT_ITEMS_PER_PAGE do
		local index = (MerchantFrame.page - 1) * MERCHANT_ITEMS_PER_PAGE + i
		if index > numItems then return end

		local button = _G["MerchantItem" .. i .. "ItemButton"]

		if button and button:IsShown() then
			local _, _, _, _, numAvailable, isUsable = GetMerchantItemInfo(index)

			if isUsable and IsAlreadyKnown(GetMerchantItemLink(index)) then
				if E.db.enhanced.general.alreadyKnown then
					local r, g, b = knowncolor.r, knowncolor.g, knowncolor.b
					if numAvailable == 0 then
						r, g, b = r * 0.5, g * 0.5, b * 0.5
					end

					SetItemButtonTextureVertexColor(button, r, g, b)
				else
					return
				end
			end
		end
	end
end

local function MerchantFrame_UpdateBuybackInfo()
	local numItems = GetNumBuybackItems()

	for index = 1, BUYBACK_ITEMS_PER_PAGE do
		if index > numItems then return end

		local button = _G["MerchantItem" .. index .. "ItemButton"]

		if button and button:IsShown() then
			local _, _, _, _, _, isUsable = GetBuybackItemInfo(index)

			if isUsable and IsAlreadyKnown(GetBuybackItemLink(index)) then
				if E.db.enhanced.general.alreadyKnown then
					SetItemButtonTextureVertexColor(button, knowncolor.r, knowncolor.g, knowncolor.b)
				else
					return
				end
			end
		end
	end
end

-- Guild Bank
local function GuildBankFrame_Update()
	if GuildBankFrame.mode ~= "bank" then return end

	local tab = GetCurrentGuildBankTab()

	for i = 1, MAX_GUILDBANK_SLOTS_PER_TAB do
		local button = _G["GuildBankColumn" .. ceil((i - 0.5) / NUM_SLOTS_PER_GUILDBANK_GROUP) .. "Button" .. fmod(i, NUM_SLOTS_PER_GUILDBANK_GROUP)]

		if button and button:IsShown() then
			local texture, _, locked = GetGuildBankItemInfo(tab, i)

			if texture and not locked then
				if E.db.enhanced.general.alreadyKnown then
					if IsAlreadyKnown(GetGuildBankItemLink(tab, i)) then
						SetItemButtonTextureVertexColor(button, knowncolor.r, knowncolor.g, knowncolor.b)
					else
						SetItemButtonTextureVertexColor(button, 1, 1, 1)
					end
				else
					return
				end
			end
		end
	end
end

-- Auction House
local function AuctionFrameBrowse_Update()
	local numItems = GetNumAuctionItems("list")
	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)

	for i = 1, NUM_BROWSE_TO_DISPLAY do
		local index = offset + i
		if index > numItems then return end

		local texture = _G["BrowseButton" .. i .. "ItemIconTexture"]

		if texture and texture:IsShown() then
			local _, _, _, _, canUse = GetAuctionItemInfo("list", index)

			if canUse and IsAlreadyKnown(GetAuctionItemLink("list", index)) then
				if E.db.enhanced.general.alreadyKnown then
					texture:SetVertexColor(knowncolor.r, knowncolor.g, knowncolor.b)
				else
					return
				end
			end
		end
	end
end

local function AuctionFrameBid_Update()
	local numItems = GetNumAuctionItems("bidder")
	local offset = FauxScrollFrame_GetOffset(BidScrollFrame)

	for i = 1, NUM_BIDS_TO_DISPLAY do
		local index = offset + i
		if index > numItems then return end

		local texture = _G["BidButton" .. i .. "ItemIconTexture"]

		if texture and texture:IsShown() then
			local _, _, _, _, canUse = GetAuctionItemInfo("bidder", index)

			if canUse and IsAlreadyKnown(GetAuctionItemLink("bidder", index)) then
				if E.db.enhanced.general.alreadyKnown then
					texture:SetVertexColor(knowncolor.r, knowncolor.g, knowncolor.b)
				else
					return
				end
			end
		end
	end
end

local function AuctionFrameAuctions_Update()
	local numItems = GetNumAuctionItems("owner")
	local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame)

	for i = 1, NUM_AUCTIONS_TO_DISPLAY do
		local index = offset + i
		if index > numItems then return end

		local texture = _G["AuctionsButton" .. i .. "ItemIconTexture"]

		if texture and texture:IsShown() then
			local _, _, _, _, canUse, _, _, _, _, _, _, _, saleStatus = GetAuctionItemInfo("owner", index)

			if canUse and IsAlreadyKnown(GetAuctionItemLink("owner", index)) then
				local r, g, b = knowncolor.r, knowncolor.g, knowncolor.b
				if E.db.enhanced.general.alreadyKnown then
					if saleStatus == 1 then
						r, g, b = r * 0.5, g * 0.5, b * 0.5
					end

					texture:SetVertexColor(r, g, b)
				else
					return
				end
			end
		end
	end
end

function AL:AlreadyKnownUpdate()
	if IsAddOnLoaded("RecipeKnown") or IsAddOnLoaded("AlreadyKnown") then return end

	hooksecurefunc("MerchantFrame_UpdateMerchantInfo", MerchantFrame_UpdateMerchantInfo)
	hooksecurefunc("MerchantFrame_UpdateBuybackInfo", MerchantFrame_UpdateBuybackInfo)

	local isBlizzard_GuildBankUILoaded
	if IsAddOnLoaded("Blizzard_GuildBankUI") then
		isBlizzard_GuildBankUILoaded = true

		hooksecurefunc("GuildBankFrame_Update", GuildBankFrame_Update)
	end

	local isBlizzard_AuctionUILoaded
	if IsAddOnLoaded("Blizzard_AuctionUI") then
		isBlizzard_AuctionUILoaded = true

		hooksecurefunc("AuctionFrameBrowse_Update", AuctionFrameBrowse_Update)
		hooksecurefunc("AuctionFrameBid_Update", AuctionFrameBid_Update)
		hooksecurefunc("AuctionFrameAuctions_Update", AuctionFrameAuctions_Update)
	end

	if not isBlizzard_GuildBankUILoaded or not isBlizzard_AuctionUILoaded then
		local function OnEvent (self, event, addonName)
			if addonName == "Blizzard_GuildBankUI" then
				isBlizzard_GuildBankUILoaded = true

				hooksecurefunc("GuildBankFrame_Update", GuildBankFrame_Update)
			elseif addonName == "Blizzard_AuctionUI" then
				isBlizzard_AuctionUILoaded = true

				hooksecurefunc("AuctionFrameBrowse_Update", AuctionFrameBrowse_Update)
				hooksecurefunc("AuctionFrameBid_Update", AuctionFrameBid_Update)
				hooksecurefunc("AuctionFrameAuctions_Update", AuctionFrameAuctions_Update)
			end

			if isBlizzard_GuildBankUILoaded or isBlizzard_AuctionUILoaded then
				self:UnregisterEvent(event)
				self:SetScript("OnEvent", nil)
				OnEvent = nil
			end
		end

		tooltip:SetScript("OnEvent", OnEvent)
		tooltip:RegisterEvent("ADDON_LOADED")
	end
end

function AL:Initialize()
	AL:AlreadyKnownUpdate()
end

local function InitializeCallback()
	AL:Initialize()
end

E:RegisterModule(AL:GetName(), InitializeCallback) 