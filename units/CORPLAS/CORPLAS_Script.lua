#CORE Immolator - Plasma Tower
#CORPLAS
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

CORPLAS = Class(TAunit) {
	Weapons = {
		CORPLAS_WEAPON = Class(TAweapon) {},
	},
}

TypeClass = CORPLAS
