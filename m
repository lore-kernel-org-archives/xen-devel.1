From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Sat, 12 Jan 2019 05:12:21 +0900
Message-ID: <CACrvCsZuh+tj2ejA2RYh78QnySw0fBBEXxWpam_TcFZAORSCXw@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
 <3aecad20-41f5-4249-46be-bfef80c88ea3@gmail.com>
 <623d0b16-8616-183c-d8d4-559ad81363ed@gmail.com>
 <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
 <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3284567372561236458=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============3284567372561236458==
Content-Type: multipart/alternative; boundary="00000000000067dc80057f2c98bb"

--00000000000067dc80057f2c98bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrii,

Due to some events on my side, I had to move from the R-Car H3 I was using
to the R-Car M3 in my posession.

I followed your initial advice and updated my environment to a newer
version, opting to stick to the rocko version for the m3ulcb.

The Yocto build configuration is shown below:

Build Configuration:
BB_VERSION           =3D "1.36.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal-4.9"
TARGET_SYS           =3D "aarch64-poky-linux"
MACHINE              =3D "m3ulcb"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "2.4.2"
TUNE_FEATURES        =3D "aarch64 cortexa57-cortexa53"
TARGET_FPU           =3D ""
SOC_FAMILY           =3D "rcar-gen3:r8a7796"
meta
meta-poky
meta-yocto-bsp       =3D "HEAD:342fbd6a3e57021c8e28b124b3adb241936f3d9d"
meta-rcar-gen3       =3D "rocko:8af0b7d6e445b532088a068dc012757001be3a1f"
meta-optee           =3D "rocko:75dfb67bbb14a70cd47afda9726e2e1c76731885"
meta-oe
meta-python
meta-networking      =3D "rocko:eae996301d9c097bcbeb8046f08041dc82bb62f8"
meta-selinux         =3D "rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae12d"
meta-virtualization  =3D "rocko:b704c689b67639214b9568a3d62e82df27e9434f"
meta-rcar-gen3-xen   =3D "master:60699c631d541aeeaebaeec9a087efed9385ee42"

I had to modify the dtb to the version shown below:

// SPDX-License-Identifier:
GPL-2.0
/*

 * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro)
board
 *

 * Copyright (C) 2016-2018 Renesas Electronics
Corp.
 * Copyright (C) 2016 Cogent Embedded,
Inc.
 */



/dts-v1/;

#include
"r8a7796.dtsi"

#include
"ulcb.dtsi"



/
{

        model =3D "Renesas M3ULCB board based on
r8a7796";
        compatible =3D "renesas,m3ulcb",
"renesas,r8a7796";


        cpus
{
                idle-states
{
                        /delete-node/
cpu-sleep-1;

};

};



        memory@48000000
{
                device_type =3D
"memory";
                /* first 128MB is reserved for secure area.
*/
                reg =3D <0x0 0x48000000 0x0
0x38000000>;
        };

        memory@600000000 {
                device_type =3D "memory";
                reg =3D <0x6 0x00000000 0x0 0x40000000>;
        };

        reserved-memory {
                #address-cells =3D <2>;
                #size-cells =3D <2>;
                ranges;

                /* device specific region for Lossy Decompression */
                lossy_decompress: linux,lossy_decompress@54000000 {
                        no-map;
                        reg =3D <0x00000000 0x54000000 0x0 0x03000000>;
                };

                /* global autoconfigured region for contiguous allocations
*/
                linux,cma@57000000 {
                        compatible =3D "shared-dma-pool";
                        reusable;
                        reg =3D <0x00000000 0x57000000 0x0 0x19000000>;
                        linux,cma-default;
                };

                /* device specific region for contiguous allocations */
                mmp_reserved: linux,multimedia@70000000 {
                        compatible =3D "shared-dma-pool";
                        reusable;
                        reg =3D <0x00000000 0x70000000 0x0 0x10000000>;
                };
        };

        chosen {
                stdout-path =3D "serial0:115200n8";
                xen,xen-bootargs =3D "dom0_mem=3D752M console=3Ddtuart
dtuart=3Dserial0 dom0_max_vcpus=3D4";
                xen,dom0-bootargs =3D "console=3Dhvc0 clk_ignore_unused
root=3D/dev/mmcblk1p2 rw rootwait ignore_loglevel cma=3D128M";

                #address-cells =3D <2>;
                #size-cells =3D <2>;
                modules {
                        module@0 {
                                compatible =3D "xen,linux-zimage",
"xen,multiboot-module";
                                reg =3D <0x0 0x7a000000 0x0 0x02000000>;
                        };
                };
        };

        mmngr {
                compatible =3D "renesas,mmngr";
                memory-region =3D <&mmp_reserved>, <&lossy_decompress>;
        };

        mmngrbuf {
                compatible =3D "renesas,mmngrbuf";
        };

        vspm_if {
                compatible =3D "renesas,vspm_if";
        };

        versaclock5_out3: versaclk-3 {
                compatible =3D "fixed-clock";
                #clock-cells =3D <0>;
                /* Initial value of versaclock out3 */
                clock-frequency =3D <33000000>;
        };
};

&a53_0 {
        /delete-property/ cpu-idle-states;
};

&a53_1 {
        /delete-property/ cpu-idle-states;
};

&a53_2 {
        /delete-property/ cpu-idle-states;
};

&a53_3 {
        /delete-property/ cpu-idle-states;
};

&du {
        clocks =3D <&cpg CPG_MOD 724>,
                 <&cpg CPG_MOD 723>,
                 <&cpg CPG_MOD 722>,
                 <&versaclock5 1>,
                 <&versaclock5_out3>,
                 <&versaclock5 2>;
        clock-names =3D "du.0", "du.1", "du.2",
                      "dclkin.0", "dclkin.1", "dclkin.2";
};

&vspb {
        status =3D "okay";
};

&vspi0 {
        status =3D "okay";
};

With the new information, I finally got some output for Xen, but was met
with a completely different issue for which I can't find any information
for the error I am receiving.

I realize that I may have an issue with the version of the board I am
using, but a simple online search doesn't throw any red flags. The serial
console output is below:

[    0.000177] NOTICE:  BL2: R-Car M3 Initial Program Loader(CA57)
[    0.004613] NOTICE:  BL2: Initial Program Loader(Rev.2.0.0)
[    0.010147] NOTICE:  BL2: PRR is R-Car M3 Ver.1.0
[    0.014815] NOTICE:  BL2: Board is Starter Kit Rev.1.0
[    0.019928] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.025354] NOTICE:  BL2: LCM state is CM
[    0.029395] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
[    0.035383] NOTICE:  BL2: DDR3200(rev.0.34)
[    0.046779] NOTICE:  BL2: [COLD_BOOT]
[    0.085117] NOTICE:  BL2: DRAM Split is 2ch
[    0.087812] NOTICE:  BL2: QoS is default setting(rev.0.19)
[    0.093315] NOTICE:  BL2: Lossy Decomp areas
[    0.097489] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
DCMPAREACRBx:0x570
[    0.104573] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
DCMPAREACRBx:0x0
[    0.111485] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
DCMPAREACRBx:0x0
[    0.118400] NOTICE:  BL2: v1.5(release):556a11e
[    0.122890] NOTICE:  BL2: Built : 18:03:48, Jan 11 2019
[    0.128077] NOTICE:  BL2: Normal boot
[    0.131718] NOTICE:  BL2: dst=3D0xe6321100 src=3D0x8180000 len=3D512(0x2=
00)
[    0.138106] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x=
1800)
[    0.144726] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000 len=3D65536(0=
x10000)
[    0.151952] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
len=3D1048576(0x100000)
[    0.166777] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
len=3D1048576(0x100000)
[    0.180752] NOTICE:  BL2: Booting BL31


U-Boot 2018.09 (Jan 12 2019 - 03:03:43 +0900)

CPU: Renesas Electronics R8A7796 rev 1.0
Model: Renesas M3ULCB board based on r8a7796
DRAM:  1.9 GiB
Bank #0: 0x048000000 - 0x07fffffff, 896 MiB
Bank #1: 0x600000000 - 0x63fffffff, 1 GiB

MMC:   sd@ee100000: 0, sd@ee140000: 1
Loading Environment from MMC... communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
communication out of sync
OK
In:    serial@e6e88000
Out:   serial@e6e88000
Err:   serial@e6e88000
Net:   eth0: ethernet@e6800000
Hit any key to stop autoboot:  0
ethernet@e6800000 Waiting for PHY auto negotiation to complete... done
Using ethernet@e6800000 device
TFTP from server 192.168.1.100; our IP address is 192.168.1.3
Filename 'Image'.
Load address: 0x48080000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ############################################
         2.7 MiB/s
