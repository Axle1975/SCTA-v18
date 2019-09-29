#CORE Searcher - Scout Ship
#CORPT
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

CORPT = Class(TAunit) {
	Weapons = {
		CORPT_LASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
		CORKBOT_MISSILE = Class(TAweapon) {},
	},
}

TypeClass = CORPT
