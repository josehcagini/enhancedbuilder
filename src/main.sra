HA$PBExportHeader$main.sra
$PBExportComments$Generated Application Object
forward
global type main from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type main from application
string appname = "main"
end type
global main main

on main.create
appname="main"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on main.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;queryBuilder u_queryBuilder 
u_queryBuilder = Create queryBuilder

classdefinition lcd
lcd = u_queryBuilder.classdefinition

//PBDOM_ELEMENT pbdom_elem_1
//PBDOM_ELEMENT pbdom_elem_2 
//
//pbdom_elem_1 = Create PBDOM_ELEMENT
//pbdom_elem_2 = Create PBDOM_ELEMENT 
//
//pbdom_elem_1.SetName("pbdom_elem_1")
//pbdom_elem_2.SetName("pbdom_elem_2")
//pbdom_elem_1.AddContent(pbdom_elem_2)
end event

