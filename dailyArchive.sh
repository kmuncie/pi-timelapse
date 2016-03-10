#!/bin/bash

TODAY=$(date +"%Y-%m-%d")

aws s3 mv ~/webcam/images/today/ s3://pi-timelapse-archive/$TODAY/ --recursive --exclude '*' --include '*.jpg'
