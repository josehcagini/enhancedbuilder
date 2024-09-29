$PBExportHeader$q_query.sru
forward
global type q_query from q_resulttable
end type
end forward

global type q_query from q_resulttable
end type
global q_query q_query

type variables

protected _array queryTables
protected _array queryClauses
protected _array queryColumns
end variables

forward prototypes
public function q_query _select (q_collumn aq_collumn[])
public function q_query _where (q_clause aq_clause[])
public function q_query _select ()
public function q_query _from (q_resulttable aq_table)
public function q_query _join (q_resulttable a_table, q_clause a_clauses[])
public function q_query _leftjoin (q_resulttable a_table, q_clause a_clauses[])
public function q_query _rightjoin (q_resulttable a_table, q_clause a_clauses[])
public function _array getquerycollumns ()
public function _array getquerytables ()
public function _array getqueryclauses ()
public function q_query _on (q_clause a_clauses[])
end prototypes

public function q_query _select (q_collumn aq_collumn[]);
queryColumns.push(aq_collumn)

return this

end function

public function q_query _where (q_clause aq_clause[]);
queryClauses.push(aq_clause)

return this
end function

public function q_query _select ();
return this._select({__collumn('*')})
end function

public function q_query _from (q_resulttable aq_table);
aq_table.joinType('from')
queryTables.push({aq_table})
return this

end function

public function q_query _join (q_resulttable a_table, q_clause a_clauses[]);
a_table.joinType('inner join')
if UpperBound(a_clauses) > 0 then a_table.joinClauses(a_clauses)

queryTables.push({a_table})

return this
end function

public function q_query _leftjoin (q_resulttable a_table, q_clause a_clauses[]);
a_table.joinType('left join')
if UpperBound(a_clauses) > 0 then a_table.joinClauses(a_clauses)

queryTables.push({a_table})

return this
end function

public function q_query _rightjoin (q_resulttable a_table, q_clause a_clauses[]);
a_table.joinType('right join')
if UpperBound(a_clauses) > 0 then a_table.joinClauses(a_clauses)

queryTables.push({a_table})

return this
end function

public function _array getquerycollumns ();
return this.queryColumns
end function

public function _array getquerytables ();
return this.queryTables
end function

public function _array getqueryclauses ();
return this.queryClauses
end function

public function q_query _on (q_clause a_clauses[]);
q_table tableAux
tableAux = queryTables.at(queryTables.length())
tableAux.joinClauses(a_clauses)

return this
end function

on q_query.create
call super::create
end on

on q_query.destroy
call super::destroy
end on

event constructor;call super::constructor;
this.queryColumns = _init_.Class('_array')
this.queryClauses = _init_.Class('_array')
this.queryTables = _init_.Class('_array')
end event

