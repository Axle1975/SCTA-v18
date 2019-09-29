#ARM Big Bertha - Long Range Plasma Cannon
#ARMBRTHA
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMBRTHA = Class(TAunit) {
	Weapons = {
		ARM_BERTHACANNON = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.25)
			end,
		},
	},
}

TypeClass = ARMBRTHA
