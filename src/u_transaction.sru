HA$PBExportHeader$u_transaction.sru
forward
global type u_transaction from transaction
end type
end forward

global type u_transaction from transaction
end type
global u_transaction u_transaction

type variables

PROTECTED STRING DEFAULT_SCHEMA
end variables

forward prototypes
public function string getdefaultschema ()
public subroutine setdefaultschema (string a_schema)
end prototypes

public function string getdefaultschema ();
return DEFAULT_SCHEMA
end function

public subroutine setdefaultschema (string a_schema);
DEFAULT_SCHEMA = a_schema
end subroutine

on u_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

