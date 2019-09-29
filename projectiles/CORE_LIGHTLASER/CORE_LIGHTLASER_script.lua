#CORE Light Laser Tower Laser
#CORE_LIGHTLASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

CORE_LIGHTLASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = CORE_LIGHTLASER
