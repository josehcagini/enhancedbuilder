HA$PBExportHeader$_ds.sru
forward
global type _ds from datastore
end type
end forward

global type _ds from datastore
end type
global _ds _ds

type variables
u_transaction i_transaction
end variables
forward prototypes
public function _ds createfromsql (string as_sql)
public function long find (string ls_filter)
public function any getitem (long row, string col, any default)
public function string of_describe (string a_string)
public function integer settransobject (transaction t)
end prototypes

public function _ds createfromsql (string as_sql);
string errors, genSyntax

genSyntax = i_transaction.SyntaxFromSql(as_sql, "style(type=grid)", errors)

If Len(errors) > 0 Then
	
	return this
End If

This.Create(genSyntax)

return this
end function

public function long find (string ls_filter);
return this.find(ls_filter, 0, this.rowCount())
end function

public function any getitem (long row, string col, any default);
dwobject dwo
dwo = this.object.__getAtribute(col)

String colType
colType = this.of_Describe(col + ".Coltype")

dwo.typeof( )
this.GetItemDate(row, col)
this.GetItemDateTime(row, col)
this.GetItemNumber(row, col)
this.GetItemString(row, col)
this.GetItemTime(row, col)

return 1
end function

public function string of_describe (string a_string);return this.describe(a_string)
end function

public function integer settransobject (transaction t);
integer li_return
li_return = datastore::setTransObject(t)

this.i_transaction = t

return li_return
end function

on _ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

