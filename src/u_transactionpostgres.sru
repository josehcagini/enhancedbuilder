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

this.DBMS = _constructor_parms.db_dbms
this.Database = _constructor_parms.db_database
this.DBParm =  _constructor_parms.db_dbparm
this.Lock = _constructor_parms.db_lock
this.AutoCommit = _constructor_parms.db_autocommit

//this.UserID = _constructor_parms.
//this.DBPass = _constructor_parms.
//this.LogID = _constructor_parms.
//this.LogPass = _constructor_parms.
//this.ServerName = _constructor_parms.

this.setDefaultSchema('public')

if this.connectTransaction() < 0 then
	MessageBox('', 'n$$HEX1$$e300$$ENDHEX$$o conectou:' + string(this.SQLDBCode) + ' - ' + this.SQLErrText)
end if 


end event

