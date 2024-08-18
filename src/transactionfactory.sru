HA$PBExportHeader$transactionfactory.sru
forward
global type transactionfactory from nonvisualobject
end type
end forward

global type transactionfactory from nonvisualobject
end type
global transactionfactory transactionfactory

forward prototypes
public function u_transactionPostgres createtransactionpostgres ()
end prototypes

public function u_transactionPostgres createtransactionpostgres ();
u_transactionPostgres newTransaction
newTransaction = Create u_transactionPostgres

return newTransaction 
end function

on transactionfactory.create
call super::create
TriggerEvent( this, "constructor" )
end on

on transactionfactory.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

