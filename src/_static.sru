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
u_process _process
constructor_parm _constructor_parm
end variables
forward prototypes
public subroutine set_object (ref _object a_object)
public subroutine instantiate ()
public subroutine set_console (console a_console)
public subroutine set__init__ (ref __init__ a_init)
public subroutine set_constructor_parm (constructor_parm a_constructor)
public subroutine send_constructor_parm (powerobject str_parm)
public subroutine set_process (u_process a_process)
end prototypes

public subroutine set_object (ref _object a_object);object = a_object
end subroutine

public subroutine instantiate ();
this.set__init__(_init_)
this.set_constructor_parm(_init_.constructor_parm())

__object = _init_._object()
this.set_object(__object)

__process = _init_._process()
this.set_process(__process)

__console = _init_.console()
this.set_console(__console)
	

end subroutine

public subroutine set_console (console a_console);this._console = a_console
end subroutine

public subroutine set__init__ (ref __init__ a_init);this.init = a_init
end subroutine

public subroutine set_constructor_parm (constructor_parm a_constructor);this._constructor_parm = a_constructor
end subroutine

public subroutine send_constructor_parm (powerobject str_parm);this._constructor_parm.PowerObjectParm = str_parm
end subroutine

public subroutine set_process (u_process a_process);this._process = a_process
end subroutine

on _static.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _static.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

