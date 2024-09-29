$PBExportHeader$q_clause.sru
forward
global type q_clause from q_basebuilder
end type
end forward

global type q_clause from q_basebuilder
end type
global q_clause q_clause

type variables

protected q_collumn clause_name
protected string clause_operator
protected q_collumn clause_value
protected string clause_logicalOperator

protected boolean isNested

protected _array nested_clauses

protected u_database _database

end variables

forward prototypes
public function q_clause equals (string a_value)
public function str_q_clause_parm getconstructorparm ()
public function string getname ()
public function string getoperator ()
public function string getvalue ()
public function boolean isnested ()
public function string getlogicaloperator ()
public subroutine setdatabase (u_database a_db)
public function _array getnestedclauses ()
public function string tostring ()
end prototypes

public function q_clause equals (string a_value);
return this
end function

public function str_q_clause_parm getconstructorparm ();
str_q_clause_parm str_return
str_return = __static.get_constructor_parm()
return str_return
end function

public function string getname ();
return  this.clause_name.getName()
end function

public function string getoperator ();
return this.clause_operator
end function

public function string getvalue ();
return this.clause_value.getName()
end function

public function boolean isnested ();
return this.isNested
end function

public function string getlogicaloperator ();
return this.clause_logicalOperator
end function

public subroutine setdatabase (u_database a_db);
this._database = a_db
end subroutine

public function _array getnestedclauses ();
return this.nested_Clauses
end function

public function string tostring ();
string ls_clause = ' '

ls_clause += _database.ClauseOperation(this.clause_name, this.clause_operator, this.clause_value) 

return ls_clause
end function

on q_clause.create
call super::create
end on

on q_clause.destroy
call super::destroy
end on

event constructor;call super::constructor;
str_q_clause_parm _constructor_parms
_constructor_parms = this.getConstructorParm()

this.clause_name = __collumn(_constructor_parms.clause_table, _constructor_parms.clause_name) 
this.clause_value = __collumn( _constructor_parms.clause_value_table, _constructor_parms.clause_value)
this.clause_operator = _constructor_parms.clause_operator



end event

