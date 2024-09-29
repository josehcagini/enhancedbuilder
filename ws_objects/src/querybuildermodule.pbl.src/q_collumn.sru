$PBExportHeader$q_collumn.sru
forward
global type q_collumn from q_basebuilder
end type
end forward

global type q_collumn from q_basebuilder
end type
global q_collumn q_collumn

type variables

protected string column_table
protected string column_name
protected string column_alias

protected boolean isRaw
protected any rawData[]

end variables

forward prototypes
public function str_q_collumn_parm getconstructorparm ()
public function string getalias ()
public function string getname ()
public function string gettable ()
public function any getrawdata ()
public function boolean israw ()
end prototypes

public function str_q_collumn_parm getconstructorparm ();
str_q_collumn_parm str_return
str_return = __static.get_constructor_parm()
return str_return
end function

public function string getalias ();
return this.column_alias
end function

public function string getname ();
return this.column_name
end function

public function string gettable ();
return this.column_table
end function

public function any getrawdata ();
return this.rawData
end function

public function boolean israw ();
return this.isRaw
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
this.column_table =_constructor_parms.column_table


end event

