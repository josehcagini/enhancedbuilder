HA$PBExportHeader$_object.sru
forward
global type _object from nonvisualobject
end type
end forward

shared variables
boolean isStatic = TRUE
boolean isSingleton = TRUE
boolean privateConstructor = TRUE
end variables

global type _object from nonvisualobject
end type
global _object _object

forward prototypes
public function boolean isnotvalid (powerobject a_pwo2)
public function boolean _isvalid (powerobject a_pwo)
end prototypes

public function boolean isnotvalid (powerobject a_pwo2);return not this._isValid(a_pwo2)
end function

public function boolean _isvalid (powerobject a_pwo);Return isValid(a_pwo)
end function

on _object.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _object.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

