local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')

ARMAAP_debris01 = Class(BaseGenericDebris) {
    FxImpactLand = EffectTemplates.GenericDebrisLandImpact01,
    FxTrails = {
	'/effects/emitters/debris_smoke_emit.bp',
	'/effects/emitters/debrisfire_smoke_emit.bp',
    },
}

TypeClass = ARMAAP_debris01

