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
		"gm_gc_army_ural375d_medic_oli",
		"gm_gc_army_ural375d_medic_ols",
		"gm_gc_army_ural375d_medic_olw",
		"gm_gc_army_ural375d_medic_un",
		"gm_gc_army_ural375d_medic_wdl",
		"gm_gc_army_ural375d_medic_win",
		"gm_gc_army_ural375d_refuel_oli",
		"gm_gc_army_ural375d_refuel_ols",
		"gm_gc_army_ural375d_refuel_olw",
		"gm_gc_army_ural375d_refuel_un",
		"gm_gc_army_ural375d_refuel_wdl",
		"gm_gc_army_ural375d_refuel_win",
		"gm_gc_army_ural4320_cargo_oli",
		"gm_gc_army_ural4320_cargo_ols",
		"gm_gc_army_ural4320_cargo_olw",
		"gm_gc_army_ural4320_cargo_un",
		"gm_gc_army_ural4320_cargo_wdl",
		"gm_gc_army_ural4320_cargo_win",
		"gm_gc_army_ural4320_reammo_oli",
		"gm_gc_army_ural4320_reammo_ols",
		"gm_gc_army_ural4320_reammo_olw",
		"gm_gc_army_ural4320_reammo_un",
		"gm_gc_army_ural4320_reammo_wdl",
		"gm_gc_army_ural4320_reammo_win",
		"gm_gc_army_ural4320_repair_oli",
		"gm_gc_army_ural4320_repair_ols",
		"gm_gc_army_ural4320_repair_olw",
		"gm_gc_army_ural4320_repair_un",
		"gm_gc_army_ural4320_repair_wdl",
		"gm_gc_army_ural4320_repair_win",
		"gm_gc_army_ural44202_oli",
		"gm_gc_army_ural44202_ols",
		"gm_gc_army_ural44202_olw",
		"gm_gc_army_ural44202_un",
		"gm_gc_army_ural44202_wdl",
		"gm_gc_army_ural44202_win",
		"B_Truck_01_mover_F",
		"B_Truck_01_ammo_F",
		"B_Truck_01_box_F",
		"B_Truck_01_covered_F",
		"B_Truck_01_flatbed_F",
		"B_Truck_01_fuel_F",
		"B_Truck_01_medical_F",
		"B_Truck_01_Repair_F",
		"O_Truck_03_device_F",
		"O_Truck_03_ammo_F",
		"O_Truck_03_transport_F",
		"O_Truck_03_covered_F",
		"O_Truck_03_fuel_F",
		"O_Truck_03_medical_F",
		"O_Truck_03_repair_F",
		"I_Truck_02_ammo_F",
		"I_Truck_02_transport_F",
		"I_Truck_02_covered_F",
		"I_Truck_02_fuel_F",
		"I_Truck_02_medical_F",
		"I_Truck_02_box_F",
		"gm_pl_army_ural375d_medic_oli",
		"gm_pl_army_ural375d_medic_ols",
		"gm_pl_army_ural375d_medic_olw",
		"gm_pl_army_ural375d_refuel_oli",
		"gm_pl_army_ural375d_refuel_ols",
		"gm_pl_army_ural375d_refuel_olw",
		"gm_pl_army_ural4320_cargo_oli",
		"gm_pl_army_ural4320_cargo_ols",
		"gm_pl_army_ural4320_cargo_olw",
		"gm_pl_army_ural4320_reammo_oli",
		"gm_pl_army_ural4320_reammo_ols",
		"gm_pl_army_ural4320_reammo_olw",
		"gm_pl_army_ural4320_repair_oli",
		"gm_pl_army_ural4320_repair_ols",
		"gm_pl_army_ural4320_repair_olw",
		"gm_ge_army_kat1_451_cargo_des",
		"gm_ge_army_kat1_451_cargo_oli",
		"gm_ge_army_kat1_451_cargo_ols",
		"gm_ge_army_kat1_451_cargo_olw",
		"gm_ge_army_kat1_451_cargo_trp",
		"gm_ge_army_kat1_451_cargo_un",
		"gm_ge_army_kat1_451_cargo",
		"gm_ge_army_kat1_451_cargo",
		"gm_ge_army_kat1_451_cargo",
		"gm_ge_army_kat1_451_container_des",
		"gm_ge_army_kat1_451_container_oli",
		"gm_ge_army_kat1_451_container_ols",
		"gm_ge_army_kat1_451_container_olw",
		"gm_ge_army_kat1_451_container_trp",
		"gm_ge_army_kat1_451_container_un",
		"gm_ge_army_kat1_451_container",
		"gm_ge_army_kat1_451_container",
		"gm_ge_army_kat1_451_container",
		"gm_ge_army_kat1_451_reammo_des",
		"gm_ge_army_kat1_451_reammo_oli",
		"gm_ge_army_kat1_451_reammo_ols",
		"gm_ge_army_kat1_451_reammo_trp",
		"gm_ge_army_kat1_451_reammo_un",
		"gm_ge_army_kat1_451_reammo_wdl",
		"gm_ge_army_kat1_451_reammo_win",
		"gm_ge_army_kat1_451_reammo_wiw",
		"gm_ge_army_kat1_451_refuel_des",
		"gm_ge_army_kat1_451_refuel_oli",
		"gm_ge_army_kat1_451_refuel_ols",
		"gm_ge_army_kat1_451_refuel_olw",
		"gm_ge_army_kat1_451_refuel_trp",
		"gm_ge_army_kat1_451_refuel_un",
		"gm_ge_army_kat1_451_refuel_wdl",
		"gm_ge_army_kat1_451_refuel_win",
		"gm_ge_army_kat1_451_refuel_wiw",
		"gm_ge_army_kat1_454_cargo_des",
		"gm_ge_army_kat1_454_cargo_oli",
		"gm_ge_army_kat1_454_cargo_ols",
		"gm_ge_army_kat1_454_cargo_olw",
		"gm_ge_army_kat1_454_cargo_trp",
		"gm_ge_army_kat1_454_cargo_un",
		"gm_ge_army_kat1_454_cargo_wdl",
		"gm_ge_army_kat1_454_cargo_win",
		"gm_ge_army_kat1_454_cargo_wiw",
		"gm_ge_army_u1300l_cargo_des",
		"gm_ge_army_u1300l_cargo_oli",
		"gm_ge_army_u1300l_cargo_ols",
		"gm_ge_army_u1300l_cargo_olw",
		"gm_ge_army_u1300l_cargo_trp",
		"gm_ge_army_u1300l_cargo_un",
		"gm_ge_army_u1300l_cargo_wdl",
		"gm_ge_army_u1300l_cargo_win",
		"gm_ge_army_u1300l_cargo_wiw",
		"gm_ge_army_u1300l_container_des",
		"gm_ge_army_u1300l_container_oli",
		"gm_ge_army_u1300l_container_ols",
		"gm_ge_army_u1300l_container_olw",
		"gm_ge_army_u1300l_container_trp",
		"gm_ge_army_u1300l_container_un",
		"gm_ge_army_u1300l_container_wdl",
		"gm_ge_army_u1300l_container_win",
		"gm_ge_army_u1300l_container_wiw",
		"gm_ge_army_u1300l_medic_des_rc",
		"gm_ge_army_u1300l_medic_oli_rc",
		"gm_ge_army_u1300l_medic_ols_rc",
		"gm_ge_army_u1300l_medic_olw_rc",
		"gm_ge_army_u1300l_medic_trp_rc",
		"gm_ge_army_u1300l_medic_un_rc",
		"gm_ge_army_u1300l_medic_wdl_rc",
		"gm_ge_army_u1300l_medic_win_rc",
		"gm_ge_army_u1300l_medic_wiw_rc",
		"gm_ge_army_u1300l_repair_oli",
		"gm_ge_army_u1300l_repair_des",
		"gm_ge_army_u1300l_repair_ols",
		"gm_ge_army_u1300l_repair_trp",
		"gm_ge_army_u1300l_repair_olw",
		"gm_ge_army_u1300l_repair_un",
		"gm_ge_army_u1300l_repair_wdl",
		"gm_ge_army_u1300l_repair_win",
		"gm_ge_army_u1300l_repair_wiw",
		"gm_ge_army_u1300l_firefighter_des",
		"gm_ge_army_u1300l_firefighter_oli",
		"gm_ge_army_u1300l_firefighter_ols",
		"gm_ge_army_u1300l_firefighter_olw",
		"gm_ge_army_u1300l_firefighter_trp",
		"gm_ge_army_u1300l_firefighter_un",
		"gm_ge_army_u1300l_firefighter_wdl",
		"gm_ge_army_u1300l_firefighter_win",
		"gm_ge_army_u1300l_firefighter_wiw"
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
