# Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
#
# This is the minimal setup required to load the game rules.

# Do global init
__blueprints = {}

doscript '/lua/system/config.lua'
doscript '/lua/system/repr.lua'
doscript '/lua/system/utils.lua'

LOG('Active game mods for blueprint loading: ',repr(__active_mods))

local hasCompatibility = false

for k,v in __active_mods do
   if v.uid == '49C1BB2C-77C1-11DC-0590-D57856D89595' then
        hasCompatibility = true
   end
end

if (hasCompatibility == true) then
	doscript '/lua/footprintsCompatibility.lua'
else
	doscript '/lua/footprints.lua'
end

doscript '/lua/system/Blueprints.lua'
LoadBlueprints()
