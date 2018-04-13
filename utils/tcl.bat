@echo off
if [%1] == [] (
	exit
)

set PRJ_NAME=%1

if exist %PRJ_NAME%.tcl (
	start vivado -mode tcl -journal %PRJ_NAME%.jou -log %PRJ_NAME%.log -source %PRJ_NAME%.tcl -notrace
) else (
	start vivado -mode tcl -journal %PRJ_NAME%.jou -log %PRJ_NAME%.log 
)