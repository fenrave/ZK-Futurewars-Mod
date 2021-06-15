return { 
	tankheavyassault = {
		unitname            = [[tankheavyassault]],
		name                = [[Colossus]],
		description         = [[Near-Impervious Assault Tank]],
		acceleration        = 0.17,
		brakeRate           = 0.624,
		buildCostMetal      = 5400,
		builder             = false,
		buildPic            = [[tankheavyassault.png]],
		canGuard            = true,
		canMove             = true,
		canPatrol           = true,
		category            = [[LAND]],
		corpse              = [[DEAD]],

		customParams        = {
			bait_level_default = 0,
			decloak_footprint  = 5,
			nanoregen = 25,
			nano_maxregen = 8,
			extradrawrange = 300,
			dontfireatradarcommand = '1',
		},

		explodeAs           = [[BIG_UNIT]],
		footprintX          = 4,
		footprintZ          = 4,
		iconType            = [[tankskirm]],
		idleAutoHeal        = 5,
		idleTime            = 1800,
		leaveTracks         = true,
		maxDamage           = 24000,
		maxSlope            = 18,
		maxVelocity         = 1.3,
		maxWaterDepth       = 22,
		movementClass       = [[TANK4]],
		noAutoFire          = false,
		noChaseCategory     = [[TERRAFORM FIXEDWING SATELLITE GUNSHIP SUB]],
		objectName          = [[corgol_512.s3o]],
		script              = [[tankheavyassault.lua]],
		selfDestructAs      = [[BIG_UNIT]],

		sfxtypes            = {

			explosiongenerators = {
				[[custom:LARGE_MUZZLE_FLASH_FX]],
			},
		},
		
		sightDistance       = 540,
		trackOffset         = 8,
		trackStrength       = 10,
		trackStretch        = 1,
		trackType           = [[StdTank]],
		trackWidth          = 50,
		turninplace         = 0,
		turnRate            = 500,
		workerTime          = 0,

		weapons             = {
			{
				def                = [[CANNON]],
				badTargetCategory  = [[FIXEDWING GUNSHIP]],
				onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP FIXEDWING]],
			},
			{
				def                = [[SLOWBEAM]],
				badTargetCategory  = [[FIXEDWING UNARMED]],
				onlyTargetCategory = [[FIXEDWING LAND SINK TURRET SHIP SWIM FLOAT GUNSHIP HOVER]],
			},
		},

		weaponDefs          = {
			CANNON = {
				name                    = [[Oblivion Cannon]],
				accuracy                = 0,
				areaOfEffect            = 50,
				avoidFeature            = false,
				avoidGround             = true,
				craterBoost             = 0,
				craterMult              = 0,

				customParams            = {
					restrict_in_widgets = 1,
					light_color = [[3 2.33 1.5]],
					light_radius = 150,
					light_camera_height = 3500,
					light_color = [[0.75 0.4 0.15]],
					light_radius = 220,
					numprojectiles1 = 10, -- how many of the weapondef we spawn. OPTIONAL. Default: 1.
					projectile1 = "tankheavyassault_fragment_dummy",
					--spreadradius = 8, -- used in clusters. OPTIONAL. Default: 100.
					clustervec1 = "randomxyz", -- accepted values: randomx, randomy, randomz, randomxy, randomxz, randomyz, random. OPTIONAL. default: random.
					keepmomentum1 = 0,
					timeoutspawn = 0,
					vradius1 = "-2.5,3,-2.5,2.5,6,2.5",
					noairburst = "March of progress", -- if true, this projectile will skip all airburst checks
					onexplode = "The unity prevails", -- if true, this projectile will cluster when it explodes
					spawndist = 69420, -- at what distance should we spawn the projectile(s)? REQUIRED.
					stats_damage = 3000,
					shield_damage = (100*10) + 3000,
				},

				damage                  = {
					default = 3000.2,
				},
				
				explosionGenerator      = [[custom:100rlexplode]],
				edgeEffectiveness		= 0.1,
				fireTolerance           = 1820, -- 10 degrees
				impulseBoost            = 2,
				impulseFactor           = 1.3,
				interceptedByShieldType = 1,
				noSelfDamage            = true,
				range                   = 680,
				reloadtime              = 8,
				rgbColor                = [[0.615 0.447 0.412]],
				soundHit                = [[weapon/cannon/tankbuster_hit]],
				soundStart              = [[weapon/cannon/heavy_sonic]],
				size                    = 12,
				turret                  = true,
				weaponType              = [[Cannon]],
				weaponVelocity          = 1200,
			},
			FRAGMENT_DUMMY = {
				name                    = [[Fragment]],
				accuracy                = 400,
				areaOfEffect            = 162,
				avoidFeature            = false,
				craterBoost             = 1,
				craterMult              = 2,
				--cegTag                  = [[flamer]],
				customParams              = {

					numprojectiles1 = 1, -- how many of the weapondef we spawn. OPTIONAL. Default: 1.
					projectile1 = "tankheavyassault_final",
					--spreadradius = 8, -- used in clusters. OPTIONAL. Default: 100.
					clustervec1 = "derpderpderpderpderpderpderpderpderpderp", -- accepted values: randomx, randomy, randomz, randomxy, randomxz, randomyz, random. OPTIONAL. default: random.
					keepmomentum1 = 1,
					timeoutspawn = 0,
					noairburst = "Burning time", -- if true, this projectile will skip all airburst checks
					spawndist = 69420, -- at what distance should we spawn the projectile(s)? REQUIRED.
					timeddeploy = 3,

					--lups_heat_fx = [[firewalker]],
					light_camera_height = 2500,
					light_color = [[0.25 0.13 0.05]],
					light_radius = 500,
					shield_damage = 100,
				},
				damage                  = {
					default = 0,
				},

				--explosionGenerator      = [[custom:napalm_firewalker_small]],
				firestarter             = 180,
				impulseBoost            = 0,
				impulseFactor           = 0.4,
				interceptedByShieldType = 1,
				myGravity               = 0.33,
				noExplode               = true,
				projectiles             = 10,
				range                   = 900,
				reloadtime              = 12,
				rgbColor                = [[1 0.95 0.4]],
				size 					= 6,
				soundHit                = [[nosound]],
				soundStart              = [[weapon/cannon/frag_impact]],
				soundStartVolume        = 3.2,
				sprayangle              = 2500,
				turret                  = true,
				weaponType              = [[Cannon]],
				weaponVelocity          = 320,
			},
			FINAL = {
				name                    = [[Flechette]],
				--cegTag                  = [[flak_trail]],
				areaOfEffect            = 96,
				alphaDecay              = 0.7,
				coreThickness           = 0.5,
				craterBoost             = 0,
				craterMult              = 0,

				customParams            = {
					light_camera_height = 2000,
					light_color = [[1 0.2 0.2]],
					light_radius = 128,
					reaim_time = 8, -- COB
					isaa = [[1]],
					light_radius = 0,
					isFlak = 3,
					flaktime = 15,
				},

				damage = {
					default = 100,
				},
				--interceptor = 2,
				edgeEffectiveness       = 0.8,
				--duration                = 0.02,
				explosionGenerator      = [[custom:EMG_HIT_HE]],
				fireStarter             = 50,
				heightMod               = 1,
				impulseBoost            = 0,
				impulseFactor           = 0.4,
				interceptedByShieldType = 1,
				range                   = 300,
				reloadtime              = 0.8,
				rgbColor                = [[1 0.95 0.4]],
				soundHit                = [[explosion/ex_med6]],
				soundHitVolume	        = 0.4,
				--soundTrigger            = true,
				sprayangle              = 1500,
				size 					= 6,
				thickness               = 6,
				tolerance               = 10000,
				turret                  = true,
				weaponType              = [[Cannon]],
				weaponVelocity          = 920,
				--coverage = 1000,
			},
			SLOWBEAM = {
				name                    = [[Disruptor Pulse MG]],
				areaOfEffect            = 60,
				duration                = 3,
				craterBoost             = 0,
				craterMult              = 0,
				coreThickness			= 0.5,
				collisionsize			= 0.8,
				customParams            = {
					timeslow_damagefactor = 1.4,
					light_camera_height = 2000,
					light_color = [[0.85 0.33 1]],
					light_radius = 120,
				},
				damage                  = {
					default = 30,
				},
				explosionGenerator      = [[custom:riotballplus2_purple_small60]],
				explosionSpeed          = 5,
				fireStarter             = 100,
				impulseBoost            = 0,
				impulseFactor           = 0,
				interceptedByShieldType = 1,
				minIntensity            = 1,
				noSelfDamage            = true,
				myGravity               = 0.11,
				range                   = 300,
				reloadtime              = 1/6,
				rgbColor                = [[0.3 0 0.4]],
				soundHit				= [[weapon/aoe_aura2]],
				soundHitVolume          = 2.2,
				soundStart              = [[weapon/laser/disruptor_mg_fire]],
				soundStartVolume        = 3.5,
				stages                  = 10,
				separation              = 1.5,
				size					= 4.5,
				tolerance               = 18000,
				turret                  = true,
				weaponType              = [[Cannon]],
				weaponVelocity          = 620,
			},
		},
		featureDefs         = {
			DEAD = {
				blocking         = true,
				featureDead      = [[HEAP]],
				footprintX       = 4,
				footprintZ       = 4,
				object           = [[golly_d.s3o]],
			},
			HEAP = {
				blocking         = false,
				footprintX       = 4,
				footprintZ       = 4,
				object           = [[debris4x4c.s3o]],
			},

		},
	}
}
