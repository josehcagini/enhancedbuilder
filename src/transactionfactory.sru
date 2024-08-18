HA$PBExportHeader$transactionfactory.sru
forward
global type transactionfactory from nonvisualobject
end type
end forward

global type transactionfactory from nonvisualobject
end type
global transactionfactory transactionfactory

on transactionfactory.create
call super::create
TriggerEvent( this, "constructor" )
end on

on transactionfactory.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

