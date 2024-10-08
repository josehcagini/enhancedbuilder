HA$PBExportHeader$_map.sru
forward
global type _map from nonvisualobject
end type
end forward

global type _map from nonvisualobject
end type
global _map _map

type variables
powerobject arrObj[]
_ds ds_map
end variables

forward prototypes
public function _map set (string key, powerobject value)
public subroutine create_ds_map ()
public function powerobject get (string key)
end prototypes

public function _map set (string key, powerobject value);
long findKey, findIndex
string ls_type = 'obj'

findKey = ds_map.Find(" key = '" + key + "' and type = '" + ls_type + "'" )
if findKey > 0 then
	findIndex = ds_map.GetItem(findKey, 'index', 0)
	if findIndex > 0 then 
		arrObj[findIndex] = value
	end if
else
	findKey = ds_map.insertRow(0)
	ds_map.SetItem(findKey, 'key', key)
	ds_map.SetItem(findKey, 'type', ls_type)
	
	findIndex = UpperBound(arrObj) + 1
	arrObj[findIndex] = value
	ds_map.SetItem(findKey, 'index', findIndex)
end if

return this


end function

public subroutine create_ds_map ();try
	str_ds_parm _ds_map_parm
	_ds_map_parm.dataobject = 'd_dsmap'
	ds_map = _init_.class('_ds', _ds_map_parm)
catch( PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
end try
end subroutine

public function powerobject get (string key);
long findKey, findIndex
string ls_type = 'obj'
powerobject lpwo

findKey = ds_map.Find(" key = '" + key + "' and type = '" + ls_type + "'" )
if findKey > 0 then
	findIndex = ds_map.GetItem(findKey, 'index', 0)
	if findIndex > 0 then 
		lpwo = arrObj[findIndex]
	end if
end if

return lpwo 


end function

on _map.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _map.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;this.create_ds_map()
end event

