HA$PBExportHeader$u_process.sru
forward
global type u_process from nonvisualobject
end type
end forward

global type u_process from nonvisualobject
end type
global u_process u_process

type variables
string dotEnvFilePath = ''
string defaultSectionDotEnvFile = 'default'
end variables

forward prototypes
public function string getdotenvfilepath ()
public subroutine setdotenvfilepath (string value)
public function string env (string key, string default)
end prototypes

public function string getdotenvfilepath ();Return this.dotEnvFilePath
end function

public subroutine setdotenvfilepath (string value);this.dotEnvFilePath = value
end subroutine

public function string env (string key, string default);
string ls_value
ls_value = ProfileString(this.getDotEnvFilePath(), this.defaultSectionDotEnvFile, key, default)
return ls_value 
end function

on u_process.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_process.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;
string ls_dotEnvPath
ls_dotEnvPath = rootDirName() + '\.env.ini'

If Not FileExists(ls_dotEnvPath) Then MessageBox('', '.env file not found')

this.setDotEnvFilePath(ls_dotEnvPath)
end event

