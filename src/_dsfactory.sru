HA$PBExportHeader$_dsfactory.sru
forward
global type _dsfactory from ancobject
end type
end forward

global type _dsfactory from ancobject
end type
global _dsfactory _dsfactory

type variables
databaseManager i_dbmanager
end variables
forward prototypes
public subroutine createdsmap (ref _ds ads)
public function _dson createdson (string a_dataobject, u_transaction a_trans)
public function _dson createdson (string a_dataobject)
public function _dson createdson ()
end prototypes

public subroutine createdsmap (ref _ds ads);ads = _init_.class( '_ds')

ads.dataobject = 'd_dsmap'
end subroutine

public function _dson createdson (string a_dataobject, u_transaction a_trans);
_dson newDs 

str_ds_parm newDs_parm
newDs_parm.dataobject = a_dataobject
newDs_parm.transaction = a_trans

newDs = _init_.Class('_dson', newDs_parm)
return newDs
end function

public function _dson createdson (string a_dataobject);
return this.createdson(a_dataobject, i_dbmanager.GetDefaultTrans())
end function

public function _dson createdson ();
return this.createdson('')
end function

on _dsfactory.create
call super::create
end on

on _dsfactory.destroy
call super::destroy
end on

event constructor;call super::constructor;
i_dbmanager = __static.GetInstance('databaseManager')


end event

