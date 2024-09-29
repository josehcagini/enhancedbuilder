HA$PBExportHeader$console.sru
forward
global type console from nonvisualobject
end type
end forward

global type console from nonvisualobject
end type
global console console

forward prototypes
public subroutine log (string msg)
end prototypes

public subroutine log (string msg);MessageBox('', msg)
end subroutine

on console.create
call super::create
TriggerEvent( this, "constructor" )
end on

on console.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

