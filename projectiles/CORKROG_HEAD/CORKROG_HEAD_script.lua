#CORE Krogoth Laser
#CORKROG_HEAD
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

CORKROG_HEAD = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/PURPLE_LASER_emit.bp',
}

TypeClass = CORKROG_HEAD

