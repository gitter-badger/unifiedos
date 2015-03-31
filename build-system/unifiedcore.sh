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
echo Please enter "wheezy" or "precise" to build for debian or ubuntu on the amd64 arch.
echo Please enter wheezy or precise
read BUILD
echo "You chose $BUILD"
if [ "x$BUILD" = "xwheezy" ]
then
	# Build for wheezy wheezy
else
	if [ "x$BUILD" = "xprecise" ]
then
	# Build for ubuntu precise
else
echo You did not select the correct build name.
wait 3
read -p "Do you want to retry or quit to terminal? (y/n)?" CONT
if [ "$CONT" == "y" ]; then
  echo "Redoing Script";
  wait 3
  sh ./unifiedcore.sh
else
  echo "Good Bye";
  exit
fi




