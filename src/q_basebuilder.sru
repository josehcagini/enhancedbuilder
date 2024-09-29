HA$PBExportHeader$q_basebuilder.sru
forward
global type q_basebuilder from nonvisualobject
end type
end forward

global type q_basebuilder from nonvisualobject
end type
global q_basebuilder q_basebuilder

on q_basebuilder.create
call super::create
TriggerEvent( this, "constructor" )
end on

on q_basebuilder.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

