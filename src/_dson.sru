HA$PBExportHeader$_dson.sru
forward
global type _dson from _ds
end type
end forward

global type _dson from _ds
end type
global _dson _dson

type variables
databaseManager i_dbmanager
end variables

event constructor;call super::constructor;

i_dbmanager = __static.getInstance('databasemanager')

u_transaction initialTransaction; 
initialTransaction = i_dbmanager.getDefaultTrans()

if __object._isValid(_constructor_parms) then
	if __object._isValid(_constructor_parms.transaction) then
		initialTransaction = _constructor_parms.transaction
	end if
end if

if __object.IsNotValid(initialTransaction) then
	messageBox('', 'transa$$HEX2$$e700e300$$ENDHEX$$o invalida')
end if

if _coalesce(initialTransaction.DBHandle(), 0) < 0 then
	messageBox('', 'DBHandle invalida')
end if

if _coalesce(initialTransaction.SQLCode, 0) < 0 then
	messageBox('', 'SQLCode invalida')
end if

if _coalesce(initialTransaction.SQLDBCode, 0) < 0 then
	messageBox('', 'SQLDBCode invalida')
end if

this.setTransObject(initialTransaction)
end event

on _dson.create
call super::create
end on

on _dson.destroy
call super::destroy
end on

