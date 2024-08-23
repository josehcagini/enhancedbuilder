HA$PBExportHeader$databasemanager.sru
forward
global type databasemanager from nonvisualobject
end type
end forward

global type databasemanager from nonvisualobject
end type
global databasemanager databasemanager

type variables
STRING CLASS_SUPER = 'U_DATABASE'  
STRING CLASS_POSTGRES 

STRING SGDB_POSTGRES = 'POSTGRES'

STRING DEFAULT_SGDB

STRING CLASS_QUERY_SUPER = 'querybuilder'
STRING CLASS_QUERY_P0STGRE

_map transaction_map

end variables

forward prototypes
public function string gettypesgdb (string a_sgdb)
public subroutine setdefaultsgdb (string a_type)
public function STRING getdefaulttypesgdb ()
public function databasemanager addtransaction (string a_typesgdb, string key, u_transaction a_trans)
public function string getdefaultkey ()
public function u_transaction gettransaction (string a_typesgdb, string key)
public function u_transaction getdefaulttrans ()
public function querybuilder querybuilder ()
public function queryBuilder querybuilder (string a_typesgdb)
public function string getclassquery (string a_typesgdb)
end prototypes

public function string gettypesgdb (string a_sgdb);
string ls_return
choose case Upper(a_sgdb)
	case SGDB_POSTGRES
		ls_return = CLASS_POSTGRES
end choose

return Lower(ls_return)
end function

public subroutine setdefaultsgdb (string a_type);DEFAULT_SGDB = a_type
end subroutine

public function STRING getdefaulttypesgdb ();return this.getTypeSgdb(DEFAULT_SGDB)
end function

public function databasemanager addtransaction (string a_typesgdb, string key, u_transaction a_trans);
transaction_map.Set(Lower(a_typesgdb + key), a_trans)
return this

end function

public function string getdefaultkey ();return '_default'
end function

public function u_transaction gettransaction (string a_typesgdb, string key);
u_transaction l_trans
l_trans = transaction_map.Get(Lower(a_typesgdb+key))
return l_trans 


end function

public function u_transaction getdefaulttrans ();return this.getTransaction(this.getDefaultTypeSgdb(), this.getDefaultKey())
end function

public function querybuilder querybuilder ();
return this.queryBuilder(DEFAULT_SGDB)
end function

public function queryBuilder querybuilder (string a_typesgdb);
queryBuilder newQuery

newQuery = _init_.class(this.getClassQuery(a_typesgdb))

return newQuery

end function

public function string getclassquery (string a_typesgdb);
string ls_class 

choose case Upper(a_typesgdb)
	case SGDB_POSTGRES
		ls_class = CLASS_QUERY_P0STGRE
end choose

return ls_class
end function

on databasemanager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on databasemanager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor; CLASS_POSTGRES = CLASS_SUPER + '_POSTGRES'
 CLASS_QUERY_P0STGRE = CLASS_QUERY_SUPER + 'postgres'
 
try
	transaction_map = _init_.class('_map', NULL_OBJ)
catch(PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
end try
end event

