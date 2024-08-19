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

_map instance_map
end variables

forward prototypes
public subroutine set_object (ref _object a_object)
public subroutine instantiate ()
public subroutine set_console (console a_console)
public subroutine set__init__ (ref __init__ a_init)
public subroutine set_constructor_parm (constructor_parm a_constructor)
public subroutine send_constructor_parm (powerobject str_parm)
public subroutine set_process (u_process a_process)
public function powerobject getinstance (string class)
public subroutine createinstancemap ()
public function powerobject get_constructor_parm ()
end prototypes

public subroutine set_object (ref _object a_object);object = a_object
end subroutine

public subroutine instantiate ();
this.set__init__(_init_)

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

public function powerobject getinstance (string class);
powerobject static_obj
class = Lower(class)
static_obj = instance_map.get(class)
if __object.isNotValid(static_obj) Then
	try
		static_obj = this.init.class(class, NULL_OBJ)
	catch( PrivateConstructorExcept err)
	end try
	instance_map.set(class, static_obj)
end if

return static_obj

end function

public subroutine createinstancemap ();try
	instance_map = _init_.class('_map', NULL_OBJ)
catch(PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
end try
end subroutine

public function powerobject get_constructor_parm ();return this._constructor_parm.PowerObjectParm
end function

on _static.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _static.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
__static = this
this.set_constructor_parm(_init_.constructor_parm())
this.instantiate()
createInstanceMap()

end event

