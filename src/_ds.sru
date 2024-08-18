HA$PBExportHeader$_ds.sru
forward
global type _ds from datastore
end type
end forward

global type _ds from datastore
end type
global _ds _ds

on _ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

