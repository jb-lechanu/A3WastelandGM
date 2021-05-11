// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_CivHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = 
	[
		"I_Heli_Transport_02_F", 
		"B_Heli_Transport_03_unarmed_F", 
		"O_Heli_Transport_04_bench_F",
		"gm_gc_airforce_mi2p"
		"gm_gc_airforce_mi2sr",
		"gm_gc_airforce_mi2t",
		"gm_gc_bgs_mi2p",
		"gm_pl_airforce_mi2p",
		"gm_pl_airforce_mi2sr",
		"gm_pl_airforce_mi2t",
		"gm_ge_pol_bo105m_vbh",
		"gm_gc_civ_mi2p",
		"gm_gc_civ_mi2r",
		"gm_gc_civ_mi2sr",
		"gm_ge_bgs_bo105_vbh",
		"gm_ge_army_bo105m_vbh",
		"gm_ge_army_bo105p1m_vbh",
		"gm_ge_army_bo105p1m_vbh_swooper",
		"gm_ge_army_ch53g",
		"gm_ge_army_ch53gs"
	] call BIS_fnc_selectRandom;

	_missionType = "Transport Helicopter";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
