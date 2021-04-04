return {
	["ataalaser_flattened"] = {
		groundsmoke = {
			class              = [[CSimpleParticleSystem]],
			count              = 2,
			ground             = true,
			unit               = true,
			properties = {
				airdrag            = 0.8,
				colormap           = [[0.2 0 0.25 1  0.4 0 0.7 1   0 0 0 0]],
				directional        = true,
				emitrot            = 70,
				emitrotspread      = 10,
				emitvector         = [[0, 1, 0]],
				gravity            = [[0, 0.5, 0]],
				numparticles       = 6,
				particlelife       = 12,
				particlelifespread = 24,
				particlesize       = 22,
				particlesizespread = 60,
				particlespeed      = 27,
				particlespeedspread = 6,
				pos                = [[0 r-10 r10, 0 r-10 r10, 0 r-10 r10]],
				sizegrowth         = 4.2,
				sizemod            = 1,
				texture            = [[smokesmall]],
			},
		},
		flash = {
			class              = [[CSimpleParticleSystem]],
			count              = 2,
			ground             = true,
			air                = true,
			properties = {
				airdrag            = 0.8,
				colormap           = [[0.25 0.35 1 0.01   0 0 0 0]],
				directional        = true,
				emitrot            = 30,
				emitrotspread      = 40,
				emitvector         = [[0, 1, 0]],
				gravity            = [[0, 2, 0]],
				numparticles       = 6,
				particlelife       = 24,
				particlelifespread = 24,
				particlesize       = 12,
				particlesizespread = 54,
				particlespeed      = 3,
				particlespeedspread = 21,
				pos                = [[0 r-10 r10, 0 r-10 r10, 0 r-10 r10]],
				sizegrowth         = 3,
				sizemod            = 1,
				texture            = [[flare]],
			},
		},
		flash2 = {
			class              = [[CSimpleParticleSystem]],
			count              = 1,
			ground             = true,
			air                = true,
			properties = {
				airdrag            = 0.8,
				colormap           = [[0.3 0.15 0.9 0.01   0 0 0 0]],
				directional        = 0,
				emitrot            = 0,
				emitrotspread      = 0,
				emitvector         = [[0, 1, 0]],
				gravity            = [[0, 0, 0]],
				numparticles       = 1,
				particlelife       = 23,
				particlelifespread = 6,
				particlesize       = 12,
				particlesizespread = 12,
				particlespeed      = 6,
				particlespeedspread = 11,
				pos                = [[0,15,0]],
				sizegrowth         = 1,
				sizemod            = 1.1,
				texture            = [[flare]],
			},
		},
		stacheln1 = {
			air                = true,
			class              = [[explspike]],
			count              = 8,
			ground             = true,
			water              = true,
			properties = {
				alpha              = 2,
				alphadecay         = 0.25,
				color              = [[0.15, 0.25, 1]],
				dir                = [[r20 r-15, r-15 r20, r20 r-15]],
				length             = 90,
				lengthgrowth       = -3,
				pos                = [[0, 1, 0]],
				width              = 180,
			},
		},
		funken = {
			class              = [[CSimpleParticleSystem]],
			count              = 5,
			ground             = true,
			air                = true,
			unit               = true,
			properties = {
				airdrag            = 1,
				colormap           = [[0.15 0.25 1 0.01  0.3 0.15 0.75 0.01   0 0 0 0.01]],
				directional        = true,
				emitrot            = 40,
				emitrotspread      = 50,
				emitvector         = [[0,1,0]],
				gravity            = [[0,0, 0]],
				numparticles       = 5,
				particlelife       = 27,
				particlelifespread = 34,
				particlesize       = 30,
				particlesizespread = 15,
				particlespeed      = 6,
				particlespeedspread = 9,
				pos                = [[0, 1, 0]],
				sizegrowth         = 0,
				sizemod            = 1.0,
				texture            = [[gunshot]],
			},
		},
		yudell = {
			air                = false,
			class              = [[CSimpleGroundFlash]],
			count              = 1,
			ground             = true,
			water              = false,
			properties = {
				colormap           = [[0.6 0.25 1 0.2  0.4 0.2 1 0.2    0 0 0 0]],
				size               = 240,
				sizegrowth         = [[-1.25]],
				texture            = [[groundflash]],
				ttl                = 60,
			},
		},
		yudell3 = {
			air                = false,
			class              = [[CSimpleGroundFlash]],
			count              = 1,
			ground             = true,
			water              = false,
			properties = {
				colormap           = [[1 1 0 0.2  1 .45 0 0.2     0 0 0 0]],
				size               = 60,
				sizegrowth         = [[-1.25]],
				texture            = [[groundflash]],
				ttl                = 60,
			},
		},
	},
}
