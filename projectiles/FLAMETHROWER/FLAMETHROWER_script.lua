#CORE Pyro Flamethrower
#FLAMETHROWER
#
#Script created by Raevn

local TALightCannonProjectile = import('/mods/SCTA/lua/TAProjectiles.lua').TALightCannonProjectile

FLAMETHROWER = Class(TALightCannonProjectile) {
	PyroDamage = 2,
	Smoke = true,

	FxSmoke = '/mods/SCTA/effects/emitters/flamethrower_emit.bp',

	FxImpactAirUnit = {},
	FxImpactShield = {},
	FxImpactUnit = {},
	FxImpactProp = {},
	FxImpactLand = {},
	FxImpactWater = {},
}

TypeClass = FLAMETHROWER
