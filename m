From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: RT Xen on ARM - R-Car series
Date: Wed, 16 Jan 2019 22:46:39 +0200
Message-ID: <CAC1WxdgJQWhYJHfZoK7DfY9a7CLyn1MACUa5UXeOEkVaXt1oJA@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
 <3aecad20-41f5-4249-46be-bfef80c88ea3@gmail.com>
 <623d0b16-8616-183c-d8d4-559ad81363ed@gmail.com>
 <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
 <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
 <CACrvCsZuh+tj2ejA2RYh78QnySw0fBBEXxWpam_TcFZAORSCXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8417742942000171812=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CACrvCsZuh+tj2ejA2RYh78QnySw0fBBEXxWpam_TcFZAORSCXw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Xen-devel List <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============8417742942000171812==
Content-Type: multipart/alternative; boundary="0000000000007b9395057f9960f1"

--0000000000007b9395057f9960f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kudos to Oleksandr Tyshchenko, he stepped into the same, and found the
rootcause.

The problem is in a patch https://patchwork.kernel.org/patch/10084561/ .

I guess you can workaround it with adding interrupts and interrupt-parent
properties to timer node through your dtb. Something like following:


 	&timer {


		interrupt-parent =3D <&gic>;

		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>=
,

				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,

				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,

				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;

 	};



For sure the proper fix is something different, i.e. teaching xen to cope
with interrupts-extended.


Sent from my Android.

=D0=BF=D1=82, 11 =D1=81=D1=96=D1=87. 2019, 12:59 LOPEZ, FUENTES NACARINO Ja=
iro Eduardo =D0=BA=D0=BE=D1=80=D0=B8=D1=81=D1=82=D1=83=D0=B2=D0=B0=D1=87
jairo@ruri.waseda.jp =D0=BF=D0=B8=D1=88=D0=B5:

