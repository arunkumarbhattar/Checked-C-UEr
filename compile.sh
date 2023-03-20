#!/bin/bash

current_dir=$PWD

# compile the code
cd "src/edk2"
make -C "BaseTools"
source edksetup.sh
build -p EmulatorPkg/EmulatorPkg.dsc -a X64 -t GCC5
cd $current_dir

simics_dir="src/edk2-platforms/Platform/Intel/"
cd $simics_dir
python build_bios.py -p BoardX58Ich10 -t GCC5
cd $current_dir
chmod -R 777 $current_dir

# create a simics project
cd "$current_dir/simics/intel-simics-package-manager-1.5.3"
./ispm packages --install-bundle $current_dir/simics/simics-6-packages-2022-49-linux64.ispm --install-dir $current_dir/simics/ --create-project $current_dir/simics/fuzzer-project -y
cd $current_dir

# copy it to the necessary directory
cp src/Build/SimicsOpenBoardPkg/BoardX58Ich10/DEBUG_GCC5/FV/BOARDX58ICH10.fd simics/simics-qsp-x86-6.0.65/targets/qsp-x86/images/

# patch the scripts
patch simics/simics-qsp-x86-6.0.65/targets/qsp-x86/qsp-uefi.include < modified-FV.patch

# copy the additional scripts from the main dir to simics project
cd $current_dir
cp afl-wrapper.c afl-simics-linker.py custom_mutator.c custom_mutator_helpers.h simics/fuzzer-project
cp -R testcases simics/fuzzer-project

cd simics/fuzzer-project
gcc afl-wrapper.c -o afl-wrapper
gcc -shared -Wall -I$current_dir/AFLplusplus/include custom_mutator.c -o custom_mutator.so
export AFL_CUSTOM_MUTATOR_LIBRARY="$PWD/custom_mutator.so"
mkdir fuzz_output

cd $current_dir
