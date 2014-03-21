private["_startpos","_endpos","_marker","_width","_length","_distanceY","_distanceX","_markername","_rotation","_text"];
_group = [_this,0] call bis_fnc_param;


_marker = _group getvariable "a3e_debug_positionMarker";

if(isNil("_marker")) then {
        _markername = format["a3e_debug_positionMarker_%1",_group];
        _marker = createmarker [_markername,getposASL (leader _group)];
        _marker setmarkershape "ICON";		
        _marker setmarkertype "mil_dot";
		_marker setMarkerSize [0.5, 0.5];
        _marker setmarkercolor ([side leader _group] call a3e_fnc_getSideColor);
        //_marker setmarkercolor "ColorRed";
        _group setvariable ["a3e_debug_positionMarker",_marker,false];
};
_headingmarker = "noMarker";

while{!(isNull _group)} do {
        _marker setmarkerpos getposASL (leader _group);
		_headingmarker = [getposASL (units _group select 0),waypointPosition ((waypoints _group) select 1),_headingmarker] call A3E_FNC_DrawMapLine;
        _text = [_group] call a3e_fnc_GetTaskState;
        _marker setmarkertext _text;
        if(count (units _group) == 0) exitwith {
			_marker setmarkertext "KIA";
			deletemarker _headingmarker;
			sleep 30;
		};
        sleep 5;
};
_group setvariable ["a3e_debug_positionMarker",nil,false];
_group setvariable ["a3e_debug_headingMarker",nil,false];
deletemarker _marker;