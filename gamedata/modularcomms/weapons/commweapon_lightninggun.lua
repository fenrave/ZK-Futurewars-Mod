local name = "commweapon_lightninggun"
local weaponDef = {
	name                    = [[Light EMP Rifle]],
	areaOfEffect            = 40,
	cegtag					= [[artillery_spark_small_commander]],
	craterBoost             = 0,
	craterMult              = 0,
	--highTrajectory			= 1,
	burst					= 4,
	burstrate				= 0.2,
	customParams            = {
		is_unit_weapon = 1,
		extra_damage_mult = 2.5,
		slot = [[5]],
		muzzleeffectshot = [[custom:zeus_fire_fx]],

		light_camera_height = 1600,
		light_color = [[0.85 0.85 1.2]],
		light_radius = 200,
		reaim_time = 1,
	},
	cylinderTargeting       = 0,
	damage                  = {
		default = 85,
	},
	explosionGenerator      = [[custom:comm_shockhit]],
	edgeEffectiveness       = 0.05,
	paralyzeTime            = 1,
	impactOnly              = false,
	interceptedByShieldType = 1,
	range					= 340,
	myGravity               = 0.02,
	reloadtime              = 2,
	soundHit                = [[weapon/cannon/emp_arty_hit]],
	soundStart              = [[weapon/emp/commweapon_emplight_fire]],
	size					= 0.01,
	turret                  = true,
	weaponType              = [[Cannon]],
	weaponVelocity          = 600,
}

return name, weaponDef
