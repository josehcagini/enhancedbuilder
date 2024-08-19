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
u_transaction defaultTransaction
end variables

forward prototypes
public function str_querybuilder_parm getconstructorparm ()
public function u_transaction getdefaulttransaction ()
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

