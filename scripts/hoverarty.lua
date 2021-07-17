include "constants.lua"

local base = piece 'base' 
local turret = piece 'turret' 
local gun = piece 'barrel1' 
local wheels = {piece 'frdirt', piece 'fldirt', piece 'rrdirt', piece 'rldirt'}
local frpontoon = piece 'frpontoon' 
local flpontoon = piece 'flpontoon' 
local rrpontoon = piece 'rrpontoon' 
local rlpontoon = piece 'rlpontoon' 
local flare = piece 'firepoint1' 

local smokePiece = {base, turret}

local RESTORE_DELAY = 4000

local delay = WeaponDefs[UnitDef.weapons[1].weaponDef].customParams.aimdelay
local beam_duration = WeaponDefs[UnitDef.weapons[1].weaponDef].beamtime * 1000

-- Signal definitions
local SIG_AIM = 2
local SIG_MOVE = 4

local curTerrainType = 4
local wobble = false
local reloading = false
local lastcheck = -1
--local turning = false

local turnrate = math.rad(20)

local function Tilt()
	while true do
		local angle1 = math.random(-15, 15)
		local angle2 = math.random(-15, 15)
		Turn(base, x_axis, math.rad(angle1*0.1), math.rad(1))
		Turn(base, z_axis, math.rad(angle2*0.1), math.rad(1))
		WaitForTurn(base, x_axis)
		WaitForTurn(base, z_axis)
	end
end

local function WobbleUnit()
	StartThread(Tilt)
	while true do
		if wobble == true then
			Move(base, y_axis, 2, 3)
		else
			Move(base, y_axis, -2, 3)
		end
		wobble = not wobble
		Sleep(1500)
	end
end

local function HoverFX()
	local emitType = 1024
	while true do
		if not Spring.GetUnitIsCloaked(unitID) then
			if (curTerrainType == 1 or curTerrainType == 2) and select(2, Spring.GetUnitPosition(unitID)) == 0 then
				emitType = 5
			else
				emitType = 1024
			end
			for i = 1, 4 do
				EmitSfx(wheels[i], emitType)
			end
		end
		Sleep(150)
	end
end

function script.setSFXoccupy(num)
	curTerrainType = num
end

function script.StopMoving()
	bMoving = 0
end

--[[function TurnThread()
	if turning and not Spring.GetUnitIsCloaked(unitID) then
		local x,y,z = Spring.GetUnitPosition(unitID)
		GG.PlayFogHiddenSound("Sounds/ambient/turretslow.wav", 38.5,x,y,z,0.1,0.1,0.1,1)
		Sleep(600)
	else
		Sleep(100)
	end
end]]

function TrackThread()
	local currentframe, trackingcompletedframe, diff, reloadFrame = 0, 999999999, 0, 0
	while true do
		trackingcompletedframe = Spring.GetUnitRulesParam(unitID, "specialReloadFrame") or -9999
		currentframe = Spring.GetGameFrame()
		diff = trackingcompletedframe - currentframe
		if diff <= 30 and diff > 0 and currentframe - lastcheck < 3 and not reloading then
			Spring.PlaySoundFile("Sounds/weapon/laser/trackercompleted.wav", 20.0, x, y, z, 1, 1, 1, 1)
			Sleep(33 * math.ceil((trackingcompletedframe - currentframe)/4))
		else
			Sleep(33)
		end
		_, _, reloadFrame = Spring.GetUnitWeaponState(unitID, 1)
		if reloadFrame then
			reloading = reloadFrame >= currentframe
			--Spring.Echo("TrackThread: Updated Reloading state: " .. tostring(reloading) .. "\nReloadFrame: " .. tostring(reloadFrame))
		end
	end
end

function script.Create()
	Hide(flare)
	StartThread(WobbleUnit)
	--StartThread(TurnThread)
	StartThread(TrackThread)
	--for i = 1, 4 do
		--Hide(wheels[i])
	--end
	StartThread(GG.Script.SmokeUnit, smokePiece)
	StartThread(HoverFX)
end

local function RestoreAfterDelay()
	Sleep(RESTORE_DELAY)
	Turn(turret, y_axis, 0, turnrate)
	Turn(gun, x_axis, 0, turnrate / 2)
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	GG.DontFireRadar_CheckAim(unitID)
	Turn(turret, y_axis, heading, turnrate)
	Turn(gun, x_axis, -pitch, turnrate)
	WaitForTurn(turret, y_axis)
	WaitForTurn(gun, x_axis)
	StartThread(RestoreAfterDelay)
	if num == 1 and not reloading then
		lastcheck = Spring.GetGameFrame()
		--Spring.Echo("Heading: " .. tostring(heading) .. "\nPitch: " .. tostring(pitch) .. "\nAimDelay: " .. tostring(GG.AimDelay_AttemptToFire(unitID, 1, heading, pitch, delay)))
		return GG.AimDelay_AttemptToFire(unitID, 1, heading, pitch, delay)
	elseif num == 1 and reloading then
		return false
	end
	return true
end

function script.BlockShot(num, targetID)
	if num == 1 then
		return (targetID and GG.DontFireRadar_CheckBlock(unitID, targetID)) and true or false
	elseif num == 2 then
		return reloading
	else
		return false
	end
end

function script.AimFromWeapon(num)
	return gun
end

function script.QueryWeapon(num)
	return flare
end

function script.FireWeapon(id)
	if id == 1 then
		GG.AimDelay_ForceWeaponRestart(unitID, 1) -- restart progress.
	end
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	if severity <= .25 then
		Explode(gun, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(base, SFX.NONE)
		Explode(turret, SFX.NONE)
		return 1
	elseif severity <= .50 then
		Explode(gun, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(base, SFX.NONE)
		Explode(turret, SFX.FALL)
		return 1
	elseif severity <= .99 then
		Explode(gun, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(base, SFX.NONE)
		Explode(turret, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(flpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(frpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(rlpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(rrpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		return 2
	else
		Explode(gun, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(base, SFX.NONE)
		Explode(turret, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(flpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(frpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(rlpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		Explode(rrpontoon, SFX.FALL + SFX.SMOKE + SFX.FIRE + SFX.EXPLODE_ON_HIT)
		return 2
	end
end
