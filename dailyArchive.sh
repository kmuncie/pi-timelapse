#!/bin/bash

TODAY=$(date +"%Y-%m-%d")

# Move days images to temp folder so we can do long upload
cp -avr ~/webcam/images/today ~/webcam/images/todayTEMP

# Delete days images immediately after move so new photos can start at 0001
rm -rf ~/webcam/image/today/*.jpg

# Upload to s3 bucket from temp folder
aws s3 mv ~/webcam/images/todayTEMP/ s3://pi-timelapse-archive/$TODAY/ --recursive --exclude '*' --include '*.jpg'

# Delete temp folder after upload
rm -rf ~/webcam/images/todayTEMP
