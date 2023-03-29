#ifndef _BBCLIENTUTILITIES_H_
#define _BBCLIENTUTILITIES_H_

#include "BBClient.h"

typedef struct {
  CHAR16 *Buffer;
  UINTN Length;
} INPUT_BUFFER;


UINT16
FvBufCalculateChecksum16 (
  IN UINT16       *Buffer,
  IN UINTN        Size
  );


UINT16
FvBufCalculateSum16 (
  IN UINT16       *Buffer,
  IN UINTN        Size
  );

EFI_DEVICE_PATH_PROTOCOL *
CoreFvToDevicePath (
  IN  EFI_FIRMWARE_VOLUME2_PROTOCOL  *Fv,
  IN  EFI_HANDLE                     FvHandle,
  IN  EFI_GUID                       *DriverName
  );

VOID
EFIAPI
ReadInput(
  IN INPUT_BUFFER *InputBuffer,
  IN UINTN NumBytes,
  OUT VOID *Buffer
);

UINTN
EFIAPI
Strlen(
    IN CHAR16 *Buffer
);

EFI_STATUS
EFIAPI
HelpMenu ();

EFI_FIRMWARE_VOLUME_HEADER
EFIAPI
CreateDummyFirmwareVolume(
    IN EFI_FVB_ATTRIBUTES_2 InputAttributes,
    IN UINT64 InputLength,
    IN UINT32 NumBlocks,
    IN UINT32 BlockLength
);

#endif