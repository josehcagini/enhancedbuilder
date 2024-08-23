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
public function integer main ()
end prototypes

public subroutine createstatic ();try
	_init_ = CREATE __init__
	sleep(1)
	__static = _init_._static()
catch( PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
end try
end subroutine

public function integer startapp ();try
	_app main_app
	
	main_app = __static.getInstance('_app')
	main_app.main()
catch( PrivateConstructorExcept err)
	MessageBox('', err.GetMessage())
finally

end try

return 1
end function

public function integer main ();
try
	sleep(1)
	this.createStatic()
	sleep(1)
	this.startApp()
catch(Throwable thr)
	MessageBox('', thr.getMessage())
end try

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

event open;try
	this.main()
catch(Throwable thr)
	MessageBox('', thr.getMessage())
end try
end event

