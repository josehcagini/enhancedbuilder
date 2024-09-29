$PBExportHeader$constructor_parm.sru
forward
global type constructor_parm from message
end type
end forward

global type constructor_parm from message
end type
global constructor_parm constructor_parm

on constructor_parm.create
call super::create
TriggerEvent( this, "constructor" )
end on

on constructor_parm.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

