HA$PBExportHeader$u_database_postgres.sru
forward
global type u_database_postgres from u_database
end type
end forward

global type u_database_postgres from u_database
end type
global u_database_postgres u_database_postgres

on u_database_postgres.create
call super::create
end on

on u_database_postgres.destroy
call super::destroy
end on

