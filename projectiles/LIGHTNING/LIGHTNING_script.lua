#ARM Zeus Lightning Weapon
#LIGHTNING
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

LIGHTNING = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/LIGHTNING_emit.bp',
}

TypeClass = LIGHTNING

