HA$PBExportHeader$_static.sru
forward
global type _static from nonvisualobject
end type
end forward

shared variables
boolean isStatic = TRUE
boolean isSingleton = TRUE
boolean privateConstructor = TRUE
end variables

global type _static from nonvisualobject
end type
global _static _static

type variables
__init__ init
_object object
end variables

forward prototypes
public function __init__ __init__ ()
public subroutine set__init__ (ref __init__ a_pwo)
public subroutine set_object (ref _object a_object)
end prototypes

public function __init__ __init__ ();if not isValid(this.init) then
	this.init = _init_
end if

return this.init
end function

public subroutine set__init__ (ref __init__ a_pwo);this.init = a_pwo
end subroutine

public subroutine set_object (ref _object a_object);object = a_object
end subroutine

on _static.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _static.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

