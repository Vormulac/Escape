//A3E_fnc_GetPlayers
private["_list"];
_list = [];
{
	if(!isNull(_x) && {isPlayer _x}) then {
		_list set[count(_list),_x];
	};
} foreach A3E_Players;

_list