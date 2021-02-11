function widget:GetInfo()
	return {
		name      = "Commander Alerts",
		desc      = "Dynamic Commander Alerts.",
		author    = "Shaman",
		date      = "2/11/2021",
		license   = "CC-0",
		layer     = 1,
		enabled   = true  --  loaded by default?
	}
end

local delays = {
	damage = 12*30,
	capture = 12*30,
	critical = 8*30,
	criticalcapture = 8*30,
}

local globalcooldown = 0
local lastwarning = {}
local commanders = {}
local frame = -1
local criticalratio = 0.12
local criticalcaptureratio = 0.8

local spGetUnitRulesParam = Spring.GetUnitRulesParam
local spGetMyTeamID = Spring.GetMyTeamID
local spPlaySoundFile = Spring.PlaySoundFile
local spGetUnitHealth = Spring.GetUnitHealth
local spSetLastMessagePosition = Spring.SetLastMessagePosition
local spGetUnitPosition = Spring.GetUnitPosition
local spEcho = Spring.Echo
local max = math.max
local sounddir = 'sounds/reply/advisor/'

local function PlaySound(file, vol)
	spPlaySoundFile(sounddir .. file, vol, 'userinterface')
end

local function AddToConsole(str)
	spEcho("game_message: " .. str)
end

function widget:GameFrame(f)
	frame = f
end

function widget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
	if spGetUnitRulesParam(unitID, "comm_level") and unitTeam == spGetMyTeamID() then
		commanders[unitID] = 0 -- store last capture damage here.
		if lastwarning[unitID] == nil then
			lastwarning[unitID] = {capture = -1, critical = -1, damage = -1, criticalcapture = -1}
		end
	end
end

function widget:UnitDestroyed(unitID)
	if commanders[unitID] then
		local morphed = spGetUnitRulesParam(unitID, "wasMorphedTo")
		if morphed then
			lastwarning[morphed] = lastwarning[unitID]
		end
		lastwarning[unitID] = nil
		commanders[unitID] = nil
	end
end

function widget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
	if commanders[unitID] then
		commanders[unitID] = nil
		lastwarning[unitID] = nil
	end
end

function widget:UnitGiven(unitID, unitDefID, newTeam, oldTeam)
	if spGetUnitRulesParam(unitID, "comm_level") and newTeam == spGetMyTeamID() then
		commanders[unitID] = 0
		lastwarning[unitID] = {capture = -1, critical = -1, damage = -1, criticalcapture = -1}
	end
end

function widget:UnitDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam) -- TODO: disarm and slow
	if commanders[unitID] then
		local lastcapture = commanders[unitID]
		local hp, maxhp, _, capture = spGetUnitHealth(unitID)
		local x, y, z = Spring.GetUnitPosition(unitID)
		local myname = spGetUnitRulesParam(unitID, "comm_name") or "Unknown Commander"
		if damage > 0 then
			local hpratio = hp/maxhp
			if hpratio < criticalratio and lastwarning[unitID].critical < frame and globalcooldown < frame then
				PlaySound('systemfailureimminent.wav', 1)
				lastwarning[unitID].critical = frame + delays.critical
				globalcooldown = frame + 270 -- 4s before next warning
				AddToConsole(myname .. " is low on HP!")
				spSetLastMessagePosition(x, y, z)
			elseif hpratio > criticalratio and lastwarning[unitID].damage < frame and globalcooldown < frame then
				PlaySound('armordamage.wav', 1)
				lastwarning[unitID].damage = frame + delays.damage
				globalcooldown = frame + 270 -- 4s before next warning
				AddToConsole(myname .. " is under attack.")
				spSetLastMessagePosition(x, y, z)
			end
		elseif capture > lastcapture then -- we're getting captured!
			commanders[unitID] = capture
			if lastwarning[unitID].capture < frame and capture < criticalcaptureratio and globalcooldown < frame then
				PlaySound('alertcapture.wav', 1)
				lastwarning[unitID].capture = frame + delays.capture
				globalcooldown = frame + 270 -- 4s before next warning
				AddToConsole(myname .. " is being captured.")
				spSetLastMessagePosition(x, y, z)
			elseif lastwarning[unitID].criticalcapture < frame and capture > criticalcaptureratio and globalcooldown < frame then
				PlaySound('alertcapturecritical.wav', 1)
				lastwarning[unitID].criticalcapture = frame + delays.criticalcapture
				AddToConsole(myname .. " is about to be captured!")
				spSetLastMessagePosition(x, y, z)
				globalcooldown = frame + 270 -- 4s before next warning
			end
		end
	end
end
