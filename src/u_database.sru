HA$PBExportHeader$u_database.sru
forward
global type u_database from nonvisualobject
end type
end forward

global type u_database from nonvisualobject
end type
global u_database u_database

forward prototypes
public function string generatedbparm (string a_dns, string a_uid, string a_pwd)
public function u_transaction createtransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, string a_db_autocommit)
end prototypes

public function string generatedbparm (string a_dns, string a_uid, string a_pwd);return "ConnectString='DSN=" + a_dns + ";UID=" + a_uid + ";PWD=" + a_pwd + "'"

end function

public function u_transaction createtransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, string a_db_autocommit);
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

