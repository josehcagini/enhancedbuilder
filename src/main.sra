HA$PBExportHeader$main.sra
$PBExportComments$Generated Application Object
forward
global type main from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
__init__ _init_
_object __object
_static __static
console __console
u_process __process
powerobject NULL_OBJ

CONSTANT STRING __ISSINGLETON = 'ISSINGLETON'
CONSTANT STRING __ISSTATIC = 'ISSTATIC'
CONSTANT STRING __PRIVATECONSTRUCTOR = 'PRIVATECONSTRUCTOR'
end variables

shared variables

end variables

global type main from application
string appname = "main"
end type
global main main

forward prototypes
public subroutine createstatic ()
public function integer startapp ()
end prototypes

public subroutine createstatic ();Try
	_init_ = CREATE __init__
	__static = _init_._static()
	__static.instantiate()
Catch( PrivateConstructorExcept err)
	__console.log(err.GetMessage())
Finally
	
End Try
end subroutine

public function integer startapp ();Try
	_app main_app
	
	main_app = _init_.class('_app', NULL_OBJ)
Catch( PrivateConstructorExcept err)
	__console.log('')
End Try

return 1
end function

on main.create
appname="main"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on main.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;this.createStatic()

this.startApp()
end event

