return { 
	shieldbomb = {
		unitname               = [[shieldbomb]],
		name                   = [[Parcel]],
		description            = [[Crawling Cluster Bomb (Burrows)]],
		acceleration           = 0.75,
		activateWhenBuilt      = true,
		brakeRate              = 2.4,
		buildCostMetal         = 160,
		buildPic               = [[shieldbomb.png]],
		canGuard               = true,
		canMove                = true,
		canPatrol              = true,
		category               = [[LAND TOOFAST]],
		cloakCost              = 0,
		collisionVolumeOffsets = [[0 0 0]],
		collisionVolumeScales  = [[16 16 16]],
		collisionVolumeType    = [[ellipsoid]],
		selectionVolumeOffsets = [[0 0 0]],
		selectionVolumeScales  = [[28 28 28]],
		selectionVolumeType    = [[ellipsoid]],
		corpse                 = [[DEAD]],

		customParams           = {
			modelradius    = [[7]],
			idle_cloak = 1,
			selection_scale = 1, -- Maybe change later
		},

		explodeAs              = [[shieldbomb_DEATH]],
		fireState              = 0,
		footprintX             = 2,
		footprintZ             = 2,
		iconType               = [[walkerbomb]],
		idleAutoHeal           = 5,
		idleTime               = 1800,
		kamikaze               = true,
		kamikazeDistance       = 80,
		kamikazeUseLOS         = true,
		leaveTracks            = true,
		maxDamage              = 60,
		maxSlope               = 36,
		maxVelocity            = 3.9,
		maxWaterDepth          = 15,
		movementClass          = [[SKBOT2]],
		noChaseCategory        = [[FIXEDWING LAND SINK TURRET SHIP SWIM GUNSHIP FLOAT SUB HOVER]],
		objectName             = [[logroach.s3o]],
		pushResistant          = 0,
		script                 = [[shieldbomb.lua]],
		selfDestructAs         = [[shieldbomb_DEATH]],
		selfDestructCountdown  = 0,
		sfxtypes               = {
			explosiongenerators = {
				[[custom:RAIDMUZZLE]],
				[[custom:VINDIBACK]],
				[[custom:digdig]],
			},
		},

		sightDistance          = 240,
		trackOffset            = 0,
		trackStrength          = 8,
		trackStretch           = 1,
		trackType              = [[ChickenTrackPointy]],
		trackWidth             = 20,
		turnRate               = 3600,
		featureDefs            = {
			DEAD      = {
				blocking         = false,
				featureDead      = [[HEAP]],
				footprintX       = 2,
				footprintZ       = 2,
				object           = [[logroach_dead.s3o]],
			},

			HEAP      = {
				blocking         = false,
				footprintX       = 2,
				footprintZ       = 2,
				object           = [[debris2x2c.s3o]],
			},
		},
--		weapons = {
--			{
--				def                = [[SHIELD]],
--			},
--		},
		weaponDefs = {
--			SHIELD = {
--				name                    = [[Energy Shield]],	
--				damage                  = {	
--					default = 10,	
--				},	
--				exteriorShield          = true,	
--				shieldAlpha             = 0.2,	
--				shieldBadColor          = [[1 0.1 0.1 1]],	
--				shieldGoodColor         = [[0.1 0.1 1 1]],	
--				shieldInterceptType     = 3,	
--				shieldPower             = 650,	
--				shieldPowerRegen        = 12,	
--				shieldPowerRegenEnergy  = 0.2,	
--				shieldRadius            = 50,	
--				shieldRepulser          = false,	
--				shieldStartingPower     = 850,	
--				smartShield             = true,	
--				visibleShield           = false,	
--				visibleShieldRepulse    = false,	
--				weaponType              = [[Shield]],	
--			},
			death = {
				name                    = [[Cluster Bomb Dispenser]],
				areaOfEffect            = 216,
				avoidFeature            = true,
				--cegTag                  = [[missiletrailred]],
				commandFire             = true,
				craterBoost             = 0,
				craterMult              = 0,

				customParams        = {
					light_camera_height = 3500,
					light_color = [[0.75 0.4 0.15]],
					light_radius = 220,
					blastwave_size = 25,
					blastwave_impulse = 1,
					blastwave_speed = 30,
					blastwave_life = 4,
					blastwave_lossfactor = 0.55,
					blastwave_damage = 1000,

					numprojectiles1 = 10, -- how many of the weapondef we spawn. OPTIONAL. Default: 1.
					projectile1 = "shieldbomb_fragment_dummy",
					--spreadradius = 8, -- used in clusters. OPTIONAL. Default: 100.
					clustervec1 = "randomxyz", -- accepted values: randomx, randomy, randomz, randomxy, randomxz, randomyz, random. OPTIONAL. default: random.
					keepmomentum1 = 0,
					timeoutspawn = 0,
					vradius1 = "-3,1,-3,3,3,3",
					noairburst = "Merkityksetön räjähdys", -- if true, this projectile will skip all airburst checks
					onexplode = "Sattuu ihan vitusti", -- if true, this projectile will cluster when it explodes
					spawndist = 69420, -- at what distance should we spawn the projectile(s)? REQUIRED.
				},

				damage                  = {
					default = 100,
				},

				explosionGenerator      = "custom:ROACHPLOSION",
				fireStarter             = 70,
				flightTime              = 3,
				impulseBoost            = 0,
				impulseFactor           = 0.4,
				interceptedByShieldType = 2,
				--model                   = [[wep_b_fabby.s3o]], --TODO: replace with SharkGameDev's better model. delete this once it's done.
				range                   = 340,
				reloadtime              = 45,
				smokeTrail              = true,
				soundHit                = [[explosion/shieldbomb_deploy]],
				soundHitVolume          = 100,
				soundStart              = [[weapon/cannon/cannon_fire3]],
				trajectoryHeight        = 1,
				texture2                = [[lightsmoketrail]],
				tolerance               = 8000,
				size = 0.1,
				turret                  = true,
				weaponType              = [[Cannon]],
				weaponVelocity          = 255,
			},
			
			FRAGMENT_DUMMY = {
				name                    = [[merkityksetön räjähdys]], -- nobody should read this anyways?
				accuracy                = 400,
				areaOfEffect            = 162,
				avoidFeature            = false,
				craterBoost             = 1,
				craterMult              = 2,
				cegTag                  = [[flamer]],
				customParams              = {

					numprojectiles1 = 1, -- how many of the weapondef we spawn. OPTIONAL. Default: 1.
					projectile1 = "shieldbomb_cluster_fragment",
					--spreadradius = 8, -- used in clusters. OPTIONAL. Default: 100.
					clustervec1 = "derpderpderpderpderpderpderpderpderpderp", -- accepted values: randomx, randomy, randomz, randomxy, randomxz, randomyz, random. OPTIONAL. default: random.
					keepmomentum1 = 1,
					timeoutspawn = 0,
					noairburst = "I belive I can fly...", -- if true, this projectile will skip all airburst checks
					spawndist = 69420, -- at what distance should we spawn the projectile(s)? REQUIRED.
					timeddeploy = 20,
					shield_damage = 100,
					bogus = 1
				},
				damage                  = {
					default = 0,
				},

				firestarter             = 180,
				impulseBoost            = 0,
				impulseFactor           = 0.4,
				interceptedByShieldType = 1,
				myGravity               = 0.1,
				noExplode               = true,
				model                   = [[wep_b_fabby.s3o]],
				projectiles             = 10,
				range                   = 900,
				reloadtime              = 12,
				rgbColor                = [[1 0.5 0.2]],
				size                    = 5,
				soundHit                = [[nosound]],
				soundStart              = [[weapon/cannon/wolverine_fire]],
				soundStartVolume        = 3.2,
				sprayangle              = 2500,
				turret                  = true,
				weaponType              = [[Cannon]],
				weaponVelocity          = 320,
			},
			
			cluster_fragment = {
				name                    = [[High Explosive Bomblet]],
				accuracy                = 200,
				areaOfEffect            = 128,
				craterBoost             = 10,
				craterMult              = 5,

				damage                  = {
					default = 100,
				},

				explosionGenerator      = [[custom:MEDMISSILE_EXPLOSION]],
				fireStarter             = 180,
				impulseBoost            = 0,
				impulseFactor           = 0.2,
				interceptedByShieldType = 2,
				model                   = [[wep_b_fabby.s3o]],
				range                   = 200,
				reloadtime              = 1,
				smokeTrail              = true,
				soundHit                = [[explosion/explosion_roach]],
				soundHitVolume          = 8,
				soundStart              = [[weapon/cannon/mini_cannon]],
				soundStartVolume        = 2,
				sprayangle              = 14400,
				turret                  = true,
				tolerance				= 32000,
				firetolerance			= 32000,
				weaponType              = [[Cannon]],
				weaponVelocity          = 400,
			},
		}
	} 
}
