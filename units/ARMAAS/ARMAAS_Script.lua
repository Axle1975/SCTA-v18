#ARM Archer - Anti-Air Ship
#ARMAAS
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMAAS = Class(TAunit) {
	Weapons = {
		ARMAAS_WEAPON1 = Class(TAweapon) {},
		ARMAAS_WEAPON2 = Class(TAweapon) {},
		ARMAAS_WEAPON3 = Class(TAweapon) {},
	},
}

TypeClass = ARMAAS
