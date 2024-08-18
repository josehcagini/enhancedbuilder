HA$PBExportHeader$u_database_postgres.sru
forward
global type u_database_postgres from u_database
end type
end forward

global type u_database_postgres from u_database
end type
global u_database_postgres u_database_postgres

forward prototypes
public function u_transaction createtransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, string a_db_autocommit)
end prototypes

public function u_transaction createtransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, string a_db_autocommit);
transactionFactory _transactionFactory
_transactionFactory = __static.getInstance('transactionfactory')

u_transaction t
t = _transactionFactory.createPostgresTransaction( &
	a_db_dbms, &  
	a_db_sgdb, &
	a_db_database, &
	a_db_userid, &
	a_db_pass, &
	a_db_dsn, &
	a_db_lock, &
	not isFalsy(a_db_autocommit), &
	this.generateDBParm( a_db_dsn, a_db_userid, a_db_pass) &
	)

return t
end function

on u_database_postgres.create
call super::create
end on

on u_database_postgres.destroy
call super::destroy
end on

