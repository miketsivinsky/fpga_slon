#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo '[ERROR] no input arg'
	exit 1
fi

PRJ_NAME=$1
PRJ_TCL_FILE=$PRJ_NAME.tcl

if [ -f $PRJ_TCL_FILE ]; then
	echo "[INFO] $PRJ_NAME started at tcl mode"
	vivado -mode tcl -journal $PRJ_NAME.jou -log $PRJ_NAME.log -source $PRJ_TCL_FILE -notrace
else
	echo "[WARN] $PRJ_TCL_FILE not exist"
	vivado -mode tcl -journal $PRJ_NAME.jou -log $PRJ_NAME.log
fi	



