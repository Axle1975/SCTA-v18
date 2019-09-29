#ARM Sentinel Laser
#ARM_LASERH1
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARM_LASERH1 = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/GREEN_LASER_emit.bp',
}

TypeClass = ARM_LASERH1

