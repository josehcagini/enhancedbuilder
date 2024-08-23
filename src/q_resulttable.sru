HA$PBExportHeader$q_resulttable.sru
forward
global type q_resulttable from q_basebuilder
end type
end forward

global type q_resulttable from q_basebuilder
end type
global q_resulttable q_resulttable

type variables

protected string table_alias
protected _array joinClauses
protected string joinType
end variables

forward prototypes
public function q_resulttable jointype (string a_type)
public function q_resulttable joinclauses (q_clause a_clauses[])
public function string getjointype ()
public function _array getclauses ()
public function string getalias ()
end prototypes

public function q_resulttable jointype (string a_type);
this.joinType = a_type
return this
end function

public function q_resulttable joinclauses (q_clause a_clauses[]);
this.joinClauses.push(a_clauses)
return this
end function

public function string getjointype ();
return this.joinType
end function

public function _array getclauses ();
return this.joinClauses
end function

public function string getalias ();
return this.table_alias
end function

on q_resulttable.create
call super::create
end on

on q_resulttable.destroy
call super::destroy
end on

