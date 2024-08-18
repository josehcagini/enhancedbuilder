HA$PBExportHeader$_app.sru
forward
global type _app from ancobject
end type
end forward

global type _app from ancobject
end type
global _app _app

forward prototypes
public function integer startapp ()
end prototypes

public function integer startapp ();string ls_db_dbms
string ls_db_sgdb
string ls_db_database
string ls_db_userid
string ls_db_dsn
string ls_db_lock
string ls_db_autocommit

ls_db_dbms = __process.env('db_dbms', '')
ls_db_sgdb = __process.env('db_sgdb', '')
ls_db_database = __process.env('db_database', '')
ls_db_userid = __process.env('db_userid', '')
ls_db_dsn = __process.env('db_dsn', '')
ls_db_lock = __process.env('db_lock', '')
ls_db_autocommit = __process.env('db_autocommit', '')



return 1
end function

on _app.create
call super::create
end on

on _app.destroy
call super::destroy
end on

