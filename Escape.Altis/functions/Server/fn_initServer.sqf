//waituntil{!isNil("BIS_fnc_init")};
if(!isserver) exitwith {};
["Server started."] spawn a3e_fnc_debugChat;
//Parse the parameters
call a3e_fnc_parameterInit;

[1] call compile preprocessFileLineNumbers "Scripts\Escape\UnitClasses.sqf";
[1] call compile preprocessFileLineNumbers "functions\debug\fn_TrackGroup.sqf";
[1] call compile preprocessFileLineNumbers "functions\RandomEvents\fn_RandomEvents.sqf";

A3E_StartPos = [] call a3e_fnc_findFlatArea;

// Build start position
_fenceRotateDir = random 360;
[A3E_StartPos, _fenceRotateDir] call a3e_fnc_BuildPrison;


// Add crashsite here
//##############



//[] call A3E_fnc_parsebaseMarkers;
A3E_BaseMarker = ["Base_"] call a3e_fnc_getMarkerList;
A3E_VillageMarker = ["Village_"] call a3e_fnc_getMarkerList;

//[] spawn A3E_fnc_createRegions;

[] spawn A3E_fnc_initSearchLeader;

[] spawn A3E_fnc_CreateComCenters;
[] spawn A3E_fnc_createAmmoDepots;

[] call A3E_fnc_Chronos_Init;


["A3E_FNC_AmbientAISpawn"] call A3E_FNC_Chronos_Register;
["A3E_FNC_TrackGroup_Update"] call A3E_FNC_Chronos_Register;
["A3E_FNC_RandomEvent_Run"] call A3E_FNC_Chronos_Register;