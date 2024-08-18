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
public function _object _object () throws privateconstructorexcept
public function _static _static () throws privateconstructorexcept
public function powerobject class (string classname)
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

public function _object _object () throws privateconstructorexcept;
_object new_object

if this.IsPrivateConstructor('_object') then 
	Throw CREATE PrivateConstructorExcept
end if 

new_object = CREATE _object
return new_object
end function

public function _static _static () throws privateconstructorexcept;
_static new_static

if this.IsPrivateConstructor('_static') then 
	Throw CREATE PrivateConstructorExcept
end if

new_static = CREATE _static
return new_static
end function

public function powerobject class (string classname);
powerobject new_object
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