done
Bytes transferred =3D 15911424 (f2ca00 hex)
Using ethernet@e6800000 device
TFTP from server 192.168.1.100; our IP address is 192.168.1.3
Filename 'Image-r8a7796-m3ulcb.dtb'.
Load address: 0x48000000
Loading: *
TFTP error: 'File not found' (1)
Not retrying...
ERROR: Did not find a cmdline Flattened Device Tree
Could not find a valid device tree
=3D> setenv bootargs
=3D> tftp 0x48080000 xen-m3ulcb.uImage
Using ethernet@e6800000
device
TFTP from server 192.168.1.100; our IP address is
192.168.1.3
Filename
'xen-m3ulcb.uImage'.
Load address:
0x48080000
Loading:
###############################################################
         28.3
MiB/s
done

Bytes transferred =3D 918928 (e0590
hex)
=3D> tftp 0x48000000
Image-r8a7796-m3ulcb-xen-local.dtb
Using ethernet@e6800000
device
TFTP from server 192.168.1.100; our IP address is
192.168.1.3
Filename
'Image-r8a7796-m3ulcb-xen-local.dtb'.
Load address:
0x48000000
Loading:
#####
         21.8
MiB/s
done

Bytes transferred =3D 68545 (10bc1
hex)
=3D> tftp 0x7a000000
Image-m3ulcb.bin
Using ethernet@e6800000
device
TFTP from server 192.168.1.100; our IP address is 192.168.1.3
Filename 'Image-m3ulcb.bin'.
Load address: 0x7a000000
Loading: #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ################################################################
         28.1 MiB/s
done
Bytes transferred =3D 19059200 (122d200 hex)
=3D> bootm 0x48080000 - 0x48000000
## Booting kernel from Legacy Image at 48080000 ...
   Image Name:   XEN
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    918864 Bytes =3D 897.3 KiB
   Load Address: 78080000
   Entry Point:  78080000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 48000000
   Booting using the fdt blob at 0x48000000
   Loading Kernel Image ... OK
   Using Device Tree in place at 0000000048000000, end 0000000048013bc0

Starting kernel ...

 Xen 4.12-unstable
(XEN) Xen version 4.12-unstable (jelfn@waseda.jp) (aarch64-poky-linux-gc9
(XEN) Latest ChangeSet: Mon Dec 17 09:22:59 2018 +0000 git:a5b0eb3-dirty
(XEN) Processor: 411fd073: "ARM Limited", variant: 0x1, part 0xd07, rev 0x3
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001124 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.1
(XEN) Using PSCI v1.1
(XEN) SMP: Allowing 6 CPUs
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Timer: Unable to retrieve IRQ 0 from the device tree
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

Is there anything I have overlooked in the compilation or configuration for
Xen?

Thank you very much for all the help you have offered up to this point. I
am at least happy to get some output, even if it is on the R-Car M3 board
in my possession.

Best regards,

Jairo


2019=E5=B9=B41=E6=9C=889=E6=97=A5(=E6=B0=B4) 2:04 LOPEZ, FUENTES NACARINO J=
airo Eduardo <
jairo@ruri.waseda.jp>:

> Andrii,
>
> I have attempted to update the bootloader from the srec files created by
> the bitbake command.
>
> I believe I have been able to update it, but I am still obtaining the sam=
e
> results. The serial output is shown below:
>
> [    0.000161] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57)
> Rev.1.0.17
> [    0.005721] NOTICE:  BL2: PRR is R-Car H3 Ver2.0
> [    0.010304] NOTICE:  BL2: Board is Starter Kit Rev1.0
> [    0.015331] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
> [    0.020757] NOTICE:  BL2: LCM state is CM
> [    0.024802] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
> [    0.030786] NOTICE:  BL2: DDR3200(rev.0.28)NOTICE:  [COLD_BOOT]NOTICE:
> ..0
> [    0.059996] NOTICE:  BL2: DRAM Split is 4ch
> [    0.063882] NOTICE:  BL2: QoS is default setting(rev.0.18)
> [    0.069381] NOTICE:  BL2: Lossy Decomp areas
> [    0.073559] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
> DCMPAREACRBx:0x570
> [    0.080643] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
> DCMPAREACRBx:0x0
> [    0.087555] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
> DCMPAREACRBx:0x0
> [    0.094470] NOTICE:  BL2: v1.3(release):b15fefa
> [    0.098960] NOTICE:  BL2: Built : 12:21:32, Dec 28 2018
> [    0.104147] NOTICE:  BL2: Normal boot
> [    0.107788] NOTICE:  BL2: dst=3D0xe6322210 src=3D0x8180000 len=3D512(0=
x200)
> [    0.114335] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(=
0x1800)
> [    0.120797] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000
> len=3D65536(0x10000)
> [    0.128022] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
> len=3D524288(0x80000)
> [    0.138503] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
> len=3D1048576(0x100000)
>
>
> U-Boot 2015.04 (Dec 28 2018 - 02:46:24)
>
> CPU: Renesas Electronics R8A7795 rev 2.0
> Board: H3ULCB
> I2C:   ready
> DRAM:  3.9 GiB
> MMC:   sh-sdhi: 0, sh-sdhi: 1
> In:    serial
> Out:   serial
> Err:   serial
> Net:   ravb
> Hit any key to stop autoboot:  0
> =3D> setenv bootargs
> =3D> setenv serverip 192.168.1.100
> =3D> tftp 0x48080000 xen-h3ulcb.uImage
> ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !
> Half
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'xen-h3ulcb.uImage'.
> Load address: 0x48080000
> Loading: *
> ARP Retry count exceeded; starting again
> ravb:0 is connected to ravb.  Reconnecting to ravb
> ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !
> Half
>
> ARP Retry count exceeded; starting again
> ravb:0 is connected to ravb.  Reconnecting to ravb
> ravb Waiting for PHY auto negotiation to complete... done
> ravb: 1000Base/Full
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'xen-h3ulcb.uImage'.
> Load address: 0x48080000
> Loading: ###########################################################
>          25.4 MiB/s
> done
> Bytes transferred =3D 852368 (d0190 hex)
> =3D> tftp 0x48000000 Image-r8a7795-h3ulcb-xen-local.dtb
> ravb:0 is connected to ravb.  Reconnecting to ravb
> ravb Waiting for PHY auto negotiation to complete..... done
> ravb: 1000Base/Full
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'Image-r8a7795-h3ulcb-xen-local.dtb'.
> Load address: 0x48000000
> Loading: #####
>          11.7 KiB/s
> done
> Bytes transferred =3D 63778 (f922 hex)
> =3D> tftp 0x7a000000 h3ulcb-image
> ravb:0 is connected to ravb.  Reconnecting to ravb
> ravb Waiting for PHY auto negotiation to complete... done
> ravb: 1000Base/Full
> Using ravb device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
> Filename 'h3ulcb-image'.
> Load address: 0x7a000000
> Loading: ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ########################################
>          2.1 MiB/s
> done
> Bytes transferred =3D 15843840 (f1c200 hex)
> =3D> bootm 0x48080000 - 0x48000000
> ## Booting kernel from Legacy Image at 48080000 ...
>    Image Name:   XEN
>    Image Type:   AArch64 Linux Kernel Image (uncompressed)
>    Data Size:    852304 Bytes =3D 832.3 KiB
>    Load Address: 78080000
>    Entry Point:  78080000
>    Verifying Checksum ... OK
> ## Flattened Device Tree blob at 48000000
>    Booting using the fdt blob at 0x48000000
>    Loading Kernel Image ... OK
>    Using Device Tree in place at 0000000048000000, end 0000000048012921
>
> Starting kernel ...
>
> </end output>
>
> I have noticed that the uboot date has not changed from 2015.04 although
> the build date is from the last time I ran a bitbake command.
>
> I do not know what version of uboot should be used without breaking the
> current compiling versions.
>
> Are there any other modifications that I can attempt?
>
> Thank you very much for your time and patience.
>
> Best regards,
>
> Jairo
>
>
>
>

