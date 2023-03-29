#!/bin/bash

main_dir=$PWD
# Create a snapshot of the FW at the EFI Shell

# run the fuzzer
cd $main_dir/simics/fuzzer-project
$main_dir/AFLplusplus/afl-fuzz -i testcases/ -o testrun/ -n -t 100000 -- ./afl-wrapper @@
