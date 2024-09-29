$PBExportHeader$transactionfactory.sru
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
public function u_transaction createpostgrestransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, boolean a_db_autocommit, string a_db_dbparm)
end prototypes

public function u_transaction createpostgrestransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, boolean a_db_autocommit, string a_db_dbparm);
u_transaction newTransaction
str_u_transaction_parm _constructor_parms

_constructor_parms.db_dbms = a_db_dbms
_constructor_parms.db_sgdb = a_db_sgdb
_constructor_parms.db_database = a_db_database
_constructor_parms.db_userid = a_db_userid
_constructor_parms.db_pass = a_db_pass
_constructor_parms.db_dsn = a_db_dsn
_constructor_parms.db_lock = a_db_lock
_constructor_parms.db_autocommit = a_db_autocommit
_constructor_parms.db_dbparm = a_db_dbparm

try 
	newTransaction = _init_.class( TRANSACTION_POSTGRES, _constructor_parms)
catch(PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
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

