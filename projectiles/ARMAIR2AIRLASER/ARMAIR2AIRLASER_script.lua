#ARM Pheonix Laser
#ARMAIR2AIRLASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARMAIR2AIRLASER = Class(TALaserProjectile) {
	AirDamage = 32,
	PolyTrail = '/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = ARMAIR2AIRLASER

