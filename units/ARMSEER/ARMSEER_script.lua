#ARM Seer - Mobile Radar
#ARMSEER
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit

ARMSEER = Class(TAunit) {
	OnCreate = function(self)
		TAunit.OnCreate(self)
		self.Spinners = {
			dish = CreateRotator(self, 'Radar', 'y', nil, 0, 120, 0),
		}
		self.Trash:Add(self.Spinners.dish)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAunit.OnStopBeingBuilt(self,builder,layer)
		--spin dish around y-axis speed <100>;
		self.Spinners.dish:SetTargetSpeed(100)
		self:SetConsumptionActive(true)
	end,


	OnScriptBitSet = function(self, bit)
		if bit == 3 then
			--spin dish around z-axis speed <0> (Bug in TA: meant to be y-axis)
			self.Spinners.dish:SetTargetSpeed(0)
			self:SetConsumptionActive(false)
		end
		TAunit.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 3 then
			--spin dish around y-axis speed <100>;
			self.Spinners.dish:SetTargetSpeed(100)
			self:SetConsumptionActive(true)
		end
		TAunit.OnScriptBitClear(self, bit)
	end,
}
TypeClass = ARMSEER