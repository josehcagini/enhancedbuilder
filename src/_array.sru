HA$PBExportHeader$_array.sru
forward
global type _array from nonvisualobject
end type
end forward

global type _array from nonvisualobject
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
integer index



return index
end function

public function _array splice (integer index, integer deletedcount);
_array deletedElements

deletedElements = _init_.class('_array')

integer ll_for
integer oldLength 
oldLength = this.length
for ll_for = index to oldLength
	deletedElements.push(this.component[index])
	this.component[index] = this.component[index + 1]
	this.length -= 1
next

return deletedElements
end function

on _array.create
call super::create
TriggerEvent( this, "constructor" )
end on

on _array.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

