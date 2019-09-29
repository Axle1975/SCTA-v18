#CORE Commander - Commander
#CORCOM
#
#Script created by Raevn

local TAconstructor = import('/mods/SCTA/lua/TAconstructor.lua').TAconstructor
local TAweapon = import('/mods/SCTA/lua/TAweapon.lua').TAweapon
local TAutils = import('/mods/SCTA/lua/TAutils.lua')

CORCOM = Class(TAconstructor) {
	motion = 'Stopped',
	cloakOn = false,
	cloakSet = false,

	Weapons = {
		CORCOMLASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAconstructor.ShowMuzzleFlare(self, 0.1)
			end,
		},
		CORE_DISINTEGRATOR = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAconstructor.ShowMuzzleFlare(self, 0.1)
				#self.unit:SetWeaponEnabledByLabel('CORCOMLASER', true)
			end,

		        OnLostTarget = function(self)
				#self.unit:SetWeaponEnabledByLabel('CORCOMLASER', true)
				TAweapon.OnLostTarget(self)
		        end,
		},
	},

	OnCreate = function(self)
		self.Spinners = {
			Torso = CreateRotator(self, 'Torso', 'y', nil, 0, 0, 0),
			Nanogun = CreateRotator(self, 'Nanogun', 'x', nil, 0, 0, 0),
		}
		for k, v in self.Spinners do
			self.Trash:Add(v)
		end
		TAconstructor.OnCreate(self)
            	self:SetIntelRadius('Omni', 0)
		ForkThread(self.CloakDetection, self)
	end,

	CloakDetection = function(self)
		while not IsDestroyed(self) and self:IsDead() do
			WaitSeconds(1)
			local pos = self:GetPosition()
			local area = Rect(pos.x - 4, pos.z - 4, pos.x + 4, pos.z + 4)
			local unitsInRect = GetUnitsInRect(area)
			local enemyClose = false
			for k, v in unitsInRect do
				if v != self and v:GetArmy() != self:GetArmy() then
					if self.cloakOn == true then
						self.cloakOn = false
						self:DisableIntel('Cloak')
						self:SetMesh(self:GetBlueprint().Display.MeshBlueprint, true)
					end
					enemyClose = true
				end
			end
			if enemyClose == false then
				if self.cloakSet == true then
					self.cloakOn = true
					self:EnableIntel('Cloak')
					self:SetMesh('/units/CORCOM/CORCOM_cloak_mesh', true)
				end
			end
		end
	end,

	PlayCommanderWarpInEffect = function(self)
	end,

	OnStopBeingBuilt = function(self,builder,layer)
		TAconstructor.OnStopBeingBuilt(self,builder,layer)
		ForkThread(self.GiveInitialResources, self)
	        self:SetScriptBit('RULEUTC_CloakToggle', true)
	end,

	OnMotionHorzEventChange = function( self, new, old )
		TAconstructor.OnMotionHorzEventChange(self, new, old)
		if old == 'Stopped' then
			self:SetConsumptionPerSecondEnergy(1000)
			self.motion = 'Moving'
		elseif new == 'Stopped' then
			self:SetConsumptionPerSecondEnergy(200)
			self.motion = 'Stopped'
		end
	end,

	OnIntelDisabled = function(self)
		self.cloakOn = false
		self.cloakSet = false
            	self:SetIntelRadius('Omni', 0)
        	self:PlayUnitSound('Uncloak')
		self:SetMesh(self:GetBlueprint().Display.MeshBlueprint, true)
	end,

	OnIntelEnabled = function(self)
		if self.motion == 'Moving' then
			self:SetConsumptionPerSecondEnergy(1000)
		end
            	self:SetIntelRadius('Omni', 3)
		self.cloakOn = true
		self.cloakSet = true
        	self:PlayUnitSound('Cloak')
		self:SetMesh('/units/CORCOM/CORCOM_cloak_mesh', true)
	end,



	OnScriptBitSet = function(self, bit)
		if bit == 8 then
		end
		TAconstructor.OnScriptBitSet(self, bit)
	end,


	OnScriptBitClear = function(self, bit)
		if bit == 8 then
		end
		TAconstructor.OnScriptBitClear(self, bit)
	end,


	GiveInitialResources = function(self)
		self:GetAIBrain():GiveResource('ENERGY', self:GetBlueprint().Economy.StorageEnergy)
		self:GetAIBrain():GiveResource('MASS', self:GetBlueprint().Economy.StorageMass)
	end,

	Aim = function(self, target)
		local selfPosition = self:GetPosition('Torso') 
		local targetPosition = target:GetPosition()
			

		--TURN torso to y-axis heading SPEED <300.07>;
		self.Spinners.Torso:SetGoal(TAutils.GetAngle(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z) - (self:GetHeading() * 180) / math.pi)
		self.Spinners.Torso:SetSpeed(300)

		local distance = VDist2(selfPosition.x, selfPosition.z, targetPosition.x, targetPosition.z)
		selfPosition = self:GetPosition('NanoMuzzle') 

		--TURN luparm to x-axis (0 - pitch - 29.99) SPEED <45.01>; #luparm or nanogun?
		self.Spinners.Nanogun:SetGoal(TAutils.GetAngle(0, selfPosition.y, distance, targetPosition.y) + 180)
		self.Spinners.Nanogun:SetSpeed(45.01)

		WaitFor(self.Spinners.Torso)
		WaitFor(self.Spinners.Nanogun)
		TAconstructor.Aim(self,target)
	end,


	Close = function(self)
		self.Spinners.Torso:SetGoal(0)
		self.Spinners.Torso:SetSpeed(90)
			
		self.Spinners.Nanogun:SetGoal(0)
		self.Spinners.Nanogun:SetSpeed(45)

		WaitFor(self.Spinners.Torso)
		WaitFor(self.Spinners.Nanogun)
		TAconstructor.Close(self)
	end,
}

TypeClass = CORCOM