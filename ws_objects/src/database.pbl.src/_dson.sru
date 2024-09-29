$PBExportHeader$_dson.sru
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

forward prototypes
public function long of_retrieve (_array args)
public function long of_retrieve ()
end prototypes

public function long of_retrieve (_array args);
long ll_rows

if __object._IsValid(this.i_transaction) then
	this.setTransObject(i_transaction)	
end if

choose case args.length()
	case 0
		ll_rows = this.retrieve()
	case 1
		ll_rows = this.retrieve(_returnarray(args.at(1)))
	case 2
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)))
	case 3
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)))
	case 4
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)), _returnarray(args.at(4)))
	case 5
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)), _returnarray(args.at(4)), _returnarray(args.at(5)))
	case 6
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)), _returnarray(args.at(4)), _returnarray(args.at(5)), _returnarray(args.at(6)))
	case 7
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)), _returnarray(args.at(4)), _returnarray(args.at(5)), _returnarray(args.at(6)), _returnarray(args.at(7)))
	case 8
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)), _returnarray(args.at(4)), _returnarray(args.at(5)), _returnarray(args.at(6)), _returnarray(args.at(7)), _returnarray(args.at(8)))
	case 9
		ll_rows = this.retrieve(_returnarray(args.at(1)), _returnarray(args.at(2)), _returnarray(args.at(3)), _returnarray(args.at(4)), _returnarray(args.at(5)), _returnarray(args.at(6)), _returnarray(args.at(7)), _returnarray(args.at(8)), _returnarray(args.at(9)))
end choose

return ll_rows
end function

public function long of_retrieve ();
return this.of_retrieve(__array())
end function

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
	messageBox('', 'transação invalida')
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

return 1
end event

on _dson.create
call super::create
end on

on _dson.destroy
call super::destroy
end on

