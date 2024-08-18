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

public subroutine create_ds_map ();Try
	ds_map = __init__.class('_ds', NULL_OBJ)
	ds_map.createFromSql("select cast('' as char(30)) as key, cast('' as char(30)) as type, cast(0 as integer) as index from public.dummy")
Catch( PrivateConstructorExcept err)

End Try
end subroutine

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

