#ARM Warrior - Medium Infantry Kbot
#ARMWAR
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

ARMWAR = Class(TAunit) {
	
	Weapons = {
		ARMWAR_EMG = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
			end,
		},
		ARMWAR_LCANNON = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.1)
			end,
		},
	},
}

TypeClass = ARMWAR