--00000000000067dc80057f2c98bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdj5BbmRyaWksPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EdWUgdG8gc29tZSBldmVu
dHMgb24gbXkgc2lkZSwgSSBoYWQgdG8gbW92ZSBmcm9tIHRoZSBSLUNhciBIMyBJIHdhcyB1c2lu
ZyB0byB0aGUgUi1DYXIgTTMgaW4gbXkgcG9zZXNzaW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSBmb2xsb3dlZCB5b3VyIGluaXRpYWwgYWR2aWNlIGFuZCB1cGRhdGVkIG15IGVudmlyb25t
ZW50IHRvIGEgbmV3ZXIgdmVyc2lvbiwgb3B0aW5nIHRvIHN0aWNrIHRvIHRoZSByb2NrbyB2ZXJz
aW9uIGZvciB0aGUgbTN1bGNiLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIFlvY3RvIGJ1
aWxkIGNvbmZpZ3VyYXRpb24gaXMgc2hvd24gYmVsb3c6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5CdWlsZCBDb25maWd1cmF0aW9uOjxicj5CQl9WRVJTSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSAmcXVvdDsxLjM2LjAmcXVvdDs8YnI+QlVJTERfU1lTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9
ICZxdW90O3g4Nl82NC1saW51eCZxdW90Ozxicj5OQVRJVkVMU0JTVFJJTkfCoMKgwqDCoMKgID0g
JnF1b3Q7dW5pdmVyc2FsLTQuOSZxdW90Ozxicj5UQVJHRVRfU1lTwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPSAmcXVvdDthYXJjaDY0LXBva3ktbGludXgmcXVvdDs8YnI+TUFDSElORcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgID0gJnF1b3Q7bTN1bGNiJnF1b3Q7PGJyPkRJU1RST8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtwb2t5JnF1b3Q7PGJyPkRJU1RST19WRVJTSU9OwqDC
oMKgwqDCoMKgID0gJnF1b3Q7Mi40LjImcXVvdDs8YnI+VFVORV9GRUFUVVJFU8KgwqDCoMKgwqDC
oMKgID0gJnF1b3Q7YWFyY2g2NCBjb3J0ZXhhNTctY29ydGV4YTUzJnF1b3Q7PGJyPlRBUkdFVF9G
UFXCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICZxdW90OyZxdW90Ozxicj5TT0NfRkFNSUxZwqDCoMKg
wqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtyY2FyLWdlbjM6cjhhNzc5NiZxdW90Ozxicj5tZXRhwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPm1ldGEtcG9recKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPm1ldGEteW9jdG8tYnNwwqDCoMKgwqDCoMKgID0gJnF1b3Q7SEVBRDozNDJm
YmQ2YTNlNTcwMjFjOGUyOGIxMjRiM2FkYjI0MTkzNmYzZDlkJnF1b3Q7PGJyPm1ldGEtcmNhci1n
ZW4zwqDCoMKgwqDCoMKgID0gJnF1b3Q7cm9ja286OGFmMGI3ZDZlNDQ1YjUzMjA4OGEwNjhkYzAx
Mjc1NzAwMWJlM2ExZiZxdW90Ozxicj5tZXRhLW9wdGVlwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAm
cXVvdDtyb2Nrbzo3NWRmYjY3YmJiMTRhNzBjZDQ3YWZkYTk3MjZlMmUxYzc2NzMxODg1JnF1b3Q7
PGJyPm1ldGEtb2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1weXRob27CoMKg
wqDCoMKgwqDCoMKgwqAgPGJyPm1ldGEtbmV0d29ya2luZ8KgwqDCoMKgwqAgPSAmcXVvdDtyb2Nr
bzplYWU5OTYzMDFkOWMwOTdiY2JlYjgwNDZmMDgwNDFkYzgyYmI2MmY4JnF1b3Q7PGJyPm1ldGEt
c2VsaW51eMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtyb2NrbzpkODU1YzYyNGYzMmM1ZTU5OWJm
MjdlMDZjYjhmNWIyNWIzYWFlMTJkJnF1b3Q7PGJyPm1ldGEtdmlydHVhbGl6YXRpb27CoCA9ICZx
dW90O3JvY2tvOmI3MDRjNjg5YjY3NjM5MjE0Yjk1NjhhM2Q2MmU4MmRmMjdlOTQzNGYmcXVvdDs8
YnI+bWV0YS1yY2FyLWdlbjMteGVuwqDCoCA9ICZxdW90O21hc3Rlcjo2MDY5OWM2MzFkNTQxYWVl
YWViYWVlYzlhMDg3ZWZlZDkzODVlZTQyJnF1b3Q7PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSBoYWQgdG8gbW9kaWZ5IHRoZSBkdGIgdG8gdGhlIHZlcnNpb24gc2hvd24gYmVsb3c6PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj4vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+LyrCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKg
KiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBNM1VMQ0IgKFItQ2FyIFN0YXJ0ZXIgS2l0IFBy
bykgYm9hcmTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJy
PsKgKiBDb3B5cmlnaHQgKEMpIDIwMTYtMjAxOCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPsKgKiBDb3B5cmlnaHQgKEMpIDIwMTYgQ29nZW50IEVtYmVkZGVkLCBJbmMu
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgKi/CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj4vZHRzLXYxLzvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj4jaW5jbHVkZSAmcXVvdDty
OGE3Nzk2LmR0c2kmcXVvdDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPiNpbmNsdWRlICZxdW90O3VsY2IuZHRz
aSZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+LyB7wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqAgbW9k
ZWwgPSAmcXVvdDtSZW5lc2FzIE0zVUxDQiBib2FyZCBiYXNlZCBvbiByOGE3Nzk2JnF1b3Q7O8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8YnI+wqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3JlbmVzYXMsbTN1bGNiJnF1
b3Q7LCAmcXVvdDtyZW5lc2FzLHI4YTc3OTYmcXVvdDs7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKg
wqAgY3B1cyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWRsZS1zdGF0ZXMge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvZGVsZXRlLW5vZGUvIGNwdS1zbGVlcC0xO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqAgfTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqAgbWVtb3J5QDQ4MDAwMDAw
IHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90eXBl
ID0gJnF1b3Q7bWVtb3J5JnF1b3Q7O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBmaXJzdCAxMjhNQiBpcyBy
ZXNlcnZlZCBmb3Igc2VjdXJlIGFyZWEuICovwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVn
ID0gJmx0OzB4MCAweDQ4MDAwMDAwIDB4MCAweDM4MDAwMDAwJmd0OzvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKg
wqDCoMKgwqDCoCB9Ozxicj48YnI+wqDCoMKgwqDCoMKgwqAgbWVtb3J5QDYwMDAwMDAwMCB7PGJy
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICZxdW90O21lbW9y
eSZxdW90Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9ICZsdDsweDYg
MHgwMDAwMDAwMCAweDAgMHg0MDAwMDAwMCZndDs7PGJyPsKgwqDCoMKgwqDCoMKgIH07PGJyPjxi
cj7CoMKgwqDCoMKgwqDCoCByZXNlcnZlZC1tZW1vcnkgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJhbmdlczs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBkZXZpY2Ugc3BlY2lmaWMgcmVnaW9uIGZvciBMb3NzeSBEZWNvbXByZXNzaW9u
ICovPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb3NzeV9kZWNvbXByZXNzOiBs
aW51eCxsb3NzeV9kZWNvbXByZXNzQDU0MDAwMDAwIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1tYXA7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gJmx0OzB4MDAwMDAwMDAgMHg1NDAwMDAw
MCAweDAgMHgwMzAwMDAwMCZndDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Ozxicj48YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGdsb2JhbCBhdXRvY29u
ZmlndXJlZCByZWdpb24gZm9yIGNvbnRpZ3VvdXMgYWxsb2NhdGlvbnMgKi88YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpbnV4LGNtYUA1NzAwMDAwMCB7PGJyPsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3No
YXJlZC1kbWEtcG9vbCZxdW90Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXVzYWJsZTs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWcgPSAmbHQ7MHgwMDAwMDAwMCAweDU3MDAwMDAwIDB4MCAweDE5
MDAwMDAwJmd0Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsaW51eCxjbWEtZGVmYXVsdDs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH07PGJyPjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZGV2aWNlIHNwZWNp
ZmljIHJlZ2lvbiBmb3IgY29udGlndW91cyBhbGxvY2F0aW9ucyAqLzxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbW1wX3Jlc2VydmVkOiBsaW51eCxtdWx0aW1lZGlhQDcwMDAwMDAw
IHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21w
YXRpYmxlID0gJnF1b3Q7c2hhcmVkLWRtYS1wb29sJnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldXNhYmxlOzxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9ICZsdDsweDAwMDAwMDAwIDB4
NzAwMDAwMDAgMHgwIDB4MTAwMDAwMDAmZ3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTs8YnI+wqDCoMKgwqDCoMKgwqAgfTs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgIGNob3Nl
biB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGRvdXQtcGF0aCA9ICZxdW90
O3NlcmlhbDA6MTE1MjAwbjgmcXVvdDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB4ZW4seGVuLWJvb3RhcmdzID0gJnF1b3Q7ZG9tMF9tZW09NzUyTSBjb25zb2xlPWR0dWFydCBk
dHVhcnQ9c2VyaWFsMCBkb20wX21heF92Y3B1cz00JnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVuLGRvbTAtYm9vdGFyZ3MgPSAmcXVvdDtjb25zb2xlPWh2YzAgY2xr
X2lnbm9yZV91bnVzZWQgcm9vdD0vZGV2L21tY2JsazFwMiBydyByb290d2FpdCBpZ25vcmVfbG9n
bGV2ZWwgY21hPTEyOE0mcXVvdDs7PGJyPjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAjc2l6ZS1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG1vZHVsZXMgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1vZHVsZUAwIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3hlbixs
aW51eC16aW1hZ2UmcXVvdDssICZxdW90O3hlbixtdWx0aWJvb3QtbW9kdWxlJnF1b3Q7Ozxicj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSAmbHQ7MHgwIDB4N2EwMDAwMDAgMHgwIDB4MDIwMDAwMDAmZ3Q7Ozxicj7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07PGJyPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ozxicj7CoMKgwqDCoMKgwqDCoCB9Ozxicj48YnI+wqDC
oMKgwqDCoMKgwqAgbW1uZ3Igezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29t
cGF0aWJsZSA9ICZxdW90O3JlbmVzYXMsbW1uZ3ImcXVvdDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtZW1vcnktcmVnaW9uID0gJmx0OyZhbXA7bW1wX3Jlc2VydmVkJmd0Oywg
Jmx0OyZhbXA7bG9zc3lfZGVjb21wcmVzcyZndDs7PGJyPsKgwqDCoMKgwqDCoMKgIH07PGJyPjxi
cj7CoMKgwqDCoMKgwqDCoCBtbW5ncmJ1ZiB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gJnF1b3Q7cmVuZXNhcyxtbW5ncmJ1ZiZxdW90Ozs8YnI+wqDCoMKg
wqDCoMKgwqAgfTs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgIHZzcG1faWYgezxicj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3JlbmVzYXMsdnNwbV9pZiZx
dW90Ozs8YnI+wqDCoMKgwqDCoMKgwqAgfTs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgIHZlcnNhY2xv
Y2s1X291dDM6IHZlcnNhY2xrLTMgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcGF0aWJsZSA9ICZxdW90O2ZpeGVkLWNsb2NrJnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogSW5pdGlhbCB2YWx1ZSBvZiB2ZXJzYWNsb2NrIG91dDMgKi88
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDsz
MzAwMDAwMCZndDs7PGJyPsKgwqDCoMKgwqDCoMKgIH07PGJyPn07PGJyPjxicj4mYW1wO2E1M18w
IHs8YnI+wqDCoMKgwqDCoMKgwqAgL2RlbGV0ZS1wcm9wZXJ0eS8gY3B1LWlkbGUtc3RhdGVzOzxi
cj59Ozxicj48YnI+JmFtcDthNTNfMSB7PGJyPsKgwqDCoMKgwqDCoMKgIC9kZWxldGUtcHJvcGVy
dHkvIGNwdS1pZGxlLXN0YXRlczs8YnI+fTs8YnI+PGJyPiZhbXA7YTUzXzIgezxicj7CoMKgwqDC
oMKgwqDCoCAvZGVsZXRlLXByb3BlcnR5LyBjcHUtaWRsZS1zdGF0ZXM7PGJyPn07PGJyPjxicj4m
YW1wO2E1M18zIHs8YnI+wqDCoMKgwqDCoMKgwqAgL2RlbGV0ZS1wcm9wZXJ0eS8gY3B1LWlkbGUt
c3RhdGVzOzxicj59Ozxicj48YnI+JmFtcDtkdSB7PGJyPsKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9
ICZsdDsmYW1wO2NwZyBDUEdfTU9EIDcyNCZndDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZsdDsmYW1wO2NwZyBDUEdfTU9EIDcyMyZndDssPGJyPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZsdDsmYW1wO2NwZyBDUEdfTU9EIDcyMiZndDssPGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZsdDsmYW1wO3ZlcnNhY2xvY2s1IDEmZ3Q7LDxi
cj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmbHQ7JmFtcDt2ZXJzYWNsb2NrNV9v
dXQzJmd0Oyw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmx0OyZhbXA7dmVy
c2FjbG9jazUgMiZndDs7PGJyPsKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gJnF1b3Q7ZHUu
MCZxdW90OywgJnF1b3Q7ZHUuMSZxdW90OywgJnF1b3Q7ZHUuMiZxdW90Oyw8YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O2RjbGtpbi4wJnF1b3Q7LCAm
cXVvdDtkY2xraW4uMSZxdW90OywgJnF1b3Q7ZGNsa2luLjImcXVvdDs7PGJyPn07PGJyPjxicj4m
YW1wO3ZzcGIgezxicj7CoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxi
cj59Ozxicj48YnI+JmFtcDt2c3BpMCB7PGJyPsKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICZxdW90
O29rYXkmcXVvdDs7PGJyPn07PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaXRoIHRoZSBuZXcg
aW5mb3JtYXRpb24sIEkgZmluYWxseSBnb3Qgc29tZSBvdXRwdXQgZm9yIFhlbiwgYnV0IHdhcyBt
ZXQgd2l0aCBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IGlzc3VlIGZvciB3aGljaCBJIGNhbiYjMzk7
dCBmaW5kIGFueSBpbmZvcm1hdGlvbiBmb3IgdGhlIGVycm9yIEkgYW0gcmVjZWl2aW5nLjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSByZWFsaXplIHRoYXQgSSBtYXkgaGF2ZSBhbiBpc3N1ZSB3
aXRoIHRoZSB2ZXJzaW9uIG9mIHRoZSBib2FyZCBJIGFtIHVzaW5nLCBidXQgYSBzaW1wbGUgb25s
aW5lIHNlYXJjaCBkb2VzbiYjMzk7dCB0aHJvdyBhbnkgcmVkIGZsYWdzLiBUaGUgc2VyaWFsIGNv
bnNvbGUgb3V0cHV0IGlzIGJlbG93OjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W8KgwqDCoCAw
LjAwMDE3N10gTk9USUNFOsKgIEJMMjogUi1DYXIgTTMgSW5pdGlhbCBQcm9ncmFtIExvYWRlcihD
QTU3KTxicj5bwqDCoMKgIDAuMDA0NjEzXSBOT1RJQ0U6wqAgQkwyOiBJbml0aWFsIFByb2dyYW0g
TG9hZGVyKFJldi4yLjAuMCk8YnI+W8KgwqDCoCAwLjAxMDE0N10gTk9USUNFOsKgIEJMMjogUFJS
IGlzIFItQ2FyIE0zIFZlci4xLjA8YnI+W8KgwqDCoCAwLjAxNDgxNV0gTk9USUNFOsKgIEJMMjog
Qm9hcmQgaXMgU3RhcnRlciBLaXQgUmV2LjEuMDxicj5bwqDCoMKgIDAuMDE5OTI4XSBOT1RJQ0U6
wqAgQkwyOiBCb290IGRldmljZSBpcyBIeXBlckZsYXNoKDgwTUh6KTxicj5bwqDCoMKgIDAuMDI1
MzU0XSBOT1RJQ0U6wqAgQkwyOiBMQ00gc3RhdGUgaXMgQ008YnI+W8KgwqDCoCAwLjAyOTM5NV0g
Tk9USUNFOsKgIEJMMjogQVZTIHNldHRpbmcgc3VjY2VlZGVkLiBEVkZTX1NldFZJRD0weDUzPGJy
PlvCoMKgwqAgMC4wMzUzODNdIE5PVElDRTrCoCBCTDI6IEREUjMyMDAocmV2LjAuMzQpPGJyPlvC
oMKgwqAgMC4wNDY3NzldIE5PVElDRTrCoCBCTDI6IFtDT0xEX0JPT1RdPGJyPlvCoMKgwqAgMC4w
ODUxMTddIE5PVElDRTrCoCBCTDI6IERSQU0gU3BsaXQgaXMgMmNoPGJyPlvCoMKgwqAgMC4wODc4
MTJdIE5PVElDRTrCoCBCTDI6IFFvUyBpcyBkZWZhdWx0IHNldHRpbmcocmV2LjAuMTkpPGJyPlvC
oMKgwqAgMC4wOTMzMTVdIE5PVElDRTrCoCBCTDI6IExvc3N5IERlY29tcCBhcmVhczxicj5bwqDC
oMKgIDAuMDk3NDg5XSBOT1RJQ0U6wqDCoMKgwqDCoMKgIEVudHJ5IDA6IERDTVBBUkVBQ1JBeDow
eDgwMDAwNTQwIERDTVBBUkVBQ1JCeDoweDU3MDxicj5bwqDCoMKgIDAuMTA0NTczXSBOT1RJQ0U6
wqDCoMKgwqDCoMKgIEVudHJ5IDE6IERDTVBBUkVBQ1JBeDoweDQwMDAwMDAwIERDTVBBUkVBQ1JC
eDoweDA8YnI+W8KgwqDCoCAwLjExMTQ4NV0gTk9USUNFOsKgwqDCoMKgwqDCoCBFbnRyeSAyOiBE
Q01QQVJFQUNSQXg6MHgyMDAwMDAwMCBEQ01QQVJFQUNSQng6MHgwPGJyPlvCoMKgwqAgMC4xMTg0
MDBdIE5PVElDRTrCoCBCTDI6IHYxLjUocmVsZWFzZSk6NTU2YTExZTxicj5bwqDCoMKgIDAuMTIy
ODkwXSBOT1RJQ0U6wqAgQkwyOiBCdWlsdCA6IDE4OjAzOjQ4LCBKYW4gMTEgMjAxOTxicj5bwqDC
oMKgIDAuMTI4MDc3XSBOT1RJQ0U6wqAgQkwyOiBOb3JtYWwgYm9vdDxicj5bwqDCoMKgIDAuMTMx
NzE4XSBOT1RJQ0U6wqAgQkwyOiBkc3Q9MHhlNjMyMTEwMCBzcmM9MHg4MTgwMDAwIGxlbj01MTIo
MHgyMDApPGJyPlvCoMKgwqAgMC4xMzgxMDZdIE5PVElDRTrCoCBCTDI6IGRzdD0weDQzZjAwMDAw
IHNyYz0weDgxODA0MDAgbGVuPTYxNDQoMHgxODAwKTxicj5bwqDCoMKgIDAuMTQ0NzI2XSBOT1RJ
Q0U6wqAgQkwyOiBkc3Q9MHg0NDAwMDAwMCBzcmM9MHg4MWMwMDAwIGxlbj02NTUzNigweDEwMDAw
KTxicj5bwqDCoMKgIDAuMTUxOTUyXSBOT1RJQ0U6wqAgQkwyOiBkc3Q9MHg0NDEwMDAwMCBzcmM9
MHg4MjAwMDAwIGxlbj0xMDQ4NTc2KDB4MTAwMDAwKTxicj5bwqDCoMKgIDAuMTY2Nzc3XSBOT1RJ
Q0U6wqAgQkwyOiBkc3Q9MHg1MDAwMDAwMCBzcmM9MHg4NjQwMDAwIGxlbj0xMDQ4NTc2KDB4MTAw
MDAwKTxicj5bwqDCoMKgIDAuMTgwNzUyXSBOT1RJQ0U6wqAgQkwyOiBCb290aW5nIEJMMzE8YnI+
PGJyPjxicj5VLUJvb3QgMjAxOC4wOSAoSmFuIDEyIDIwMTkgLSAwMzowMzo0MyArMDkwMCk8YnI+
PGJyPkNQVTogUmVuZXNhcyBFbGVjdHJvbmljcyBSOEE3Nzk2IHJldiAxLjA8YnI+TW9kZWw6IFJl
bmVzYXMgTTNVTENCIGJvYXJkIGJhc2VkIG9uIHI4YTc3OTY8YnI+RFJBTTrCoCAxLjkgR2lCPGJy
PkJhbmsgIzA6IDB4MDQ4MDAwMDAwIC0gMHgwN2ZmZmZmZmYsIDg5NiBNaUI8YnI+QmFuayAjMTog
MHg2MDAwMDAwMDAgLSAweDYzZmZmZmZmZiwgMSBHaUI8YnI+PGJyPk1NQzrCoMKgIHNkQGVlMTAw
MDAwOiAwLCBzZEBlZTE0MDAwMDogMTxicj5Mb2FkaW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4u
IGNvbW11bmljYXRpb24gb3V0IG9mIHN5bmM8YnI+Y29tbXVuaWNhdGlvbiBvdXQgb2Ygc3luYzxi
cj5jb21tdW5pY2F0aW9uIG91dCBvZiBzeW5jPGJyPmNvbW11bmljYXRpb24gb3V0IG9mIHN5bmM8
YnI+Y29tbXVuaWNhdGlvbiBvdXQgb2Ygc3luYzxicj5jb21tdW5pY2F0aW9uIG91dCBvZiBzeW5j
PGJyPmNvbW11bmljYXRpb24gb3V0IG9mIHN5bmM8YnI+Y29tbXVuaWNhdGlvbiBvdXQgb2Ygc3lu
Yzxicj5jb21tdW5pY2F0aW9uIG91dCBvZiBzeW5jPGJyPmNvbW11bmljYXRpb24gb3V0IG9mIHN5
bmM8YnI+Y29tbXVuaWNhdGlvbiBvdXQgb2Ygc3luYzxicj5jb21tdW5pY2F0aW9uIG91dCBvZiBz
eW5jPGJyPk9LPGJyPkluOsKgwqDCoCBzZXJpYWxAZTZlODgwMDA8YnI+T3V0OsKgwqAgc2VyaWFs
QGU2ZTg4MDAwPGJyPkVycjrCoMKgIHNlcmlhbEBlNmU4ODAwMDxicj5OZXQ6wqDCoCBldGgwOiBl
dGhlcm5ldEBlNjgwMDAwMDxicj5IaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OsKgIDAgPGJy
PmV0aGVybmV0QGU2ODAwMDAwIFdhaXRpbmcgZm9yIFBIWSBhdXRvIG5lZ290aWF0aW9uIHRvIGNv
bXBsZXRlLi4uIGRvbmU8YnI+VXNpbmcgZXRoZXJuZXRAZTY4MDAwMDAgZGV2aWNlPGJyPlRGVFAg
ZnJvbSBzZXJ2ZXIgMTkyLjE2OC4xLjEwMDsgb3VyIElQIGFkZHJlc3MgaXMgMTkyLjE2OC4xLjM8
YnI+RmlsZW5hbWUgJiMzOTtJbWFnZSYjMzk7Ljxicj5Mb2FkIGFkZHJlc3M6IDB4NDgwODAwMDA8
YnI+TG9hZGluZzogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKg
wqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDC
oMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKg
wqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7C
oMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+
wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJy
PsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxi
cj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8
YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgIDIuNyBNaUIvczxicj5kb25lPGJyPkJ5dGVzIHRy
YW5zZmVycmVkID0gMTU5MTE0MjQgKGYyY2EwMCBoZXgpPGJyPlVzaW5nIGV0aGVybmV0QGU2ODAw
MDAwIGRldmljZTxicj5URlRQIGZyb20gc2VydmVyIDE5Mi4xNjguMS4xMDA7IG91ciBJUCBhZGRy
ZXNzIGlzIDE5Mi4xNjguMS4zPGJyPkZpbGVuYW1lICYjMzk7SW1hZ2UtcjhhNzc5Ni1tM3VsY2Iu
ZHRiJiMzOTsuPGJyPkxvYWQgYWRkcmVzczogMHg0ODAwMDAwMDxicj5Mb2FkaW5nOiAqPGJyPlRG
VFAgZXJyb3I6ICYjMzk7RmlsZSBub3QgZm91bmQmIzM5OyAoMSk8YnI+Tm90IHJldHJ5aW5nLi4u
PGJyPkVSUk9SOiBEaWQgbm90IGZpbmQgYSBjbWRsaW5lIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZTxi
cj5Db3VsZCBub3QgZmluZCBhIHZhbGlkIGRldmljZSB0cmVlPGJyPj0mZ3Q7IHNldGVudiBib290
YXJnczxicj49Jmd0OyB0ZnRwIDB4NDgwODAwMDAgeGVuLW0zdWxjYi51SW1hZ2U8YnI+VXNpbmcg
ZXRoZXJuZXRAZTY4MDAwMDAgZGV2aWNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPGJyPlRGVFAgZnJvbSBzZXJ2ZXIgMTkyLjE2OC4xLjEwMDsgb3VyIElQIGFkZHJlc3MgaXMg
MTkyLjE2OC4xLjPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkZpbGVuYW1lICYj
Mzk7eGVuLW0zdWxjYi51SW1hZ2UmIzM5Oy7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxicj5Mb2FkIGFkZHJlc3M6IDB4NDgwODAwMDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+TG9hZGluZzogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjwqDCoMKgwqAgPGJy
PsKgwqDCoMKgwqDCoMKgwqAgMjguMyBNaUIvc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+ZG9uZcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8YnI+Qnl0ZXMgdHJhbnNmZXJyZWQgPSA5MTg5MjggKGUwNTkwIGhleCnCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDxicj49Jmd0OyB0ZnRwIDB4NDgwMDAwMDAgSW1hZ2UtcjhhNzc5Ni1t
M3VsY2IteGVuLWxvY2FsLmR0YsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPlVzaW5nIGV0aGVybmV0QGU2ODAwMDAwIGRldmljZcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5URlRQIGZyb20gc2VydmVyIDE5Mi4xNjguMS4xMDA7
IG91ciBJUCBhZGRyZXNzIGlzIDE5Mi4xNjguMS4zwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDxicj5GaWxlbmFtZSAmIzM5O0ltYWdlLXI4YTc3OTYtbTN1bGNiLXhlbi1sb2NhbC5kdGIm
IzM5Oy7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPkxvYWQgYWRkcmVzczogMHg0ODAwMDAwMMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5Mb2FkaW5nOiAjIyMjI8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PGJyPsKgwqDCoMKgwqDCoMKgwqAgMjEuOCBNaUIvc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+ZG9uZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+Qnl0ZXMgdHJhbnNmZXJyZWQgPSA2ODU0NSAoMTBiYzEgaGV4KcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+PSZndDsgdGZ0cCAweDdhMDAwMDAwIEltYWdlLW0zdWxj
Yi5iaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5Vc2luZyBldGhlcm5ldEBlNjgwMDAw
MCBkZXZpY2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+VEZUUCBmcm9t
IHNlcnZlciAxOTIuMTY4LjEuMTAwOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIuMTY4LjEuMzxicj5G
aWxlbmFtZSAmIzM5O0ltYWdlLW0zdWxjYi5iaW4mIzM5Oy48YnI+TG9hZCBhZGRyZXNzOiAweDdh
MDAwMDAwPGJyPkxvYWRpbmc6ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8
YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
PGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Izxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAg
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgIDI4LjEgTWlCL3M8YnI+ZG9uZTxicj5CeXRlcyB0
cmFuc2ZlcnJlZCA9IDE5MDU5MjAwICgxMjJkMjAwIGhleCk8YnI+PSZndDsgYm9vdG0gMHg0ODA4
MDAwMCAtIDB4NDgwMDAwMDA8YnI+IyMgQm9vdGluZyBrZXJuZWwgZnJvbSBMZWdhY3kgSW1hZ2Ug
YXQgNDgwODAwMDAgLi4uPGJyPsKgwqAgSW1hZ2UgTmFtZTrCoMKgIFhFTjxicj7CoMKgIEltYWdl
IFR5cGU6wqDCoCBBQXJjaDY0IExpbnV4IEtlcm5lbCBJbWFnZSAodW5jb21wcmVzc2VkKTxicj7C
oMKgIERhdGEgU2l6ZTrCoMKgwqAgOTE4ODY0IEJ5dGVzID0gODk3LjMgS2lCPGJyPsKgwqAgTG9h
ZCBBZGRyZXNzOiA3ODA4MDAwMDxicj7CoMKgIEVudHJ5IFBvaW50OsKgIDc4MDgwMDAwPGJyPsKg
wqAgVmVyaWZ5aW5nIENoZWNrc3VtIC4uLiBPSzxicj4jIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUg
YmxvYiBhdCA0ODAwMDAwMDxicj7CoMKgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4
NDgwMDAwMDA8YnI+wqDCoCBMb2FkaW5nIEtlcm5lbCBJbWFnZSAuLi4gT0s8YnI+wqDCoCBVc2lu
ZyBEZXZpY2UgVHJlZSBpbiBwbGFjZSBhdCAwMDAwMDAwMDQ4MDAwMDAwLCBlbmQgMDAwMDAwMDA0
ODAxM2JjMDxicj48YnI+U3RhcnRpbmcga2VybmVsIC4uLjxicj48YnI+wqBYZW4gNC4xMi11bnN0
YWJsZTxicj4oWEVOKSBYZW4gdmVyc2lvbiA0LjEyLXVuc3RhYmxlICg8YSBocmVmPSJtYWlsdG86
amVsZm5Ad2FzZWRhLmpwIj5qZWxmbkB3YXNlZGEuanA8L2E+KSAoYWFyY2g2NC1wb2t5LWxpbnV4
LWdjOTxicj4oWEVOKSBMYXRlc3QgQ2hhbmdlU2V0OiBNb24gRGVjIDE3IDA5OjIyOjU5IDIwMTgg
KzAwMDAgZ2l0OmE1YjBlYjMtZGlydHk8YnI+KFhFTikgUHJvY2Vzc29yOiA0MTFmZDA3MzogJnF1
b3Q7QVJNIExpbWl0ZWQmcXVvdDssIHZhcmlhbnQ6IDB4MSwgcGFydCAweGQwNywgcmV2IDB4Mzxi
cj4oWEVOKSA2NC1iaXQgRXhlY3V0aW9uOjxicj4oWEVOKcKgwqAgUHJvY2Vzc29yIEZlYXR1cmVz
OiAwMDAwMDAwMDAwMDAyMjIyIDAwMDAwMDAwMDAwMDAwMDA8YnI+KFhFTinCoMKgwqDCoCBFeGNl
cHRpb24gTGV2ZWxzOiBFTDM6NjQrMzIgRUwyOjY0KzMyIEVMMTo2NCszMiBFTDA6NjQrMzI8YnI+
KFhFTinCoMKgwqDCoCBFeHRlbnNpb25zOiBGbG9hdGluZ1BvaW50IEFkdmFuY2VkU0lNRDxicj4o
WEVOKcKgwqAgRGVidWcgRmVhdHVyZXM6IDAwMDAwMDAwMTAzMDUxMDYgMDAwMDAwMDAwMDAwMDAw
MDxicj4oWEVOKcKgwqAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDA8YnI+KFhFTinCoMKgIE1lbW9yeSBNb2RlbCBGZWF0dXJlczogMDAwMDAwMDAw
MDAwMTEyNCAwMDAwMDAwMDAwMDAwMDAwPGJyPihYRU4pwqDCoCBJU0EgRmVhdHVyZXM6wqAgMDAw
MDAwMDAwMDAxMTEyMCAwMDAwMDAwMDAwMDAwMDAwPGJyPihYRU4pIDMyLWJpdCBFeGVjdXRpb246
PGJyPihYRU4pwqDCoCBQcm9jZXNzb3IgRmVhdHVyZXM6IDAwMDAwMTMxOjAwMDExMDExPGJyPihY
RU4pwqDCoMKgwqAgSW5zdHJ1Y3Rpb24gU2V0czogQUFyY2gzMiBBMzIgVGh1bWIgVGh1bWItMiBK
YXplbGxlPGJyPihYRU4pwqDCoMKgwqAgRXh0ZW5zaW9uczogR2VuZXJpY1RpbWVyIFNlY3VyaXR5
PGJyPihYRU4pwqDCoCBEZWJ1ZyBGZWF0dXJlczogMDMwMTAwNjY8YnI+KFhFTinCoMKgIEF1eGls
aWFyeSBGZWF0dXJlczogMDAwMDAwMDA8YnI+KFhFTinCoMKgIE1lbW9yeSBNb2RlbCBGZWF0dXJl
czogMTAyMDExMDUgNDAwMDAwMDAgMDEyNjAwMDAgMDIxMDIyMTE8YnI+KFhFTinCoCBJU0EgRmVh
dHVyZXM6IDAyMTAxMTEwIDEzMTEyMTExIDIxMjMyMDQyIDAxMTEyMTMxIDAwMDExMTQyIDAwMDEx
MTIxPGJyPihYRU4pIFVzaW5nIFNNQyBDYWxsaW5nIENvbnZlbnRpb24gdjEuMTxicj4oWEVOKSBV
c2luZyBQU0NJIHYxLjE8YnI+KFhFTikgU01QOiBBbGxvd2luZyA2IENQVXM8YnI+KFhFTikgPGJy
PihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKio8YnI+KFhFTikg
UGFuaWMgb24gQ1BVIDA6PGJyPihYRU4pIFRpbWVyOiBVbmFibGUgdG8gcmV0cmlldmUgSVJRIDAg
ZnJvbSB0aGUgZGV2aWNlIHRyZWU8YnI+KFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKjxicj4oWEVOKSA8YnI+KFhFTikgUmVib290IGluIGZpdmUgc2Vjb25kcy4u
Ljxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PklzIHRoZXJlIGFueXRoaW5nIEkgaGF2ZSBv
dmVybG9va2VkIGluIHRoZSBjb21waWxhdGlvbiBvciBjb25maWd1cmF0aW9uIGZvciBYZW4/PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFuayB5b3UgdmVyeSBtdWNoIGZvciBhbGwgdGhlIGhl
bHAgeW91IGhhdmUgb2ZmZXJlZCB1cCB0byB0aGlzIHBvaW50LiBJIGFtIGF0IGxlYXN0IGhhcHB5
IHRvIGdldCBzb21lIG91dHB1dCwgZXZlbiBpZiBpdCBpcyBvbiB0aGUgUi1DYXIgTTMgYm9hcmQg
aW4gbXkgcG9zc2Vzc2lvbi48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkphaXJvPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjwv
ZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBk
aXI9Imx0ciI+MjAxOeW5tDHmnIg55pelKOawtCkgMjowNCBMT1BFWiwgRlVFTlRFUyBOQUNBUklO
TyBKYWlybyBFZHVhcmRvICZsdDs8YSBocmVmPSJtYWlsdG86amFpcm9AcnVyaS53YXNlZGEuanAi
PmphaXJvQHJ1cmkud2FzZWRhLmpwPC9hPiZndDs6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0i
bHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PkFuZHJpaSw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkkgaGF2ZSBhdHRlbXB0ZWQgdG8gdXBkYXRlIHRoZSBib290bG9hZGVyIGZyb20gdGhlIHNyZWMg
ZmlsZXMgY3JlYXRlZCBieSB0aGUgYml0YmFrZSBjb21tYW5kLjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SSBiZWxpZXZlIEkgaGF2ZSBiZWVuIGFibGUgdG8gdXBkYXRlIGl0LCBidXQgSSBhbSBz
dGlsbCBvYnRhaW5pbmcgdGhlIHNhbWUgcmVzdWx0cy4gVGhlIHNlcmlhbCBvdXRwdXQgaXMgc2hv
d24gYmVsb3c6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5bwqDCoMKgIDAuMDAwMTYxXSBOT1RJ
Q0U6wqAgQkwyOiBSLUNhciBHZW4zIEluaXRpYWwgUHJvZ3JhbSBMb2FkZXIoQ0E1NykgUmV2LjEu
MC4xNzxicj5bwqDCoMKgIDAuMDA1NzIxXSBOT1RJQ0U6wqAgQkwyOiBQUlIgaXMgUi1DYXIgSDMg
VmVyMi4wPGJyPlvCoMKgwqAgMC4wMTAzMDRdIE5PVElDRTrCoCBCTDI6IEJvYXJkIGlzIFN0YXJ0
ZXIgS2l0IFJldjEuMDxicj5bwqDCoMKgIDAuMDE1MzMxXSBOT1RJQ0U6wqAgQkwyOiBCb290IGRl
dmljZSBpcyBIeXBlckZsYXNoKDgwTUh6KTxicj5bwqDCoMKgIDAuMDIwNzU3XSBOT1RJQ0U6wqAg
QkwyOiBMQ00gc3RhdGUgaXMgQ008YnI+W8KgwqDCoCAwLjAyNDgwMl0gTk9USUNFOsKgIEJMMjog
QVZTIHNldHRpbmcgc3VjY2VlZGVkLiBEVkZTX1NldFZJRD0weDUzPGJyPlvCoMKgwqAgMC4wMzA3
ODZdIE5PVElDRTrCoCBCTDI6IEREUjMyMDAocmV2LjAuMjgpTk9USUNFOsKgIFtDT0xEX0JPT1Rd
Tk9USUNFOsKgIC4uMDxicj5bwqDCoMKgIDAuMDU5OTk2XSBOT1RJQ0U6wqAgQkwyOiBEUkFNIFNw
bGl0IGlzIDRjaDxicj5bwqDCoMKgIDAuMDYzODgyXSBOT1RJQ0U6wqAgQkwyOiBRb1MgaXMgZGVm
YXVsdCBzZXR0aW5nKHJldi4wLjE4KTxicj5bwqDCoMKgIDAuMDY5MzgxXSBOT1RJQ0U6wqAgQkwy
OiBMb3NzeSBEZWNvbXAgYXJlYXM8YnI+W8KgwqDCoCAwLjA3MzU1OV0gTk9USUNFOsKgwqDCoMKg
wqDCoCBFbnRyeSAwOiBEQ01QQVJFQUNSQXg6MHg4MDAwMDU0MCBEQ01QQVJFQUNSQng6MHg1NzA8
YnI+W8KgwqDCoCAwLjA4MDY0M10gTk9USUNFOsKgwqDCoMKgwqDCoCBFbnRyeSAxOiBEQ01QQVJF
QUNSQXg6MHg0MDAwMDAwMCBEQ01QQVJFQUNSQng6MHgwPGJyPlvCoMKgwqAgMC4wODc1NTVdIE5P
VElDRTrCoMKgwqDCoMKgwqAgRW50cnkgMjogRENNUEFSRUFDUkF4OjB4MjAwMDAwMDAgRENNUEFS
RUFDUkJ4OjB4MDxicj5bwqDCoMKgIDAuMDk0NDcwXSBOT1RJQ0U6wqAgQkwyOiB2MS4zKHJlbGVh
c2UpOmIxNWZlZmE8YnI+W8KgwqDCoCAwLjA5ODk2MF0gTk9USUNFOsKgIEJMMjogQnVpbHQgOiAx
MjoyMTozMiwgRGVjIDI4IDIwMTg8YnI+W8KgwqDCoCAwLjEwNDE0N10gTk9USUNFOsKgIEJMMjog
Tm9ybWFsIGJvb3Q8YnI+W8KgwqDCoCAwLjEwNzc4OF0gTk9USUNFOsKgIEJMMjogZHN0PTB4ZTYz
MjIyMTAgc3JjPTB4ODE4MDAwMCBsZW49NTEyKDB4MjAwKTxicj5bwqDCoMKgIDAuMTE0MzM1XSBO
T1RJQ0U6wqAgQkwyOiBkc3Q9MHg0M2YwMDAwMCBzcmM9MHg4MTgwNDAwIGxlbj02MTQ0KDB4MTgw
MCk8YnI+W8KgwqDCoCAwLjEyMDc5N10gTk9USUNFOsKgIEJMMjogZHN0PTB4NDQwMDAwMDAgc3Jj
PTB4ODFjMDAwMCBsZW49NjU1MzYoMHgxMDAwMCk8YnI+W8KgwqDCoCAwLjEyODAyMl0gTk9USUNF
OsKgIEJMMjogZHN0PTB4NDQxMDAwMDAgc3JjPTB4ODIwMDAwMCBsZW49NTI0Mjg4KDB4ODAwMDAp
PGJyPlvCoMKgwqAgMC4xMzg1MDNdIE5PVElDRTrCoCBCTDI6IGRzdD0weDUwMDAwMDAwIHNyYz0w
eDg2NDAwMDAgbGVuPTEwNDg1NzYoMHgxMDAwMDApPGJyPjxicj48YnI+VS1Cb290IDIwMTUuMDQg
KERlYyAyOCAyMDE4IC0gMDI6NDY6MjQpPGJyPjxicj5DUFU6IFJlbmVzYXMgRWxlY3Ryb25pY3Mg
UjhBNzc5NSByZXYgMi4wPGJyPkJvYXJkOiBIM1VMQ0I8YnI+STJDOsKgwqAgcmVhZHk8YnI+RFJB
TTrCoCAzLjkgR2lCPGJyPk1NQzrCoMKgIHNoLXNkaGk6IDAsIHNoLXNkaGk6IDE8YnI+SW46wqDC
oMKgIHNlcmlhbDxicj5PdXQ6wqDCoCBzZXJpYWw8YnI+RXJyOsKgwqAgc2VyaWFsPGJyPk5ldDrC
oMKgIHJhdmI8YnI+SGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDrCoCAwIDxicj49Jmd0OyBz
ZXRlbnYgYm9vdGFyZ3M8YnI+PSZndDsgc2V0ZW52IHNlcnZlcmlwIDE5Mi4xNjguMS4xMDA8YnI+
PSZndDsgdGZ0cCAweDQ4MDgwMDAwIHhlbi1oM3VsY2IudUltYWdlPGJyPnJhdmIgV2FpdGluZyBm
b3IgUEhZIGF1dG8gbmVnb3RpYXRpb24gdG8gY29tcGxldGUuLi4uLi4uLi4gVElNRU9VVCAhPGJy
PkhhbGY8YnI+VXNpbmcgcmF2YiBkZXZpY2U8YnI+VEZUUCBmcm9tIHNlcnZlciAxOTIuMTY4LjEu
MTAwOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIuMTY4LjEuNDA8YnI+RmlsZW5hbWUgJiMzOTt4ZW4t
aDN1bGNiLnVJbWFnZSYjMzk7Ljxicj5Mb2FkIGFkZHJlc3M6IDB4NDgwODAwMDA8YnI+TG9hZGlu
ZzogKjxicj5BUlAgUmV0cnkgY291bnQgZXhjZWVkZWQ7IHN0YXJ0aW5nIGFnYWluPGJyPnJhdmI6
MCBpcyBjb25uZWN0ZWQgdG8gcmF2Yi7CoCBSZWNvbm5lY3RpbmcgdG8gcmF2Yjxicj5yYXZiIFdh
aXRpbmcgZm9yIFBIWSBhdXRvIG5lZ290aWF0aW9uIHRvIGNvbXBsZXRlLi4uLi4uLi4uIFRJTUVP
VVQgITxicj5IYWxmPGJyPjxicj5BUlAgUmV0cnkgY291bnQgZXhjZWVkZWQ7IHN0YXJ0aW5nIGFn
YWluPGJyPnJhdmI6MCBpcyBjb25uZWN0ZWQgdG8gcmF2Yi7CoCBSZWNvbm5lY3RpbmcgdG8gcmF2
Yjxicj5yYXZiIFdhaXRpbmcgZm9yIFBIWSBhdXRvIG5lZ290aWF0aW9uIHRvIGNvbXBsZXRlLi4u
IGRvbmU8YnI+cmF2YjogMTAwMEJhc2UvRnVsbDxicj5Vc2luZyByYXZiIGRldmljZTxicj5URlRQ
IGZyb20gc2VydmVyIDE5Mi4xNjguMS4xMDA7IG91ciBJUCBhZGRyZXNzIGlzIDE5Mi4xNjguMS40
MDxicj5GaWxlbmFtZSAmIzM5O3hlbi1oM3VsY2IudUltYWdlJiMzOTsuPGJyPkxvYWQgYWRkcmVz
czogMHg0ODA4MDAwMDxicj5Mb2FkaW5nOiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgIDI1LjQgTWlC
L3M8YnI+ZG9uZTxicj5CeXRlcyB0cmFuc2ZlcnJlZCA9IDg1MjM2OCAoZDAxOTAgaGV4KTxicj49
Jmd0OyB0ZnRwIDB4NDgwMDAwMDAgSW1hZ2UtcjhhNzc5NS1oM3VsY2IteGVuLWxvY2FsLmR0Yjxi
cj5yYXZiOjAgaXMgY29ubmVjdGVkIHRvIHJhdmIuwqAgUmVjb25uZWN0aW5nIHRvIHJhdmI8YnI+
cmF2YiBXYWl0aW5nIGZvciBQSFkgYXV0byBuZWdvdGlhdGlvbiB0byBjb21wbGV0ZS4uLi4uIGRv
bmU8YnI+cmF2YjogMTAwMEJhc2UvRnVsbDxicj5Vc2luZyByYXZiIGRldmljZTxicj5URlRQIGZy
b20gc2VydmVyIDE5Mi4xNjguMS4xMDA7IG91ciBJUCBhZGRyZXNzIGlzIDE5Mi4xNjguMS40MDxi
cj5GaWxlbmFtZSAmIzM5O0ltYWdlLXI4YTc3OTUtaDN1bGNiLXhlbi1sb2NhbC5kdGImIzM5Oy48
YnI+TG9hZCBhZGRyZXNzOiAweDQ4MDAwMDAwPGJyPkxvYWRpbmc6ICMjIyMjPGJyPsKgwqDCoMKg
wqDCoMKgwqAgMTEuNyBLaUIvczxicj5kb25lPGJyPkJ5dGVzIHRyYW5zZmVycmVkID0gNjM3Nzgg
KGY5MjIgaGV4KTxicj49Jmd0OyB0ZnRwIDB4N2EwMDAwMDAgaDN1bGNiLWltYWdlPGJyPnJhdmI6
MCBpcyBjb25uZWN0ZWQgdG8gcmF2Yi7CoCBSZWNvbm5lY3RpbmcgdG8gcmF2Yjxicj5yYXZiIFdh
aXRpbmcgZm9yIFBIWSBhdXRvIG5lZ290aWF0aW9uIHRvIGNvbXBsZXRlLi4uIGRvbmU8YnI+cmF2
YjogMTAwMEJhc2UvRnVsbDxicj5Vc2luZyByYXZiIGRldmljZTxicj5URlRQIGZyb20gc2VydmVy
IDE5Mi4xNjguMS4xMDA7IG91ciBJUCBhZGRyZXNzIGlzIDE5Mi4xNjguMS40MDxicj5GaWxlbmFt
ZSAmIzM5O2gzdWxjYi1pbWFnZSYjMzk7Ljxicj5Mb2FkIGFkZHJlc3M6IDB4N2EwMDAwMDA8YnI+
TG9hZGluZzogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDC
oMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKg
wqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDC
oMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKg
wqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDC
oMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKg
wqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7C
oMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+
wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
PGJyPsKgwqDCoMKgwqDCoMKgwqAgMi4xIE1pQi9zPGJyPmRvbmU8YnI+Qnl0ZXMgdHJhbnNmZXJy
ZWQgPSAxNTg0Mzg0MCAoZjFjMjAwIGhleCk8YnI+PSZndDsgYm9vdG0gMHg0ODA4MDAwMCAtIDB4
NDgwMDAwMDA8YnI+IyMgQm9vdGluZyBrZXJuZWwgZnJvbSBMZWdhY3kgSW1hZ2UgYXQgNDgwODAw
MDAgLi4uPGJyPsKgwqAgSW1hZ2UgTmFtZTrCoMKgIFhFTjxicj7CoMKgIEltYWdlIFR5cGU6wqDC
oCBBQXJjaDY0IExpbnV4IEtlcm5lbCBJbWFnZSAodW5jb21wcmVzc2VkKTxicj7CoMKgIERhdGEg
U2l6ZTrCoMKgwqAgODUyMzA0IEJ5dGVzID0gODMyLjMgS2lCPGJyPsKgwqAgTG9hZCBBZGRyZXNz
OiA3ODA4MDAwMDxicj7CoMKgIEVudHJ5IFBvaW50OsKgIDc4MDgwMDAwPGJyPsKgwqAgVmVyaWZ5
aW5nIENoZWNrc3VtIC4uLiBPSzxicj4jIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBhdCA0
ODAwMDAwMDxicj7CoMKgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4NDgwMDAwMDA8
YnI+wqDCoCBMb2FkaW5nIEtlcm5lbCBJbWFnZSAuLi4gT0s8YnI+wqDCoCBVc2luZyBEZXZpY2Ug
VHJlZSBpbiBwbGFjZSBhdCAwMDAwMDAwMDQ4MDAwMDAwLCBlbmQgMDAwMDAwMDA0ODAxMjkyMTxi
cj48YnI+U3RhcnRpbmcga2VybmVsIC4uLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiZs
dDsvZW5kIG91dHB1dCZndDs8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgaGF2ZSBub3RpY2Vk
IHRoYXQgdGhlIHVib290IGRhdGUgaGFzIG5vdCBjaGFuZ2VkIGZyb20gMjAxNS4wNCBhbHRob3Vn
aCB0aGUgYnVpbGQgZGF0ZSBpcyBmcm9tIHRoZSBsYXN0IHRpbWUgSSByYW4gYSBiaXRiYWtlIGNv
bW1hbmQuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGRvIG5vdCBrbm93IHdoYXQgdmVyc2lv
biBvZiB1Ym9vdCBzaG91bGQgYmUgdXNlZCB3aXRob3V0IGJyZWFraW5nIHRoZSBjdXJyZW50IGNv
bXBpbGluZyB2ZXJzaW9ucy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFyZSB0aGVyZSBhbnkg
b3RoZXIgbW9kaWZpY2F0aW9ucyB0aGF0IEkgY2FuIGF0dGVtcHQ/PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5UaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHRpbWUgYW5kIHBhdGllbmNlLjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SmFpcm88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=
--00000000000067dc80057f2c98bb--


--===============3284567372561236458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3284567372561236458==--
