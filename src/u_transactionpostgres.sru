HA$PBExportHeader$u_transactionpostgres.sru
forward
global type u_transactionpostgres from u_transaction
end type
end forward

global type u_transactionpostgres from u_transaction
end type
global u_transactionpostgres u_transactionpostgres

forward prototypes
public function str_u_transaction_parm getconstructorparm ()
end prototypes

public function str_u_transaction_parm getconstructorparm ();str_u_transaction_parm str_return

str_return = __static.get_constructor_parm()

return str_return
end function

on u_transactionpostgres.create
call super::create
end on

on u_transactionpostgres.destroy
call super::destroy
end on

event constructor;call super::constructor;str_u_transaction_parm _constructor_parms

_constructor_parms = this.getConstructorParm()

SQLCA.DBMS = _constructor_parms.db_dbms
SQLCA.Database = _constructor_parms.db_database
//SQLCA.UserID = _constructor_parms.db_userid
//SQLCA.DBPass = _constructor_parms.
//SQLCA.LogID = _constructor_parms.
//SQLCA.LogPass = _constructor_parms.
//SQLCA.ServerName = _constructor_parms.
SQLCA.DBParm =  _constructor_parms.db_dbparm
SQLCA.Lock = _constructor_parms.db_lock
SQLCA.AutoCommit = _constructor_parms.db_autocommit
end event

