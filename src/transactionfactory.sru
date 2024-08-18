HA$PBExportHeader$transactionfactory.sru
forward
global type transactionfactory from nonvisualobject
end type
end forward

global type transactionfactory from nonvisualobject
end type
global transactionfactory transactionfactory

type variables
STRING TRANSACTION_POSTGRES = 'U_TRANSACTIONPOSTGRES'
end variables
forward prototypes
public function u_transaction createpostgrestransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_dsn, string a_db_lock, string a_db_autocommit)
end prototypes

public function u_transaction createpostgrestransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_dsn, string a_db_lock, string a_db_autocommit);
u_transaction newTransaction
str_u_transaction_parm _constructor_parms

_constructor_parms.db_dbms = a_db_dbms
_constructor_parms.db_sgdb = a_db_sgdb
_constructor_parms.db_database = a_db_database
_constructor_parms.db_userid = a_db_userid
_constructor_parms.db_dsn = a_db_dsn
_constructor_parms.db_lock = a_db_lock
_constructor_parms.db_autocommit = a_db_autocommit

try 
	newTransaction = _init_.class( TRANSACTION_POSTGRES, constructor_parm)
catch(PrivateConstructorExcept err)
end try

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

