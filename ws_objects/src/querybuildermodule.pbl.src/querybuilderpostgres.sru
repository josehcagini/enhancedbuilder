$PBExportHeader$querybuilderpostgres.sru
forward
global type querybuilderpostgres from querybuilder
end type
end forward

global type querybuilderpostgres from querybuilder
end type
global querybuilderpostgres querybuilderpostgres

forward prototypes
public function string tostring ()
public function string typetabletostring (q_table a_table)
public function string tableclausetostring (q_resulttable a_table)
public function string clausetostring (q_clause a_clause)
public function string typequerytostring (q_query a_query)
public function string querytostring (q_query a_query)
public function string columnstostring (q_query a_query)
public function string tablestostring (q_query a_query)
public function string wheretostring (q_query a_query)
public function _dson todatastore ()
public function querybuilder _select ()
public function querybuilder _select (q_collumn aq_collumn[])
public function querybuilder _from (q_resulttable a_table)
public function querybuilder _from (string a_schema, string a_table, string a_alias)
public function querybuilder _from (string a_schema, string a_table)
public function querybuilder _from (string a_table)		
public function querybuilder _join (q_resulttable a_table, q_clause a_clauses[])
public function querybuilder _join (string a_schema, string a_table, string a_alias)
public function querybuilder _join (string a_schema, string a_table)
public function querybuilder _join (string a_table)
public function querybuilder _leftjoin (q_resulttable a_table, q_clause a_clauses[])
public function querybuilder _leftjoin (string a_schema, string a_table, string a_alias)
public function querybuilder _leftjoin (string a_schema, string a_table)
public function querybuilder _leftjoin (string a_table)
public function querybuilder _rightjoin (q_resulttable a_table, q_clause a_clauses[])
public function querybuilder _rightjoin (string a_schema, string a_table, string a_alias)
public function querybuilder _rightjoin (string a_schema, string a_table)
public function querybuilder _rightjoin (string a_table)
public function querybuilder _where (q_clause aq_clause[])
public function querybuilder _on (q_clause a_clause[])
public function querybuilder _on (string a_name, string a_operator, string a_value)
end prototypes

public function string tostring ();
string querySQL = ''

querySQL += this.queryToString(this._query)

return querySQL
end function

public function string typetabletostring (q_table a_table);
string ls_table = ' '

if a_table.getJoinType() <> 'from' then
	ls_table += a_table.getJoinType()
end if

string ls_schema
if a_table.getSchema() = '' then
	ls_schema = '"' + a_table.getSchema() + '".'
end if

ls_table += ls_schema + + '"' + a_table.getName() + '" as "' + a_table.getAlias() + '" ~r~n'
ls_table += this.tableClauseToString(a_table)

return ls_table
end function

public function string tableclausetostring (q_resulttable a_table);
if __object.IsNotValid(a_table.getClauses()) then return ' '
if a_table.getClauses().length() = 0 then return ' '

string ls_clause = ' ~t on ~r~n'
integer index
for index = 1 to a_table.getClauses().length()
	q_clause clause_tmp
	clause_tmp = a_table.getClauses().at(index)
	ls_clause += '~t'
	if index > 1 then
		ls_clause += clause_tmp.getLogicalOperator()
	end if

	string clause_response
	clause_response = this.clauseToString(clause_tmp)
	ls_clause += ' ( ' + clause_response + ' ) ~r~n'	
next 

return ls_clause

end function

public function string clausetostring (q_clause a_clause);
string ls_clause 

if a_clause.isNested() then
	integer index
	string ls_clause_tmp
	for index = 1 to a_clause.getNestedClauses().length()
		q_clause clause_tmp
		clause_tmp = a_clause.getNestedClauses().at(index)
		
		if index > 1 then ls_clause_tmp += ' ' + clause_tmp.getLogicalOperator()
		
		ls_clause_tmp += this.clauseToString(clause_tmp)
	next
	ls_clause = ' ( ' + ls_clause_tmp + ' ) '
else
	ls_clause += a_clause.toString() 
end if

return ls_clause 

end function

public function string typequerytostring (q_query a_query);
string ls_table = ' '

if a_query.getJoinType() <> 'from' then
	ls_table += a_query.getJoinType()
end if

string ls_subquery 
ls_subquery = this.queryToString(a_query)
ls_subquery = ' (' + ls_subquery + ') '

ls_table += ls_subquery + ' as "' + a_query.getAlias() + '" ~r~n'

if a_query.getJoinType() <> 'from' then
	ls_table += this.tableClauseToString(a_query)
end if

return ls_table
end function

public function string querytostring (q_query a_query);
string querySQL = ''

querySQL += this.ColumnsToString(a_query)
querySQL += this.TablesToString(a_query)
querySQL += this.WhereToString(a_query)

return querySQL
end function

public function string columnstostring (q_query a_query);
string sqlCol = " "

sqlCol += this.SQL_SELECT + " ~r~n"

_array queryColumns 
queryColumns = a_query.getQueryCollumns()

long index
for index = 1 to queryColumns.length()
	q_Collumn colAux
	colAux = queryColumns.at(index)
	
	sqlCol += '~t'
	
	string ls_table
	if colAux.getName() = "*" then
		sqlCol += " " + colAux.getName() + " ~r~n"
	else
		if colAux.getTable() <> '' then ls_table = '"' + colAux.getTable() + '".'
		sqlCol += ls_table + '"' + colAux.getName() + '" as ' + colAux.getAlias()
		if index = queryColumns.length() then  sqlCol += + ', '
		sqlCol += '~r~n'
	end if
