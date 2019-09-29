#ARM Sentinel - Heavy Laser Tower
#ARMHLT
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMHLT = Class(TAunit) {
	Weapons = {
		ARM_LASERH1 = Class(TAweapon) {},
	},
}

TypeClass = ARMHLT
