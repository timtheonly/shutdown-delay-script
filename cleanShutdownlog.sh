#! /bin/bash
logFile=shutdown.log
if [$# -eq 0]
then 
	size=$(stat -c %s $logFile)
	#echo $logFile $size
	if test $size -ge 3145728
		then
		tail $logFile >> tmp
		rm  $logFile
		echo "`date +%a-%H:%M:%S-%d/%m/%y`--  log file cleaned" >> $logFile
		cat tmp >> $logFile
		exit
	fi
fi

if test $1 = "clean"
	then
	rm $logFile
	echo "`date +%a-%H:%M:%S-%d/%m/%y`--  log file forceably cleaned" >> $logFile
	exit
fi

