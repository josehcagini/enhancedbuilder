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
public subroutine of_destroy ()
end prototypes

public subroutine of_destroy ();//
end subroutine

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

event open;
Try
	_init_ = CREATE __init__
	__console = CREATE console
	__static = _init_._static()
	__static.set__init__(_init_)
	__object = _init_._object()
	__static.set_object(__object)
	
Catch( PrivateConstructorExcept err)
	__console.log(err.GetMessage())
Finally
	this.of_destroy()
End Try
end event

