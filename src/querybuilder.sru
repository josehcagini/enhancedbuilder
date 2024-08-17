HA$PBExportHeader$querybuilder.sru
forward
global type querybuilder from nonvisualobject
end type
end forward

global type querybuilder from nonvisualobject
end type
global querybuilder querybuilder

type prototypes

end prototypes
on querybuilder.create
call super::create
TriggerEvent( this, "constructor" )
end on

on querybuilder.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

