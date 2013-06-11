#! /bin/bash
logFile=~/shutdown.log
if [ $# -gt 0 ]
then 
	if [ $1 =  "clean" ]
	then
			rm $logFile
			echo "`date +%a-%H:%M:%S-%d/%m/%y`--  log file forceably cleaned" >> $logFile
			exit
	fi
fi


size=$(stat -c %s $logFile)
if [ $size -ge 3145728 ] 
	then
		tail $logFile >> tmp
		rm  $logFile
		echo "`date +%a-%H:%M:%S-%d/%m/%y`--  log file cleaned" >> $logFile
		cat tmp >> $logFile
		exit
fi
