private["_list","_dist"];
_pos = _this select 0;
_list = [] call A3E_fnc_GetPlayers;
_dist = (_list select 0) distance _pos;
{
	if((_x distance _pos)<_dist) then {
		_dist = (_x distance _pos);
	};
} foreach _list;

_dist