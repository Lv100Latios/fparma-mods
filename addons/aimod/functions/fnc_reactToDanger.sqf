
#include "script_component.hpp"
params ["_grp", ["_dangerCause", objNull]];

if (diag_fps < 15) exitWith {};
[_grp, _dangerCause] call FUNC(broadcastInfo);
[_grp, _dangerCause] call FUNC(mountWeapons);
