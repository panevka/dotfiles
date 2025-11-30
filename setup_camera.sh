#!/bin/bash

# Terminate any running instances of the applications that may be using the camera
sudo killall obs
sudo killall droidcam
sudo killall droidcam-cli
sudo killall firefox
sudo killall google-chrome-stable

# Remove existing v4l2loopback module if loaded
sudo rmmod v4l2loopback

# Setup 2 virtual camera devices using v4l2loopback
sudo modprobe v4l2loopback devices=2 video_nr=0,20 card_label="DroidCam,OBS Virtual Camera" exclusive_caps=1

# Verify that the virtual camera devices are created
lsof /dev/video*
ls /dev/video*

# Connect droidcam to the first virtual camera device
droidcam-cli -dev=/dev/video0 -v 192.168.1.7 4747

