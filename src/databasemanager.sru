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
end variables
forward prototypes
public function string gettypesgdb (string a_sgdb)
public subroutine setdefaultsgdb (string a_type)
public function STRING getdefaulttypesgdb ()
end prototypes

public function string gettypesgdb (string a_sgdb);
string ls_return
choose case a_sgdb
	case SGDB_POSTGRES
		ls_return = CLASS_POSTGRES
end choose

return ls_return 
end function

public subroutine setdefaultsgdb (string a_type);DEFAULT_SGDB = a_type
end subroutine

public function STRING getdefaulttypesgdb ();return this.getTypeSgdb(DEFAULT_SGDB)
end function

on databasemanager.create
call super::create
TriggerEvent( this, "constructor" )
end on

on databasemanager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor; CLASS_POSTGRES = CLASS_SUPER + 'POSTGRES'
end event

