HA$PBExportHeader$u_database.sru
forward
global type u_database from nonvisualobject
end type
end forward

global type u_database from nonvisualobject
end type
global u_database u_database

forward prototypes
public function u_transaction createtransaction ()
end prototypes

public function u_transaction createtransaction ();
//implements on descendants
u_transaction t
return t
end function

on u_database.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_database.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

