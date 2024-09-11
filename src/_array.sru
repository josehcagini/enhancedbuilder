HA$PBExportHeader$_array.sru
forward
global type _array from ancobject
end type
end forward

global type _array from ancobject
end type
global _array _array

type variables

protected any component[]
protected string componenttype
protected boolean isPrimitive
protected boolean isObject

protected integer iterator
protected integer length = 0
end variables

forward prototypes
public function _array push (any element[])
public function integer length ()
public function any pop ()
public function any at (integer index)
public function any default ()
public function integer indexof (any element)
public function _array splice (integer index, integer deletedcount)
public function any toarray ()
public function str_array_parm getconstructorparm ()
end prototypes

public function _array push (any element[]);
long index
for index = 1 to UpperBound(element)
	this.component[this.length + 1] = element[index]
	this.length += 1
next
return this
end function

public function integer length ();
return this.length
end function

public function any pop ();
any element 
element = this.component[this.length()]
SetNull(this.component[this.length()])
this.length -= 1
return element
end function

public function any at (integer index);
if this.length() < index then return this.default()
return this.component[index]
end function

public function any default ();
any defaultReturn



return defaultReturn
end function

public function integer indexof (any element);
Long index
For index = 1 To This.length()
	If This.Component[index] = element Then Return index
Next
return -1
end function

public function _array splice (integer index, integer deletedcount);
_array deletedElements

deletedElements = _init_.class('_array')

Long oldLength 
oldLength = this.length()

Long ll_loop, ll_deletedLoop
ll_loop = index
ll_deletedLoop = deletedcount
Do
	If oldLength < ll_loop Then Exit
	ll_deletedLoop -= 1
	deletedElements.push(this.component[ll_loop])
	SetNull(this.component[ll_loop])
	this.length -= 1
	ll_loop += 1
Loop While ll_deletedLoop > 0

any la_newComponent[]

Long ll_For
For ll_For = 1 To index - 1
	la_newComponent[ll_For] = this.Component[ll_For]
Next

ll_loop = index
Do While oldLength >= ll_loop + deletedcount
	la_newComponent[ll_Loop] = this.component[ll_loop + deletedcount]
	SetNull(this.component[ll_loop + deletedcount])
	ll_loop += 1 
Loop

this.component = la_newComponent

return deletedElements
end function

public function any toarray ();
return this.component
end function

public function str_array_parm getconstructorparm ();
str_array_parm str_return
str_return = __static.get_constructor_parm()
return str_return
end function

on _array.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _array.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
str_array_parm _constructor_parms
_constructor_parms = this.getConstructorParm()

if __object._IsValid(_constructor_parms) then
	if UpperBound(_constructor_parms.components) > 0 then
		this.component = _constructor_parms.components
		this.length = UpperBound(this.component)
	end if
end if
end event

