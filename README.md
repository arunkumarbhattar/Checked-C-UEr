This repo is responsible for fuzzing the EDK2 UEFI through the use of a harness driver that is reposible for creating well formed inputs to pass to other drivers. The fuzzing is done by using AFL and plmbing it into Simics.

The driver is included in the EDK2 repo under the breakingboot branch, but the external code is included here in this repo. 

The script called setup.sh is responisble for downloading all of the necessary repos and making sure all of the tools are installed. 

The script called compile.sh is responsible for compiling all of the code needed to run the fuzzer on Simics, including copying the firmware volume to the location that simics is downloaded into during the execution of the setup.sh script. 

Finally, the execute.sh script is responsible for running the actually fuzzing on the FW image.

All of these steps can be done at the same time by running the run.sh script, but if you are adding additional functionality or running into issues because you are testing this code in a different environment it may be useful to run the scripts one at a time so you know where the problem is happening.

Debug statements are included throughout the code to provide useful information, and these are stored in a file called execute.log. Note: by adding the -D flag when running the scripts the debug statements will be displayed on in the terminal too.


Limitations:
- Currently, this is being tested on an Ubuntu 22.04 LTS VM