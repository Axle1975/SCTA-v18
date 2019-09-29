#CORE Pulverizer - Missile Tower
#CORRL
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

CORRL = Class(TAunit) {

	Weapons = {
		CORRL_MISSILE = Class(TAweapon) {},
	},
}

TypeClass = CORRL
