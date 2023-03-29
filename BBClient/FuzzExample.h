#ifndef _FUZZEXAMPLE_H_
#define _FUZZEXAMPLE_H_

#include "BBClientUtilities.h"

EFI_STATUS
EFIAPI
FuzzExample1(
    IN INPUT_BUFFER *Input,
    IN EFI_HANDLE ParentImageHandle
);

#endif