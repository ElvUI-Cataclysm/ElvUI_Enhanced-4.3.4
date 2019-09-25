local E, L, V, P, G = unpack(ElvUI)
local ENP = E:GetModule("Enhanced_NamePlates")
local NP = E:GetModule("NamePlates")

local min, max = math.min, math.max

local smoothing = {}

local function SetSmooth(self, value)
	local _, maxValue = self:GetMinMaxValues()
	if value == self:GetValue() or (self._max and self._max ~= maxValue) then
		smoothing[self] = nil
		self:SetValue_(value)
	else
		smoothing[self] = value
	end
	self._max = maxValue
end

function ENP:UpdateAllFrame(_, frame)
	frame.HealthBar.Smooth = E.db.enhanced.nameplates.smoothBars.enable
	frame.HealthBar.SmoothSpeed = E.db.enhanced.nameplates.smoothBars.smoothingAmount * 10
end

function ENP:OnCreated(_, frame)
	if not frame.UnitFrame.HealthBar.SetValue_ then
		frame.UnitFrame.HealthBar.SetValue_ = frame.UnitFrame.HealthBar.SetValue
		frame.UnitFrame.HealthBar.SetValue = SetSmooth
	end
	frame.UnitFrame.HealthBar.Smooth = E.db.enhanced.nameplates.smoothBars.enable
	frame.UnitFrame.HealthBar.SmoothSpeed = E.db.enhanced.nameplates.smoothBars.smoothingAmount * 10
end

local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function()
	local limit = 30/GetFramerate()
	for bar, value in pairs(smoothing) do
		local cur = bar:GetValue()
		local new = cur + min((value-cur)/(bar.SmoothSpeed or 3), max(value-cur, limit))
		if new ~= new then
			new = value
		end
		bar:SetValue_(new)
		if (cur == value or abs(new - value) < 2) and bar.Smooth then
			bar:SetValue_(value)
			smoothing[bar] = nil
		elseif not bar.Smooth then
			bar:SetValue_(value)
			smoothing[bar] = nil
		end
	end
end)

function ENP:Smooth()
	self:SecureHook(NP, "UpdateAllFrame")
	self:SecureHook(NP, "OnCreated")
end