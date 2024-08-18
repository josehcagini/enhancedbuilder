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
end variables
forward prototypes
public function _map set (string key, powerobject value)
end prototypes

public function _map set (string key, powerobject value);
return this

end function

on _map.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _map.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

