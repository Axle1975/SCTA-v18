#CORE Shark Torpedo Weapon
#CORSMART_TORPEDO
#
#Script created by Raevn

local TAUnderWaterProjectile = import('/lua/TAProjectiles.lua').TAUnderWaterProjectile

CORSMART_TORPEDO = Class(TAUnderWaterProjectile) {
	TrackTime = 3,
	NormalSubDamage = 600,
}

TypeClass = CORSMART_TORPEDO