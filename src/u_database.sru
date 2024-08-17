HA$PBExportHeader$u_database.sru
forward
global type u_database from nonvisualobject
end type
end forward

global type u_database from nonvisualobject
end type
global u_database u_database

forward prototypes
public subroutine default_connection ()
end prototypes

public subroutine default_connection ();// Profile pgsqlsample
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PostgreSQL35W;UID=postgres;PWD=postgres'"
end subroutine

on u_database.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_database.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

