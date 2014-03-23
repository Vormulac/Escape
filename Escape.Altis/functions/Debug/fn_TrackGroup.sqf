if(isNil("A3E_Debug_TrackedGroups")) then {
	A3E_Debug_TrackedGroups = [];
};

A3E_fnc_TrackGroup_Add = {
	private["_group","_markername","_marker","_linemarker"];
	_group = _this select 0;
	
	_markername = format["a3e_debug_positionMarker_%1",_group];
	_marker = createmarker [_markername,getposASL (leader _group)];
	_marker setmarkershape "ICON";		
	_marker setmarkertype "mil_dot";
	_marker setMarkerSize [0.4, 0.4];
	_marker setmarkercolor ([side leader _group] call a3e_fnc_getSideColor);

	if(isNil("a3e_var_LineMarkerNo")) then {
		a3e_var_LineMarkerNo = 0;
	} else {
		a3e_var_LineMarkerNo = a3e_var_LineMarkerNo +1;
	};
	_markername = format["LineMarker%1",a3e_var_LineMarkerNo];
	_linemarker = createMarker [_markername,getposASL (leader _group)];

	_linemarker setMarkerShape "RECTANGLE";
	_linemarker setMarkerColor "ColorYellow";
	_linemarker setMarkerSize [1,1];

	
	A3E_Debug_TrackedGroups set [count(A3E_Debug_TrackedGroups),[_group,_marker,_linemarker,[]]];
};

A3E_fnc_TrackGroup_Update = {
	private["_groups","_newgroups"];
	_groups = A3E_Debug_TrackedGroups;
	_newgroups = [];
	{
		private["_group","_marker","_linemarker","_unitmarkers"];
		_group = _x select 0;
		_marker = _x  select 1;
		_linemarker = _x  select 2;
		_unitmarkers = _x  select 3;
		 _marker setmarkerpos getposASL (leader _group);
		[getposASL (units _group select 0),waypointPosition ((waypoints _group) select 1),_linemarker] call A3E_FNC_DrawMapLine;
        _text = [_group] call a3e_fnc_GetTaskState;
        _marker setmarkertext _text;
		{deletemarker _x;} foreach _unitmarkers;
		_unitmarkers = [];
		{
			private["_umarker","_markername"];
			_markername = format["a3e_debug_unitMarker_%1_%2",_group,_foreachindex];
			_umarker = createmarker [_markername,getposASL _x];
			_umarker setmarkershape "ICON";		
			_umarker setmarkertype "mil_dot";
			_umarker setMarkerSize [0.3, 0.3];
			_umarker setmarkercolor ([side leader _group] call a3e_fnc_getSideColor);
			_unitmarkers set[count(_unitmarkers),_umarker];
		} foreach units _group;
		if(count(units _group)>0) then {
			_newgroups set [count(_newgroups),[_group,_marker,_linemarker,_unitmarkers]];
		} else {
			deletemarker _marker;
			deletemarker _linemarker;
		};
	} foreach _groups;
	A3E_Debug_TrackedGroups = _newgroups;
};

A3E_fnc_TrackGroup_Remove = {

};