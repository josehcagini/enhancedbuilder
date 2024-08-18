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
_init_ = CREATE __init__
__static = _init_._static()
__static.set__init__(_init_)
__object = _init_._object()
__static.set_object(__object)


ClassDefinition temp_ClassDef
VariableDefinition temp_VariableList[]

temp_ClassDef = FindClassDefinition('__init__')
temp_VariableList = temp_ClassDef.variablelist

long var_index 
for var_index = 1 to UpperBound(temp_VariableList)
	VariableDefinition index_VariableList
	index_VariableList = temp_VariableList[var_index]
	index_VariableList.name 
end for

temp_ClassDef = FindClassDefinition('__static')
temp_ClassDef = FindClassDefinition('__object')


end event

