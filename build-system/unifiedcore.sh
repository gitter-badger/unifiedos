#!/bin/bash

## This script is going to build the base system without any heavy packages.
## Be aware that you must have the "live-build" package with all it's dependencies on your workstation.

## Greeting
echo Welcome to the Unified OS Core build-system script
wait 3

## Check and Build directories.
echo A build directory is required to help orginize the files. However if you already have a working directory ready you can select no for this prompt.
wait 3
read -p "Do you want to install a working directory called /live-build/? (y/n)" ANS
if [ "$ANS" = "y" ]; then
 echo Building working dir called /live-build/
 mkdir live-build
 cd live-build
 echo Now we are in the live-build directory. So please take note.
else
 echo Continuing to the next step.
 wait 2 

## Build Prompt
read -p "Please enter "wheezy" to build the base image on the amd64 arch" BUILD
echo "You chose $BUILD"
if [ "x$BUILD" = "xwheezy" ]
then
    # Build for debian wheezy
    lb config --bootloader grub -d wheezy -a amd64 --debian-installer netinst
else
    # Exit Script
    echo Exiting Build Script.
    echo See you again.
    wait 3
    exit

## Ask if user wants to build again.
read -p "Do you want to retry or quit to terminal? (y/n)?" CONT
if [ "$CONT" == "y" ]; then
  echo "Redoing Script";
  wait 3
  sh ./unifiedcore.sh
else
  echo "Good Bye";
  exit
fi




