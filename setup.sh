#!/bin/bash

main_dir=$PWD
# these are the remote branches to pull from
folder_name="src"
repo_url="https://github.com/BreakingBoot"
edk2_url="edk2"
fsp_url="FSP"
edk2_platforms_url="edk2-platforms"
edk2_platforms_branch="modified-fuzz"
edk2_non_osi_url="edk2-non-osi"

# create the folder if it doesn't exist and clone the repos
# otherwise make sure the git repos are install and up to date
if [ ! -d "$folder_name" ]; then
    mkdir "$folder_name"
fi

# get all of the necessary repos from github
cd "$folder_name"
git clone "$repo_url/$edk2_url"
cd "$edk2_url" && git submodule update --init --recursive
cd ..
git clone "$repo_url/$fsp_url"
cd "$fsp_url" && git submodule update --init --recursive
cd ..
git clone -b $edk2_platforms_branch "$repo_url/$edk2_platforms_url"
cd "$edk2_platforms_url" && git submodule update --init --recursive
cd ..
git clone "$repo_url/$edk2_non_osi_url"
cd "$edk2_non_osi_url" && git submodule update --init --recursive
cd $main_dir
git clone "https://github.com/AFLplusplus/AFLplusplus"
cd AFLplusplus && git submodule update --init --recursive
cd $main_dir

# patch the src directory with necessary files
cp -r "BBClient" "$folder_name/$edk2_url/MdeModulePkg/Application/"
cp -r "Example1_App" "$folder_name/$edk2_url/MdeModulePkg/Application/"
cp -r "Example1_Driver_Lockbox" "$folder_name/$edk2_url/MdeModulePkg/Application/"
cp -r "SmmHarden" "$folder_name/$edk2_url/MdeModulePkg/Application/"
cp -r "Exploit" "$folder_name/$edk2_url/MdeModulePkg/Application/"
patch -p0 < "src_directory.patch"

# download simics and install it
mkdir simics
cd simics

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/708028d9-b710-45ea-baab-3b9c78c32cfc/intel-simics-package-manager-1.5.3-linux64.tar.gz
tar -xzf intel-simics-package-manager-1.5.3-linux64.tar.gz

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/1f756747-b5ca-47d7-85b5-23cb3141fd4a/simics-6-packages-2022-49-linux64.ispm

cd $main_dir

cd "simics/intel-simics-package-manager-1.5.3"
./ispm packages --install-bundle ../simics-6-packages-2022-49-linux64.ispm --install-dir $main_dir/simics/ -y

cd $main_dir
