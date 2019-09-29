#CORE Weasel Laser
#CORE_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

CORE_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = CORE_LASER