next

return sqlCol
end function

public function string tablestostring (q_query a_query);
string sqlTable = ' '

sqlTable += this.SQL_FROM + '~r~n'

_array queryTables 
queryTables = a_query.getQueryTables()

long index
for index = 1 to queryTables.length()
	sqlTable += '~t'
	q_resultTable q_tmp
	q_tmp = queryTables.at(index)
	if q_tmp.ClassName() = 'q_table' then
		q_table tabAux
		tabAux = q_tmp
		sqlTable += this.typeTableToString(tabAux)
	end if
	
	if q_tmp.ClassName() = 'q_query' then
		q_query queryAux
		queryAux = q_tmp
		string ls_tableAux 
		ls_tableAux = this.typeQueryToString(queryAux)
		sqlTable += ls_tableAux
	end if
	sqlTable += '~r~n'
next

//sqlTable = Left(sqlTable, Len(sqlTable) - 2)

return sqlTable
end function

public function string wheretostring (q_query a_query);
string ls_clause = ' '

integer index
for index = 1 to a_query.getQueryClauses().length()
	q_clause clause_tmp
	clause_tmp = a_query.getQueryClauses().at(index)
	
	if index > 1 then
		ls_clause += clause_tmp.getLogicalOperator()
	end if

	string clause_response
	clause_response = this.clauseToString(clause_tmp)
	ls_clause += ' ( ' + clause_response + ' ) '	
next 

return ls_clause
end function

public function _dson todatastore ();
_dsFactory dsFactory; dsFactory = __static.getInstance('_dsFactory')
_dson newDatastore; newDatastore = dsFactory.createDson()

newDatastore.createFromSQL(this.toString())

return newDatastore
end function

public function querybuilder _select ();
this._query._select()
return this
end function

public function querybuilder _select (q_collumn aq_collumn[]);
this._query._select(aq_collumn)
return this
end function

public function querybuilder _from (q_resulttable a_table);
this.setLastOperation('_from')

if a_table.className() = 'q_table' then
	if a_table.dynamic getSchema() = '' then a_table.dynamic setSchema(defaultTransaction.getDefaultSchema())
end if
this._query._from(a_table)
return this

end function

public function querybuilder _from (string a_schema, string a_table, string a_alias);
return this._from(__table(a_schema, a_table, a_alias))

end function

public function querybuilder _from (string a_schema, string a_table);
return this._from(a_schema, a_table, a_table)
end function

public function querybuilder _from (string a_table);
return this._from('', a_table)
end function

public function querybuilder _join (q_resulttable a_table, q_clause a_clauses[]);
this.setLastOperation('_join')

if a_table.className() = 'q_table' then
	if a_table.dynamic getSchema() = '' then a_table.dynamic setSchema(defaultTransaction.getDefaultSchema())
end if
this._query._join(a_table, a_clauses)

return this
end function

public function querybuilder _join (string a_schema, string a_table, string a_alias);
q_clause null_clauses[]
return this._join(__table(a_schema, a_table, a_alias), null_clauses)

end function

public function querybuilder _join (string a_schema, string a_table);
return this._join(a_schema, a_table, a_table)
end function

public function querybuilder _join (string a_table);
return this._join('', a_table)
end function

public function querybuilder _leftjoin (q_resulttable a_table, q_clause a_clauses[]);
this.setLastOperation('_leftjoin')

if a_table.className() = 'q_table' then
	if a_table.dynamic getSchema() = '' then a_table.dynamic setSchema(defaultTransaction.getDefaultSchema())
end if
this._query._leftjoin(a_table, a_clauses)

return this
end function

public function querybuilder _leftjoin (string a_schema, string a_table, string a_alias);
q_clause null_clauses[]
return this._leftjoin(__table(a_schema, a_table, a_alias), null_clauses)
end function

public function querybuilder _leftjoin (string a_schema, string a_table);
return this._leftjoin(a_schema, a_table, a_table)
end function

public function querybuilder _leftjoin (string a_table);
return this._leftjoin('', a_table)
end function

public function querybuilder _rightjoin (q_resulttable a_table, q_clause a_clauses[]);
if a_table.className() = 'q_table' then
	if a_table.dynamic getSchema() = '' then a_table.dynamic setSchema(defaultTransaction.getDefaultSchema())
end if
this._query._rightjoin(a_table, a_clauses)
return this
end function

public function querybuilder _rightjoin (string a_schema, string a_table, string a_alias);
q_clause null_clauses[]
return this._rightjoin(__table(a_schema, a_table, a_alias), null_clauses)
end function

public function querybuilder _rightjoin (string a_schema, string a_table);
return this._rightjoin(a_schema, a_table, a_table)
end function

public function querybuilder _rightjoin (string a_table);
return this._rightjoin('', a_table)
end function

public function querybuilder _where (q_clause aq_clause[]);
this._query._where(aq_clause)
return this
end function

public function querybuilder _on (q_clause a_clause[]);
if _in(this.lastOperation, fromOperation) then
	this._query._on(a_clause)
end if

return this
end function

public function querybuilder _on (string a_name, string a_operator, string a_value);
return this._on({__clause('', a_name, a_operator, '', a_value)})

return this
end function

on querybuilderpostgres.create
call super::create
end on

on querybuilderpostgres.destroy
call super::destroy
end on

event constructor;call super::constructor;
this._database = __static.getInstance('u_database_postgres')
end event

