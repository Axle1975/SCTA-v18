#ARM Penetrator - Mobile Energy Weapon
#ARMMANNI
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMMANNI = Class(TAunit) {

	Weapons = {
		ARMMANNI_WEAPON = Class(TAweapon) {},
	},
}
TypeClass = ARMMANNI
