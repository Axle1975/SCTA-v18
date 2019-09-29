#ARM Rocko - Rocket Kbot
#ARMROCK
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMROCK = Class(TAunit) {
	Weapons = {
		KBOT_ROCKET = Class(TAweapon) {},
	},
}

TypeClass = ARMROCK
