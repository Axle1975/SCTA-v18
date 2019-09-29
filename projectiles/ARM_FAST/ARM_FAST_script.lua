#ARM Zipper Laser
#ARM_FAST
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARM_FAST = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = ARM_FAST

