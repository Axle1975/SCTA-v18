#ARM Panther Lightning Weapon
#ARMLATNK_WEAPON
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARMLATNK_WEAPON = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/LIGHTNING_emit.bp',
}

TypeClass = ARMLATNK_WEAPON

