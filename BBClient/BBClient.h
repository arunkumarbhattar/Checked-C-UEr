#ifndef _BBCLIENT_H_
#define _BBCLIENT_H_

#include <Uefi.h>
#include <Library/UefiLib.h>
#include <Library/UefiApplicationEntryPoint.h>
#include <Library/UefiBootServicesTableLib.h>
#include "../../MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.h"
//#include <Library/HobLib.h>
#include <Library/BaseLib.h>
#include <PiDxe.h>
#include <Protocol/LoadedImage.h>
#include "../../ShellPkg/Include/Protocol/EfiShellInterface.h"
#include <Protocol/FirmwareVolume2.h>
#include <Protocol/ShellParameters.h>
#include <Library/PcdLib.h>
#include <Library/UefiLib.h>
#include <Library/UefiApplicationEntryPoint.h>
#include <Library/BaseMemoryLib.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/UefiRuntimeServicesTableLib.h>
#include <PiDxe.h>
#include <Guid/DxeServices.h>
#include <Protocol/VariableWrite.h>
#include <Protocol/FaultTolerantWrite.h>
#include <Protocol/FirmwareVolumeBlock.h>
#include <Protocol/Variable.h>
#include <Protocol/VariableLock.h>
#include <Protocol/VarCheck.h>
#include <Library/HobLib.h>
#include <Library/UefiDriverEntryPoint.h>
#include <Library/UefiRuntimeLib.h>
#include <Library/DebugLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/BaseLib.h>
#include <Library/DxeServicesTableLib.h>
#include <Library/SynchronizationLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/AuthVariableLib.h>
#include <Library/VarCheckLib.h>
#include <Library/VariableFlashInfoLib.h>
#include <Library/SafeIntLib.h>
#include <Guid/GlobalVariable.h>
#include <Guid/EventGroup.h>
#include <Guid/VariableFormat.h>
#include <Guid/SystemNvDataGuid.h>
#include <Guid/FaultTolerantWrite.h>
#include <Guid/VarErrorFlag.h>

#define PROCESS_FIRMWARE_VOLUME 0
#define CLOSE_EVENT 1
#define LOAD_IMAGE 2
#define EXAMPLE 4

#endif