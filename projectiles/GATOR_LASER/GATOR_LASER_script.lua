#CORE Instigator Laser
#GATOR_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

GATOR_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = GATOR_LASER

