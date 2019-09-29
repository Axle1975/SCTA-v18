#CORE Intimidator - Long Range Plasma Cannon
#CORINT
#
#Script created by Raevn

local TAunit = import('/lua/TAunit.lua').TAunit
local TAweapon = import('/lua/TAweapon.lua').TAweapon

CORINT = Class(TAunit) {
	Weapons = {
		CORE_INTIMIDATOR = Class(TAweapon) {
			OnWeaponFired = function(self)
				TAweapon.OnWeaponFired(self)
				TAunit.ShowMuzzleFlare(self, 0.25)
			end,
		},
	},
}

TypeClass = CORINT
