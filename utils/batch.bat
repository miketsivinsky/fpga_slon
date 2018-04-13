@echo off
if [%1] == [] (
	exit
)

set PRJ_NAME=%1

start vivado -mode batch -journal %PRJ_NAME%.jou -log %PRJ_NAME%.log -source %PRJ_NAME%.tcl
