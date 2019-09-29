#COR Crasher - Missile Kbot
#CORCRASH
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

CORCRASH = Class(TAunit) {
	Weapons = {
		CORKBOT_MISSILE = Class(TAweapon) {},
	},
}

TypeClass = CORCRASH
