#ARM Freedom Fighter Missile
#ARMVTOL_MISSILE
#
#Script created by Raevn

local TAMissileProjectile = import('/lua/TAProjectiles.lua').TAMissileProjectile

ARMVTOL_MISSILE = Class(TAMissileProjectile) 
{
	TrackTime = 5,
	AirDamage = 130,
}

TypeClass = ARMVTOL_MISSILE
