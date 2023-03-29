This is a set of vulnerable drivers written during for the HARDEN program.


To build it, first prepare EDK2 and building with the following:

```
git clone git@github.com:BreakingBoot/edk2-vulnerable.git
git submodule update --init 
make -C BaseTools
source edksetup.sh 
build -p OvmfPkg/OvmfPkgX64.dsc -a X64 -t GCC5 -D SMM_REQUIRE
```

Then copy the OVMF firmware and Exploit UEFI Application under /tmp/rootfs:
```
cp ./Build/OvmfX64/DEBUG_GCC5/FV/OVMF.fd /tmp/
cp ./Build/OvmfX64/DEBUG_GCC5/X64/Exploit.efi /tmp/rootfs
```

You can run OVMF in Qemu with the following:

```
qemu-system-x86_64 \
    -m 1024    \
    -no-reboot \
    -machine q35,smm=on \
    -cpu max \
    -pflash /tmp/OVMF.fd \
    -global ICH9-LPC.disable_s3=1 \
    -global driver=cfi.pflash01,property=secure,value=on \
    -global isa-debugcon.iobase=0x402 -debugcon file:/tmp/debug.log \
    -drive format=raw,file=fat:rw:/tmp/rootfs/ \
    -net none
```

Finally, run the exploit from the UEFI Shell with:
```
FS0:\Exploit.efi
```
