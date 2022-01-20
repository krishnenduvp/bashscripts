#!/bin/bash
# Script to check if input is a file/directory 
#
# Usage getopts.sh -f filename
#
while getopts d:f:h opt; do
	case $opt in
		d)
		  echo "Checking if directory or not $OPTARG "
		  [ -d "$OPTARG" ] && echo "Yes" || echo "No"
		  ;;
		f)
		  echo "Checking if file or not $OPTARG "
                  [ -f "$OPTARG" ] && echo "Yes" || echo "No"
                  ;;
		h)
		  echo "Use parameter d or f filename"
		  exit 1
		  ;;

		*)
	          echo "Invalid option: $OPTARG "
		  exit 1
		  ;;
	esac
done
