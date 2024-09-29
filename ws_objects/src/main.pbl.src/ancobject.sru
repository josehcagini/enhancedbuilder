$PBExportHeader$ancobject.sru
forward
global type ancobject from nonvisualobject
end type
end forward

global type ancobject from nonvisualobject
end type
global ancobject ancobject

on ancobject.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ancobject.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

