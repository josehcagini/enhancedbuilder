HA$PBExportHeader$u_transaction.sru
forward
global type u_transaction from transaction
end type
end forward

global type u_transaction from transaction
end type
global u_transaction u_transaction

event constructor;

//this.DBMS = ls_dbms
//this.Database = ls_database
//this.UserID = ls_userid
//this.DBPass = ls_dbpass
//this.LogID = ls_logid
//this.LogPass = ls_logpass
//this.ServerName = ls_server
//this.DBParm = ls_dbparm
//this.Lock = ls_lock
//this.AutoCommit	= False
end event

on u_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

