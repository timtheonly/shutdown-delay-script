shutdown-delay-script
=====================

Using [zenity](https://help.gnome.org/users/zenity/stable/) to create a user interface, to notify the user of a pending scheduled shutdown

##Features

* user can choose to suspend or allow shutdown 
* user can input number of hours to delay the shutdown by
* only manual additions to cron for the moment
* logs all outcomes
* log file can be cleaned by cleanShutdownlog.sh by passing the arg clean. If run without any args it will only remove the log file if its size is larger than 3mb
 
##Upcomming Features

* automaticaly scan cron for scheduled shutdowns
* allow user to specify time that shutdown is delayed till (i.e. 15:30)
