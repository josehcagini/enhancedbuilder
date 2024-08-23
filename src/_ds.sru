HA$PBExportHeader$_ds.sru
forward
global type _ds from datastore
end type
end forward

global type _ds from datastore
end type
global _ds _ds

type variables
Protected u_transaction i_transaction

Protected str_ds_parm _constructor_parms
end variables

forward prototypes
public function long find (string ls_filter)
public function any getitem (long row, string col, any default)
public function string of_describe (string a_string)
public function _ds createfromsql (string as_sql, transaction a_trans)
public function boolean ds_typenumber (string a_type)
public function boolean ds_typedate (string a_type)
public function boolean ds_typedatetime (string a_type)
public function boolean ds_typestring (string a_type)
public function boolean ds_typetime (string a_type)
public function str_ds_parm getconstructorparm ()
public function _ds createfromsql (string as_sql)
public function integer settransobject (transaction t)
end prototypes

public function long find (string ls_filter);
return this.find(ls_filter, 0, this.rowCount())
end function

public function any getitem (long row, string col, any default);
string colType
any al_result

colType = this.of_Describe(col + ".Coltype")
choose case TRUE 
	case this.ds_typeNumber(colType)
		return _coalesce(this.GetItemNumber(row, col), default)
	case this.ds_typeDate(colType)
		return _coalesce(this.GetItemDate(row, col), default)
	case this.ds_typeDateTime(colType)
		return _coalesce(this.GetItemDateTime(row, col), default)
	case this.ds_typeTime(colType)
		return _coalesce(this.GetItemTime(row, col), default)
	case this.ds_typeString(colType)
		return _coalesce(this.GetItemString(row, col), default)
end choose

return default
end function

public function string of_describe (string a_string);return this.describe(a_string)
end function

public function _ds createfromsql (string as_sql, transaction a_trans);
string errors, genSyntax

this.SetTransObject(a_trans)

genSyntax = i_transaction.SyntaxFromSql(as_sql, "style(type=grid)", errors)

If Len(errors) > 0 Then
	
	return this
End If

This.Create(genSyntax)

return this
end function

public function boolean ds_typenumber (string a_type);return _in(Upper(a_type), {'LONG', 'INTEGER'})
end function

public function boolean ds_typedate (string a_type);return _in(Upper(a_type), {'DATE'})
end function

public function boolean ds_typedatetime (string a_type);return _in(Upper(a_type), {'DATETIME'})
end function

public function boolean ds_typestring (string a_type);return _in(Upper(a_type), {'STRING'})
end function

public function boolean ds_typetime (string a_type);return _in(Upper(a_type), {'TIME'})
end function

public function str_ds_parm getconstructorparm ();
str_ds_parm str_return
str_return = __static.get_constructor_parm()
return str_return
end function

public function _ds createfromsql (string as_sql);
return this.createFromSQL(as_sql, i_transaction)
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

event constructor;

_constructor_parms = this.getConstructorParm()

if isValid(_constructor_parms) then
	this.dataobject = _constructor_parms.dataobject
end if

end event

