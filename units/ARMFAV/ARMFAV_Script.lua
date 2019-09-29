#ARM Jeffy - Fast Attack Vehicle
#ARMFAV
#
#Blueprint created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMFAV = Class(TAunit) {

	Weapons = {
		ARM_LASER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},
}

TypeClass = ARMFAV