#CORE The Can Laser
#CORE_CANLASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

CORE_CANLASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/GREEN_LASER_emit.bp',
}

TypeClass = CORE_CANLASER

