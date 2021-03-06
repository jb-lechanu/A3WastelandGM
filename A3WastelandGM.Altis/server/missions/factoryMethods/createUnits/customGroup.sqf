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

	

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "gm_ge_army_uniform_soldier_80_ols";
			_unit addVest "gm_dk_army_vest_54_rifleman";
			_unit addHeadgear "gm_ge_headgear_m62_net";
			_unit addWeapon "gm_hk69a1_blk";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "gm_p1_blk";
			_unit addMagazine "gm_8rnd_9x19mm_b_dm11_p1_blk";
			_unit addMagazine "gm_8rnd_9x19mm_b_dm11_p1_blk";
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addUniform "gm_ge_army_uniform_soldier_80_ols";
			_unit addVest "gm_dk_army_vest_54_machinegunner";
			_unit addHeadgear "gm_ge_headgear_m62_net";
			_unit addBackpack "gm_ge_army_backpack_80_oli";
			_unit addWeapon "gm_g3a4_oli";
			_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
			_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
			_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
			_unit addWeapon "gm_pzf44_2_oli"; 
			_unit addMagazine "gm_1rnd_44x537mm_heat_dm32_pzf44_2";
			_unit addMagazine "gm_1rnd_44x537mm_heat_dm32_pzf44_2";
			_unit addMagazine "gm_1rnd_44x537mm_heat_dm32_pzf44_2";
		};
		// Rifleman 
		default
		{
			if (_unit == leader _group) then
			{
				_unit addUniform "gm_ge_army_uniform_soldier_80_oli";
				_unit addVest "gm_dk_army_vest_54_crew";
				_unit addHeadgear "gm_ge_headgear_hat_80_oli";
				_unit addWeapon "gm_g3a4_ebr";
				_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
				_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
				_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
				_unit addMagazine "gm_1rnd_67mm_heat_dm22a1_g3";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addUniform "gm_ge_army_uniform_soldier_80_ols";
				_unit addVest "gm_dk_army_vest_54_rifleman";
				_unit addHeadgear "gm_ge_headgear_m62_net";
				_unit addWeapon "gm_g3a3_oli";
				_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
				_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
				_unit addMagazine "gm_20rnd_762x51mm_b_dm41_g3_blk";
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
