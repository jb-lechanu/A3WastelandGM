// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_Truck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_vehicleClass", "_vehicle"];

_setupVars =
{
	_missionType = "Supply Truck";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;

	_vehicleClass =
	[
		"gm_gc_army_ural375d_medic",
		"gm_gc_army_ural375d_refuel",
		"gm_gc_army_ural4320_cargo",
		"gm_gc_army_ural4320_reammo",
		"gm_gc_army_ural4320_repair",
		"gm_gc_army_ural44202"
	] call BIS_fnc_selectRandom;

	// Class, Position, Fuel, Ammo, Damage, Special
	_vehicle = [_vehicleClass, _missionPos] call createMissionVehicle;
	_vehicle call fn_refilltruck;

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_missionHintText = format ["A <t color='%2'>%1</t> has been immobilized, go get it for your team.", _vehicleName, sideMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = {!alive _vehicle};

_failedExec =
{
	// Mission failed
	deleteVehicle _vehicle;
};

_successExec =
{
	// Mission completed
	[_vehicle, 1] call A3W_fnc_setLockState; // Unlock

	_successHintMessage = "The truck has been captured, well done.";
};

_this call sideMissionProcessor;
