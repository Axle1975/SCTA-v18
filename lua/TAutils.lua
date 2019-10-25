faCompatibility = false

function GetDistanceBetweenTwoPoints(x1, z1, x2, z2)
	#lol ^ is broken :P
	local dx = (x2-x1)*(x2 - x1)
	local dz = (z2-z1)*(z2 - z1)
	local distance = math.sqrt(dx + dz)

	return ( distance )
end

function getUnitChat()
	return -1
end

function DisplayMessage(message, importance)
	if getUnitChat() >= importance then
		print(message)
	end
end

function GetAngle(x1, z1, x2, z2)
	local dx = x2 - x1
	local dz = z2 - z1

	local angle = math.atan(math.abs(dz) / math.abs(dx))

	if dz < 0 then
		if dx < 0 then
			angle = math.pi - angle
		elseif dx == 0 then
			angle = math.pi / 2
		end
	elseif dz > 0 then
		if dx < 0 then
			angle = math.pi + angle
		elseif dx > 0 then
			angle = 2 * math.pi - angle
		elseif dx == 0 then
			angle = 3 * math.pi
		end
	else
		if dx < 0 then
			angle = math.pi
		else
			angle = 0
		end
	end
	return (angle / math.pi) * 180 + 90
end

function DoTaperedAreaDamage(radius, damage, position, instigator, targetEntity, damageType, damageFriendly, damageSelf, edgeEffectiveness)
	local precision = math.floor(radius * 2) + 1
	local pulse = 0
	local edge = edgeEffectiveness or 0

        if radius and radius > 0 then
		if edge * damage > 0 then
			DamageArea(instigator, position, radius, damage * edge, damageType, damageFriendly, damageSelf or false)
		end
		while pulse < precision do
			local factor = (pulse + 1) / precision
       			if damage and damage - edge > 0 then
	            		DamageArea(instigator, position, radius * factor, damage / precision + (1 - factor) * damage * edge, damageType, damageFriendly, damageSelf or false)
        		end
			pulse = pulse + 1
		end
	elseif damage and targetEntity then
		Damage(instigator, position, targetEntity, damage, damageType)
	end
end



textureChange = {
	{
		currentAnim = 1,
		frames = 8,
		bones = {
			{
			'a',
			'b',
			'c',
			'd',
			'e',
			'd',
			'c',
			'b',
			},
			{
			'a2',
			'b2',
			'c2',
			'd2',
			'e2',
			'd2',
			'c2',
			'b2',
			},
		},
	},
	{
		currentAnim = 1,
		frames = 6,
		bones = {
			{
			'a',
			'b',
			'c',
			'd',
			'c',
			'b',
			},
			{
			'a2',
			'b2',
			'c2',
			'd2',
			'c2',
			'b2',
			},
		}
	},
}

function TextureChangeCall()
	while true do
		for k,v in textureChange do
			local hide1 = v.bones[1][v.currentAnim]
			local hide2 = v.bones[2][v.currentAnim]
			v.currentAnim = v.currentAnim + 1
			if v.currentAnim > v.frames then
				v.currentAnim = 1
			end
			for bk,bv in ArmyBrains do
				local units = bv:GetListOfUnits(categories.TEXTUREANIM, false)

				if units then
					for uk,uv in units do
						if uv:GetFractionComplete() == 1 then
							if uv:GetBlueprint().Display.TextureAnimationFrames == v.frames then
								if uv.textureAnimation == true then
									uv:ShowBone(v.bones[1][v.currentAnim], true)
									uv:HideBone(hide1, true)
									if (uv:GetBlueprint().Display.TextureAnimationSets == 2) then
										uv:ShowBone(v.bones[2][v.currentAnim], true)
										uv:HideBone(hide2, true)
									end
								else
									uv:HideBone(hide1, true)
									uv:ShowBone(v.bones[1][v.currentAnim], true)
									if (uv:GetBlueprint().Display.TextureAnimationSets == 2) then
										uv:HideBone(hide2, true)
										uv:ShowBone(v.bones[2][v.currentAnim], true)
									end
								end
							end
						end
					end
				end
			end
		end
		WaitSeconds(0.5)
	end
