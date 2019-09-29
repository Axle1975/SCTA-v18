#CORE Doomsday Machine Laser
#CORE_DOOMSDAY
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

CORE_DOOMSDAY = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/PURPLE_LASER_emit.bp',
}

TypeClass = CORE_DOOMSDAY

