#!/bin/bash
## case usage
function help() {
	echo "Use keywords morg,evn,afternoon,an,evening !!"
	echo "bye"
	exit 1
}
read -erp "Enter greetings : morg,evn,afternoon >>" greet
case $greet in 
	morg)
		echo " Good Morning $(whoami)"
	  ;;
	evn|evening)
		echo "Good Evening $(whoami)"
	  ;;
	afternoon|an)
		echo "Good Afternoon $(whoami)"
	  ;;
	*)
          echo "Check you time :) Wrong keyword"
	  help
	  ;;
esac
