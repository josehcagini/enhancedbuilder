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
public function powerobject class (string classname) throws privateconstructorexcept
public function _object _object ()
public function _static _static ()
public function console console ()
end prototypes

public function boolean isprivateconstructor (string as_classname);ClassDefinition classDef
classDef = FindClassDefinition(as_classname)

long index
For index = 1 To UpperBound(classDef.variableList)
	VariableDefinition varDef
	varDef = classDef.variableList[index]
	If Upper(varDef.Name) = __PRIVATECONSTRUCTOR Then 
		return TRUE
	End If
Next

return FALSE
end function

public function powerobject class (string classname) throws privateconstructorexcept;
powerobject new_object
if this.IsPrivateConstructor(classname) then 
	Throw CREATE PrivateConstructorExcept
end if
new_object = CREATE USING classname
return new_object 

end function

public function _object _object ();
if not isValid(__object) Then
	__object = CREATE _object
End If
return __object
end function

public function _static _static ();
if not isValid(__static) Then
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

on __init__.create
call super::create
TriggerEvent( this, "constructor" )
end on

on __init__.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

