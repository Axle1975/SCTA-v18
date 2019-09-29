#ARM L.L.T. Laser
#ARM_LIGHTLASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARM_LIGHTLASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = ARM_LIGHTLASER
