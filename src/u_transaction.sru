HA$PBExportHeader$u_transaction.sru
forward
global type u_transaction from transaction
end type
end forward

global type u_transaction from transaction
end type
global u_transaction u_transaction

event constructor;this.autocommit = False
end event

on u_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

