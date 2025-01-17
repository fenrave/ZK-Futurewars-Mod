return { 
	plateship = {
		unitname                      = [[plateship]],
		name                          = [[Ship Plate]],
		description                   = [[Parallel Unit Production]],
		acceleration                  = 0,
		brakeRate                     = 0,
		buildCostMetal                = Shared.FACTORY_PLATE_COST,
		buildDistance                 = Shared.FACTORY_PLATE_RANGE,
		builder                       = true,
		buildoptions                  = {
			[[shipcon]],
			[[shipscout]],
			[[shiptorpraider]],
			[[subraider]],
			[[shipriot]],
			[[shipskirm]],
			[[shipassault]],
			[[shiparty]],
			[[shipaa]],
			[[subscout]],
		},
		buildPic                      = [[plateship.png]],
		canMove                       = true,
		canPatrol                     = true,
		category                      = [[UNARMED FLOAT]],
		collisionVolumeOffsets        = [[-34 8 5]],
		collisionVolumeScales         = [[30 30 130]],
		collisionVolumeType           = [[cylZ]],
		selectionVolumeOffsets        = [[-6 0 5]],
		selectionVolumeScales         = [[98 50 120]],
		selectionVolumeType           = [[box]],
		corpse                        = [[DEAD]],

		customParams                  = {
			sortName               = [[7]],
			unstick_help           = 1,
			aimposoffset           = [[30 0 -5]],
			midposoffset           = [[0 0 -5]],
			solid_factory          = [[2]],
			modelradius            = [[50]],
			solid_factory_rotation = [[1]], -- 90 degrees counter clockwise
			default_spacing        = 4,
			selectionscalemult     = 1,
			cus_noflashlight       = 1,
			child_of_factory       = [[factoryship]],
		},

		energyUse                     = 0,
		explodeAs                     = [[FAC_PLATEEX]],
		footprintX                    = 6,
		footprintZ                    = 8,
		iconType                      = [[padship]],
		idleAutoHeal                  = 5,
		idleTime                      = 1800,
		maxDamage                     = Shared.FACTORY_PLATE_HEALTH * 2,
		maxSlope                      = 15,
		maxVelocity                   = 0,
		minCloakDistance              = 150,
		minWaterDepth                 = 15,
		moveState                     = 1,
		objectName                    = [[plate_ship.s3o]],
		script                        = [[plateship.lua]],
		selfDestructAs                = [[FAC_PLATEEX]],
		showNanoSpray                 = false,
		sightDistance                 = 850,
		sonarDistance                 = 850,
		turnRate                      = 0,
		waterline                     = 0,
		workerTime                    = Shared.FACTORY_BUILDPOWER,
		yardMap                       = [[ooyyyy ooyyyy ooyyyy ooyyyy ooyyyy ooyyyy ooyyyy ooyyyy]],
		featureDefs            = {
			DEAD  = {
				blocking         = false,
				featureDead      = [[HEAP]],
				footprintX       = 6,
				footprintZ       = 8,
				object           = [[plate_ship_dead.s3o]],
			},
			HEAP  = {
				blocking         = false,
				footprintX       = 6,
				footprintZ       = 8,
				object           = [[debris4x4c.s3o]],
			},
		},
	} 
}
