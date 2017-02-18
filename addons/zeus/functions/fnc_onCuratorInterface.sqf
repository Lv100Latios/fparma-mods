/*
* Event on curator interface opened. Adds FP icon
*/
#include "script_component.hpp"
#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

if (isNil QGVAR(categories)) then {
    private _condition = {QUOTE(ADDON) in configSourceAddonList (configFile >> "CfgFactionClasses" >> configName _x)} call ace_common_fnc_codeToString;
    GVAR(categories) = _condition configClasses (configFile >> "CfgFactionClasses") apply {getText (_x >> "displayName")};
    GVAR(customCategory) = getText (configFile >> "CfgFactionClasses" >> QGVAR(Custom) >> "displayName");
};

// module categories are not loaded on this frame
[{
    disableSerialization;
    params ["_display"];
    if (isNull _display) exitWith {};

    private _ctrl = _display displayCtrl IDC_RSCDISPLAYCURATOR_CREATE_MODULES;
    private _customCategoryIdx = -1;

    for "_i" from 0 to (_ctrl tvCount []) do {
        private _name = _ctrl tvText [_i];
        if (_name in GVAR(categories)) then {
            _ctrl tvSetPicture [[_i], QPATHTOF(data\icon_fp.paa)];
        };

        // don't mess around with the tree in the loop
        if (_name isEqualTo GVAR(customCategory)) then {_customCategoryIdx = _i};
    };

    if (_customCategoryIdx == -1) exitWith {};

    if (count GVAR(registeredModules) isEqualTo 0) then {
        _ctrl tvDelete [_custom];
    } else {

    };
}, _this] call CBA_fnc_execNextFrame;
