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

protected q_table queryTables[]
protected q_clause queryClauses[]
protected q_collumn queryColumns[]


end variables
forward prototypes
public function str_querybuilder_parm getconstructorparm ()
public function u_transaction getdefaulttransaction ()
public function querybuilder _select (string a_select[])
public function querybuilder _where (string a_where[])
public function querybuilder _select ()
public function querybuilder _select (q_collumn aq_collumn[])
public function querybuilder _where (q_clause aq_clause[])
public function querybuilder _join (q_table a_table, q_clause a_clauses[])
public function querybuilder _leftjoin (q_table a_table, q_clause a_clauses[])
public function querybuilder _rightjoin (q_table a_table, q_clause a_clauses[])
public function querybuilder _from (q_table aq_table)
public function querybuilder _from (string a_table)
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

public function querybuilder _join (q_table a_table, q_clause a_clauses[]);
return this
end function

public function querybuilder _leftjoin (q_table a_table, q_clause a_clauses[]);
return this
end function

public function querybuilder _rightjoin (q_table a_table, q_clause a_clauses[]);
return this
end function

public function querybuilder _from (q_table aq_table);
return this
end function

public function querybuilder _from (string a_table);
return this
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

u_transaction receivedTransaction
if __object._IsValid(_construtor_parms) then
	if __object.IsNotValid(_construtor_parms.defaulttransaction) then
		receivedTransaction = this.getDefaultTransaction()
	else
		receivedTransaction = _construtor_parms.defaulttransaction
	end if
end if

this.defaultTransaction = receivedTransaction

end event

