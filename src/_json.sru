HA$PBExportHeader$_json.sru
forward
global type _json from nonvisualobject
end type
end forward

global type _json from nonvisualobject
end type
global _json _json

on _json.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _json.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

