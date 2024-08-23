HA$PBExportHeader$querybuilder.sru
forward
global type querybuilder from nonvisualobject
end type
end forward

global type querybuilder from nonvisualobject
end type
global querybuilder querybuilder

type prototypes

end prototypes

type variables
protected u_transaction defaultTransaction
protected u_database _database

protected q_query _query

CONSTANT STRING SQL_SELECT = 'SELECT'
CONSTANT STRING SQL_FROM = 'FROM'
CONSTANT STRING SQL_WHERE = 'WHERE'
end variables

forward prototypes
public function str_querybuilder_parm getconstructorparm ()
public function u_transaction getdefaulttransaction ()
public function querybuilder _select (string a_select[])
public function querybuilder _where (string a_where[])
public function querybuilder _select ()
public function querybuilder _select (q_collumn aq_collumn[])
public function querybuilder _where (q_clause aq_clause[])
public function querybuilder _join (q_resulttable a_table, q_clause a_clauses[])
public function querybuilder _leftjoin (q_resulttable a_table, q_clause a_clauses[])
public function querybuilder _rightjoin (q_resulttable a_table, q_clause a_clauses[])
public function querybuilder _from (q_resulttable a_table)
public function querybuilder _from (string a_table)
public function string tostring ()
public function string typequerytostring (q_query a_query)
public function string typetabletostring (q_table a_table)
public function string tableclausetostring (q_resulttable a_table)
public function string querytostring (q_query a_query)
public function string columnstostring (q_query a_query)
public function string tablestostring (q_query a_query)
public function string wheretostring (q_query a_query)
public function _dson todatastore ()
public function string clausetostring (q_clause a_clause)
end prototypes

public function str_querybuilder_parm getconstructorparm ();
str_querybuilder_parm str_return

str_return = __static.get_constructor_parm()

return str_return
end function

public function u_transaction getdefaulttransaction ();

databaseManager _databaseManager; _databaseManager = __static.getInstance('databaseManager')
return _databaseManager.getDefaultTrans()
end function

public function querybuilder _select (string a_select[]);
return this
end function

public function querybuilder _where (string a_where[]);
return this
end function

public function querybuilder _select ();
return this
end function

public function querybuilder _select (q_collumn aq_collumn[]);
return this
end function

public function querybuilder _where (q_clause aq_clause[]);
return this
end function

public function querybuilder _join (q_resulttable a_table, q_clause a_clauses[]);
return this
end function

public function querybuilder _leftjoin (q_resulttable a_table, q_clause a_clauses[]);
return this
end function

public function querybuilder _rightjoin (q_resulttable a_table, q_clause a_clauses[]);
return this
end function

public function querybuilder _from (q_resulttable a_table);
return this
end function

public function querybuilder _from (string a_table);
return this
end function

public function string tostring ();
string querySQL

return querySQL
end function

public function string typequerytostring (q_query a_query);
return ''
end function

public function string typetabletostring (q_table a_table);
return ''
end function

public function string tableclausetostring (q_resulttable a_table);
return ''
end function

public function string querytostring (q_query a_query);
return ''
end function

public function string columnstostring (q_query a_query);
string sqlCol
return sqlCol
end function

public function string tablestostring (q_query a_query);
string sqlTable
return sqlTable
end function

public function string wheretostring (q_query a_query);
string sqlwhere
return sqlwhere
end function

public function _dson todatastore ();
_dson newDatastore
return newDatastore
end function

public function string clausetostring (q_clause a_clause);
return ''
end function

on querybuilder.create
call super::create
TriggerEvent( this, "constructor" )
end on

on querybuilder.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
str_querybuilder_parm _construtor_parms
_construtor_parms = this.getConstructorParm()

this._query = _init_.Class('q_query')

u_transaction receivedTransaction
if __object._IsValid(_construtor_parms) then
	if __object._IsValid(_construtor_parms.defaulttransaction) then
		receivedTransaction = _construtor_parms.defaulttransaction
	else
		receivedTransaction = this.getDefaultTransaction()
	end if
else
	receivedTransaction = this.getDefaultTransaction()
end if

this.defaultTransaction = receivedTransaction

end event

