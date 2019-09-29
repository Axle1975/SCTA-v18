#COR Snake - Submarine
#CORSUB
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

CORSUB = Class(TAunit) {
    Weapons = {
        CORE_TORPEDO = Class(TAweapon) {
	},
    },
}


TypeClass = CORSUB