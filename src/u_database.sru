HA$PBExportHeader$u_database.sru
forward
global type u_database from nonvisualobject
end type
end forward

global type u_database from nonvisualobject
end type
global u_database u_database

type variables

CONSTANT STRING _BETWEEN = 'between'
CONSTANT STRING _IN = 'in'
CONSTANT STRING _NOT = 'not'
CONSTANT STRING _EQUALS = '='
CONSTANT STRING _DIFF = '<>'
CONSTANT STRING _GREATER = '>'
CONSTANT STRING _GREATEREQUAL = '>='
CONSTANT STRING _LESSES = '<'
CONSTANT STRING _LESSEREQUAL = '<='
end variables

forward prototypes
public function string generatedbparm (string a_dns, string a_uid, string a_pwd)
public function u_transaction createtransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, string a_db_autocommit)
public function string clauseoperation (q_collumn a_name, string a_operation, q_collumn a_value)
public function string clausebetween (q_collumn a_name, q_collumn a_value)
public function string clausein (q_collumn a_name, q_collumn a_value)
public function string clausegeneric (q_collumn a_name, string a_operation, q_collumn a_value)
public function string convertdatatosql (any a_rawdata[])
end prototypes

public function string generatedbparm (string a_dns, string a_uid, string a_pwd);return "ConnectString='DSN=" + a_dns + ";UID=" + a_uid + ";PWD=" + a_pwd + "'"

end function

public function u_transaction createtransaction (string a_db_dbms, string a_db_sgdb, string a_db_database, string a_db_userid, string a_db_pass, string a_db_dsn, string a_db_lock, string a_db_autocommit);
//implements on descendants
u_transaction t
return t
end function

public function string clauseoperation (q_collumn a_name, string a_operation, q_collumn a_value);
string ls_response

choose case a_operation
	case this._BETWEEN
		ls_response += this.ClauseBetween(a_name, a_value)
	case this._IN
		ls_response += this.ClauseIn(a_name, a_value)
	case this._EQUALS, this._DIFF, this._GREATER, this._GREATEREQUAL, this._LESSES, this._LESSEREQUAL
		ls_response += this.ClauseGeneric(a_name, a_operation, a_value)
end choose

return ls_response
end function

public function string clausebetween (q_collumn a_name, q_collumn a_value);
any valueData[]
valueData = a_value.getrawData()

return '"' + a_name.getAlias() + '" ' + this._BETWEEN + ' ' + this.convertDataToSQL(valueData[1]) + ' and ' + this.convertDataToSQL(valueData[2])
end function

public function string clausein (q_collumn a_name, q_collumn a_value);
any valueData[]
valueData = a_value.getrawData()

return ' "' + a_name.getAlias() + '" ' + this._IN + ' (' + this.convertDataToSQL(valueData) + ' ) '
end function

public function string clausegeneric (q_collumn a_name, string a_operation, q_collumn a_value);
any valueData[]
valueData = a_value.getrawData()

if a_value.isRaw() then
	return ' "' + a_name.getAlias() + '" ' + a_operation + ' "' + this.convertDataToSQL(valueData[1]) + '" '
else
	return ' "' + a_name.getAlias() + '" ' + a_operation + ' "' + a_value.getAlias() + '" '	
end if


end function

public function string convertdatatosql (any a_rawdata[]);
string ls_response = ' '

int index 
for index = 1 to UpperBound(a_rawData)
	choose case className(ls_response)
		case 'string'
			ls_response += "'" + a_rawData[1] + "'"
		case 'number', 'integer', 'long', 'double', 'float'
			ls_response += a_rawData[1]
		case 'date'
			date dataValue
			dataValue = a_rawData[1]
			ls_response += String(dataValue, 'yyyy-mm-dd')
	end choose
	ls_response += ', '
next

ls_response = Left(ls_response, Len(ls_response)-2)

return ls_response
end function

on u_database.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_database.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

