#CORE Commander Laser
#CORCOMLASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

CORCOMLASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = CORCOMLASER
