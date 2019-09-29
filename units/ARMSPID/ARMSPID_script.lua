#ARM Spider - Spider Assault Vehicle
#ARMBULL
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMSPID = Class(TAunit) {

	Weapons = {
		ARM_PARALYZER = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.15)
			end,
		},
	},
}
TypeClass = ARMSPID
