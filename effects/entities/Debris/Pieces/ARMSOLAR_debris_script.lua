local BaseGenericDebris = import('/lua/sim/DefaultProjectiles.lua').BaseGenericDebris
local EffectTemplates = import('/lua/EffectTemplates.lua')

ARMSOLAR_debris = Class(BaseGenericDebris) {
    FxImpactLand = EffectTemplates.GenericDebrisLandImpact01,
    FxTrails = {
	'/effects/emitters/debris_smoke_emit.bp',
	'/effects/emitters/debrisfire_smoke_emit.bp',
    },
}

TypeClass = ARMSOLAR_debris

