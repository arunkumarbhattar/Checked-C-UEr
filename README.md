# FuzzUEr
This is the tool is designed for setting up and Fuzzing the EDK2 firmware, specifically the BoardX58Ich10 board via Simics. The code here is responsible for automating downloading, installing, compiling, and executing the UEFI firmware on Simics.

## Overview
This repo is responsible for fuzzing the EDK2 UEFI through the use of a harness driver that is reposible for creating well formed inputs to pass to other drivers. The fuzzing is done by using AFL and plmbing it into Simics.

The custom drivers and applications that are needed are included here in this repo, but the custom internal driver responsible for creating the well formed input is called the BBClient.

## Stucture
The important bash scripts that are included are:

* `install_libraries.sh`: It is responsible for downloading all of the needed libraries via `sudo apt install`.
* `setup.sh`: It is responsible for downloading and "setting up" all of the required libraries and additional tools, like Simics and EDK2.
* `compile.sh`: This compiles the EDK2 for Simics and the custom AFL repo, and it also copies all of the necessary files to where they need to be so it can be run with `execute.sh`.
* `execute.sh`: This scripts creates a checkpoint or "snapshot" within Simics within the UEFI shell to optimize the fuzzing process and then runs the custom `afl-fuzz` on it.
* `run.sh`: It puts all of the scripts together and makes it easy to run all of the commands.

All of these steps can be done at the same time by running the run.sh script, but if you are adding additional functionality or running into issues because you are testing this code in a different environment it may be useful to run the scripts one at a time so you know where the problem is happening.

Debug statements are included throughout the code to provide useful information, and these are stored in a file called execute.log. TODO: by adding the -D flag when running the scripts the debug statements will be displayed on in the terminal too.


Limitations:
- Currently, this is being tested on an Ubuntu 22.04 LTS VM