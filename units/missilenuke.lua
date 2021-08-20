return { 
	missilenuke = {
		unitname                      = [[missilenuke]],
		name                          = [[Silencer Mk III]],
		description                   = [[Nuclear Cruise Missile]],
		buildCostMetal                = 4500,
		builder                       = false,
		buildingGroundDecalDecaySpeed = 30,
		buildingGroundDecalSizeX      = 3,
		buildingGroundDecalSizeY      = 3,
		buildingGroundDecalType       = [[seismic_aoplane.dds]],
		buildPic                      = [[tacnuke.png]],
		category                      = [[SINK UNARMED]],
		collisionVolumeOffsets        = [[0 75 -50]],
		collisionVolumeScales         = [[20 50 20]],
		collisionVolumeType           = [[CylY]],

		customParams                  = {
			mobilebuilding = [[1]],
		},

		explodeAs                     = [[CRBLMSSL]],
		footprintX                    = 1,
		footprintZ                    = 1,
		iconType                      = [[cruisemissilenuclear]],
		idleAutoHeal                  = 5,
		idleTime                      = 1800,
		maxDamage                     = 4000,
		maxSlope                      = 18,
		minCloakDistance              = 150,
		objectName                    = [[crblmsslr.s3o]],
		script                        = [[missilenuke.lua]],
		selfDestructAs                = [[CRBLMSSL]],

		sfxtypes                      = {
			explosiongenerators = {
				[[custom:RAIDMUZZLE]],
			},
		},
		sightDistance                 = 0,
		useBuildingGroundDecal        = false,
		yardMap                       = [[o]],
		selectionVolumeScales  = [[20 50 20]],
		selectionVolumeType    = [[box]],
		weapons                       = {
			{
				def                = [[CRBLMSSL]],
				badTargetCategory  = [[SWIM LAND SHIP HOVER]],
				onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER]],
			},
		},

		weaponDefs                    = {
			CRBLMSSL = {
				name                    = [[Nuclear Missile]],
				areaOfEffect            = 1920,
				cegTag                  = [[NUCKLEARMINI]],
				collideFriendly         = false,
				collideFeature          = false,
				commandfire             = true,
				craterBoost             = 6,
				craterMult              = 6,

				customParams              = {
					light_color = [[2.92 2.64 1.76]],
					light_radius = 3000,
					cruisealt = 1800,
					cruisedist = 800,
					reveal_unit = 20,
				},

				damage                  = {
					default = 11000.1,
				},

				edgeEffectiveness       = 0.3,
				explosionGenerator      = [[custom:LONDON_FLAT]],      -- note, spawning of the explosion is handled by exp_nuke_effect_chooser.lua
				fireStarter             = 0,
				flightTime              = 180,
				impulseBoost            = 0.5,
				impulseFactor           = 0.2,
				interceptedByShieldType = 65,
				model                   = [[crblmsslr.s3o]],
				noSelfDamage            = false,
				range                   = 9000,
				reloadtime              = 10,
				smokeTrail              = false,
				soundHit                = [[explosion/ex_ultra8]],
				startVelocity           = 800,
				turnrate                = 18000,
				tracks                  = true,
				targetable              = 1,
				texture1                = [[null]], --flare
				tolerance               = 4000,
				weaponAcceleration      = 0,
				weaponType              = [[StarburstLauncher]],
				weaponVelocity          = 800,
			},
		},
		featureDefs                   = {},
	} 
}