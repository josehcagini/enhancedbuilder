HA$PBExportHeader$_dsfactory.sru
forward
global type _dsfactory from ancobject
end type
end forward

global type _dsfactory from ancobject
end type
global _dsfactory _dsfactory

forward prototypes
public subroutine createdsmap (ref _ds ads)
end prototypes

public subroutine createdsmap (ref _ds ads);ads = _init_.class( '_ds', NULL_OBJ)

ads.dataobject = 'd_dsmap'
end subroutine

on _dsfactory.create
call super::create
end on

on _dsfactory.destroy
call super::destroy
end on

