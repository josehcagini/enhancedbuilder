HA$PBExportHeader$_app.sru
forward
global type _app from ancobject
end type
end forward

global type _app from ancobject
end type
global _app _app

forward prototypes
public function integer main ()
private function integer startapp ()
public function integer teste ()
end prototypes

public function integer main ();
this.startApp()
this.teste()

return 1
end function

private function integer startapp ();string ls_db_dbms
string ls_db_sgdb
string ls_db_database
string ls_db_userid
string ls_db_dbpass
string ls_db_dsn
string ls_db_lock
string ls_db_autocommit

ls_db_dbms = __process.env('db_dbms', '')
ls_db_sgdb = __process.env('db_sgdb', '')
ls_db_database = __process.env('db_database', '')
ls_db_userid = __process.env('db_userid', '')
ls_db_dbpass = __process.env('db_dbpass', '')
ls_db_dsn = __process.env('db_dsn', '')
ls_db_lock = __process.env('db_lock', '')
ls_db_autocommit = __process.env('db_autocommit', '')


try 
	databasemanager _databasemanager
	u_database _database

	_databasemanager = __static.getInstance('databasemanager')
	_databasemanager.setDefaultSGDB(ls_db_sgdb)
	_database = __static.getInstance(_databasemanager.getDefaultTypeSgdb())
	
	_databasemanager.AddTransaction( &
		_databasemanager.getDefaultTypeSgdb(), &
		_databasemanager.getDefaultKey(), &
		_database.createTransaction( &
			ls_db_dbms, &
			ls_db_sgdb, &
			ls_db_database, &
			ls_db_userid, &
			ls_db_dbpass, &
			ls_db_dsn, &
			ls_db_lock, &
			ls_db_autocommit &
		) &
	)
catch(PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
end try

return 1
end function

public function integer teste ();
databasemanager _databasemanager; _databasemanager = __static.getInstance('databasemanager')
u_transaction _PgTransaction; _PgTransaction = _databasemanager.getDefaultTrans()

queryBuilder _queryBuilder; _queryBuilder = _databasemanager.queryBuilder() 

_queryBuilder._from({fq_table('user')})._where({fq_clause('').equals('')})._select()

_dson ds_teste; ds_teste = _init_.class('_dson')



return 1
end function

on _app.create
call super::create
end on

on _app.destroy
call super::destroy
end on

