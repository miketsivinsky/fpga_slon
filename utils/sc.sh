#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo '[ERROR] no input arg'
	exit 1
fi

PRJ_NAME=$1

echo "[INFO] $PRJ_NAME"

rm -rf .Xil
rm -rf $PRJ_NAME.sim
rm -rf $PRJ_NAME.cache
rm -rf $PRJ_NAME.hw
rm -rf $PRJ_NAME.ip_user_files
rm -rf $PRJ_NAME.ioplanning
rm -rf $PRJ_NAME.runs

rm -rf *.jou
rm -rf *.log
rm -rf *.xpr
rm -rf *.dmp

