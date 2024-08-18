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
console _console
end variables
forward prototypes
public subroutine set_object (ref _object a_object)
public subroutine instantiate ()
public subroutine set_console (console a_console)
public subroutine set__init__ (ref __init__ a_init)
end prototypes

public subroutine set_object (ref _object a_object);object = a_object
end subroutine

public subroutine instantiate ();
Try
	this.set__init__(_init_)
	
	__object = _init_._object()
	this.set_object(__object)
	
	__console = _init_.console()
	this.set_console(__console)
	
Catch( PrivateConstructorExcept err)
	__console.log(err.GetMessage())
Finally
	
End Try
end subroutine

public subroutine set_console (console a_console);this._console = a_console
end subroutine

public subroutine set__init__ (ref __init__ a_init);this.init = a_init
end subroutine

on _static.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _static.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

