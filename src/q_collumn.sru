HA$PBExportHeader$q_collumn.sru
forward
global type q_collumn from q_basebuilder
end type
end forward

global type q_collumn from q_basebuilder
end type
global q_collumn q_collumn

type variables

protected string column_name
protected string column_alias

end variables
forward prototypes
public function str_q_collumn_parm getconstructorparm ()
end prototypes

public function str_q_collumn_parm getconstructorparm ();
str_q_collumn_parm str_return
str_return = __static.get_constructor_parm()
return str_return
end function

on q_collumn.create
call super::create
end on

on q_collumn.destroy
call super::destroy
end on

event constructor;call super::constructor;
str_q_collumn_parm _constructor_parms
_constructor_parms = this.getConstructorParm()

this.column_name = _constructor_parms.column_name
this.column_alias =_constructor_parms.column_alias


end event

