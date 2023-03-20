#!/bin/bash

# setup the program
./setup.sh 

# compile
./compile.sh 

# fuzz UEFI
./execute.sh 
