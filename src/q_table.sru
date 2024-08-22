HA$PBExportHeader$q_table.sru
forward
global type q_table from q_basebuilder
end type
end forward

global type q_table from q_basebuilder
end type
global q_table q_table

type variables

protected string table_name
protected string table_schema
protected string table_alias

end variables

forward prototypes
public function str_q_table_parm getconstructorparm ()
end prototypes

public function str_q_table_parm getconstructorparm ();
str_q_table_parm str_return
str_return = __static.get_constructor_parm()
return str_return
end function

on q_table.create
call super::create
end on

on q_table.destroy
call super::destroy
end on

event constructor;call super::constructor;
str_q_table_parm _constructor_parms
_constructor_parms = this.getConstructorParm()

this.table_name = _constructor_parms.table_name 
this.table_schema = _constructor_parms.table_schema 
this.table_alias = _constructor_parms.table_alias 

end event

