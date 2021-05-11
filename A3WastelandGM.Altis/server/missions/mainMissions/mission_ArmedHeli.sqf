// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"B_Heli_Light_01_armed_F",
		"B_Heli_Transport_01_F",
		"B_Heli_Attack_01_F",
		"O_Heli_Light_02_F",
		"O_Heli_Attack_02_F",
		"I_Heli_light_03_F",
		"gm_gc_airforce_mi2urn_beg",
		"gm_gc_airforce_mi2urn_brb",
		"gm_gc_airforce_mi2urn_brg",
		"gm_gc_airforce_mi2urn_grg",
		"gm_gc_airforce_mi2urn_grn",
		"gm_gc_airforce_mi2urn_un",
		"gm_gc_airforce_mi2urn_wdl",
		"gm_gc_airforce_mi2us_beg",
		"gm_gc_airforce_mi2us_brb",
		"gm_gc_airforce_mi2us_brg",
		"gm_gc_airforce_mi2us_grg",
		"gm_gc_airforce_mi2us_grn",
		"gm_gc_airforce_mi2us_un",
		"gm_gc_airforce_mi2us_wdl",
		"gm_gc_bgs_mi2us_oli",
		"gm_gc_bgs_mi2us_beg",
		"gm_gc_bgs_mi2us_brg",
		"gm_pl_airforce_mi2ch_bgb",
		"gm_pl_airforce_mi2ch_flp",
		"gm_pl_airforce_mi2ch_oli",
		"gm_pl_airforce_mi2ch_un",
		"gm_pl_airforce_mi2ch_wdl",
		"gm_pl_airforce_mi2urn_bgb",
		"gm_pl_airforce_mi2urn_flp",
		"gm_pl_airforce_mi2urn_oli",
		"gm_pl_airforce_mi2urn_un",
		"gm_pl_airforce_mi2urn_wdl",
		"gm_pl_airforce_mi2urp_bgb",
		"gm_pl_airforce_mi2urp_flp",
		"gm_pl_airforce_mi2urp_oli",
		"gm_pl_airforce_mi2urp_un",
		"gm_pl_airforce_mi2urp_wdl",
		"gm_pl_airforce_mi2urpg_bgb",
		"gm_pl_airforce_mi2urpg_flp",
		"gm_pl_airforce_mi2urpg_oli",
		"gm_pl_airforce_mi2urpg_un",
		"gm_pl_airforce_mi2urpg_wdl",
		"gm_pl_airforce_mi2urs_bgb",
		"gm_pl_airforce_mi2urs_flp",
		"gm_pl_airforce_mi2urs_oli",
		"gm_pl_airforce_mi2urs_un",
		"gm_pl_airforce_mi2urs_wdl",
		"gm_pl_airforce_mi2us_bgb",
		"gm_pl_airforce_mi2us_flp",
		"gm_pl_airforce_mi2us_oli",
		"gm_pl_airforce_mi2us_un",
		"gm_pl_airforce_mi2us_wdl",
		"gm_ge_army_bo105p_pah1_n83",
		"gm_ge_army_bo105p_pah1_n84",
		"gm_ge_army_bo105p_pah1_oli",
		"gm_ge_army_bo105p_pah1_un",
		"gm_ge_army_bo105p_pah1a1_n83",
		"gm_ge_army_bo105p_pah1a1_n84",
		"gm_ge_army_bo105p_pah1a1_oli",
		"gm_ge_army_bo105p_pah1a1_un",
		"gm_ge_army_bo105p_pah1a1_n83",
		"gm_ge_army_bo105p_pah1a1_n84",
		"gm_ge_army_bo105p_pah1a1_oli",
		"gm_ge_army_bo105p_pah1a1_un"
	] call BIS_fnc_selectRandom;

	_missionType = "Armed Helicopter";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
