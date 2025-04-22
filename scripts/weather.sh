#!/bin/bash

# Default location is 'laf' if no argument is provided
LOCATION=${1}

curl -s "wttr.in/${LOCATION}?format=It+feels+like+%c+%f+in+%l\n" | cowsay
