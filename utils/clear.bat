@echo off
if [%1] == [] (
	exit
)

set PRJ_NAME=%1

rd .Xil                      /s /q
rd %PRJ_NAME%.sim            /s /q
rd %PRJ_NAME%.cache          /s /q
rd %PRJ_NAME%.hw             /s /q
rd %PRJ_NAME%.ip_user_files  /s /q
rd %PRJ_NAME%.ioplanning     /s /q
rd %PRJ_NAME%.runs           /s /q

del *.jou
del *.log
del *.xpr
del *.dmp

