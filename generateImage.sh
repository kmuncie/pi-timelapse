#!/bin/bash

root_folder="/home/pi/webcam/images/today"
file_prefix="nyc_"
counter="0001";
filename="$root_folder/$file_prefix$counter.jpg"
# check if there are any files already
if [ -e "$filename" ]
then
	# if there are then get latest one
	last_file=$(ls $root_folder|sort -n|tail -n 1)
	echo lastfile: $last_file
	# and get the counter from the file name
	old_counter=$(echo $last_file | sed -r 's/(nyc_)([0-9]{4})(.jpg)/\2/')
  echo old: $old_counter
  incremented_counter=$((10#$old_counter + 1))
  counter=$(printf "%04d" $incremented_counter)
  echo counter now set to $counter
else
	echo "this is the first picture"
fi

# if there aren't any files then use the default counter
filename="$root_folder/$file_prefix$counter.jpg"
echo filename: $filename

fswebcam -c ~/.fswebcam.conf $filename
