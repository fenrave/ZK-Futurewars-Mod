local name = "commweapon_heavyrifle_disrupt"
local weaponDef = {
	name                    = [[Heavy Disruption Rifle]],
	areaOfEffect            = 48,
	craterBoost             = 0,
	craterMult              = 0,

	customParams            = {
		is_unit_weapon = 1,
		muzzleEffectFire = [[custom:HEAVY_CANNON_MUZZLE]],
		miscEffectFire = [[custom:emg_shells_l]],
		timeslow_damageFactor = 2,
		light_color = [[1.3 0.5 1.6]],
		light_radius = 120,
		reaim_time = 1,
	},

	damage                  = {
		default = 125.1*.85,
	},

	edgeEffectiveness       = 0.5,
	explosionGenerator      = [[custom:BEAMWEAPON_HIT_PURPLE]],
	impulseBoost            = 0,
	impulseFactor           = 0.4,
	interceptedByShieldType = 1,
	myGravity               = 0.1,
	range                   = 320,
	reloadtime              = .5,
	rgbColor				= "0.9 0.1 0.9",
	soundHit                = [[weapon/aoe_aura2]],
	soundStart              = [[weapon/laser/heavydisruptor]],
	soundstartvolume		= 12,
	turret                  = true,
	weaponType              = [[Cannon]],
	weaponVelocity          = 450,
}

return name, weaponDef
