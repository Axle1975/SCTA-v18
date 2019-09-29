#ARM Skimmer Laser
#ARMSH_WEAPON
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARMSH_WEAPON = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/RED_LASER_emit.bp',
}

TypeClass = ARMSH_WEAPON

