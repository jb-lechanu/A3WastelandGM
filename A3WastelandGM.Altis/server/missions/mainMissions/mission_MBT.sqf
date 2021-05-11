// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_MBT.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"B_MBT_01_cannon_F",
		"O_MBT_02_cannon_F",
		"I_MBT_03_cannon_F",
		"gm_gc_army_t55",
		"gm_gc_army_t55a",
		"gm_gc_army_t55ak",
		"gm_gc_army_t55am2",
		"gm_gc_army_t55am2b",
		"gm_pl_army_t55",
		"gm_pl_army_t55a",
		"gm_pl_army_t55ak",
		"gm_dk_army_Leopard1a3",
		"gm_ge_army_Leopard1a1",
		"gm_ge_army_Leopard1a1a1",
		"gm_ge_army_Leopard1a1a2",
		"gm_ge_army_Leopard1a1a3",
		"gm_ge_army_Leopard1a1a4",
		"gm_ge_army_Leopard1a3",
		"gm_ge_army_Leopard1a3a1",
		"gm_ge_army_Leopard1a3a2",
		"gm_ge_army_Leopard1a3a3",
		"gm_ge_army_Leopard1a5"
	] call BIS_fnc_selectRandom;

	_missionType = "Main Battle Tank";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
