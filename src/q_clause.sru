HA$PBExportHeader$q_clause.sru
forward
global type q_clause from q_basebuilder
end type
end forward

global type q_clause from q_basebuilder
end type
global q_clause q_clause

type variables

protected string clause_name
protected string clause_operator
protected string clause_value
end variables
forward prototypes
public function q_clause equals (string a_value)
public function str_q_clause_parm getconstructorparm ()
end prototypes

public function q_clause equals (string a_value);
return this
end function

public function str_q_clause_parm getconstructorparm ();
str_q_clause_parm str_return
str_return = __static.get_constructor_parm()
return str_return
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

this.clause_name =_constructor_parms.clause_name
this.clause_value = _constructor_parms.clause_value
this.clause_operator =_constructor_parms.clause_operator


end event

