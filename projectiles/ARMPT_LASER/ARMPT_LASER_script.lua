#ARM Skeeter Laser
#ARMPT_LASER
#
#Script created by Raevn

local TALaserProjectile = import('/lua/TAProjectiles.lua').TALaserProjectile

ARMPT_LASER = Class(TALaserProjectile) 
{
	PolyTrail = '/effects/emitters/YELLOW_LASER_emit.bp',
}

TypeClass = ARMPT_LASER