> Andrii,
>
> Due to some events on my side, I had to move from the R-Car H3 I was usin=
g
> to the R-Car M3 in my posession.
>
> I followed your initial advice and updated my environment to a newer
> version, opting to stick to the rocko version for the m3ulcb.
>
> The Yocto build configuration is shown below:
>
> Build Configuration:
> BB_VERSION           =3D "1.36.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal-4.9"
> TARGET_SYS           =3D "aarch64-poky-linux"
> MACHINE              =3D "m3ulcb"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "2.4.2"
> TUNE_FEATURES        =3D "aarch64 cortexa57-cortexa53"
> TARGET_FPU           =3D ""
> SOC_FAMILY           =3D "rcar-gen3:r8a7796"
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:342fbd6a3e57021c8e28b124b3adb241936f3d9d"
> meta-rcar-gen3       =3D "rocko:8af0b7d6e445b532088a068dc012757001be3a1f"
> meta-optee           =3D "rocko:75dfb67bbb14a70cd47afda9726e2e1c76731885"
> meta-oe
> meta-python
> meta-networking      =3D "rocko:eae996301d9c097bcbeb8046f08041dc82bb62f8"
> meta-selinux         =3D "rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae12d"
> meta-virtualization  =3D "rocko:b704c689b67639214b9568a3d62e82df27e9434f"
> meta-rcar-gen3-xen   =3D "master:60699c631d541aeeaebaeec9a087efed9385ee42=
"
>
> I had to modify the dtb to the version shown below:
>
> // SPDX-License-Identifier:
> GPL-2.0
> /*
>
>  * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro)
> board
>  *
>
>  * Copyright (C) 2016-2018 Renesas Electronics
> Corp.
>  * Copyright (C) 2016 Cogent Embedded,
> Inc.
>  */
>
>
>
> /dts-v1/;
>
> #include
> "r8a7796.dtsi"
>
> #include
> "ulcb.dtsi"
>
>
>
> /
> {
>
>         model =3D "Renesas M3ULCB board based on
> r8a7796";
>         compatible =3D "renesas,m3ulcb",
> "renesas,r8a7796";
>
>
>         cpus
> {
>                 idle-states
> {
>                         /delete-node/
> cpu-sleep-1;
>
> };
>
> };
>
>
>
>         memory@48000000
> {
>                 device_type =3D
> "memory";
>                 /* first 128MB is reserved for secure area.
> */
>                 reg =3D <0x0 0x48000000 0x0
> 0x38000000>;
>         };
>
>         memory@600000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x6 0x00000000 0x0 0x40000000>;
>         };
>
>         reserved-memory {
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges;
>
>                 /* device specific region for Lossy Decompression */
>                 lossy_decompress: linux,lossy_decompress@54000000 {
>                         no-map;
>                         reg =3D <0x00000000 0x54000000 0x0 0x03000000>;
>                 };
>
>                 /* global autoconfigured region for contiguous allocation=
s
> */
>                 linux,cma@57000000 {
>                         compatible =3D "shared-dma-pool";
>                         reusable;
>                         reg =3D <0x00000000 0x57000000 0x0 0x19000000>;
>                         linux,cma-default;
>                 };
>
>                 /* device specific region for contiguous allocations */
>                 mmp_reserved: linux,multimedia@70000000 {
>                         compatible =3D "shared-dma-pool";
>                         reusable;
>                         reg =3D <0x00000000 0x70000000 0x0 0x10000000>;
>                 };
>         };
>
>         chosen {
>                 stdout-path =3D "serial0:115200n8";
>                 xen,xen-bootargs =3D "dom0_mem=3D752M console=3Ddtuart
> dtuart=3Dserial0 dom0_max_vcpus=3D4";
>                 xen,dom0-bootargs =3D "console=3Dhvc0 clk_ignore_unused
> root=3D/dev/mmcblk1p2 rw rootwait ignore_loglevel cma=3D128M";
>
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 modules {
>                         module@0 {
>                                 compatible =3D "xen,linux-zimage",
> "xen,multiboot-module";
>                                 reg =3D <0x0 0x7a000000 0x0 0x02000000>;
>                         };
>                 };
>         };
>
>         mmngr {
>                 compatible =3D "renesas,mmngr";
>                 memory-region =3D <&mmp_reserved>, <&lossy_decompress>;
>         };
>
>         mmngrbuf {
>                 compatible =3D "renesas,mmngrbuf";
>         };
>
>         vspm_if {
>                 compatible =3D "renesas,vspm_if";
>         };
>
>         versaclock5_out3: versaclk-3 {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
>                 /* Initial value of versaclock out3 */
>                 clock-frequency =3D <33000000>;
>         };
> };
>
> &a53_0 {
>         /delete-property/ cpu-idle-states;
> };
>
> &a53_1 {
>         /delete-property/ cpu-idle-states;
> };
>
> &a53_2 {
>         /delete-property/ cpu-idle-states;
> };
>
> &a53_3 {
>         /delete-property/ cpu-idle-states;
> };
>
> &du {
>         clocks =3D <&cpg CPG_MOD 724>,
>                  <&cpg CPG_MOD 723>,
>                  <&cpg CPG_MOD 722>,
>                  <&versaclock5 1>,
>                  <&versaclock5_out3>,
>                  <&versaclock5 2>;
>         clock-names =3D "du.0", "du.1", "du.2",
>                       "dclkin.0", "dclkin.1", "dclkin.2";
> };
>
> &vspb {
>         status =3D "okay";
> };
>
> &vspi0 {
>         status =3D "okay";
> };
>
> With the new information, I finally got some output for Xen, but was met
> with a completely different issue for which I can't find any information
> for the error I am receiving.
>
> I realize that I may have an issue with the version of the board I am
> using, but a simple online search doesn't throw any red flags. The serial
> console output is below:
>
> [    0.000177] NOTICE:  BL2: R-Car M3 Initial Program Loader(CA57)
> [    0.004613] NOTICE:  BL2: Initial Program Loader(Rev.2.0.0)
> [    0.010147] NOTICE:  BL2: PRR is R-Car M3 Ver.1.0
> [    0.014815] NOTICE:  BL2: Board is Starter Kit Rev.1.0
> [    0.019928] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
> [    0.025354] NOTICE:  BL2: LCM state is CM
> [    0.029395] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
> [    0.035383] NOTICE:  BL2: DDR3200(rev.0.34)
> [    0.046779] NOTICE:  BL2: [COLD_BOOT]
> [    0.085117] NOTICE:  BL2: DRAM Split is 2ch
> [    0.087812] NOTICE:  BL2: QoS is default setting(rev.0.19)
> [    0.093315] NOTICE:  BL2: Lossy Decomp areas
> [    0.097489] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
> DCMPAREACRBx:0x570
> [    0.104573] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
> DCMPAREACRBx:0x0
> [    0.111485] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
> DCMPAREACRBx:0x0
> [    0.118400] NOTICE:  BL2: v1.5(release):556a11e
> [    0.122890] NOTICE:  BL2: Built : 18:03:48, Jan 11 2019
> [    0.128077] NOTICE:  BL2: Normal boot
> [    0.131718] NOTICE:  BL2: dst=3D0xe6321100 src=3D0x8180000 len=3D512(0=
x200)
> [    0.138106] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(=
0x1800)
> [    0.144726] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000
> len=3D65536(0x10000)
> [    0.151952] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
> len=3D1048576(0x100000)
> [    0.166777] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
> len=3D1048576(0x100000)
> [    0.180752] NOTICE:  BL2: Booting BL31
>
>
> U-Boot 2018.09 (Jan 12 2019 - 03:03:43 +0900)
>
> CPU: Renesas Electronics R8A7796 rev 1.0
> Model: Renesas M3ULCB board based on r8a7796
> DRAM:  1.9 GiB
> Bank #0: 0x048000000 - 0x07fffffff, 896 MiB
> Bank #1: 0x600000000 - 0x63fffffff, 1 GiB
>
> MMC:   sd@ee100000: 0, sd@ee140000: 1
> Loading Environment from MMC... communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> communication out of sync
> OK
> In:    serial@e6e88000
> Out:   serial@e6e88000
> Err:   serial@e6e88000
> Net:   eth0: ethernet@e6800000
> Hit any key to stop autoboot:  0
> ethernet@e6800000 Waiting for PHY auto negotiation to complete... done
> Using ethernet@e6800000 device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> Filename 'Image'.
> Load address: 0x48080000
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
>          ############################################
>          2.7 MiB/s
> done
> Bytes transferred =3D 15911424 (f2ca00 hex)
> Using ethernet@e6800000 device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> Filename 'Image-r8a7796-m3ulcb.dtb'.
> Load address: 0x48000000
> Loading: *
> TFTP error: 'File not found' (1)
> Not retrying...
> ERROR: Did not find a cmdline Flattened Device Tree
> Could not find a valid device tree
> =3D> setenv bootargs
> =3D> tftp 0x48080000 xen-m3ulcb.uImage
> Using ethernet@e6800000
> device
> TFTP from server 192.168.1.100; our IP address is
> 192.168.1.3
> Filename
> 'xen-m3ulcb.uImage'.
> Load address:
> 0x48080000
> Loading:
> ###############################################################
>          28.3
> MiB/s
> done
>
> Bytes transferred =3D 918928 (e0590
> hex)
> =3D> tftp 0x48000000
> Image-r8a7796-m3ulcb-xen-local.dtb
> Using ethernet@e6800000
> device
> TFTP from server 192.168.1.100; our IP address is
> 192.168.1.3
> Filename
> 'Image-r8a7796-m3ulcb-xen-local.dtb'.
> Load address:
> 0x48000000
> Loading:
> #####
>          21.8
> MiB/s
> done
>
> Bytes transferred =3D 68545 (10bc1
> hex)
> =3D> tftp 0x7a000000
> Image-m3ulcb.bin
> Using ethernet@e6800000
> device
> TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> Filename 'Image-m3ulcb.bin'.
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
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################=
#
>          ################################################################
>          28.1 MiB/s
> done
> Bytes transferred =3D 19059200 (122d200 hex)
> =3D> bootm 0x48080000 - 0x48000000
> ## Booting kernel from Legacy Image at 48080000 ...
>    Image Name:   XEN
>    Image Type:   AArch64 Linux Kernel Image (uncompressed)
>    Data Size:    918864 Bytes =3D 897.3 KiB
>    Load Address: 78080000
>    Entry Point:  78080000
>    Verifying Checksum ... OK
> ## Flattened Device Tree blob at 48000000
>    Booting using the fdt blob at 0x48000000
>    Loading Kernel Image ... OK
>    Using Device Tree in place at 0000000048000000, end 0000000048013bc0
>
> Starting kernel ...
>
>  Xen 4.12-unstable
> (XEN) Xen version 4.12-unstable (jelfn@waseda.jp) (aarch64-poky-linux-gc9
> (XEN) Latest ChangeSet: Mon Dec 17 09:22:59 2018 +0000 git:a5b0eb3-dirty
> (XEN) Processor: 411fd073: "ARM Limited", variant: 0x1, part 0xd07, rev 0=
x3
> (XEN) 64-bit Execution:
> (XEN)   Processor Features: 0000000000002222 0000000000000000
> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> (XEN)     Extensions: FloatingPoint AdvancedSIMD
> (XEN)   Debug Features: 0000000010305106 0000000000000000
> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> (XEN)   Memory Model Features: 0000000000001124 0000000000000000
> (XEN)   ISA Features:  0000000000011120 0000000000000000
> (XEN) 32-bit Execution:
> (XEN)   Processor Features: 00000131:00011011
> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> (XEN)     Extensions: GenericTimer Security
> (XEN)   Debug Features: 03010066
> (XEN)   Auxiliary Features: 00000000
> (XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
> (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 0001112=
1
> (XEN) Using SMC Calling Convention v1.1
> (XEN) Using PSCI v1.1
> (XEN) SMP: Allowing 6 CPUs
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Timer: Unable to retrieve IRQ 0 from the device tree
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
>
> Is there anything I have overlooked in the compilation or configuration
> for Xen?
>
> Thank you very much for all the help you have offered up to this point. I
> am at least happy to get some output, even if it is on the R-Car M3 board
> in my possession.
>
> Best regards,
>
> Jairo
>
>
> 2019=E5=B9=B41=E6=9C=889=E6=97=A5(=E6=B0=B4) 2:04 LOPEZ, FUENTES NACARINO=
 Jairo Eduardo <
> jairo@ruri.waseda.jp>:
>
>> Andrii,
>>
>> I have attempted to update the bootloader from the srec files created by
>> the bitbake command.
>>
>> I believe I have been able to update it, but I am still obtaining the
>> same results. The serial output is shown below:
>>
>> [    0.000161] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57)
>> Rev.1.0.17
>> [    0.005721] NOTICE:  BL2: PRR is R-Car H3 Ver2.0
>> [    0.010304] NOTICE:  BL2: Board is Starter Kit Rev1.0
>> [    0.015331] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
>> [    0.020757] NOTICE:  BL2: LCM state is CM
>> [    0.024802] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
>> [    0.030786] NOTICE:  BL2: DDR3200(rev.0.28)NOTICE:
>> [COLD_BOOT]NOTICE:  ..0
>> [    0.059996] NOTICE:  BL2: DRAM Split is 4ch
>> [    0.063882] NOTICE:  BL2: QoS is default setting(rev.0.18)
>> [    0.069381] NOTICE:  BL2: Lossy Decomp areas
>> [    0.073559] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
>> DCMPAREACRBx:0x570
>> [    0.080643] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
>> DCMPAREACRBx:0x0
>> [    0.087555] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
>> DCMPAREACRBx:0x0
>> [    0.094470] NOTICE:  BL2: v1.3(release):b15fefa
>> [    0.098960] NOTICE:  BL2: Built : 12:21:32, Dec 28 2018
>> [    0.104147] NOTICE:  BL2: Normal boot
>> [    0.107788] NOTICE:  BL2: dst=3D0xe6322210 src=3D0x8180000 len=3D512(=
0x200)
>> [    0.114335] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144=
(0x1800)
>> [    0.120797] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000
>> len=3D65536(0x10000)
>> [    0.128022] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
>> len=3D524288(0x80000)
>> [    0.138503] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
>> len=3D1048576(0x100000)
>>
>>
>> U-Boot 2015.04 (Dec 28 2018 - 02:46:24)
>>
>> CPU: Renesas Electronics R8A7795 rev 2.0
>> Board: H3ULCB
>> I2C:   ready
>> DRAM:  3.9 GiB
>> MMC:   sh-sdhi: 0, sh-sdhi: 1
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Net:   ravb
>> Hit any key to stop autoboot:  0
>> =3D> setenv bootargs
>> =3D> setenv serverip 192.168.1.100
>> =3D> tftp 0x48080000 xen-h3ulcb.uImage
>> ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !
>> Half
>> Using ravb device
>> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
>> Filename 'xen-h3ulcb.uImage'.
>> Load address: 0x48080000
>> Loading: *
>> ARP Retry count exceeded; starting again
>> ravb:0 is connected to ravb.  Reconnecting to ravb
>> ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !
>> Half
>>
>> ARP Retry count exceeded; starting again
>> ravb:0 is connected to ravb.  Reconnecting to ravb
>> ravb Waiting for PHY auto negotiation to complete... done
>> ravb: 1000Base/Full
>> Using ravb device
>> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
>> Filename 'xen-h3ulcb.uImage'.
>> Load address: 0x48080000
>> Loading: ###########################################################
>>          25.4 MiB/s
>> done
>> Bytes transferred =3D 852368 (d0190 hex)
>> =3D> tftp 0x48000000 Image-r8a7795-h3ulcb-xen-local.dtb
>> ravb:0 is connected to ravb.  Reconnecting to ravb
>> ravb Waiting for PHY auto negotiation to complete..... done
>> ravb: 1000Base/Full
>> Using ravb device
>> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
>> Filename 'Image-r8a7795-h3ulcb-xen-local.dtb'.
>> Load address: 0x48000000
>> Loading: #####
>>          11.7 KiB/s
>> done
>> Bytes transferred =3D 63778 (f922 hex)
>> =3D> tftp 0x7a000000 h3ulcb-image
>> ravb:0 is connected to ravb.  Reconnecting to ravb
>> ravb Waiting for PHY auto negotiation to complete... done
>> ravb: 1000Base/Full
>> Using ravb device
>> TFTP from server 192.168.1.100; our IP address is 192.168.1.40
>> Filename 'h3ulcb-image'.
>> Load address: 0x7a000000
>> Loading: ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ###############################################################=
##
>>          ########################################
>>          2.1 MiB/s
>> done
>> Bytes transferred =3D 15843840 (f1c200 hex)
>> =3D> bootm 0x48080000 - 0x48000000
>> ## Booting kernel from Legacy Image at 48080000 ...
>>    Image Name:   XEN
>>    Image Type:   AArch64 Linux Kernel Image (uncompressed)
>>    Data Size:    852304 Bytes =3D 832.3 KiB
>>    Load Address: 78080000
>>    Entry Point:  78080000
>>    Verifying Checksum ... OK
>> ## Flattened Device Tree blob at 48000000
>>    Booting using the fdt blob at 0x48000000
>>    Loading Kernel Image ... OK
>>    Using Device Tree in place at 0000000048000000, end 0000000048012921
>>
>> Starting kernel ...
>>
>> </end output>
>>
>> I have noticed that the uboot date has not changed from 2015.04 although
>> the build date is from the last time I ran a bitbake command.
>>
>> I do not know what version of uboot should be used without breaking the
>> current compiling versions.
>>
>> Are there any other modifications that I can attempt?
>>
>> Thank you very much for your time and patience.
>>
>> Best regards,
>>
>> Jairo
>>
>>
>>
>>

--0000000000007b9395057f9960f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPkt1ZG9zIHRvIE9sZWtzYW5kciBUeXNoY2hlbmtvLCBo
ZSBzdGVwcGVkIGludG8gdGhlIHNhbWUsIGFuZCBmb3VuZCB0aGUgcm9vdGNhdXNlLjwvZGl2Pjxk
aXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPlRoZSBwcm9ibGVtIGlzIGlu
IGEgcGF0Y2ggPGEgaHJlZj0iaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDA4
NDU2MS8iPmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAwODQ1NjEvPC9hPiAu
PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SSBndWVzcyB5
b3UgY2FuIHdvcmthcm91bmQgaXQgd2l0aCBhZGRpbmcgaW50ZXJydXB0cyBhbmQgaW50ZXJydXB0
LXBhcmVudCBwcm9wZXJ0aWVzIHRvIHRpbWVyIG5vZGUgdGhyb3VnaCB5b3VyIGR0Yi4gU29tZXRo
aW5nIGxpa2UgZm9sbG93aW5nOjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBk
aXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGRpdiBzdHlsZT0icGFkZGluZy1s
ZWZ0OjI1cHg7bWluLWhlaWdodDowLjhyZW07Zm9udC1mYW1pbHk6bW9ub3NwYWNlO2ZvbnQtc2l6
ZTptZWRpdW0iIGRpcj0iYXV0byI+PHByZSBzdHlsZT0icGFkZGluZzowcHg7YmFja2dyb3VuZC1p
bWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3JvdW5kLXNpemU6
aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3JpZ2luOmluaXRp
YWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7Zm9udC1mYW1pbHk6aW5oZXJpdDtmb250LXNpemU6
aW5oZXJpdDttYXJnaW4tdG9wOjBweDttYXJnaW4tYm90dG9tOjBweDtsaW5lLWhlaWdodDppbmhl
cml0O2NvbG9yOmluaGVyaXQiPiAJJmFtcDt0aW1lciB7PC9wcmU+PC9kaXY+PGRpdiBzdHlsZT0i
cGFkZGluZy1sZWZ0OjI1cHg7bWluLWhlaWdodDowLjhyZW07Zm9udC1mYW1pbHk6bW9ub3NwYWNl
O2ZvbnQtc2l6ZTptZWRpdW0iIGRpcj0iYXV0byI+PHByZSBzdHlsZT0icGFkZGluZzowcHg7YmFj
a2dyb3VuZC1pbWFnZTppbml0aWFsO2JhY2tncm91bmQtcG9zaXRpb246aW5pdGlhbDtiYWNrZ3Jv
dW5kLXNpemU6aW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDppbml0aWFsO2JhY2tncm91bmQtb3Jp
Z2luOmluaXRpYWw7YmFja2dyb3VuZC1jbGlwOmluaXRpYWw7Zm9udC1mYW1pbHk6aW5oZXJpdDtm
b250LXNpemU6aW5oZXJpdDttYXJnaW4tdG9wOjBweDttYXJnaW4tYm90dG9tOjBweDtsaW5lLWhl
aWdodDppbmhlcml0O2NvbG9yOmluaGVyaXQiPjxicj48L3ByZT48L2Rpdj48ZGl2IHN0eWxlPSJw
YWRkaW5nLWxlZnQ6MjVweDttaW4taGVpZ2h0OjAuOHJlbTtmb250LWZhbWlseTptb25vc3BhY2U7
Zm9udC1zaXplOm1lZGl1bSIgZGlyPSJhdXRvIj48cHJlIHN0eWxlPSJwYWRkaW5nOjBweDtiYWNr
Z3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91
bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmln
aW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDtmb250LWZhbWlseTppbmhlcml0O2Zv
bnQtc2l6ZTppbmhlcml0O21hcmdpbi10b3A6MHB4O21hcmdpbi1ib3R0b206MHB4O2xpbmUtaGVp
Z2h0OmluaGVyaXQ7Y29sb3I6aW5oZXJpdCI+CQlpbnRlcnJ1cHQtcGFyZW50ID0gJmx0OyZhbXA7
Z2ljJmd0Ozs8L3ByZT48L2Rpdj48ZGl2IHN0eWxlPSJwYWRkaW5nLWxlZnQ6MjVweDttaW4taGVp
Z2h0OjAuOHJlbTtmb250LWZhbWlseTptb25vc3BhY2U7Zm9udC1zaXplOm1lZGl1bSIgZGlyPSJh
dXRvIj48cHJlIHN0eWxlPSJwYWRkaW5nOjBweDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFj
a2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91
bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNs
aXA6aW5pdGlhbDtmb250LWZhbWlseTppbmhlcml0O2ZvbnQtc2l6ZTppbmhlcml0O21hcmdpbi10
b3A6MHB4O21hcmdpbi1ib3R0b206MHB4O2xpbmUtaGVpZ2h0OmluaGVyaXQ7Y29sb3I6aW5oZXJp
dCI+CQlpbnRlcnJ1cHRzID0gJmx0O0dJQ19QUEkgMTMgKEdJQ19DUFVfTUFTS19TSU1QTEUoOCkg
fCBJUlFfVFlQRV9MRVZFTF9MT1cpJmd0Oyw8L3ByZT48L2Rpdj48ZGl2IHN0eWxlPSJwYWRkaW5n
LWxlZnQ6MjVweDttaW4taGVpZ2h0OjAuOHJlbTtmb250LWZhbWlseTptb25vc3BhY2U7Zm9udC1z
aXplOm1lZGl1bSIgZGlyPSJhdXRvIj48cHJlIHN0eWxlPSJwYWRkaW5nOjBweDtiYWNrZ3JvdW5k
LWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6
ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5p
dGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDtmb250LWZhbWlseTppbmhlcml0O2ZvbnQtc2l6
ZTppbmhlcml0O21hcmdpbi10b3A6MHB4O21hcmdpbi1ib3R0b206MHB4O2xpbmUtaGVpZ2h0Omlu
aGVyaXQ7Y29sb3I6aW5oZXJpdCI+CQkJCSAgICAgJmx0O0dJQ19QUEkgMTQgKEdJQ19DUFVfTUFT
S19TSU1QTEUoOCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpJmd0Oyw8L3ByZT48L2Rpdj48ZGl2IHN0
eWxlPSJwYWRkaW5nLWxlZnQ6MjVweDttaW4taGVpZ2h0OjAuOHJlbTtmb250LWZhbWlseTptb25v
c3BhY2U7Zm9udC1zaXplOm1lZGl1bSIgZGlyPSJhdXRvIj48cHJlIHN0eWxlPSJwYWRkaW5nOjBw
eDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlvbjppbml0aWFsO2Jh
Y2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRpYWw7YmFja2dyb3Vu
ZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDtmb250LWZhbWlseTppbmhl
cml0O2ZvbnQtc2l6ZTppbmhlcml0O21hcmdpbi10b3A6MHB4O21hcmdpbi1ib3R0b206MHB4O2xp
bmUtaGVpZ2h0OmluaGVyaXQ7Y29sb3I6aW5oZXJpdCI+CQkJCSAgICAgJmx0O0dJQ19QUEkgMTEg
KEdJQ19DUFVfTUFTS19TSU1QTEUoOCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpJmd0Oyw8L3ByZT48
L2Rpdj48ZGl2IHN0eWxlPSJwYWRkaW5nLWxlZnQ6MjVweDttaW4taGVpZ2h0OjAuOHJlbTtmb250
LWZhbWlseTptb25vc3BhY2U7Zm9udC1zaXplOm1lZGl1bSIgZGlyPSJhdXRvIj48cHJlIHN0eWxl
PSJwYWRkaW5nOjBweDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dyb3VuZC1wb3NpdGlv
bjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQtcmVwZWF0OmluaXRp
YWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6aW5pdGlhbDtmb250
LWZhbWlseTppbmhlcml0O2ZvbnQtc2l6ZTppbmhlcml0O21hcmdpbi10b3A6MHB4O21hcmdpbi1i
b3R0b206MHB4O2xpbmUtaGVpZ2h0OmluaGVyaXQ7Y29sb3I6aW5oZXJpdCI+CQkJCSAgICAgJmx0
O0dJQ19QUEkgMTAgKEdJQ19DUFVfTUFTS19TSU1QTEUoOCkgfCBJUlFfVFlQRV9MRVZFTF9MT1cp
Jmd0Ozs8L3ByZT48L2Rpdj48ZGl2IHN0eWxlPSJwYWRkaW5nLWxlZnQ6MjVweDttaW4taGVpZ2h0
OjAuOHJlbTtmb250LWZhbWlseTptb25vc3BhY2U7Zm9udC1zaXplOm1lZGl1bSIgZGlyPSJhdXRv
Ij48cHJlIHN0eWxlPSJwYWRkaW5nOjBweDtiYWNrZ3JvdW5kLWltYWdlOmluaXRpYWw7YmFja2dy
b3VuZC1wb3NpdGlvbjppbml0aWFsO2JhY2tncm91bmQtc2l6ZTppbml0aWFsO2JhY2tncm91bmQt
cmVwZWF0OmluaXRpYWw7YmFja2dyb3VuZC1vcmlnaW46aW5pdGlhbDtiYWNrZ3JvdW5kLWNsaXA6
aW5pdGlhbDtmb250LWZhbWlseTppbmhlcml0O2ZvbnQtc2l6ZTppbmhlcml0O21hcmdpbi10b3A6
MHB4O21hcmdpbi1ib3R0b206MHB4O2xpbmUtaGVpZ2h0OmluaGVyaXQ7Y29sb3I6aW5oZXJpdCI+
IAl9OzwvcHJlPjwvZGl2PjxkaXYgc3R5bGU9InBhZGRpbmctbGVmdDoyNXB4O21pbi1oZWlnaHQ6
MC44cmVtO2ZvbnQtZmFtaWx5Om1vbm9zcGFjZTtmb250LXNpemU6bWVkaXVtIiBkaXI9ImF1dG8i
Pjxicj48L2Rpdj48ZGl2IHN0eWxlPSJwYWRkaW5nLWxlZnQ6MjVweDttaW4taGVpZ2h0OjAuOHJl
bTtmb250LWZhbWlseTptb25vc3BhY2U7Zm9udC1zaXplOm1lZGl1bSIgZGlyPSJhdXRvIj48YnI+
PC9kaXY+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPkZvciBzdXJlIHRoZSBwcm9wZXIgZml4IGlzIHNv
bWV0aGluZyBkaWZmZXJlbnQsIGkuZS4gdGVhY2hpbmcgeGVuIHRvIGNvcGUgd2l0aCBpbnRlcnJ1
cHRzLWV4dGVuZGVkLjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1
dG8iPjxicj48ZGl2IGRhdGEtc21hcnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiIGRpcj0iYXV0byI+
U2VudCBmcm9tIG15IEFuZHJvaWQuPC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIiBk
aXI9ImF1dG8iPjxkaXYgZGlyPSJsdHIiPtC/0YIsIDExINGB0ZbRhy4gMjAxOSwgMTI6NTkgTE9Q
RVosIEZVRU5URVMgTkFDQVJJTk8gSmFpcm8gRWR1YXJkbyDQutC+0YDQuNGB0YLRg9Cy0LDRhyA8
YSBocmVmPSJtYWlsdG86amFpcm9AcnVyaS53YXNlZGEuanAiIHRhcmdldD0iX2JsYW5rIiByZWw9
Im5vcmVmZXJyZXIiPmphaXJvQHJ1cmkud2FzZWRhLmpwPC9hPiDQv9C40YjQtTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBkaXI9Imx0
ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5BbmRy
aWksPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EdWUgdG8gc29tZSBldmVudHMgb24gbXkgc2lk
ZSwgSSBoYWQgdG8gbW92ZSBmcm9tIHRoZSBSLUNhciBIMyBJIHdhcyB1c2luZyB0byB0aGUgUi1D
YXIgTTMgaW4gbXkgcG9zZXNzaW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBmb2xsb3dl
ZCB5b3VyIGluaXRpYWwgYWR2aWNlIGFuZCB1cGRhdGVkIG15IGVudmlyb25tZW50IHRvIGEgbmV3
ZXIgdmVyc2lvbiwgb3B0aW5nIHRvIHN0aWNrIHRvIHRoZSByb2NrbyB2ZXJzaW9uIGZvciB0aGUg
bTN1bGNiLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhlIFlvY3RvIGJ1aWxkIGNvbmZpZ3Vy
YXRpb24gaXMgc2hvd24gYmVsb3c6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CdWlsZCBDb25m
aWd1cmF0aW9uOjxicj5CQl9WRVJTSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDsxLjM2
LjAmcXVvdDs8YnI+QlVJTERfU1lTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICZxdW90O3g4Nl82
NC1saW51eCZxdW90Ozxicj5OQVRJVkVMU0JTVFJJTkfCoMKgwqDCoMKgID0gJnF1b3Q7dW5pdmVy
c2FsLTQuOSZxdW90Ozxicj5UQVJHRVRfU1lTwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDth
YXJjaDY0LXBva3ktbGludXgmcXVvdDs8YnI+TUFDSElORcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgID0gJnF1b3Q7bTN1bGNiJnF1b3Q7PGJyPkRJU1RST8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPSAmcXVvdDtwb2t5JnF1b3Q7PGJyPkRJU1RST19WRVJTSU9OwqDCoMKgwqDCoMKgID0g
JnF1b3Q7Mi40LjImcXVvdDs8YnI+VFVORV9GRUFUVVJFU8KgwqDCoMKgwqDCoMKgID0gJnF1b3Q7
YWFyY2g2NCBjb3J0ZXhhNTctY29ydGV4YTUzJnF1b3Q7PGJyPlRBUkdFVF9GUFXCoMKgwqDCoMKg
wqDCoMKgwqDCoCA9ICZxdW90OyZxdW90Ozxicj5TT0NfRkFNSUxZwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPSAmcXVvdDtyY2FyLWdlbjM6cjhhNzc5NiZxdW90Ozxicj5tZXRhwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPGJyPm1ldGEtcG9recKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJy
Pm1ldGEteW9jdG8tYnNwwqDCoMKgwqDCoMKgID0gJnF1b3Q7SEVBRDozNDJmYmQ2YTNlNTcwMjFj
OGUyOGIxMjRiM2FkYjI0MTkzNmYzZDlkJnF1b3Q7PGJyPm1ldGEtcmNhci1nZW4zwqDCoMKgwqDC
oMKgID0gJnF1b3Q7cm9ja286OGFmMGI3ZDZlNDQ1YjUzMjA4OGEwNjhkYzAxMjc1NzAwMWJlM2Ex
ZiZxdW90Ozxicj5tZXRhLW9wdGVlwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtyb2Nrbzo3
NWRmYjY3YmJiMTRhNzBjZDQ3YWZkYTk3MjZlMmUxYzc2NzMxODg1JnF1b3Q7PGJyPm1ldGEtb2XC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1weXRob27CoMKgwqDCoMKgwqDCoMKg
wqAgPGJyPm1ldGEtbmV0d29ya2luZ8KgwqDCoMKgwqAgPSAmcXVvdDtyb2NrbzplYWU5OTYzMDFk
OWMwOTdiY2JlYjgwNDZmMDgwNDFkYzgyYmI2MmY4JnF1b3Q7PGJyPm1ldGEtc2VsaW51eMKgwqDC
oMKgwqDCoMKgwqAgPSAmcXVvdDtyb2NrbzpkODU1YzYyNGYzMmM1ZTU5OWJmMjdlMDZjYjhmNWIy
NWIzYWFlMTJkJnF1b3Q7PGJyPm1ldGEtdmlydHVhbGl6YXRpb27CoCA9ICZxdW90O3JvY2tvOmI3
MDRjNjg5YjY3NjM5MjE0Yjk1NjhhM2Q2MmU4MmRmMjdlOTQzNGYmcXVvdDs8YnI+bWV0YS1yY2Fy
LWdlbjMteGVuwqDCoCA9ICZxdW90O21hc3Rlcjo2MDY5OWM2MzFkNTQxYWVlYWViYWVlYzlhMDg3
ZWZlZDkzODVlZTQyJnF1b3Q7PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBoYWQgdG8g
bW9kaWZ5IHRoZSBkdGIgdG8gdGhlIHZlcnNpb24gc2hvd24gYmVsb3c6PC9kaXY+PGRpdj48YnI+
PC9kaXY+PGRpdj4vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+LyrCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgKiBEZXZpY2UgVHJl
ZSBTb3VyY2UgZm9yIHRoZSBNM1VMQ0IgKFItQ2FyIFN0YXJ0ZXIgS2l0IFBybykgYm9hcmTCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgKiBDb3B5cmln
aHQgKEMpIDIwMTYtMjAxOCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJy
PsKgKiBDb3B5cmlnaHQgKEMpIDIwMTYgQ29nZW50IEVtYmVkZGVkLCBJbmMuwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgKi/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj4vZHRzLXYxLzvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj4jaW5jbHVkZSAmcXVvdDtyOGE3Nzk2LmR0c2km
cXVvdDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPGJyPiNpbmNsdWRlICZxdW90O3VsY2IuZHRzaSZxdW90O8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+LyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqAgbW9kZWwgPSAmcXVvdDtS
ZW5lc2FzIE0zVUxDQiBib2FyZCBiYXNlZCBvbiByOGE3Nzk2JnF1b3Q7O8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKg
wqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3JlbmVzYXMsbTN1bGNiJnF1b3Q7LCAmcXVvdDty
ZW5lc2FzLHI4YTc3OTYmcXVvdDs7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqAgY3B1cyB7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWRsZS1zdGF0ZXMge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvZGVsZXRlLW5vZGUvIGNwdS1zbGVlcC0xO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8YnI+wqDCoMKgwqDCoMKgwqAgfTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqAgbWVtb3J5QDQ4MDAwMDAwIHvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90eXBlID0gJnF1b3Q7bWVt
b3J5JnF1b3Q7O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBmaXJzdCAxMjhNQiBpcyByZXNlcnZlZCBmb3Ig
c2VjdXJlIGFyZWEuICovwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gJmx0OzB4MCAw
eDQ4MDAwMDAwIDB4MCAweDM4MDAwMDAwJmd0OzvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoCB9
Ozxicj48YnI+wqDCoMKgwqDCoMKgwqAgbWVtb3J5QDYwMDAwMDAwMCB7PGJyPsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICZxdW90O21lbW9yeSZxdW90Ozs8YnI+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9ICZsdDsweDYgMHgwMDAwMDAwMCAw
eDAgMHg0MDAwMDAwMCZndDs7PGJyPsKgwqDCoMKgwqDCoMKgIH07PGJyPjxicj7CoMKgwqDCoMKg
wqDCoCByZXNlcnZlZC1tZW1vcnkgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
I2FkZHJlc3MtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAjc2l6ZS1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJhbmdlczs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBk
ZXZpY2Ugc3BlY2lmaWMgcmVnaW9uIGZvciBMb3NzeSBEZWNvbXByZXNzaW9uICovPGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb3NzeV9kZWNvbXByZXNzOiBsaW51eCxsb3NzeV9k
ZWNvbXByZXNzQDU0MDAwMDAwIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBuby1tYXA7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gJmx0OzB4MDAwMDAwMDAgMHg1NDAwMDAwMCAweDAgMHgwMzAw
MDAwMCZndDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ozxicj48YnI+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGdsb2JhbCBhdXRvY29uZmlndXJlZCByZWdp
b24gZm9yIGNvbnRpZ3VvdXMgYWxsb2NhdGlvbnMgKi88YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGxpbnV4LGNtYUA1NzAwMDAwMCB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3NoYXJlZC1kbWEtcG9v
bCZxdW90Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXVzYWJsZTs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSAmbHQ7MHgwMDAwMDAwMCAweDU3MDAwMDAwIDB4MCAweDE5MDAwMDAwJmd0Ozs8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaW51eCxj
bWEtZGVmYXVsdDs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07PGJyPjxicj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZGV2aWNlIHNwZWNpZmljIHJlZ2lvbiBm
b3IgY29udGlndW91cyBhbGxvY2F0aW9ucyAqLzxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbW1wX3Jlc2VydmVkOiBsaW51eCxtdWx0aW1lZGlhQDcwMDAwMDAwIHs8YnI+wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gJnF1
b3Q7c2hhcmVkLWRtYS1wb29sJnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldXNhYmxlOzxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9ICZsdDsweDAwMDAwMDAwIDB4NzAwMDAwMDAgMHgw
IDB4MTAwMDAwMDAmZ3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTs8YnI+
wqDCoMKgwqDCoMKgwqAgfTs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgIGNob3NlbiB7PGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGRvdXQtcGF0aCA9ICZxdW90O3NlcmlhbDA6MTE1
MjAwbjgmcXVvdDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW4seGVuLWJv
b3RhcmdzID0gJnF1b3Q7ZG9tMF9tZW09NzUyTSBjb25zb2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFs
MCBkb20wX21heF92Y3B1cz00JnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgeGVuLGRvbTAtYm9vdGFyZ3MgPSAmcXVvdDtjb25zb2xlPWh2YzAgY2xrX2lnbm9yZV91bnVz
ZWQgcm9vdD0vZGV2L21tY2JsazFwMiBydyByb290d2FpdCBpZ25vcmVfbG9nbGV2ZWwgY21hPTEy
OE0mcXVvdDs7PGJyPjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3Mt
Y2VsbHMgPSAmbHQ7MiZndDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjc2l6
ZS1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1v
ZHVsZXMgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1vZHVsZUAwIHs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3hlbixsaW51eC16aW1hZ2Um
cXVvdDssICZxdW90O3hlbixtdWx0aWJvb3QtbW9kdWxlJnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSAm
bHQ7MHgwIDB4N2EwMDAwMDAgMHgwIDB4MDIwMDAwMDAmZ3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9Ozxicj7CoMKgwqDCoMKgwqDCoCB9Ozxicj48YnI+wqDCoMKgwqDCoMKgwqAg
bW1uZ3Igezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICZx
dW90O3JlbmVzYXMsbW1uZ3ImcXVvdDs7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtZW1vcnktcmVnaW9uID0gJmx0OyZhbXA7bW1wX3Jlc2VydmVkJmd0OywgJmx0OyZhbXA7bG9z
c3lfZGVjb21wcmVzcyZndDs7PGJyPsKgwqDCoMKgwqDCoMKgIH07PGJyPjxicj7CoMKgwqDCoMKg
wqDCoCBtbW5ncmJ1ZiB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRp
YmxlID0gJnF1b3Q7cmVuZXNhcyxtbW5ncmJ1ZiZxdW90Ozs8YnI+wqDCoMKgwqDCoMKgwqAgfTs8
YnI+PGJyPsKgwqDCoMKgwqDCoMKgIHZzcG1faWYgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29tcGF0aWJsZSA9ICZxdW90O3JlbmVzYXMsdnNwbV9pZiZxdW90Ozs8YnI+wqDC
oMKgwqDCoMKgwqAgfTs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgIHZlcnNhY2xvY2s1X291dDM6IHZl
cnNhY2xrLTMgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICZxdW90O2ZpeGVkLWNsb2NrJnF1b3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgI2Nsb2NrLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogSW5pdGlhbCB2YWx1ZSBvZiB2ZXJzYWNsb2NrIG91dDMgKi88YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDszMzAwMDAwMCZndDs7
PGJyPsKgwqDCoMKgwqDCoMKgIH07PGJyPn07PGJyPjxicj4mYW1wO2E1M18wIHs8YnI+wqDCoMKg
wqDCoMKgwqAgL2RlbGV0ZS1wcm9wZXJ0eS8gY3B1LWlkbGUtc3RhdGVzOzxicj59Ozxicj48YnI+
JmFtcDthNTNfMSB7PGJyPsKgwqDCoMKgwqDCoMKgIC9kZWxldGUtcHJvcGVydHkvIGNwdS1pZGxl
LXN0YXRlczs8YnI+fTs8YnI+PGJyPiZhbXA7YTUzXzIgezxicj7CoMKgwqDCoMKgwqDCoCAvZGVs
ZXRlLXByb3BlcnR5LyBjcHUtaWRsZS1zdGF0ZXM7PGJyPn07PGJyPjxicj4mYW1wO2E1M18zIHs8
YnI+wqDCoMKgwqDCoMKgwqAgL2RlbGV0ZS1wcm9wZXJ0eS8gY3B1LWlkbGUtc3RhdGVzOzxicj59
Ozxicj48YnI+JmFtcDtkdSB7PGJyPsKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9ICZsdDsmYW1wO2Nw
ZyBDUEdfTU9EIDcyNCZndDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZs
dDsmYW1wO2NwZyBDUEdfTU9EIDcyMyZndDssPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICZsdDsmYW1wO2NwZyBDUEdfTU9EIDcyMiZndDssPGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICZsdDsmYW1wO3ZlcnNhY2xvY2s1IDEmZ3Q7LDxicj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmbHQ7JmFtcDt2ZXJzYWNsb2NrNV9vdXQzJmd0Oyw8YnI+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmx0OyZhbXA7dmVyc2FjbG9jazUgMiZn
dDs7PGJyPsKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gJnF1b3Q7ZHUuMCZxdW90OywgJnF1
b3Q7ZHUuMSZxdW90OywgJnF1b3Q7ZHUuMiZxdW90Oyw8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZxdW90O2RjbGtpbi4wJnF1b3Q7LCAmcXVvdDtkY2xraW4u
MSZxdW90OywgJnF1b3Q7ZGNsa2luLjImcXVvdDs7PGJyPn07PGJyPjxicj4mYW1wO3ZzcGIgezxi
cj7CoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj59Ozxicj48YnI+
JmFtcDt2c3BpMCB7PGJyPsKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7
PGJyPn07PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaXRoIHRoZSBuZXcgaW5mb3JtYXRpb24s
IEkgZmluYWxseSBnb3Qgc29tZSBvdXRwdXQgZm9yIFhlbiwgYnV0IHdhcyBtZXQgd2l0aCBhIGNv
bXBsZXRlbHkgZGlmZmVyZW50IGlzc3VlIGZvciB3aGljaCBJIGNhbiYjMzk7dCBmaW5kIGFueSBp
bmZvcm1hdGlvbiBmb3IgdGhlIGVycm9yIEkgYW0gcmVjZWl2aW5nLjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+SSByZWFsaXplIHRoYXQgSSBtYXkgaGF2ZSBhbiBpc3N1ZSB3aXRoIHRoZSB2ZXJz
aW9uIG9mIHRoZSBib2FyZCBJIGFtIHVzaW5nLCBidXQgYSBzaW1wbGUgb25saW5lIHNlYXJjaCBk
b2VzbiYjMzk7dCB0aHJvdyBhbnkgcmVkIGZsYWdzLiBUaGUgc2VyaWFsIGNvbnNvbGUgb3V0cHV0
IGlzIGJlbG93OjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W8KgwqDCoCAwLjAwMDE3N10gTk9U
SUNFOsKgIEJMMjogUi1DYXIgTTMgSW5pdGlhbCBQcm9ncmFtIExvYWRlcihDQTU3KTxicj5bwqDC
oMKgIDAuMDA0NjEzXSBOT1RJQ0U6wqAgQkwyOiBJbml0aWFsIFByb2dyYW0gTG9hZGVyKFJldi4y
LjAuMCk8YnI+W8KgwqDCoCAwLjAxMDE0N10gTk9USUNFOsKgIEJMMjogUFJSIGlzIFItQ2FyIE0z
IFZlci4xLjA8YnI+W8KgwqDCoCAwLjAxNDgxNV0gTk9USUNFOsKgIEJMMjogQm9hcmQgaXMgU3Rh
cnRlciBLaXQgUmV2LjEuMDxicj5bwqDCoMKgIDAuMDE5OTI4XSBOT1RJQ0U6wqAgQkwyOiBCb290
IGRldmljZSBpcyBIeXBlckZsYXNoKDgwTUh6KTxicj5bwqDCoMKgIDAuMDI1MzU0XSBOT1RJQ0U6
wqAgQkwyOiBMQ00gc3RhdGUgaXMgQ008YnI+W8KgwqDCoCAwLjAyOTM5NV0gTk9USUNFOsKgIEJM
MjogQVZTIHNldHRpbmcgc3VjY2VlZGVkLiBEVkZTX1NldFZJRD0weDUzPGJyPlvCoMKgwqAgMC4w
MzUzODNdIE5PVElDRTrCoCBCTDI6IEREUjMyMDAocmV2LjAuMzQpPGJyPlvCoMKgwqAgMC4wNDY3
NzldIE5PVElDRTrCoCBCTDI6IFtDT0xEX0JPT1RdPGJyPlvCoMKgwqAgMC4wODUxMTddIE5PVElD
RTrCoCBCTDI6IERSQU0gU3BsaXQgaXMgMmNoPGJyPlvCoMKgwqAgMC4wODc4MTJdIE5PVElDRTrC
oCBCTDI6IFFvUyBpcyBkZWZhdWx0IHNldHRpbmcocmV2LjAuMTkpPGJyPlvCoMKgwqAgMC4wOTMz
MTVdIE5PVElDRTrCoCBCTDI6IExvc3N5IERlY29tcCBhcmVhczxicj5bwqDCoMKgIDAuMDk3NDg5
XSBOT1RJQ0U6wqDCoMKgwqDCoMKgIEVudHJ5IDA6IERDTVBBUkVBQ1JBeDoweDgwMDAwNTQwIERD
TVBBUkVBQ1JCeDoweDU3MDxicj5bwqDCoMKgIDAuMTA0NTczXSBOT1RJQ0U6wqDCoMKgwqDCoMKg
IEVudHJ5IDE6IERDTVBBUkVBQ1JBeDoweDQwMDAwMDAwIERDTVBBUkVBQ1JCeDoweDA8YnI+W8Kg
wqDCoCAwLjExMTQ4NV0gTk9USUNFOsKgwqDCoMKgwqDCoCBFbnRyeSAyOiBEQ01QQVJFQUNSQXg6
MHgyMDAwMDAwMCBEQ01QQVJFQUNSQng6MHgwPGJyPlvCoMKgwqAgMC4xMTg0MDBdIE5PVElDRTrC
oCBCTDI6IHYxLjUocmVsZWFzZSk6NTU2YTExZTxicj5bwqDCoMKgIDAuMTIyODkwXSBOT1RJQ0U6
wqAgQkwyOiBCdWlsdCA6IDE4OjAzOjQ4LCBKYW4gMTEgMjAxOTxicj5bwqDCoMKgIDAuMTI4MDc3
XSBOT1RJQ0U6wqAgQkwyOiBOb3JtYWwgYm9vdDxicj5bwqDCoMKgIDAuMTMxNzE4XSBOT1RJQ0U6
wqAgQkwyOiBkc3Q9MHhlNjMyMTEwMCBzcmM9MHg4MTgwMDAwIGxlbj01MTIoMHgyMDApPGJyPlvC
oMKgwqAgMC4xMzgxMDZdIE5PVElDRTrCoCBCTDI6IGRzdD0weDQzZjAwMDAwIHNyYz0weDgxODA0
MDAgbGVuPTYxNDQoMHgxODAwKTxicj5bwqDCoMKgIDAuMTQ0NzI2XSBOT1RJQ0U6wqAgQkwyOiBk
c3Q9MHg0NDAwMDAwMCBzcmM9MHg4MWMwMDAwIGxlbj02NTUzNigweDEwMDAwKTxicj5bwqDCoMKg
IDAuMTUxOTUyXSBOT1RJQ0U6wqAgQkwyOiBkc3Q9MHg0NDEwMDAwMCBzcmM9MHg4MjAwMDAwIGxl
bj0xMDQ4NTc2KDB4MTAwMDAwKTxicj5bwqDCoMKgIDAuMTY2Nzc3XSBOT1RJQ0U6wqAgQkwyOiBk
c3Q9MHg1MDAwMDAwMCBzcmM9MHg4NjQwMDAwIGxlbj0xMDQ4NTc2KDB4MTAwMDAwKTxicj5bwqDC
oMKgIDAuMTgwNzUyXSBOT1RJQ0U6wqAgQkwyOiBCb290aW5nIEJMMzE8YnI+PGJyPjxicj5VLUJv
b3QgMjAxOC4wOSAoSmFuIDEyIDIwMTkgLSAwMzowMzo0MyArMDkwMCk8YnI+PGJyPkNQVTogUmVu
ZXNhcyBFbGVjdHJvbmljcyBSOEE3Nzk2IHJldiAxLjA8YnI+TW9kZWw6IFJlbmVzYXMgTTNVTENC
IGJvYXJkIGJhc2VkIG9uIHI4YTc3OTY8YnI+RFJBTTrCoCAxLjkgR2lCPGJyPkJhbmsgIzA6IDB4
MDQ4MDAwMDAwIC0gMHgwN2ZmZmZmZmYsIDg5NiBNaUI8YnI+QmFuayAjMTogMHg2MDAwMDAwMDAg
LSAweDYzZmZmZmZmZiwgMSBHaUI8YnI+PGJyPk1NQzrCoMKgIHNkQGVlMTAwMDAwOiAwLCBzZEBl
ZTE0MDAwMDogMTxicj5Mb2FkaW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4uIGNvbW11bmljYXRp
b24gb3V0IG9mIHN5bmM8YnI+Y29tbXVuaWNhdGlvbiBvdXQgb2Ygc3luYzxicj5jb21tdW5pY2F0
aW9uIG91dCBvZiBzeW5jPGJyPmNvbW11bmljYXRpb24gb3V0IG9mIHN5bmM8YnI+Y29tbXVuaWNh
dGlvbiBvdXQgb2Ygc3luYzxicj5jb21tdW5pY2F0aW9uIG91dCBvZiBzeW5jPGJyPmNvbW11bmlj
YXRpb24gb3V0IG9mIHN5bmM8YnI+Y29tbXVuaWNhdGlvbiBvdXQgb2Ygc3luYzxicj5jb21tdW5p
Y2F0aW9uIG91dCBvZiBzeW5jPGJyPmNvbW11bmljYXRpb24gb3V0IG9mIHN5bmM8YnI+Y29tbXVu
aWNhdGlvbiBvdXQgb2Ygc3luYzxicj5jb21tdW5pY2F0aW9uIG91dCBvZiBzeW5jPGJyPk9LPGJy
PkluOsKgwqDCoCBzZXJpYWxAZTZlODgwMDA8YnI+T3V0OsKgwqAgc2VyaWFsQGU2ZTg4MDAwPGJy
PkVycjrCoMKgIHNlcmlhbEBlNmU4ODAwMDxicj5OZXQ6wqDCoCBldGgwOiBldGhlcm5ldEBlNjgw
MDAwMDxicj5IaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OsKgIDAgPGJyPmV0aGVybmV0QGU2
ODAwMDAwIFdhaXRpbmcgZm9yIFBIWSBhdXRvIG5lZ290aWF0aW9uIHRvIGNvbXBsZXRlLi4uIGRv
bmU8YnI+VXNpbmcgZXRoZXJuZXRAZTY4MDAwMDAgZGV2aWNlPGJyPlRGVFAgZnJvbSBzZXJ2ZXIg
MTkyLjE2OC4xLjEwMDsgb3VyIElQIGFkZHJlc3MgaXMgMTkyLjE2OC4xLjM8YnI+RmlsZW5hbWUg
JiMzOTtJbWFnZSYjMzk7Ljxicj5Mb2FkIGFkZHJlc3M6IDB4NDgwODAwMDA8YnI+TG9hZGluZzog
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDC
oCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKg
wqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDC
oMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKg
wqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDC
oMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKg
wqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDC
oMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7C
oMKgwqDCoMKgwqDCoMKgIDIuNyBNaUIvczxicj5kb25lPGJyPkJ5dGVzIHRyYW5zZmVycmVkID0g
MTU5MTE0MjQgKGYyY2EwMCBoZXgpPGJyPlVzaW5nIGV0aGVybmV0QGU2ODAwMDAwIGRldmljZTxi
cj5URlRQIGZyb20gc2VydmVyIDE5Mi4xNjguMS4xMDA7IG91ciBJUCBhZGRyZXNzIGlzIDE5Mi4x
NjguMS4zPGJyPkZpbGVuYW1lICYjMzk7SW1hZ2UtcjhhNzc5Ni1tM3VsY2IuZHRiJiMzOTsuPGJy
PkxvYWQgYWRkcmVzczogMHg0ODAwMDAwMDxicj5Mb2FkaW5nOiAqPGJyPlRGVFAgZXJyb3I6ICYj
Mzk7RmlsZSBub3QgZm91bmQmIzM5OyAoMSk8YnI+Tm90IHJldHJ5aW5nLi4uPGJyPkVSUk9SOiBE
aWQgbm90IGZpbmQgYSBjbWRsaW5lIEZsYXR0ZW5lZCBEZXZpY2UgVHJlZTxicj5Db3VsZCBub3Qg
ZmluZCBhIHZhbGlkIGRldmljZSB0cmVlPGJyPj0mZ3Q7IHNldGVudiBib290YXJnczxicj49Jmd0
OyB0ZnRwIDB4NDgwODAwMDAgeGVuLW0zdWxjYi51SW1hZ2U8YnI+VXNpbmcgZXRoZXJuZXRAZTY4
MDAwMDAgZGV2aWNlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlRGVFAg
ZnJvbSBzZXJ2ZXIgMTkyLjE2OC4xLjEwMDsgb3VyIElQIGFkZHJlc3MgaXMgMTkyLjE2OC4xLjPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkZpbGVuYW1lICYjMzk7eGVuLW0zdWxj
Yi51SW1hZ2UmIzM5Oy7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5M
b2FkIGFkZHJlc3M6IDB4NDgwODAwMDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+TG9hZGluZzogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjwqDCoMKgwqAgPGJyPsKgwqDCoMKgwqDC
oMKgwqAgMjguMyBNaUIvc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8YnI+ZG9uZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
YnI+Qnl0ZXMgdHJhbnNmZXJyZWQgPSA5MTg5MjggKGUwNTkwIGhleCnCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDxicj49Jmd0OyB0ZnRwIDB4NDgwMDAwMDAgSW1hZ2UtcjhhNzc5Ni1tM3VsY2IteGVuLWxv
Y2FsLmR0YsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJy
PlVzaW5nIGV0aGVybmV0QGU2ODAwMDAwIGRldmljZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDxicj5URlRQIGZyb20gc2VydmVyIDE5Mi4xNjguMS4xMDA7IG91ciBJUCBhZGRy
ZXNzIGlzIDE5Mi4xNjguMS4zwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5GaWxl
bmFtZSAmIzM5O0ltYWdlLXI4YTc3OTYtbTN1bGNiLXhlbi1sb2NhbC5kdGImIzM5Oy7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJy
PkxvYWQgYWRkcmVzczogMHg0ODAwMDAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDxicj5Mb2FkaW5nOiAjIyMjI8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgwqDCoMKg
wqDCoMKgwqAgMjEuOCBNaUIvc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+ZG9uZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8YnI+Qnl0ZXMgdHJhbnNmZXJyZWQgPSA2ODU0NSAoMTBiYzEgaGV4KcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8YnI+PSZndDsgdGZ0cCAweDdhMDAwMDAwIEltYWdlLW0zdWxjYi5iaW7CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDxicj5Vc2luZyBldGhlcm5ldEBlNjgwMDAwMCBkZXZpY2XCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+VEZUUCBmcm9tIHNlcnZlciAxOTIu
MTY4LjEuMTAwOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIuMTY4LjEuMzxicj5GaWxlbmFtZSAmIzM5
O0ltYWdlLW0zdWxjYi5iaW4mIzM5Oy48YnI+TG9hZCBhZGRyZXNzOiAweDdhMDAwMDAwPGJyPkxv
YWRpbmc6ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDC
oMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKg
wqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
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
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7C
oMKgwqDCoMKgwqDCoMKgIDI4LjEgTWlCL3M8YnI+ZG9uZTxicj5CeXRlcyB0cmFuc2ZlcnJlZCA9
IDE5MDU5MjAwICgxMjJkMjAwIGhleCk8YnI+PSZndDsgYm9vdG0gMHg0ODA4MDAwMCAtIDB4NDgw
MDAwMDA8YnI+IyMgQm9vdGluZyBrZXJuZWwgZnJvbSBMZWdhY3kgSW1hZ2UgYXQgNDgwODAwMDAg
Li4uPGJyPsKgwqAgSW1hZ2UgTmFtZTrCoMKgIFhFTjxicj7CoMKgIEltYWdlIFR5cGU6wqDCoCBB
QXJjaDY0IExpbnV4IEtlcm5lbCBJbWFnZSAodW5jb21wcmVzc2VkKTxicj7CoMKgIERhdGEgU2l6
ZTrCoMKgwqAgOTE4ODY0IEJ5dGVzID0gODk3LjMgS2lCPGJyPsKgwqAgTG9hZCBBZGRyZXNzOiA3
ODA4MDAwMDxicj7CoMKgIEVudHJ5IFBvaW50OsKgIDc4MDgwMDAwPGJyPsKgwqAgVmVyaWZ5aW5n
IENoZWNrc3VtIC4uLiBPSzxicj4jIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBhdCA0ODAw
MDAwMDxicj7CoMKgIEJvb3RpbmcgdXNpbmcgdGhlIGZkdCBibG9iIGF0IDB4NDgwMDAwMDA8YnI+
wqDCoCBMb2FkaW5nIEtlcm5lbCBJbWFnZSAuLi4gT0s8YnI+wqDCoCBVc2luZyBEZXZpY2UgVHJl
ZSBpbiBwbGFjZSBhdCAwMDAwMDAwMDQ4MDAwMDAwLCBlbmQgMDAwMDAwMDA0ODAxM2JjMDxicj48
YnI+U3RhcnRpbmcga2VybmVsIC4uLjxicj48YnI+wqBYZW4gNC4xMi11bnN0YWJsZTxicj4oWEVO
KSBYZW4gdmVyc2lvbiA0LjEyLXVuc3RhYmxlICg8YSBocmVmPSJtYWlsdG86amVsZm5Ad2FzZWRh
LmpwIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmplbGZuQHdh
c2VkYS5qcDwvYT4pIChhYXJjaDY0LXBva3ktbGludXgtZ2M5PGJyPihYRU4pIExhdGVzdCBDaGFu
Z2VTZXQ6IE1vbiBEZWMgMTcgMDk6MjI6NTkgMjAxOCArMDAwMCBnaXQ6YTViMGViMy1kaXJ0eTxi
cj4oWEVOKSBQcm9jZXNzb3I6IDQxMWZkMDczOiAmcXVvdDtBUk0gTGltaXRlZCZxdW90OywgdmFy
aWFudDogMHgxLCBwYXJ0IDB4ZDA3LCByZXYgMHgzPGJyPihYRU4pIDY0LWJpdCBFeGVjdXRpb246
PGJyPihYRU4pwqDCoCBQcm9jZXNzb3IgRmVhdHVyZXM6IDAwMDAwMDAwMDAwMDIyMjIgMDAwMDAw
MDAwMDAwMDAwMDxicj4oWEVOKcKgwqDCoMKgIEV4Y2VwdGlvbiBMZXZlbHM6IEVMMzo2NCszMiBF
TDI6NjQrMzIgRUwxOjY0KzMyIEVMMDo2NCszMjxicj4oWEVOKcKgwqDCoMKgIEV4dGVuc2lvbnM6
IEZsb2F0aW5nUG9pbnQgQWR2YW5jZWRTSU1EPGJyPihYRU4pwqDCoCBEZWJ1ZyBGZWF0dXJlczog
MDAwMDAwMDAxMDMwNTEwNiAwMDAwMDAwMDAwMDAwMDAwPGJyPihYRU4pwqDCoCBBdXhpbGlhcnkg
RmVhdHVyZXM6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMDxicj4oWEVOKcKgwqAg
TWVtb3J5IE1vZGVsIEZlYXR1cmVzOiAwMDAwMDAwMDAwMDAxMTI0IDAwMDAwMDAwMDAwMDAwMDA8
YnI+KFhFTinCoMKgIElTQSBGZWF0dXJlczrCoCAwMDAwMDAwMDAwMDExMTIwIDAwMDAwMDAwMDAw
MDAwMDA8YnI+KFhFTikgMzItYml0IEV4ZWN1dGlvbjo8YnI+KFhFTinCoMKgIFByb2Nlc3NvciBG
ZWF0dXJlczogMDAwMDAxMzE6MDAwMTEwMTE8YnI+KFhFTinCoMKgwqDCoCBJbnN0cnVjdGlvbiBT
ZXRzOiBBQXJjaDMyIEEzMiBUaHVtYiBUaHVtYi0yIEphemVsbGU8YnI+KFhFTinCoMKgwqDCoCBF
eHRlbnNpb25zOiBHZW5lcmljVGltZXIgU2VjdXJpdHk8YnI+KFhFTinCoMKgIERlYnVnIEZlYXR1
cmVzOiAwMzAxMDA2Njxicj4oWEVOKcKgwqAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMDxi
cj4oWEVOKcKgwqAgTWVtb3J5IE1vZGVsIEZlYXR1cmVzOiAxMDIwMTEwNSA0MDAwMDAwMCAwMTI2
MDAwMCAwMjEwMjIxMTxicj4oWEVOKcKgIElTQSBGZWF0dXJlczogMDIxMDExMTAgMTMxMTIxMTEg
MjEyMzIwNDIgMDExMTIxMzEgMDAwMTExNDIgMDAwMTExMjE8YnI+KFhFTikgVXNpbmcgU01DIENh
bGxpbmcgQ29udmVudGlvbiB2MS4xPGJyPihYRU4pIFVzaW5nIFBTQ0kgdjEuMTxicj4oWEVOKSBT
TVA6IEFsbG93aW5nIDYgQ1BVczxicj4oWEVOKSA8YnI+KFhFTikgKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKjxicj4oWEVOKSBQYW5pYyBvbiBDUFUgMDo8YnI+KFhFTikg
VGltZXI6IFVuYWJsZSB0byByZXRyaWV2ZSBJUlEgMCBmcm9tIHRoZSBkZXZpY2UgdHJlZTxicj4o
WEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqPGJyPihYRU4pIDxi
cj4oWEVOKSBSZWJvb3QgaW4gZml2ZSBzZWNvbmRzLi4uPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+SXMgdGhlcmUgYW55dGhpbmcgSSBoYXZlIG92ZXJsb29rZWQgaW4gdGhlIGNvbXBpbGF0
aW9uIG9yIGNvbmZpZ3VyYXRpb24gZm9yIFhlbj88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRo
YW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGFsbCB0aGUgaGVscCB5b3UgaGF2ZSBvZmZlcmVkIHVwIHRv
IHRoaXMgcG9pbnQuIEkgYW0gYXQgbGVhc3QgaGFwcHkgdG8gZ2V0IHNvbWUgb3V0cHV0LCBldmVu
IGlmIGl0IGlzIG9uIHRoZSBSLUNhciBNMyBib2FyZCBpbiBteSBwb3NzZXNzaW9uLjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
SmFpcm88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PGJy
PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIj4yMDE55bm0MeaciDnml6Uo
5rC0KSAyOjA0IExPUEVaLCBGVUVOVEVTIE5BQ0FSSU5PIEphaXJvIEVkdWFyZG8gJmx0OzxhIGhy
ZWY9Im1haWx0bzpqYWlyb0BydXJpLndhc2VkYS5qcCIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5qYWlyb0BydXJpLndhc2VkYS5qcDwvYT4mZ3Q7Ojxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdj5BbmRyaWksPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgYXR0ZW1wdGVkIHRvIHVwZGF0ZSB0aGUgYm9vdGxv
YWRlciBmcm9tIHRoZSBzcmVjIGZpbGVzIGNyZWF0ZWQgYnkgdGhlIGJpdGJha2UgY29tbWFuZC48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYmVsaWV2ZSBJIGhhdmUgYmVlbiBhYmxlIHRvIHVw
ZGF0ZSBpdCwgYnV0IEkgYW0gc3RpbGwgb2J0YWluaW5nIHRoZSBzYW1lIHJlc3VsdHMuIFRoZSBz
ZXJpYWwgb3V0cHV0IGlzIHNob3duIGJlbG93OjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+W8Kg
wqDCoCAwLjAwMDE2MV0gTk9USUNFOsKgIEJMMjogUi1DYXIgR2VuMyBJbml0aWFsIFByb2dyYW0g
TG9hZGVyKENBNTcpIFJldi4xLjAuMTc8YnI+W8KgwqDCoCAwLjAwNTcyMV0gTk9USUNFOsKgIEJM
MjogUFJSIGlzIFItQ2FyIEgzIFZlcjIuMDxicj5bwqDCoMKgIDAuMDEwMzA0XSBOT1RJQ0U6wqAg
QkwyOiBCb2FyZCBpcyBTdGFydGVyIEtpdCBSZXYxLjA8YnI+W8KgwqDCoCAwLjAxNTMzMV0gTk9U
SUNFOsKgIEJMMjogQm9vdCBkZXZpY2UgaXMgSHlwZXJGbGFzaCg4ME1Ieik8YnI+W8KgwqDCoCAw
LjAyMDc1N10gTk9USUNFOsKgIEJMMjogTENNIHN0YXRlIGlzIENNPGJyPlvCoMKgwqAgMC4wMjQ4
MDJdIE5PVElDRTrCoCBCTDI6IEFWUyBzZXR0aW5nIHN1Y2NlZWRlZC4gRFZGU19TZXRWSUQ9MHg1
Mzxicj5bwqDCoMKgIDAuMDMwNzg2XSBOT1RJQ0U6wqAgQkwyOiBERFIzMjAwKHJldi4wLjI4KU5P
VElDRTrCoCBbQ09MRF9CT09UXU5PVElDRTrCoCAuLjA8YnI+W8KgwqDCoCAwLjA1OTk5Nl0gTk9U
SUNFOsKgIEJMMjogRFJBTSBTcGxpdCBpcyA0Y2g8YnI+W8KgwqDCoCAwLjA2Mzg4Ml0gTk9USUNF
OsKgIEJMMjogUW9TIGlzIGRlZmF1bHQgc2V0dGluZyhyZXYuMC4xOCk8YnI+W8KgwqDCoCAwLjA2
OTM4MV0gTk9USUNFOsKgIEJMMjogTG9zc3kgRGVjb21wIGFyZWFzPGJyPlvCoMKgwqAgMC4wNzM1
NTldIE5PVElDRTrCoMKgwqDCoMKgwqAgRW50cnkgMDogRENNUEFSRUFDUkF4OjB4ODAwMDA1NDAg
RENNUEFSRUFDUkJ4OjB4NTcwPGJyPlvCoMKgwqAgMC4wODA2NDNdIE5PVElDRTrCoMKgwqDCoMKg
wqAgRW50cnkgMTogRENNUEFSRUFDUkF4OjB4NDAwMDAwMDAgRENNUEFSRUFDUkJ4OjB4MDxicj5b
wqDCoMKgIDAuMDg3NTU1XSBOT1RJQ0U6wqDCoMKgwqDCoMKgIEVudHJ5IDI6IERDTVBBUkVBQ1JB
eDoweDIwMDAwMDAwIERDTVBBUkVBQ1JCeDoweDA8YnI+W8KgwqDCoCAwLjA5NDQ3MF0gTk9USUNF
OsKgIEJMMjogdjEuMyhyZWxlYXNlKTpiMTVmZWZhPGJyPlvCoMKgwqAgMC4wOTg5NjBdIE5PVElD
RTrCoCBCTDI6IEJ1aWx0IDogMTI6MjE6MzIsIERlYyAyOCAyMDE4PGJyPlvCoMKgwqAgMC4xMDQx
NDddIE5PVElDRTrCoCBCTDI6IE5vcm1hbCBib290PGJyPlvCoMKgwqAgMC4xMDc3ODhdIE5PVElD
RTrCoCBCTDI6IGRzdD0weGU2MzIyMjEwIHNyYz0weDgxODAwMDAgbGVuPTUxMigweDIwMCk8YnI+
W8KgwqDCoCAwLjExNDMzNV0gTk9USUNFOsKgIEJMMjogZHN0PTB4NDNmMDAwMDAgc3JjPTB4ODE4
MDQwMCBsZW49NjE0NCgweDE4MDApPGJyPlvCoMKgwqAgMC4xMjA3OTddIE5PVElDRTrCoCBCTDI6
IGRzdD0weDQ0MDAwMDAwIHNyYz0weDgxYzAwMDAgbGVuPTY1NTM2KDB4MTAwMDApPGJyPlvCoMKg
wqAgMC4xMjgwMjJdIE5PVElDRTrCoCBCTDI6IGRzdD0weDQ0MTAwMDAwIHNyYz0weDgyMDAwMDAg
bGVuPTUyNDI4OCgweDgwMDAwKTxicj5bwqDCoMKgIDAuMTM4NTAzXSBOT1RJQ0U6wqAgQkwyOiBk
c3Q9MHg1MDAwMDAwMCBzcmM9MHg4NjQwMDAwIGxlbj0xMDQ4NTc2KDB4MTAwMDAwKTxicj48YnI+
PGJyPlUtQm9vdCAyMDE1LjA0IChEZWMgMjggMjAxOCAtIDAyOjQ2OjI0KTxicj48YnI+Q1BVOiBS
ZW5lc2FzIEVsZWN0cm9uaWNzIFI4QTc3OTUgcmV2IDIuMDxicj5Cb2FyZDogSDNVTENCPGJyPkky
QzrCoMKgIHJlYWR5PGJyPkRSQU06wqAgMy45IEdpQjxicj5NTUM6wqDCoCBzaC1zZGhpOiAwLCBz
aC1zZGhpOiAxPGJyPkluOsKgwqDCoCBzZXJpYWw8YnI+T3V0OsKgwqAgc2VyaWFsPGJyPkVycjrC
oMKgIHNlcmlhbDxicj5OZXQ6wqDCoCByYXZiPGJyPkhpdCBhbnkga2V5IHRvIHN0b3AgYXV0b2Jv
b3Q6wqAgMCA8YnI+PSZndDsgc2V0ZW52IGJvb3RhcmdzPGJyPj0mZ3Q7IHNldGVudiBzZXJ2ZXJp
cCAxOTIuMTY4LjEuMTAwPGJyPj0mZ3Q7IHRmdHAgMHg0ODA4MDAwMCB4ZW4taDN1bGNiLnVJbWFn
ZTxicj5yYXZiIFdhaXRpbmcgZm9yIFBIWSBhdXRvIG5lZ290aWF0aW9uIHRvIGNvbXBsZXRlLi4u
Li4uLi4uIFRJTUVPVVQgITxicj5IYWxmPGJyPlVzaW5nIHJhdmIgZGV2aWNlPGJyPlRGVFAgZnJv
bSBzZXJ2ZXIgMTkyLjE2OC4xLjEwMDsgb3VyIElQIGFkZHJlc3MgaXMgMTkyLjE2OC4xLjQwPGJy
PkZpbGVuYW1lICYjMzk7eGVuLWgzdWxjYi51SW1hZ2UmIzM5Oy48YnI+TG9hZCBhZGRyZXNzOiAw
eDQ4MDgwMDAwPGJyPkxvYWRpbmc6ICo8YnI+QVJQIFJldHJ5IGNvdW50IGV4Y2VlZGVkOyBzdGFy
dGluZyBhZ2Fpbjxicj5yYXZiOjAgaXMgY29ubmVjdGVkIHRvIHJhdmIuwqAgUmVjb25uZWN0aW5n
IHRvIHJhdmI8YnI+cmF2YiBXYWl0aW5nIGZvciBQSFkgYXV0byBuZWdvdGlhdGlvbiB0byBjb21w
bGV0ZS4uLi4uLi4uLiBUSU1FT1VUICE8YnI+SGFsZjxicj48YnI+QVJQIFJldHJ5IGNvdW50IGV4
Y2VlZGVkOyBzdGFydGluZyBhZ2Fpbjxicj5yYXZiOjAgaXMgY29ubmVjdGVkIHRvIHJhdmIuwqAg
UmVjb25uZWN0aW5nIHRvIHJhdmI8YnI+cmF2YiBXYWl0aW5nIGZvciBQSFkgYXV0byBuZWdvdGlh
dGlvbiB0byBjb21wbGV0ZS4uLiBkb25lPGJyPnJhdmI6IDEwMDBCYXNlL0Z1bGw8YnI+VXNpbmcg
cmF2YiBkZXZpY2U8YnI+VEZUUCBmcm9tIHNlcnZlciAxOTIuMTY4LjEuMTAwOyBvdXIgSVAgYWRk
cmVzcyBpcyAxOTIuMTY4LjEuNDA8YnI+RmlsZW5hbWUgJiMzOTt4ZW4taDN1bGNiLnVJbWFnZSYj
Mzk7Ljxicj5Mb2FkIGFkZHJlc3M6IDB4NDgwODAwMDA8YnI+TG9hZGluZzogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKg
wqDCoMKgwqDCoCAyNS40IE1pQi9zPGJyPmRvbmU8YnI+Qnl0ZXMgdHJhbnNmZXJyZWQgPSA4NTIz
NjggKGQwMTkwIGhleCk8YnI+PSZndDsgdGZ0cCAweDQ4MDAwMDAwIEltYWdlLXI4YTc3OTUtaDN1
bGNiLXhlbi1sb2NhbC5kdGI8YnI+cmF2YjowIGlzIGNvbm5lY3RlZCB0byByYXZiLsKgIFJlY29u
bmVjdGluZyB0byByYXZiPGJyPnJhdmIgV2FpdGluZyBmb3IgUEhZIGF1dG8gbmVnb3RpYXRpb24g
dG8gY29tcGxldGUuLi4uLiBkb25lPGJyPnJhdmI6IDEwMDBCYXNlL0Z1bGw8YnI+VXNpbmcgcmF2
YiBkZXZpY2U8YnI+VEZUUCBmcm9tIHNlcnZlciAxOTIuMTY4LjEuMTAwOyBvdXIgSVAgYWRkcmVz
cyBpcyAxOTIuMTY4LjEuNDA8YnI+RmlsZW5hbWUgJiMzOTtJbWFnZS1yOGE3Nzk1LWgzdWxjYi14
ZW4tbG9jYWwuZHRiJiMzOTsuPGJyPkxvYWQgYWRkcmVzczogMHg0ODAwMDAwMDxicj5Mb2FkaW5n
OiAjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgIDExLjcgS2lCL3M8YnI+ZG9uZTxicj5CeXRlcyB0
cmFuc2ZlcnJlZCA9IDYzNzc4IChmOTIyIGhleCk8YnI+PSZndDsgdGZ0cCAweDdhMDAwMDAwIGgz
dWxjYi1pbWFnZTxicj5yYXZiOjAgaXMgY29ubmVjdGVkIHRvIHJhdmIuwqAgUmVjb25uZWN0aW5n
IHRvIHJhdmI8YnI+cmF2YiBXYWl0aW5nIGZvciBQSFkgYXV0byBuZWdvdGlhdGlvbiB0byBjb21w
bGV0ZS4uLiBkb25lPGJyPnJhdmI6IDEwMDBCYXNlL0Z1bGw8YnI+VXNpbmcgcmF2YiBkZXZpY2U8
YnI+VEZUUCBmcm9tIHNlcnZlciAxOTIuMTY4LjEuMTAwOyBvdXIgSVAgYWRkcmVzcyBpcyAxOTIu
MTY4LjEuNDA8YnI+RmlsZW5hbWUgJiMzOTtoM3VsY2ItaW1hZ2UmIzM5Oy48YnI+TG9hZCBhZGRy
ZXNzOiAweDdhMDAwMDAwPGJyPkxvYWRpbmc6ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAg
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKg
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDC
oCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKg
wqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDC
oMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKg
wqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDC
oMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyM8YnI+wqDCoMKgwqDCoMKgwqDCoCAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKg
wqDCoMKgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjPGJyPsKgwqDCoMKgwqDCoMKgwqAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIzxicj7CoMKgwqDCoMKgwqDCoMKgIDIuMSBNaUIvczxicj5kb25l
PGJyPkJ5dGVzIHRyYW5zZmVycmVkID0gMTU4NDM4NDAgKGYxYzIwMCBoZXgpPGJyPj0mZ3Q7IGJv
b3RtIDB4NDgwODAwMDAgLSAweDQ4MDAwMDAwPGJyPiMjIEJvb3Rpbmcga2VybmVsIGZyb20gTGVn
YWN5IEltYWdlIGF0IDQ4MDgwMDAwIC4uLjxicj7CoMKgIEltYWdlIE5hbWU6wqDCoCBYRU48YnI+
wqDCoCBJbWFnZSBUeXBlOsKgwqAgQUFyY2g2NCBMaW51eCBLZXJuZWwgSW1hZ2UgKHVuY29tcHJl
c3NlZCk8YnI+wqDCoCBEYXRhIFNpemU6wqDCoMKgIDg1MjMwNCBCeXRlcyA9IDgzMi4zIEtpQjxi
cj7CoMKgIExvYWQgQWRkcmVzczogNzgwODAwMDA8YnI+wqDCoCBFbnRyeSBQb2ludDrCoCA3ODA4
MDAwMDxicj7CoMKgIFZlcmlmeWluZyBDaGVja3N1bSAuLi4gT0s8YnI+IyMgRmxhdHRlbmVkIERl
dmljZSBUcmVlIGJsb2IgYXQgNDgwMDAwMDA8YnI+wqDCoCBCb290aW5nIHVzaW5nIHRoZSBmZHQg
YmxvYiBhdCAweDQ4MDAwMDAwPGJyPsKgwqAgTG9hZGluZyBLZXJuZWwgSW1hZ2UgLi4uIE9LPGJy
PsKgwqAgVXNpbmcgRGV2aWNlIFRyZWUgaW4gcGxhY2UgYXQgMDAwMDAwMDA0ODAwMDAwMCwgZW5k
IDAwMDAwMDAwNDgwMTI5MjE8YnI+PGJyPlN0YXJ0aW5nIGtlcm5lbCAuLi48YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj4mbHQ7L2VuZCBvdXRwdXQmZ3Q7PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5JIGhhdmUgbm90aWNlZCB0aGF0IHRoZSB1Ym9vdCBkYXRlIGhhcyBub3QgY2hhbmdlZCBm
cm9tIDIwMTUuMDQgYWx0aG91Z2ggdGhlIGJ1aWxkIGRhdGUgaXMgZnJvbSB0aGUgbGFzdCB0aW1l
IEkgcmFuIGEgYml0YmFrZSBjb21tYW5kLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBkbyBu
b3Qga25vdyB3aGF0IHZlcnNpb24gb2YgdWJvb3Qgc2hvdWxkIGJlIHVzZWQgd2l0aG91dCBicmVh
a2luZyB0aGUgY3VycmVudCBjb21waWxpbmcgdmVyc2lvbnMuPC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5BcmUgdGhlcmUgYW55IG90aGVyIG1vZGlmaWNhdGlvbnMgdGhhdCBJIGNhbiBhdHRlbXB0
PzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciB0
aW1lIGFuZCBwYXRpZW5jZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkphaXJvPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--0000000000007b9395057f9960f1--


--===============8417742942000171812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8417742942000171812==--
