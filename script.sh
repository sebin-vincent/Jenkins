#!/bin/bash

FirstName=$1

Show=$2

if [ "$Show" = "true" ]
then
    echo "Hello $FirstName"
else
    echo "Please select show to see your name"
fi