end


function QueueDelayedWreckage(self,overkillRatio, bp, completed, pos, orientation, health)
	ForkThread(CreateDelayedWreckage, self, overkillRatio, bp, completed, pos, orientation, health)
end


function CreateDelayedWreckage(self,overkillRatio, bp, completed, pos, orientation, health)
	local WreckShield = import('/mods/SCTA/lua/TAshield.lua').WreckShield

	#see if we can reduce this?
	while not IsDestroyed(self) do
		WaitSeconds(0.4)
	end

	local wreck = bp.Wreckage.Blueprint
	if wreck and completed == 1 then
			
		local prop = CreateProp( pos, wreck )
		pbp = prop:GetBlueprint()


		prop:SetScale(pbp.Display.UniformScale)
		prop:SetOrientation(orientation, true)

		local mass = (pbp.Economy.ReclaimMassMax or 0)
		local energy = (pbp.Economy.ReclaimEnergyMax or 0)
		#change this to point to the wreckage prop intead of the unit blueprint?
		local time = (bp.Wreckage.ReclaimTimeMultiplier or 1) 

		prop:SetMaxReclaimValues(time, mass, energy)

		prop.OriginalUnit = self.OriginalUnit or self
		if pbp.Physics.BlockPath == true then
		        prop.myShield = WreckShield {
        	        	Owner = self,
               			FactionName = bp.General.FactionName,
               			CollisionSizeX = (pbp.CollisionSizeX or (pbp.SizeX or 2)) / 2,
	               		CollisionSizeY = (pbp.CollisionSizeY or (pbp.SizeY or 2)) / 2,
	       	        	CollisionSizeZ = (pbp.CollisionSizeZ or (pbp.SizeZ or 2)) / 2,
                		CollisionCenterX = pbp.CollisionOffsetX or 0,
               			CollisionCenterY = pbp.SizeY / 2 + pbp.CollisionOffsetY or 0,
	               		CollisionCenterZ = pbp.CollisionOffsetZ or 0,
                		OwnerShieldMesh = pbp.Display.MeshBlueprint,
	               		ShieldMaxHealth = prop:GetHealth(),
                		ShieldRechargeTime = 999,
	       	        	ShieldEnergyDrainRechargeTime = 0,
                		ShieldRegenRate = 0,
               			ShieldRegenStartTime = 999,
				Wreck = prop,
				Orientation = orientation,
				Position = pos,
	                }
		end
		prop:DoTakeDamage(prop, overkillRatio * health, Vector(0,0,0), 'Normal')
        	prop.AssociatedBP = pbp.BlueprintId
	end
end



wind = {
	direction = 0,
	amount = 0,
    threadStarted = false
}

function WindChangeThread()

    if wind.threadStarted then
        return
    end
    wind.threadStarted = true
    LOG('Started WindChangeThread')

	worldData = import('sim/worldData.lua')
	if worldData.GetMap().maxWind > 0 then
		while true do

			wind.direction = math.random(360)
			wind.amount = math.random(worldData.GetMap().maxWind - worldData.GetMap().minWind) + worldData.GetMap().minWind

			for bk,bv in ArmyBrains do
				local generators = bv:GetListOfUnits(categories.WIND, false)
				if generators then
					for k,v in generators do
						v.OnWindChange(v, wind.direction, wind.amount)
					end
				end
			end

			WaitSeconds(15)
		end
	end
end

targetingFacilityData = {}

function registerTargetingFacility(army)
    if (targetingFacilityData[army]) then
        targetingFacilityData[army] = targetingFacilityData[army] + 1
    else
        targetingFacilityData[army] = 1
    end

end

function unregisterTargetingFacility(army)
    if (targetingFacilityData[army]) then
        targetingFacilityData[army] = targetingFacilityData[army] - 1
    else
        targetingFacilityData[army] = 0
    end
end

function ArmyHasTargetingFacility(army)
    return (targetingFacilityData[army] > 0 and GetArmyBrain(army):GetEconomyStored('ENERGY') > 0)
end