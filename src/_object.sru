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
public function boolean isvalid (powerobject pwo)
public function boolean isnotvalid (powerobject pwo)
end prototypes

public function boolean isvalid (powerobject pwo);Return isValid(pwo)
end function

public function boolean isnotvalid (powerobject pwo);return not this.isValid(pwo)
end function

on _object.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _object.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

