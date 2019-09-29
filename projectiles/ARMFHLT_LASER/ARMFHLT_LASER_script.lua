#ARM Stingray Laser
#ARMFHLT_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARMFHLT_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/GREEN_LASER_emit.bp',
}

TypeClass = ARMFHLT_LASER

