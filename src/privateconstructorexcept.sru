HA$PBExportHeader$privateconstructorexcept.sru
forward
global type privateconstructorexcept from exception
end type
end forward

global type privateconstructorexcept from exception
end type
global privateconstructorexcept privateconstructorexcept

type variables

end variables
on privateconstructorexcept.create
call super::create
TriggerEvent( this, "constructor" )
end on

on privateconstructorexcept.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;this.setMessage('Tried to instantiate a class with Private Constructor')
end event

