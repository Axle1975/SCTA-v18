local oldExtractBuildMeshBlueprint = ExtractBuildMeshBlueprint
local oldModBlueprints = ModBlueprints

function ExtractBuildMeshBlueprint(bp)
	oldExtractBuildMeshBlueprint(bp)
	local FactionName = bp.General.FactionName
	if FactionName == 'ARM' or FactionName == 'CORE' then 
		local meshid = bp.Display.MeshBlueprint
		if not meshid then return end

		local meshbp = original_blueprints.Mesh[meshid]
		if not meshbp then return end

		local shadername = 'TABuild'
		-- local secondaryname = '/textures/effects/' .. FactionName .. 'BuildSpecular.dds'

		local buildmeshbp = table.deepcopy(meshbp)
		if buildmeshbp.LODs then
			for i,lod in buildmeshbp.LODs do
				lod.ShaderName = shadername
				-- lod.SecondaryName = secondaryname
			end
		end
		buildmeshbp.BlueprintId = meshid .. '_build'
		bp.Display.BuildMeshBlueprint = buildmeshbp.BlueprintId
		MeshBlueprint(buildmeshbp)
	end
end



function ModBlueprints(all_bps)
	oldModBlueprints(all_bps)
        
        for id,bp in all_bps.Unit do
		local FactionName = bp.General.FactionName
		if FactionName == 'ARM' or FactionName == 'CORE' then 

			#FIX for fast reclaim - should eventually be put into each units blueprints
			#Putting it here is just lazy :P
			if bp.Wreckage then
				bp.Wreckage.ReclaimTimeMultiplier = 50
			end

			#ADD veterancy levels
			bp.Veteran = {Level1 = 5, Level2 = 10, Level3 = 15, Level4 = 20, Level5 = 25}
			bp.Buffs = {}
			for i = 1,5 do
				newVet = {}
				table.insert(bp.Buffs, {Add = {["VeteranLevel" .. i] = true,}, BuffType = 'MAXHEALTH', Value = bp.Defense.MaxHealth * 0.05})
				table.insert(bp.Buffs, {Add = {["VeteranLevel" .. i] = true,}, BuffType = 'HEALTH', Value = bp.Defense.Health * 0.05})
			end
			if bp.Weapon then
	        		for k, v in bp.Weapon do
		        		v.Buffs = {}
					local lastROF = 1
					local lastRand = 0
					if v.RateOfFire then
						lastROF = v.RateOfFire
					end
					if v.FiringRandomness then
						lastRand = v.FiringRandomness
					end
					for i = 1,5 do
						if v.Damage then
							table.insert(v.Buffs, {Add = {["VeteranLevel" .. i] = true,}, BuffType = 'DAMAGE', Value = v.Damage * 0.05})
						end
						if v.RateOfFire then
							lastROF = lastROF * 1.06 #6% increase a level (increase ROF = decreased reload time)
							table.insert(v.Buffs, {Add = {["VeteranLevel" .. i] = true,}, BuffType = 'RATEOFFIRE', Value = lastROF})
						end
					end
					for i = 1,25 do
						if v.FiringRandomness then
							lastRand = lastRand * 0.95 #5% less randomness (Guess?)
							table.insert(v.Buffs, {Add = {["VeteranLevel" .. i] = true,}, BuffType = 'FIRINGRANDOMNESS', Value = lastRand})
						end
					end
				end
	        	end
	        end
	end
end