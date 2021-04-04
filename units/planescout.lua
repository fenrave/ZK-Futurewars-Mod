return { 
	planescout = {
		unitname            = [[planescout]],
		name                = [[Agitator]],
		description         = [[Area Jamming Spy Plane]],
		brakerate           = 0.4,
		buildCostMetal      = 350,
		builder             = false,
		buildPic            = [[planescout.png]],
		canFly              = true,
		canGuard            = true,
		canMove             = true,
		canPatrol           = true,
		canSubmerge         = false,
		category            = [[UNARMED FIXEDWING]],
		collide             = false,
		collisionVolumeOffsets = [[0 0 0]],
		collisionVolumeScales  = [[35 12 60]],
		collisionVolumeType    = [[box]],
		corpse              = [[DEAD]],
		cruiseAlt           = 400,
		customParams        = {
			modelradius       = [[20]],
			specialreloadtime = [[600]],
			refuelturnradius  = [[120]],
			priority_misc     = 2, -- High
		},
		energyUse           = 1.5,
		explodeAs           = [[GUNSHIPEX]],
		floater             = true,
		footprintX          = 3,
		footprintZ          = 3,
		iconType            = [[radarplane]],
		idleAutoHeal        = 5,
		idleTime            = 1800,
		maxAcc              = 0.5,
		maxDamage           = 1400,
		maxAileron          = 0.018,
		maxElevator         = 0.02,
		maxRudder           = 0.018,
		maxVelocity         = 12,
		noAutoFire          = false,
		noChaseCategory     = [[TERRAFORM SATELLITE FIXEDWING GUNSHIP HOVER SHIP SWIM SUB LAND FLOAT SINK TURRET]],
		objectName          = [[armpnix.s3o]],
		radarDistance       = 2400,
		radarDistanceJam    = 700,
		script              = [[planescout.lua]],
		selfDestructAs      = [[GUNSHIPEX]],
		sightDistance       = 1400,
		sonarDistance       = 1400,
		turnRadius          = 60,
		workerTime          = 0,

		featureDefs         = {

			DEAD = {
				blocking         = true,
				featureDead      = [[HEAP]],
				footprintX       = 2,
				footprintZ       = 2,
				collisionVolumeOffsets = [[0 0 0]],
				collisionVolumeScales  = [[35 12 60]],
				collisionVolumeType    = [[box]],
				object           = [[armpnix_dead.s3o]],
			},
			HEAP = {
				blocking         = false,
				footprintX       = 2,
				footprintZ       = 2,
				object           = [[debris2x2b.s3o]],
			},
		},
	} 
}
