#!  /bin/bash
logFile=~/shutdown.log
echo "`date +%a-%H:%M:%S-%d/%m/%y` -- script run" >> $logFile
zenity --question --title="System Shutdown" --text="System will shutdown at  $1:00 !\nDelay shutdown ? "
if test $? -eq 0
	then
	#get pid of running shutdown and kill
	pid=`pidof -s shutdown -h 5`
	kill $pid
	echo "`date +%a-%H:%M:%S-%d/%m/%y`--  kill exited with status of: $?" >> $logFile
	RESULT=( `zenity --entry --title="Set delay" --text="Enter the number of hours you wish to delay shutdown by or hit cancel to abort shutdown:"`)
	if test  -z $RESULT
	then
		echo "`date +%a-%H:%M:%S-%d/%m/%y` -- shutdown aborted" >> $logFile
		echo " ">> $logFile
		exit
	fi
	hour=`date +%H`
	let hour=$hour+$RESULT
	$RESULT=$(($RESULT%24))
	notify-send "Shutdown" "Shutdown has been delayed by $RESULT hours"
	/sbin/shutdown -h $hour:00 & #need to us /sbin/shutdown due to limitations in cron
	echo "`date +%a-%H:%M:%S-%d/%m/%y` -- shutdown set for $hour:00 " >> $logFile
	echo " ">> $logFile
	exit
fi
echo "`date +%a-%H:%M:%S-%d/%m/%y` -- user choose to allow shutdown" >> $logFile
echo " ">> $logFile
