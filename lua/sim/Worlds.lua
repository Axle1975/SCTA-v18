maps = {
	{
		name = 'Generic',
		type = 'Generic',
		minWind = 0,
		maxWind = 2505,
		tidal = 20,
		surfaceMetal = 0.1,
		patchMetal = 2.0,
		mohoMetal = 6.2,
		mohoSurfaceMetal = 0.5,
	},
}

terrain = {
	{
		name = 'Generic',
		Geothermal = {
			modelAmount = 1,
			models = {
                    		'/env/common/props/generic_geothermal_prop.bp',
			},
			albedos = {
				'/env/common/splats/geothermal_marker.dds',
			},
		},
		Metal = {
			modelAmount = 3,
			models = {
				'/env/common/props/Green/rockmetal1_prop.bp',
				'/env/common/props/Green/rockmetal2_prop.bp',
				'/env/common/props/Green/rockmetal3_prop.bp',
			},
			albedos = {
				'/env/common/splats/metal_marker.dds',
				'/env/common/splats/metal_marker.dds',
				'/env/common/splats/metal_marker.dds',
			},
		},
		UWMetal = {
			modelAmount = 1,
			models = {
                    		'/env/common/props/generic_metal_prop.bp',
			},
			albedos = {
				'/env/common/splats/mass_marker.dds',
			},
			size = 2
		},
	},
}