// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "gm_dk_army_vest_m00_m84_machinegunner";

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "gm_xx_uniform_soldier_bdu_nogloves_80_wdl";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "gm_akm_pallad_wud";
			_unit addMagazine "gm_30rnd_762x39mm_b_m43_ak47_blk";
			_unit addMagazine "gm_30rnd_762x39mm_b_m43_ak47_blk";
			_unit addMagazine "gm_30rnd_762x39mm_b_m43_ak47_blk";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addUniform "gm_xx_uniform_soldier_bdu_nogloves_80_wdl";
			_unit addBackpack "gm_ge_army_backpack_80_oli";
			_unit addWeapon "gm_mpikms72_brn";
			_unit addMagazine "gm_30rnd_762x39mm_b_m43_ak47_blk";
			_unit addMagazine "gm_30rnd_762x39mm_b_m43_ak47_blk";
			_unit addMagazine "gm_30rnd_762x39mm_b_m43_ak47_blk";
			_unit addMagazine "gm_1rnd_40mm_heat_pg7v_rpg7";
			_unit addWeapon "gm_rpg7_prp";
			_unit addMagazine "gm_1rnd_40mm_heat_pg7vl_rpg7";
			_unit addMagazine "gm_1rnd_40mm_heat_pg7vl_rpg7";
		};
		// Rifleman 
		default
		{
			_unit addUniform "gm_ge_uniform_soldier_bdu_rolled_80_wdl";

			if (_unit == leader _group) then
			{
				_unit addWeapon "gm_svd_wud";
				_unit addMagazine "gm_10Rnd_762x54mmR_ap_7n1_svd_blk";
				_unit addMagazine "gm_10Rnd_762x54mmR_ap_7n1_svd_blk";
				_unit addMagazine "gm_10Rnd_762x54mmR_ap_7n1_svd_blk";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addMagazine "gm_30rnd_545x39mm_b_7n6_ak74_prp";
				_unit addMagazine "gm_30rnd_545x39mm_b_7n6_ak74_prp";
				_unit addMagazine "gm_30rnd_545x39mm_b_7n6_ak74_prp";
				_unit addWeapon "gm_mpiak74n_brn";
			};
		};
	};

	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
