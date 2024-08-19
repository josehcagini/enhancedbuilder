HA$PBExportHeader$__init__.sru
forward
global type __init__ from nonvisualobject
end type
end forward

shared variables
boolean isStatic = TRUE
boolean isSingleton = TRUE
boolean privateConstructor = TRUE
end variables

global type __init__ from nonvisualobject
end type
global __init__ __init__

type variables

end variables

forward prototypes
public function boolean isprivateconstructor (string as_classname)
public function _object _object ()
public function _static _static ()
public function console console ()
public function constructor_parm constructor_parm ()
public function u_process _process ()
public function powerobject class (string classname, powerobject str_parm)
end prototypes

public function boolean isprivateconstructor (string as_classname);ClassDefinition classDef
classDef = FindClassDefinition(as_classname)

if Not IsValid(classDef) then return FALSE

long listNumber 
long index
string varName 

VariableDefinition varList[]

if UpperBound(classDef.variableList) <= 0 then return FALSE
varList = classDef.variableList

VariableDefinition varDef
listNumber = UpperBound(varList)
for index = 1 to listNumber
	varDef = varList[index]
	if __object.IsNotValid(varDef) then continue
	varName = Upper(varDef.Name)
	if varName = __PRIVATECONSTRUCTOR then 
		return TRUE
	end if
next

return FALSE
end function

public function _object _object ();
if not isValid(__object) Then
	__object = CREATE _object
End If
return __object 
end function

public function _static _static ();
if not isValid(__static) Then
	setNull(NULL_OBJ)
	__static = CREATE _static
End If
return __static
end function

public function console console ();
if not isValid(__console) Then
	__console = CREATE console
End If
return __console
end function

public function constructor_parm constructor_parm ();
constructor_parm new_constructor_parm
new_constructor_parm = CREATE constructor_parm 
return new_constructor_parm
end function

public function u_process _process ();
if not isValid(__process) Then
	__process = CREATE u_process
End If
return __process
end function

public function powerobject class (string classname, powerobject str_parm);
powerobject new_object

classname = Lower(classname)

//if this.IsPrivateConstructor(classname) then 
//	Throw CREATE PrivateConstructorExcept
//end if

__static.send_constructor_parm(str_parm)
new_object = CREATE USING classname
return new_object 

end function

on __init__.create
call super::create
TriggerEvent( this, "constructor" )
end on

on __init__.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

