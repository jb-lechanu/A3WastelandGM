// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_LightArmVeh.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"B_MRAP_01_hmg_F",
		"B_MRAP_01_gmg_F",
		"O_MRAP_02_hmg_F",
		"O_MRAP_02_gmg_F",
		"I_MRAP_03_hmg_F",
		"I_MRAP_03_gmg_F",
		"gm_gc_army_uaz469_dshkm",
		"gm_gc_army_uaz469_spg9",
		"gm_gc_bgs_uaz469_spg9",
		"gm_pl_army_uaz469_dshkm",
		"gm_ge_army_iltis_milan",
		"gm_ge_army_iltis_mg3"
	] call BIS_fnc_selectRandom;

	_missionType = "Light Armed Vehicle";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
