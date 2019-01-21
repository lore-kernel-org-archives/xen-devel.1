From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Tue, 22 Jan 2019 03:04:50 +0900
Message-ID: <CACrvCsY-yYaOFjX=H_3JGhMDwcGhHdSWqBcm=Zq2nQhcRfptYA@mail.gmail.com>
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
 <feb11726-086c-c6ad-9fca-30c7a22e4d9d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5880197647583217057=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <feb11726-086c-c6ad-9fca-30c7a22e4d9d@gmail.com>
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

--===============5880197647583217057==
Content-Type: multipart/alternative; boundary="000000000000186fb1057ff3f9be"

--000000000000186fb1057ff3f9be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrii,

I went through the instructions again and found the instructions for what
you call Yocto 3.9 here [1].

I attempted following the initial Xen ARM instructions found here [2]

The biggest difference is in the commit revisions for meta-selinux and
meta-virtualization that I didn't know if going with jethro and morty
respectively was still necessary.I went for rocko. Since the system
compiled, I continued with this revision.

The full compile output is shown below:

Loading cache: 100% |############################################| Time:
0:00:00
Loaded 2895 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time:
0:00:01
Parsing of 2088 .bb files complete (2082 cached, 6 parsed). 2901 targets,
87 skipped, 4 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Multiple providers are available for iasl-native (iasl-native,
acpica-native)
Consider defining a PREFERRED_PROVIDER entry to match iasl-native

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
meta-yocto-bsp       =3D "tmp:342fbd6a3e57021c8e28b124b3adb241936f3d9d"
meta-rcar-gen3       =3D "tmp:fd078b6ece537d986852cb827bd21e022a797b2f"
meta-optee           =3D "tmp:75dfb67bbb14a70cd47afda9726e2e1c76731885"
meta-oe
meta-python
meta-networking      =3D "tmp:dacfa2b1920e285531bec55cd2f08743390aaf57"
meta-selinux         =3D "rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae12d"
meta-virtualization  =3D "rocko:b704c689b67639214b9568a3d62e82df27e9434f"
meta-rcar-gen3-xen   =3D
"lastest_xen:cc6e6e1c07197207769331b0532fc88a9165a855"

Initialising tasks: 100% |#######################################| Time:
0:00:08
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 6243 tasks of which 5052 didn't need to be
rerun and all succeeded.

I followed the R-Car M3 firmware update instructions without issue from
[3]. I was confused with the ascii part, but when I realized that the
instructions were for use with the minicom program, things were relatively
smooth sailing.

After the firmware update, I attempted to boot the Linux created from
running bitbake and was able to boot the following without issue:


U-Boot 2015.04 (Jan 21 2019 - 20:33:02)

CPU: Renesas Electronics R8A7796 rev 1.0
Board: M3ULCB
I2C:   ready
DRAM:  1.9 GiB
Bank #0: 0x048000000 - 0x07fffffff, 896 MiB
Bank #1: 0x600000000 - 0x63fffffff, 1 GiB

... <redacted because it felt like unimportant data>

Poky (Yocto Project Reference Distro) 2.4.2 m3ulcb ttySC0

m3ulcb login: root
root@m3ulcb:~# uname -a
Linux m3ulcb 4.14.35-yocto-standard #2 SMP PREEMPT Mon Jan 21 23:44:14 JST
2019x

Which means that at least my Linux build is fine.
The U-Boot version is back to 2015.04 so I am guessing that this is the
version you were expected for a Yocto 3.9 build.

The final step to load Xen brings me back to the initial issue which is
that I obtain absolutely no output.

U-Boot 2015.04 (Jan 21 2019 - 20:33:02)

CPU: Renesas Electronics R8A7796 rev 1.0
Board: M3ULCB
I2C:   ready
DRAM:  1.9 GiB
Bank #0: 0x048000000 - 0x07fffffff, 896 MiB
Bank #1: 0x600000000 - 0x63fffffff, 1 GiB

MMC:   sh-sdhi: 0, sh-sdhi: 1
In:    serial
Out:   serial
Err:   serial
Net:   ravb
Hit any key to stop autoboot:  0
=3D> dhcp
ravb Waiting for PHY auto negotiation to complete........ done
ravb: 1000Base/Full
BOOTP broadcast 1
BOOTP broadcast 2
DHCP client bound to address 192.168.1.10 (256 ms)
*** Warning: no boot file name; using 'C0A8010A.img'
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.10
Filename 'C0A8010A.img'.
Load address: 0x48080000
Loading: *
TFTP error: 'File not found' (1)
Not retrying...
=3D> setenv bootargs
=3D> tftp 0x48080000 xen-m3ulcb.uImage
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.3
Filename 'xen-m3ulcb.uImage'.
Load address: 0x48080000
Loading: #############################################################
         171.9 KiB/s
done
Bytes transferred =3D 886160 (d8590 hex)
=3D> tftp 0x48000000 Image-r8a7796-m3ulcb-xen-local.dtb
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.3
Filename 'Image-r8a7796-m3ulcb-xen-local.dtb'.
Load address: 0x48000000
Loading: #####
         12.7 KiB/s
done
Bytes transferred =3D 68545 (10bc1 hex)
=3D> tftp 0x7a000000 Image-m3ulcb.bin
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete... done
ravb: 1000Base/Full
Using ravb device
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
         ################################
         2.4 MiB/s
done
Bytes transferred =3D 18588160 (11ba200 hex)
=3D> bootm 0x48080000 - 0x48000000
## Booting kernel from Legacy Image at 48080000 ...
   Image Name:   XEN
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    886096 Bytes =3D 865.3 KiB
   Load Address: 78080000
   Entry Point:  78080000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 48000000
   Booting using the fdt blob at 0x48000000
   Loading Kernel Image ... OK
   Using Device Tree in place at 0000000048000000, end 0000000048013bc0

Starting kernel ...

Obtaining no output is still a little unsettling. I am still a little
worried that my dtb configuration is wrong but since the only thing I
should need to modify is the chosen section, I place that below:

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

Since I am using the sd-card to attempt to boot various versions, I have
chosen the second partition for Linux.

Last time there was a mention of modifying the internal build scripts for
Xen.

If there is any additional information I can obtain for you let me know.

For now I think I am finally in Yocto 3.9 running a 4.14 Linux kernel and
attempting to run and unstable Xen with the following modified
xen_git.bbappend from the Xen troops meta-demo repository [4].

FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"

DEPENDS +=3D "u-boot-mkimage-native"

XEN_REL=3D"unstable"

XEN_BRANCH =3D "master"

SRCREV =3D "${AUTOREV}"

EXTRA_OEMAKE +=3D " CONFIG_QEMU_XEN=3Dn"

DEFAULT_PREFERENCE =3D "1"

do_deploy_append () {
    if [ -f ${D}/boot/xen ]; then
        uboot-mkimage -A arm64 -C none -T kernel -a 0x78080000 -e
0x78080000 -n "XEN" -d ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}.uImage
    fi
}

FILES_${PN}-xencommons_remove +=3D " \
    ${systemd_unitdir}/system/xenstored.socket \
    ${systemd_unitdir}/system/xenstored_ro.socket \
    "

FILES_${PN}-xencommons +=3D " \
    ${systemd_unitdir}/system/xendriverdomain.service \
    "

SYSTEMD_SERVICE_${PN}-xencommons_remove +=3D " \
    xenstored.socket \
    xenstored_ro.socket \
    "

#FILES_${PN}-libxendevicemodel =3D "${libdir}/libxendevicemodel.so.*"
#FILES_${PN}-libxendevicemodel-dev =3D "${libdir}/libxendevicemodel.so"

FILES_${PN}-libxentoolcore =3D "${libdir}/libxentoolcore.so.*"
FILES_${PN}-libxentoolcore-dev =3D "${libdir}/libxentoolcore.so"

FILES_${PN}-pkgconfig =3D "\
    ${datadir}/pkgconfig \
    "

FILES_${PN}-xendiag +=3D " \
    ${sbindir}/xen-diag \
    "

PACKAGES_append =3D "\
    ${PN}-libxentoolcore \
    ${PN}-libxentoolcore-dev \
    ${PN}-pkgconfig \
    ${PN}-xendiag \
    "

RDEPENDS_${PN}-base_remove =3D "\
    ${PN}-blktap \
    ${PN}-libblktapctl \
    ${PN}-libvhd \
    "

FILES_${PN}-staticdev +=3D "\
    ${libdir}/libxenforeignmemory.a \
    ${libdir}/libxentoollog.a \
    ${libdir}/libxengnttab.a \
    ${libdir}/libxendevicemodel.a \
    ${libdir}/libxenevtchn.a \
    ${libdir}/libxencall.a \
    ${libdir}/libxentoolcore.a \
    "

FILES_${PN}-libxencall-dev +=3D " \
    ${libdir}/libxencall.so \
    ${datadir}/pkgconfig/xencall.pc \
    "

FILES_${PN}-libxenctrl-dev +=3D " \
    ${libdir}/libxenctrl.so \
    ${datadir}/pkgconfig/xencontrol.pc \
    "

FILES_${PN}-libxendevicemodel +=3D "${libdir}/libxendevicemodel.so.*"
FILES_${PN}-libxendevicemodel-dev +=3D " \
    ${libdir}/libxendevicemodel.so \
    ${datadir}/pkgconfig/xendevicemodel.pc \
    "

FILES_${PN}-libxenevtchn-dev +=3D " \
    ${libdir}/libxenevtchn.so \
    ${datadir}/pkgconfig/xenevtchn.pc \
    "

FILES_${PN}-libxenforeignmemory-dev +=3D "\
    ${libdir}/libxenforeignmemory.so \
    ${datadir}/pkgconfig/xenforeignmemory.pc \
    "

FILES_${PN}-libxengnttab-dev +=3D " \
    ${libdir}/libxengnttab.so \
    ${datadir}/pkgconfig/xengnttab.pc \
    "

FILES_${PN}-libxenguest-dev +=3D " \
    ${libdir}/libxenguest.so \
    ${datadir}/pkgconfig/xenguest.pc \
    "

FILES_${PN}-libxenstat-dev +=3D " \
    ${libdir}/libxenstat.so \
    ${datadir}/pkgconfig/xenstat.pc \
    "

FILES_${PN}-libxenstore-dev +=3D " \
    ${libdir}/libxenstore.so \
    ${datadir}/pkgconfig/xenstore.pc \
    "

FILES_${PN}-libxentoolcore +=3D "${libdir}/libxentoolcore.so.*"
FILES_${PN}-libxentoolcore-dev +=3D " \
    ${libdir}/libxentoolcore.so \
    ${datadir}/pkgconfig/xentoolcore.pc \
    "

FILES_${PN}-libxentoollog-dev +=3D " \
    ${libdir}/libxentoollog.so \
    ${datadir}/pkgconfig/xentoollog.pc \
    "

FILES_${PN}-libxenvchan-dev +=3D " \
    ${libdir}/libxenvchan.so \
    ${datadir}/pkgconfig/xenvchan.pc \
    "

FILES_${PN}-misc +=3D "\
    ${sbindir}/xen-diag \
    ${libdir}/xen/bin/depriv-fd-checker \
    "

FILES_${PN}-efi =3D "\
    ${exec_prefix}/lib64/efi/xen* \
    "

FILES_${PN}-xenmon +=3D "\
    ${sbindir}/xenmon \
    "

FILES_${PN}-fsimage +=3D "\
    ${libdir}/xenfsimage/*/fsimage.so \
    "

FILES_${PN}-libfsimage +=3D "\
    ${libdir}/libxenfsimage.so.* \
    "

FILES_${PN}-libfsimage-dev +=3D "\
    ${libdir}/libxenfsimage.so \
    "

Best regards,

Jairo

[1]
https://elinux.org/R-Car/Boards/Yocto-Gen3#Building_the_BSP_for_Renesas_H3_=
Starter_Kit.2C_M3_Starter_Kit
[2]
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Sal=
vator-X
[3] https://elinux.org/R-Car/Boards/M3SK#Flashing_firmware
[4] https://github.com/xen-troops/meta-demo


2019=E5=B9=B41=E6=9C=8816=E6=97=A5(=E6=B0=B4) 16:53 Andrii Anisov <andrii.a=
nisov@gmail.com>:

> Jairo,
>
> On 11.01.19 22:12, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
> > I followed your initial advice and updated my environment to a newer
> version, opting to stick to the rocko version for the m3ulcb.
>
> I'm a bit confused are you using Renesas Yocto 3.9 or the latest 3.13?
>
> >
> > The Yocto build configuration is shown below:
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.36.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal-4.9"
> > TARGET_SYS           =3D "aarch64-poky-linux"
> > MACHINE              =3D "m3ulcb"
> > DISTRO               =3D "poky"
> > DISTRO_VERSION       =3D "2.4.2"
>
> Looks like 3.9, but why do you have u-boot 2018.09 below?
>
> > TUNE_FEATURES        =3D "aarch64 cortexa57-cortexa53"
> > TARGET_FPU           =3D ""
> > SOC_FAMILY           =3D "rcar-gen3:r8a7796"
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "HEAD:342fbd6a3e57021c8e28b124b3adb241936f3d9d=
"
> > meta-rcar-gen3       =3D "rocko:8af0b7d6e445b532088a068dc012757001be3a1=
f"
> > meta-optee           =3D "rocko:75dfb67bbb14a70cd47afda9726e2e1c7673188=
5"
> > meta-oe
> > meta-python
> > meta-networking      =3D "rocko:eae996301d9c097bcbeb8046f08041dc82bb62f=
8"
> > meta-selinux         =3D "rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae12=
d"
> > meta-virtualization  =3D "rocko:b704c689b67639214b9568a3d62e82df27e9434=
f"
> > meta-rcar-gen3-xen   =3D "master:60699c631d541aeeaebaeec9a087efed9385ee=
42"
> >
> > I had to modify the dtb to the version shown below:
> >
> > // SPDX-License-Identifier: GPL-2.0
> > /*
> >   * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board
> >   *
> >   * Copyright (C) 2016-2018 Renesas Electronics Corp.
> >   * Copyright (C) 2016 Cogent Embedded, Inc.
> >   */
> >
> > /dts-v1/;
> > #include "r8a7796.dtsi"
> > #include "ulcb.dtsi"
> >
> > / {
> >          model =3D "Renesas M3ULCB board based on r8a7796";
> >          compatible =3D "renesas,m3ulcb", "renesas,r8a7796";
> >
> >          cpus {
> >                  idle-states {
> >                          /delete-node/ cpu-sleep-1;
> >                  };
> >          };
> >
> >          memory@48000000 {
> >                  device_type =3D "memory";
> >                  /* first 128MB is reserved for secure area. */
> >                  reg =3D <0x0 0x48000000 0x0 0x38000000>;
> >          };
> >
> >          memory@600000000 {
> >                  device_type =3D "memory";
> >                  reg =3D <0x6 0x00000000 0x0 0x40000000>;
> >          };
> Merge memory nodes to be sure u-boot do not duplicate memory ranges.
>
> >
> >          reserved-memory {
> >                  #address-cells =3D <2>;
> >                  #size-cells =3D <2>;
> >                  ranges;
> >
> >                  /* device specific region for Lossy Decompression */
> >                  lossy_decompress: linux,lossy_decompress@54000000 {
> >                          no-map;
> >                          reg =3D <0x00000000 0x54000000 0x0 0x03000000>=
;
> >                  };
> >
> >                  /* global autoconfigured region for contiguous
> allocations */
> >                  linux,cma@57000000 {
> >                          compatible =3D "shared-dma-pool";
> >                          reusable;
> >                          reg =3D <0x00000000 0x57000000 0x0 0x19000000>=
;
> >                          linux,cma-default;
> >                  };
> >
> >                  /* device specific region for contiguous allocations *=
/
> >                  mmp_reserved: linux,multimedia@70000000 {
> >                          compatible =3D "shared-dma-pool";
> >                          reusable;
> >                          reg =3D <0x00000000 0x70000000 0x0 0x10000000>=
;
> >                  };
> >          };
> >
> >          chosen {
> >                  stdout-path =3D "serial0:115200n8";
> >                  xen,xen-bootargs =3D "dom0_mem=3D752M console=3Ddtuart
> dtuart=3Dserial0 dom0_max_vcpus=3D4";
> >                  xen,dom0-bootargs =3D "console=3Dhvc0 clk_ignore_unuse=
d
> root=3D/dev/mmcblk1p2 rw rootwait ignore_loglevel cma=3D128M";
> >
> >                  #address-cells =3D <2>;
> >                  #size-cells =3D <2>;
> >                  modules {
> >                          module@0 {
> >                                  compatible =3D "xen,linux-zimage",
> "xen,multiboot-module";
> >                                  reg =3D <0x0 0x7a000000 0x0 0x02000000=
>;
> >                          };
> >                  };
> >          };
> >
> >          mmngr {
> >                  compatible =3D "renesas,mmngr";
> >                  memory-region =3D <&mmp_reserved>, <&lossy_decompress>=
;
> >          };
> >
> >          mmngrbuf {
> >                  compatible =3D "renesas,mmngrbuf";
> >          };
> >
> >          vspm_if {
> >                  compatible =3D "renesas,vspm_if";
> >          };
> >
> >          versaclock5_out3: versaclk-3 {
> >                  compatible =3D "fixed-clock";
> >                  #clock-cells =3D <0>;
> >                  /* Initial value of versaclock out3 */
> >                  clock-frequency =3D <33000000>;
> >          };
> > };
> >
> > &a53_0 {
> >          /delete-property/ cpu-idle-states;
> > };
> >
> > &a53_1 {
> >          /delete-property/ cpu-idle-states;
> > };
> >
> > &a53_2 {
> >          /delete-property/ cpu-idle-states;
> > };
> >
> > &a53_3 {
> >          /delete-property/ cpu-idle-states;
> > };
> >
> > &du {
> >          clocks =3D <&cpg CPG_MOD 724>,
> >                   <&cpg CPG_MOD 723>,
> >                   <&cpg CPG_MOD 722>,
> >                   <&versaclock5 1>,
> >                   <&versaclock5_out3>,
> >                   <&versaclock5 2>;
> >          clock-names =3D "du.0", "du.1", "du.2",
> >                        "dclkin.0", "dclkin.1", "dclkin.2";
> > };
> >
> > &vspb {
> >          status =3D "okay";
> > };
> >
> > &vspi0 {
> >          status =3D "okay";
> > };
>
>
> > With the new information, I finally got some output for Xen, but was me=
t
> with a completely different issue for which I can't find any information
> for the error I am receiving.
> >
> > I realize that I may have an issue with the version of the board I am
> using, but a simple online search doesn't throw any red flags. The serial
> console output is below:
> >
> > [    0.000177] NOTICE:  BL2: R-Car M3 Initial Program Loader(CA57)
> > [    0.004613] NOTICE:  BL2: Initial Program Loader(Rev.2.0.0)
> > [    0.010147] NOTICE:  BL2: PRR is R-Car M3 Ver.1.0
>
> Your M3 revision is really old. We did not use something older than M3
> 1.1. But for the start it might be OK. You would not have IPMMU functiona=
l,
> though you do not need it now.
>
> > [    0.014815] NOTICE:  BL2: Board is Starter Kit Rev.1.0
> > [    0.019928] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
> > [    0.025354] NOTICE:  BL2: LCM state is CM
> > [    0.029395] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
> > [    0.035383] NOTICE:  BL2: DDR3200(rev.0.34)
> > [    0.046779] NOTICE:  BL2: [COLD_BOOT]
> > [    0.085117] NOTICE:  BL2: DRAM Split is 2ch
> > [    0.087812] NOTICE:  BL2: QoS is default setting(rev.0.19)
> > [    0.093315] NOTICE:  BL2: Lossy Decomp areas
> > [    0.097489] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
> DCMPAREACRBx:0x570
> > [    0.104573] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
> DCMPAREACRBx:0x0
> > [    0.111485] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
> DCMPAREACRBx:0x0
> > [    0.118400] NOTICE:  BL2: v1.5(release):556a11e
> > [    0.122890] NOTICE:  BL2: Built : 18:03:48, Jan 11 2019
> > [    0.128077] NOTICE:  BL2: Normal boot
> > [    0.131718] NOTICE:  BL2: dst=3D0xe6321100 src=3D0x8180000 len=3D512=
(0x200)
> > [    0.138106] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400
> len=3D6144(0x1800)
> > [    0.144726] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000
> len=3D65536(0x10000)
> > [    0.151952] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
> len=3D1048576(0x100000)
> > [    0.166777] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
> len=3D1048576(0x100000)
> > [    0.180752] NOTICE:  BL2: Booting BL31
> >
> >
> > U-Boot 2018.09 (Jan 12 2019 - 03:03:43 +0900)
> It is a u-boot from Renesas Yocto 3.13. I would not recommend you using i=
t.
> Seeing the problem below, it looks like u-boot messes with the device tre=
e
> in a different way now.
>
> >
> > CPU: Renesas Electronics R8A7796 rev 1.0
> > Model: Renesas M3ULCB board based on r8a7796
> > DRAM:  1.9 GiB
> > Bank #0: 0x048000000 - 0x07fffffff, 896 MiB
> > Bank #1: 0x600000000 - 0x63fffffff, 1 GiB
> >
> > MMC:   sd@ee100000: 0, sd@ee140000: 1
> > Loading Environment from MMC... communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > communication out of sync
> > OK
> > In:    serial@e6e88000
> > Out:   serial@e6e88000
> > Err:   serial@e6e88000
> > Net:   eth0: ethernet@e6800000
> > Hit any key to stop autoboot:  0
> > ethernet@e6800000 Waiting for PHY auto negotiation to complete... done
> > Using ethernet@e6800000 device
> > TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> > Filename 'Image'.
> > Load address: 0x48080000
> > Loading:
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >           ############################################
> >           2.7 MiB/s
> > done
> > Bytes transferred =3D 15911424 (f2ca00 hex)
> > Using ethernet@e6800000 device
> > TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> > Filename 'Image-r8a7796-m3ulcb.dtb'.
> > Load address: 0x48000000
> > Loading: *
> > TFTP error: 'File not found' (1)
> > Not retrying...
> > ERROR: Did not find a cmdline Flattened Device Tree
> > Could not find a valid device tree
> > =3D> setenv bootargs
> > =3D> tftp 0x48080000 xen-m3ulcb.uImage
> > Using ethernet@e6800000 device
> > TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> > Filename 'xen-m3ulcb.uImage'.
> > Load address: 0x48080000
> > Loading: ##############################################################=
#
> >           28.3 MiB/s
> > done
> > Bytes transferred =3D 918928 (e0590 hex)
> > =3D> tftp 0x48000000 Image-r8a7796-m3ulcb-xen-local.dtb
> > Using ethernet@e6800000 device
> > TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> > Filename 'Image-r8a7796-m3ulcb-xen-local.dtb'.
> > Load address: 0x48000000
> > Loading: #####
> >           21.8 MiB/s
> > done
> > Bytes transferred =3D 68545 (10bc1 hex)
> > =3D> tftp 0x7a000000 Image-m3ulcb.bin
> > Using ethernet@e6800000 device
> > TFTP from server 192.168.1.100; our IP address is 192.168.1.3
> > Filename 'Image-m3ulcb.bin'.
> > Load address: 0x7a000000
> > Loading:
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> #################################################################
> >
> ################################################################
> >           28.1 MiB/s
> > done
> > Bytes transferred =3D 19059200 (122d200 hex)
> > =3D> bootm 0x48080000 - 0x48000000
> > ## Booting kernel from Legacy Image at 48080000 ...
> >     Image Name:   XEN
> >     Image Type:   AArch64 Linux Kernel Image (uncompressed)
> >     Data Size:    918864 Bytes =3D 897.3 KiB
> >     Load Address: 78080000
> >     Entry Point:  78080000
> >     Verifying Checksum ... OK
> > ## Flattened Device Tree blob at 48000000
> >     Booting using the fdt blob at 0x48000000
> >     Loading Kernel Image ... OK
> >     Using Device Tree in place at 0000000048000000, end 0000000048013bc=
0
> >
> > Starting kernel ...
> >
> >   Xen 4.12-unstable
> > (XEN) Xen version 4.12-unstable (jelfn@waseda.jp <mailto:jelfn@waseda.j=
p>)
> (aarch64-poky-linux-gc9
> > (XEN) Latest ChangeSet: Mon Dec 17 09:22:59 2018 +0000 git:a5b0eb3-dirt=
y
> > (XEN) Processor: 411fd073: "ARM Limited", variant: 0x1, part 0xd07, rev
> 0x3
> > (XEN) 64-bit Execution:
> > (XEN)   Processor Features: 0000000000002222 0000000000000000
> > (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> > (XEN)     Extensions: FloatingPoint AdvancedSIMD
> > (XEN)   Debug Features: 0000000010305106 0000000000000000
> > (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> > (XEN)   Memory Model Features: 0000000000001124 0000000000000000
> > (XEN)   ISA Features:  0000000000011120 0000000000000000
> > (XEN) 32-bit Execution:
> > (XEN)   Processor Features: 00000131:00011011
> > (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> > (XEN)     Extensions: GenericTimer Security
> > (XEN)   Debug Features: 03010066
> > (XEN)   Auxiliary Features: 00000000
> > (XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
> > (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142
> 00011121
> > (XEN) Using SMC Calling Convention v1.1
> > (XEN) Using PSCI v1.1
> > (XEN) SMP: Allowing 6 CPUs
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Timer: Unable to retrieve IRQ 0 from the device tree
>
> XEN failed to find timer node in the device tree. r8a7796.dtsi has timer
> node described, so it must be u-boot changed dtb.
> We have scheduled switching to Renesas Yocto 3.13 soon, so will coupe wit=
h
> the issue.
> But for now I would recommend you using 3.9 at most.
>
> --
> Sincerely,
> Andrii Anisov.
>

--000000000000186fb1057ff3f9be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div>Andrii,</div><div><br></div><div>=
I went through the instructions again and found the instructions for what y=
ou call Yocto 3.9 here [1].</div><div><br></div><div>I attempted following =
the initial Xen ARM instructions found here [2]<br></div><div><br></div><di=
v>The biggest difference is in the commit revisions for meta-selinux and me=
ta-virtualization that I didn&#39;t know if going with jethro and morty res=
pectively was still necessary.I went for rocko. Since the system compiled, =
I continued with this revision.</div><div><br></div><div>The full compile o=
utput is shown below:</div><div><br></div><div>Loading cache: 100% |#######=
#####################################| Time: 0:00:00<br>Loaded 2895 entries=
 from dependency cache.<br>Parsing recipes: 100% |#########################=
#################| Time: 0:00:01<br>Parsing of 2088 .bb files complete (208=
2 cached, 6 parsed). 2901 targets, 87 skipped, 4 masked, 0 errors.<br>NOTE:=
 Resolving any missing task queue dependencies<br>NOTE: Multiple providers =
are available for iasl-native (iasl-native, acpica-native)<br>Consider defi=
ning a PREFERRED_PROVIDER entry to match iasl-native<br><br>Build Configura=
tion:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;1.36.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSB=
STRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;universal-4.9&quot;<br>TARGE=
T_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot=
;aarch64-poky-linux&quot;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;m3ulcb&quot;<br>DISTRO=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;2.4.2&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;aarch64 cortexa57-cortexa53&quot;<br>TARGET_FPU=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<=
br>SOC_FAMILY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;rcar-gen3:r8a7796&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-po=
ky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>me=
ta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;tmp:342fbd6a3e57=
021c8e28b124b3adb241936f3d9d&quot;<br>meta-rcar-gen3=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;tmp:fd078b6ece537d986852cb827bd21e022a797b2f&quot=
;<br>meta-optee=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;tmp:75dfb67bbb14a70cd47afda9726e2e1c76731885&quot;<br>meta-oe=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>=
meta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;tmp:dacfa2b1920e285=
531bec55cd2f08743390aaf57&quot;<br>meta-selinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae=
12d&quot;<br>meta-virtualization=C2=A0 =3D &quot;rocko:b704c689b67639214b95=
68a3d62e82df27e9434f&quot;<br>meta-rcar-gen3-xen=C2=A0=C2=A0 =3D &quot;last=
est_xen:cc6e6e1c07197207769331b0532fc88a9165a855&quot;<br><br>Initialising =
tasks: 100% |#######################################| Time: 0:00:08<br>NOTE=
: Executing SetScene Tasks<br>NOTE: Executing RunQueue Tasks<br>NOTE: Tasks=
 Summary: Attempted 6243 tasks of which 5052 didn&#39;t need to be rerun an=
d all succeeded.<br></div><div><br></div><div>I followed the R-Car M3 firmw=
are update instructions without issue from [3]. I was confused with the asc=
ii part, but when I realized that the instructions were for use with the mi=
nicom program, things were relatively smooth sailing.</div><div><br></div><=
div>After the firmware update, I attempted to boot the Linux created from r=
unning bitbake and was able to boot the following without issue:</div><div>=
<br></div><div><br></div><div>U-Boot 2015.04 (Jan 21 2019 - 20:33:02)<br><b=
r>CPU: Renesas Electronics R8A7796 rev 1.0<br>Board: M3ULCB<br>I2C:=C2=A0=
=C2=A0 ready<br>DRAM:=C2=A0 1.9 GiB<br>Bank #0: 0x048000000 - 0x07fffffff, =
896 MiB<br>Bank #1: 0x600000000 - 0x63fffffff, 1 GiB<br><br></div><div>... =
&lt;redacted because it felt like unimportant data&gt;<br></div><div><br></=
div><div>Poky (Yocto Project Reference Distro) 2.4.2 m3ulcb ttySC0<br><br>m=
3ulcb login: root<br>root@m3ulcb:~# uname -a<br>Linux m3ulcb 4.14.35-yocto-=
standard #2 SMP PREEMPT Mon Jan 21 23:44:14 JST 2019x</div><div><br></div><=
div>Which means that at least my Linux build is fine.</div><div>The U-Boot =
version is back to 2015.04 so I am guessing that this is the version you we=
re expected for a Yocto 3.9 build.</div><div><br></div><div>The final step =
to load Xen brings me back to the initial issue which is that I obtain abso=
lutely no output.</div><div><br></div><div>U-Boot 2015.04 (Jan 21 2019 - 20=
:33:02)<br><br>CPU: Renesas Electronics R8A7796 rev 1.0<br>Board: M3ULCB<br=
>I2C:=C2=A0=C2=A0 ready<br>DRAM:=C2=A0 1.9 GiB<br>Bank #0: 0x048000000 - 0x=
07fffffff, 896 MiB<br>Bank #1: 0x600000000 - 0x63fffffff, 1 GiB<br><br>MMC:=
=C2=A0=C2=A0 sh-sdhi: 0, sh-sdhi: 1<br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=
=C2=A0=C2=A0 serial<br>Err:=C2=A0=C2=A0 serial<br>Net:=C2=A0=C2=A0 ravb<br>=
Hit any key to stop autoboot:=C2=A0 0 <br>=3D&gt; dhcp<br>ravb Waiting for =
PHY auto negotiation to complete........ done<br>ravb: 1000Base/Full<br>BOO=
TP broadcast 1<br>BOOTP broadcast 2<br>DHCP client bound to address 192.168=
.1.10 (256 ms)<br>*** Warning: no boot file name; using &#39;C0A8010A.img&#=
39;<br>Using ravb device<br>TFTP from server 192.168.1.100; our IP address =
is 192.168.1.10<br>Filename &#39;C0A8010A.img&#39;.<br>Load address: 0x4808=
0000<br>Loading: *<br>TFTP error: &#39;File not found&#39; (1)<br>Not retry=
ing...<br>=3D&gt; setenv bootargs<br>=3D&gt; tftp 0x48080000 xen-m3ulcb.uIm=
age<br>ravb:0 is connected to ravb.=C2=A0 Reconnecting to ravb<br>ravb Wait=
ing for PHY auto negotiation to complete... done<br>ravb: 1000Base/Full<br>=
Using ravb device<br>TFTP from server 192.168.1.100; our IP address is 192.=
168.1.3<br>Filename &#39;xen-m3ulcb.uImage&#39;.<br>Load address: 0x4808000=
0<br>Loading: #############################################################=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 171.9 KiB/s<br>done<br=
>Bytes transferred =3D 886160 (d8590 hex)<br>=3D&gt; tftp 0x48000000 Image-=
r8a7796-m3ulcb-xen-local.dtb<br>ravb:0 is connected to ravb.=C2=A0 Reconnec=
ting to ravb<br>ravb Waiting for PHY auto negotiation to complete... done<b=
r>ravb: 1000Base/Full<br>Using ravb device<br>TFTP from server 192.168.1.10=
0; our IP address is 192.168.1.3<br>Filename &#39;Image-r8a7796-m3ulcb-xen-=
local.dtb&#39;.<br>Load address: 0x48000000<br>Loading: #####<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.7 KiB/s<br>done<br>Bytes transfe=
rred =3D 68545 (10bc1 hex)<br>=3D&gt; tftp 0x7a000000 Image-m3ulcb.bin<br>r=
avb:0 is connected to ravb.=C2=A0 Reconnecting to ravb<br>ravb Waiting for =
PHY auto negotiation to complete... done<br>ravb: 1000Base/Full<br>Using ra=
vb device<br>TFTP from server 192.168.1.100; our IP address is 192.168.1.3<=
br>Filename &#39;Image-m3ulcb.bin&#39;.<br>Load address: 0x7a000000<br>Load=
ing: #################################################################<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ##########################=
#######################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ########################################################=
#########<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #############=
####################################################<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ############################################=
#####################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
################################################################<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ################################=
#################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ##############################################################=
###<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###################=
##############################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ##################################################=
###############<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #######=
##########################################################<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ######################################=
###########################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 #################################################################<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #########################=
########################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ########################################################=
#########<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #############=
####################################################<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ############################################=
#####################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
################################################################<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ################################=
#################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2.4 MiB/s<br>done<br>Bytes transferred =3D 1858816=
0 (11ba200 hex)<br>=3D&gt; bootm 0x48080000 - 0x48000000<br>## Booting kern=
el from Legacy Image at 48080000 ...<br>=C2=A0=C2=A0 Image Name:=C2=A0=C2=
=A0 XEN<br>=C2=A0=C2=A0 Image Type:=C2=A0=C2=A0 AArch64 Linux Kernel Image =
(uncompressed)<br>=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 886096 Bytes =
=3D 865.3 KiB<br>=C2=A0=C2=A0 Load Address: 78080000<br>=C2=A0=C2=A0 Entry =
Point:=C2=A0 78080000<br>=C2=A0=C2=A0 Verifying Checksum ... OK<br>## Flatt=
ened Device Tree blob at 48000000<br>=C2=A0=C2=A0 Booting using the fdt blo=
b at 0x48000000<br>=C2=A0=C2=A0 Loading Kernel Image ... OK<br>=C2=A0=C2=A0=
 Using Device Tree in place at 0000000048000000, end 0000000048013bc0<br><b=
r>Starting kernel ...<br><br></div><div>Obtaining no output is still a litt=
le unsettling. I am still a little worried that my dtb configuration is wro=
ng but since the only thing I should need to modify is the chosen section, =
I place that below:</div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 chosen {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stdout-path =3D &quot;serial0:115200n8=
&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen,xen-bootargs =3D &quot;dom0_mem=3D752M cons=
ole=3Ddtuart dtuart=3Dserial0 dom0_max_vcpus=3D4&quot;;<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 xen,dom0-bootargs =3D &quot;console=3Dhvc0 clk_ignore_unused root=3D/dev/m=
mcblk1p2 rw rootwait ignore_loglevel cma=3D128M&quot;;<br><br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 #address-cells =3D &lt;2&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;=
2&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 modules {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module@0 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 compatible =3D &quot;xen,linux-zimage&quot;, &quot;xen,multiboot-mod=
ule&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x7a000=
000 0x0 0x02000000&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 };<br><br></div><div>Since I am using the sd-card to attemp=
t to boot various versions, I have chosen the second partition for Linux.<b=
r></div><div><br></div><div>Last time there was a mention of modifying the =
internal build scripts for Xen.</div><div><br></div><div>If there is any ad=
ditional information I can obtain for you let me know.</div><div><br></div>=
<div>For now I think I am finally in Yocto 3.9 running a 4.14 Linux kernel =
and attempting to run and unstable Xen with the following modified xen_git.=
bbappend from the Xen troops meta-demo repository [4].</div><div><br></div>=
<div>FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br><br>DEPE=
NDS +=3D &quot;u-boot-mkimage-native&quot;<br><br>XEN_REL=3D&quot;unstable&=
quot;<br><br>XEN_BRANCH =3D &quot;master&quot;<br><br>SRCREV =3D &quot;${AU=
TOREV}&quot;<br><br>EXTRA_OEMAKE +=3D &quot; CONFIG_QEMU_XEN=3Dn&quot;<br><=
br>DEFAULT_PREFERENCE =3D &quot;1&quot;<br><br>do_deploy_append () {<br>=C2=
=A0=C2=A0=C2=A0 if [ -f ${D}/boot/xen ]; then<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 uboot-mkimage -A arm64 -C none -T kernel -a 0x78080000 -=
e 0x78080000 -n &quot;XEN&quot; -d ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE=
}.uImage<br>=C2=A0=C2=A0=C2=A0 fi<br>}<br><br>FILES_${PN}-xencommons_remove=
 +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/xenstored.so=
cket \<br>=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/xenstored_ro.socket =
\<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-xencommons +=3D &quot; \<=
br>=C2=A0=C2=A0=C2=A0 ${systemd_unitdir}/system/xendriverdomain.service \<b=
r>=C2=A0=C2=A0=C2=A0 &quot;<br><br>SYSTEMD_SERVICE_${PN}-xencommons_remove =
+=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 xenstored.socket \<br>=C2=A0=C2=A0=C2=
=A0 xenstored_ro.socket \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>#FILES_${PN}-=
libxendevicemodel =3D &quot;${libdir}/libxendevicemodel.so.*&quot;<br>#FILE=
S_${PN}-libxendevicemodel-dev =3D &quot;${libdir}/libxendevicemodel.so&quot=
;<br><br>FILES_${PN}-libxentoolcore =3D &quot;${libdir}/libxentoolcore.so.*=
&quot;<br>FILES_${PN}-libxentoolcore-dev =3D &quot;${libdir}/libxentoolcore=
.so&quot;<br><br>FILES_${PN}-pkgconfig =3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${=
datadir}/pkgconfig \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-xendia=
g +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/xen-diag \<br>=C2=A0=C2=A0=
=C2=A0 &quot;<br><br>PACKAGES_append =3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${PN=
}-libxentoolcore \<br>=C2=A0=C2=A0=C2=A0 ${PN}-libxentoolcore-dev \<br>=C2=
=A0=C2=A0=C2=A0 ${PN}-pkgconfig \<br>=C2=A0=C2=A0=C2=A0 ${PN}-xendiag \<br>=
=C2=A0=C2=A0=C2=A0 &quot;<br><br>RDEPENDS_${PN}-base_remove =3D &quot;\<br>=
=C2=A0=C2=A0=C2=A0 ${PN}-blktap \<br>=C2=A0=C2=A0=C2=A0 ${PN}-libblktapctl =
\<br>=C2=A0=C2=A0=C2=A0 ${PN}-libvhd \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>=
FILES_${PN}-staticdev +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxenfo=
reignmemory.a \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxentoollog.a \<br>=C2=A0=
=C2=A0=C2=A0 ${libdir}/libxengnttab.a \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/lib=
xendevicemodel.a \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxenevtchn.a \<br>=C2=
=A0=C2=A0=C2=A0 ${libdir}/libxencall.a \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/li=
bxentoolcore.a \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxencall=
-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxencall.so \<br>=C2=
=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xencall.pc \<br>=C2=A0=C2=A0=C2=A0 &qu=
ot;<br><br>FILES_${PN}-libxenctrl-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 $=
{libdir}/libxenctrl.so \<br>=C2=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xencont=
rol.pc \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxendevicemodel =
+=3D &quot;${libdir}/libxendevicemodel.so.*&quot;<br>FILES_${PN}-libxendevi=
cemodel-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxendevicemodel=
.so \<br>=C2=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xendevicemodel.pc \<br>=C2=
=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxenevtchn-dev +=3D &quot; \<br=
>=C2=A0=C2=A0=C2=A0 ${libdir}/libxenevtchn.so \<br>=C2=A0=C2=A0=C2=A0 ${dat=
adir}/pkgconfig/xenevtchn.pc \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${=
PN}-libxenforeignmemory-dev +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${libdir}/li=
bxenforeignmemory.so \<br>=C2=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xenforeig=
nmemory.pc \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxengnttab-d=
ev +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxengnttab.so \<br>=C2=
=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xengnttab.pc \<br>=C2=A0=C2=A0=C2=A0 &=
quot;<br><br>FILES_${PN}-libxenguest-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=
=A0 ${libdir}/libxenguest.so \<br>=C2=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/x=
enguest.pc \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxenstat-dev=
 +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxenstat.so \<br>=C2=A0=C2=
=A0=C2=A0 ${datadir}/pkgconfig/xenstat.pc \<br>=C2=A0=C2=A0=C2=A0 &quot;<br=
><br>FILES_${PN}-libxenstore-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libd=
ir}/libxenstore.so \<br>=C2=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xenstore.pc=
 \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxentoolcore +=3D &quo=
t;${libdir}/libxentoolcore.so.*&quot;<br>FILES_${PN}-libxentoolcore-dev +=
=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxentoolcore.so \<br>=C2=A0=
=C2=A0=C2=A0 ${datadir}/pkgconfig/xentoolcore.pc \<br>=C2=A0=C2=A0=C2=A0 &q=
uot;<br><br>FILES_${PN}-libxentoollog-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=
=A0 ${libdir}/libxentoollog.so \<br>=C2=A0=C2=A0=C2=A0 ${datadir}/pkgconfig=
/xentoollog.pc \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-libxenvcha=
n-dev +=3D &quot; \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxenvchan.so \<br>=C2=
=A0=C2=A0=C2=A0 ${datadir}/pkgconfig/xenvchan.pc \<br>=C2=A0=C2=A0=C2=A0 &q=
uot;<br><br>FILES_${PN}-misc +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/=
xen-diag \<br>=C2=A0=C2=A0=C2=A0 ${libdir}/xen/bin/depriv-fd-checker \<br>=
=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-efi =3D &quot;\<br>=C2=A0=C2=
=A0=C2=A0 ${exec_prefix}/lib64/efi/xen* \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><=
br>FILES_${PN}-xenmon +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${sbindir}/xenmon =
\<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_${PN}-fsimage +=3D &quot;\<br>=
=C2=A0=C2=A0=C2=A0 ${libdir}/xenfsimage/*/fsimage.so \<br>=C2=A0=C2=A0=C2=
=A0 &quot;<br><br>FILES_${PN}-libfsimage +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0=
 ${libdir}/libxenfsimage.so.* \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br>FILES_$=
{PN}-libfsimage-dev +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0 ${libdir}/libxenfsim=
age.so \<br>=C2=A0=C2=A0=C2=A0 &quot;<br><br></div><div>Best regards,</div>=
<div><br></div><div>Jairo<br></div><div><br></div><div>[1] <a href=3D"https=
://elinux.org/R-Car/Boards/Yocto-Gen3#Building_the_BSP_for_Renesas_H3_Start=
er_Kit.2C_M3_Starter_Kit" target=3D"_blank">https://elinux.org/R-Car/Boards=
/Yocto-Gen3#Building_the_BSP_for_Renesas_H3_Starter_Kit.2C_M3_Starter_Kit</=
a></div><div>[2] <a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_with_V=
irtualization_Extensions/Salvator-X" target=3D"_blank">https://wiki.xenproj=
ect.org/wiki/Xen_ARM_with_Virtualization_Extensions/Salvator-X</a></div><di=
v>[3] <a href=3D"https://elinux.org/R-Car/Boards/M3SK#Flashing_firmware">ht=
tps://elinux.org/R-Car/Boards/M3SK#Flashing_firmware</a></div><div>[4] <a h=
ref=3D"https://github.com/xen-troops/meta-demo">https://github.com/xen-troo=
ps/meta-demo</a><br></div><div><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail-m_6510221311662285855gmail_attr">2019=E5=B9=B4=
1=E6=9C=8816=E6=97=A5(=E6=B0=B4) 16:53 Andrii Anisov &lt;<a href=3D"mailto:=
andrii.anisov@gmail.com" target=3D"_blank">andrii.anisov@gmail.com</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Jairo,<br>
<br>
On 11.01.19 22:12, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:<br>
&gt; I followed your initial advice and updated my environment to a newer v=
ersion, opting to stick to the rocko version for the m3ulcb.<br>
<br>
I&#39;m a bit confused are you using Renesas Yocto 3.9 or the latest 3.13?<=
br>
<br>
&gt; <br>
&gt; The Yocto build configuration is shown below:<br>
&gt; <br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;1.36.0&quot;<br>
&gt; BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;x86_64-linux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;universal-4.9&=
quot;<br>
&gt; TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;aarch64-poky-linux&quot;<br>
&gt; MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;m3ulcb&quot;<br>
&gt; DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>
&gt; DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;2.4.2&quo=
t;<br>
<br>
Looks like 3.9, but why do you have u-boot 2018.09 below?<br>
<br>
&gt; TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aarc=
h64 cortexa57-cortexa53&quot;<br>
&gt; TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;&quot;<br>
&gt; SOC_FAMILY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;rcar-gen3:r8a7796&quot;<br>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;HEAD:342f=
bd6a3e57021c8e28b124b3adb241936f3d9d&quot;<br>
&gt; meta-rcar-gen3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;rocko:8af=
0b7d6e445b532088a068dc012757001be3a1f&quot;<br>
&gt; meta-optee=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;rocko:75dfb67bbb14a70cd47afda9726e2e1c76731885&quot;<br>
&gt; meta-oe<br>
&gt; meta-python<br>
&gt; meta-networking=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;rocko:eae99630=
1d9c097bcbeb8046f08041dc82bb62f8&quot;<br>
&gt; meta-selinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot=
;rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae12d&quot;<br>
&gt; meta-virtualization=C2=A0 =3D &quot;rocko:b704c689b67639214b9568a3d62e=
82df27e9434f&quot;<br>
&gt; meta-rcar-gen3-xen=C2=A0=C2=A0 =3D &quot;master:60699c631d541aeeaebaee=
c9a087efed9385ee42&quot;<br>
&gt; <br>
&gt; I had to modify the dtb to the version shown below:<br>
&gt; <br>
&gt; // SPDX-License-Identifier: GPL-2.0<br>
&gt; /*<br>
&gt;=C2=A0 =C2=A0* Device Tree Source for the M3ULCB (R-Car Starter Kit Pro=
) board<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Copyright (C) 2016-2018 Renesas Electronics Corp.<br>
&gt;=C2=A0 =C2=A0* Copyright (C) 2016 Cogent Embedded, Inc.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; /dts-v1/;<br>
&gt; #include &quot;r8a7796.dtsi&quot;<br>
&gt; #include &quot;ulcb.dtsi&quot;<br>
&gt; <br>
&gt; / {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 model =3D &quot;Renes=
as M3ULCB board based on r8a7796&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;=
renesas,m3ulcb&quot;, &quot;renesas,r8a7796&quot;;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpus {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 idle-states {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /delete-node/ cpu-sleep-1;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory@48000000 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_type =3D &quot;memory&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* first 128MB is reserved for secure area. */<=
br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x48000000 0x0 0x38000000&gt;;<=
br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory@600000000 {<br=
>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_type =3D &quot;memory&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x6 0x00000000 0x0 0x40000000&gt;;<=
br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
Merge memory nodes to be sure u-boot do not duplicate memory ranges.<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reserved-memory {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ranges;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* device specific region for Lossy Decompressi=
on */<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 lossy_decompress: linux,lossy_decompress@540000=
00 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 no-map;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reg =3D &lt;0x00000000 0x54000000 0x0 0x03000000&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* global autoconfigured region for contiguous =
allocations */<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux,cma@57000000 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reusable;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reg =3D &lt;0x00000000 0x57000000 0x0 0x19000000&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 linux,cma-default;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* device specific region for contiguous alloca=
tions */<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmp_reserved: linux,multimedia@70000000 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reusable;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 reg =3D &lt;0x00000000 0x70000000 0x0 0x10000000&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chosen {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 stdout-path =3D &quot;serial0:115200n8&quot;;<b=
r>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen,xen-bootargs =3D &quot;dom0_mem=3D752M cons=
ole=3Ddtuart dtuart=3Dserial0 dom0_max_vcpus=3D4&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen,dom0-bootargs =3D &quot;console=3Dhvc0 clk_=
ignore_unused root=3D/dev/mmcblk1p2 rw rootwait ignore_loglevel cma=3D128M&=
quot;;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 modules {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 module@0 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;xen,l=
inux-zimage&quot;, &quot;xen,multiboot-module&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x7a000000=
 0x0 0x02000000&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmngr {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;renesas,mmngr&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory-region =3D &lt;&amp;mmp_reserved&gt;, &l=
t;&amp;lossy_decompress&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmngrbuf {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;renesas,mmngrbuf&quot;;<br=
>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vspm_if {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;renesas,vspm_if&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 versaclock5_out3: ver=
saclk-3 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;fixed-clock&quot;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 #clock-cells =3D &lt;0&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Initial value of versaclock out3 */<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-frequency =3D &lt;33000000&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt; };<br>
&gt; <br>
&gt; &amp;a53_0 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /delete-property/ cpu=
-idle-states;<br>
&gt; };<br>
&gt; <br>
&gt; &amp;a53_1 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /delete-property/ cpu=
-idle-states;<br>
&gt; };<br>
&gt; <br>
&gt; &amp;a53_2 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /delete-property/ cpu=
-idle-states;<br>
&gt; };<br>
&gt; <br>
&gt; &amp;a53_3 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /delete-property/ cpu=
-idle-states;<br>
&gt; };<br>
&gt; <br>
&gt; &amp;du {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D &lt;&amp;c=
pg CPG_MOD 724&gt;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;&amp;cpg CPG_MOD 723&gt;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;&amp;cpg CPG_MOD 722&gt;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;&amp;versaclock5 1&gt;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;&amp;versaclock5_out3&gt;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &lt;&amp;versaclock5 2&gt;;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names =3D &quot=
;du.0&quot;, &quot;du.1&quot;, &quot;du.2&quot;,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;dclki=
n.0&quot;, &quot;dclkin.1&quot;, &quot;dclkin.2&quot;;<br>
&gt; };<br>
&gt; <br>
&gt; &amp;vspb {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;okay=
&quot;;<br>
&gt; };<br>
&gt; <br>
&gt; &amp;vspi0 {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D &quot;okay=
&quot;;<br>
&gt; };<br>
<br>
<br>
&gt; With the new information, I finally got some output for Xen, but was m=
et with a completely different issue for which I can&#39;t find any informa=
tion for the error I am receiving.<br>
&gt; <br>
&gt; I realize that I may have an issue with the version of the board I am =
using, but a simple online search doesn&#39;t throw any red flags. The seri=
al console output is below:<br>
&gt; <br>
&gt; [=C2=A0=C2=A0=C2=A0 0.000177] NOTICE:=C2=A0 BL2: R-Car M3 Initial Prog=
ram Loader(CA57)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.004613] NOTICE:=C2=A0 BL2: Initial Program Loade=
r(Rev.2.0.0)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.010147] NOTICE:=C2=A0 BL2: PRR is R-Car M3 Ver.1=
.0<br>
<br>
Your M3 revision is really old. We did not use something older than M3 1.1.=
 But for the start it might be OK. You would not have IPMMU functional, tho=
ugh you do not need it now.<br>
<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.014815] NOTICE:=C2=A0 BL2: Board is Starter Kit =
Rev.1.0<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.019928] NOTICE:=C2=A0 BL2: Boot device is HyperF=
lash(80MHz)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.025354] NOTICE:=C2=A0 BL2: LCM state is CM<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.029395] NOTICE:=C2=A0 BL2: AVS setting succeeded=
. DVFS_SetVID=3D0x53<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.035383] NOTICE:=C2=A0 BL2: DDR3200(rev.0.34)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.046779] NOTICE:=C2=A0 BL2: [COLD_BOOT]<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.085117] NOTICE:=C2=A0 BL2: DRAM Split is 2ch<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.087812] NOTICE:=C2=A0 BL2: QoS is default settin=
g(rev.0.19)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.093315] NOTICE:=C2=A0 BL2: Lossy Decomp areas<br=
>
&gt; [=C2=A0=C2=A0=C2=A0 0.097489] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.104573] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.111485] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.118400] NOTICE:=C2=A0 BL2: v1.5(release):556a11e=
<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.122890] NOTICE:=C2=A0 BL2: Built : 18:03:48, Jan=
 11 2019<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.128077] NOTICE:=C2=A0 BL2: Normal boot<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.131718] NOTICE:=C2=A0 BL2: dst=3D0xe6321100 src=
=3D0x8180000 len=3D512(0x200)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.138106] NOTICE:=C2=A0 BL2: dst=3D0x43f00000 src=
=3D0x8180400 len=3D6144(0x1800)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.144726] NOTICE:=C2=A0 BL2: dst=3D0x44000000 src=
=3D0x81c0000 len=3D65536(0x10000)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.151952] NOTICE:=C2=A0 BL2: dst=3D0x44100000 src=
=3D0x8200000 len=3D1048576(0x100000)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.166777] NOTICE:=C2=A0 BL2: dst=3D0x50000000 src=
=3D0x8640000 len=3D1048576(0x100000)<br>
&gt; [=C2=A0=C2=A0=C2=A0 0.180752] NOTICE:=C2=A0 BL2: Booting BL31<br>
&gt; <br>
&gt; <br>
&gt; U-Boot 2018.09 (Jan 12 2019 - 03:03:43 +0900)<br>
It is a u-boot from Renesas Yocto 3.13. I would not recommend you using it.=
<br>
Seeing the problem below, it looks like u-boot messes with the device tree =
in a different way now.<br>
<br>
&gt; <br>
&gt; CPU: Renesas Electronics R8A7796 rev 1.0<br>
&gt; Model: Renesas M3ULCB board based on r8a7796<br>
&gt; DRAM:=C2=A0 1.9 GiB<br>
&gt; Bank #0: 0x048000000 - 0x07fffffff, 896 MiB<br>
&gt; Bank #1: 0x600000000 - 0x63fffffff, 1 GiB<br>
&gt; <br>
&gt; MMC:=C2=A0=C2=A0 sd@ee100000: 0, sd@ee140000: 1<br>
&gt; Loading Environment from MMC... communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; communication out of sync<br>
&gt; OK<br>
&gt; In:=C2=A0=C2=A0=C2=A0 serial@e6e88000<br>
&gt; Out:=C2=A0=C2=A0 serial@e6e88000<br>
&gt; Err:=C2=A0=C2=A0 serial@e6e88000<br>
&gt; Net:=C2=A0=C2=A0 eth0: ethernet@e6800000<br>
&gt; Hit any key to stop autoboot:=C2=A0 0<br>
&gt; ethernet@e6800000 Waiting for PHY auto negotiation to complete... done=
<br>
&gt; Using ethernet@e6800000 device<br>
&gt; TFTP from server 192.168.1.100; our IP address is 192.168.1.3<br>
&gt; Filename &#39;Image&#39;.<br>
&gt; Load address: 0x48080000<br>
&gt; Loading: #############################################################=
####<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
#############################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.7 MiB/s<br>
&gt; done<br>
&gt; Bytes transferred =3D 15911424 (f2ca00 hex)<br>
&gt; Using ethernet@e6800000 device<br>
&gt; TFTP from server 192.168.1.100; our IP address is 192.168.1.3<br>
&gt; Filename &#39;Image-r8a7796-m3ulcb.dtb&#39;.<br>
&gt; Load address: 0x48000000<br>
&gt; Loading: *<br>
&gt; TFTP error: &#39;File not found&#39; (1)<br>
&gt; Not retrying...<br>
&gt; ERROR: Did not find a cmdline Flattened Device Tree<br>
&gt; Could not find a valid device tree<br>
&gt; =3D&gt; setenv bootargs<br>
&gt; =3D&gt; tftp 0x48080000 xen-m3ulcb.uImage<br>
&gt; Using ethernet@e6800000 device<br>
&gt; TFTP from server 192.168.1.100; our IP address is 192.168.1.3<br>
&gt; Filename &#39;xen-m3ulcb.uImage&#39;.<br>
&gt; Load address: 0x48080000<br>
&gt; Loading: #############################################################=
##<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.3 MiB/s<br>
&gt; done<br>
&gt; Bytes transferred =3D 918928 (e0590 hex)<br>
&gt; =3D&gt; tftp 0x48000000 Image-r8a7796-m3ulcb-xen-local.dtb<br>
&gt; Using ethernet@e6800000 device<br>
&gt; TFTP from server 192.168.1.100; our IP address is 192.168.1.3<br>
&gt; Filename &#39;Image-r8a7796-m3ulcb-xen-local.dtb&#39;.<br>
&gt; Load address: 0x48000000<br>
&gt; Loading: #####<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.8 MiB/s<br>
&gt; done<br>
&gt; Bytes transferred =3D 68545 (10bc1 hex)<br>
&gt; =3D&gt; tftp 0x7a000000 Image-m3ulcb.bin<br>
&gt; Using ethernet@e6800000 device<br>
&gt; TFTP from server 192.168.1.100; our IP address is 192.168.1.3<br>
&gt; Filename &#39;Image-m3ulcb.bin&#39;.<br>
&gt; Load address: 0x7a000000<br>
&gt; Loading: #############################################################=
####<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
##################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############=
#################################################<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.1 MiB/s<br>
&gt; done<br>
&gt; Bytes transferred =3D 19059200 (122d200 hex)<br>
&gt; =3D&gt; bootm 0x48080000 - 0x48000000<br>
&gt; ## Booting kernel from Legacy Image at 48080000 ...<br>
&gt;=C2=A0 =C2=A0=C2=A0 Image Name:=C2=A0=C2=A0 XEN<br>
&gt;=C2=A0 =C2=A0=C2=A0 Image Type:=C2=A0=C2=A0 AArch64 Linux Kernel Image =
(uncompressed)<br>
&gt;=C2=A0 =C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 918864 Bytes =3D 897.3=
 KiB<br>
&gt;=C2=A0 =C2=A0=C2=A0 Load Address: 78080000<br>
&gt;=C2=A0 =C2=A0=C2=A0 Entry Point:=C2=A0 78080000<br>
&gt;=C2=A0 =C2=A0=C2=A0 Verifying Checksum ... OK<br>
&gt; ## Flattened Device Tree blob at 48000000<br>
&gt;=C2=A0 =C2=A0=C2=A0 Booting using the fdt blob at 0x48000000<br>
&gt;=C2=A0 =C2=A0=C2=A0 Loading Kernel Image ... OK<br>
&gt;=C2=A0 =C2=A0=C2=A0 Using Device Tree in place at 0000000048000000, end=
 0000000048013bc0<br>
&gt; <br>
&gt; Starting kernel ...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Xen 4.12-unstable<br>
&gt; (XEN) Xen version 4.12-unstable (<a href=3D"mailto:jelfn@waseda.jp" ta=
rget=3D"_blank">jelfn@waseda.jp</a> &lt;mailto:<a href=3D"mailto:jelfn@wase=
da.jp" target=3D"_blank">jelfn@waseda.jp</a>&gt;) (aarch64-poky-linux-gc9<b=
r>
&gt; (XEN) Latest ChangeSet: Mon Dec 17 09:22:59 2018 +0000 git:a5b0eb3-dir=
ty<br>
&gt; (XEN) Processor: 411fd073: &quot;ARM Limited&quot;, variant: 0x1, part=
 0xd07, rev 0x3<br>
&gt; (XEN) 64-bit Execution:<br>
&gt; (XEN)=C2=A0=C2=A0 Processor Features: 0000000000002222 000000000000000=
0<br>
&gt; (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Exception Levels: EL3:64+32 EL2:64+32 EL=
1:64+32 EL0:64+32<br>
&gt; (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Extensions: FloatingPoint AdvancedSIMD<b=
r>
&gt; (XEN)=C2=A0=C2=A0 Debug Features: 0000000010305106 0000000000000000<br=
>
&gt; (XEN)=C2=A0=C2=A0 Auxiliary Features: 0000000000000000 000000000000000=
0<br>
&gt; (XEN)=C2=A0=C2=A0 Memory Model Features: 0000000000001124 000000000000=
0000<br>
&gt; (XEN)=C2=A0=C2=A0 ISA Features:=C2=A0 0000000000011120 000000000000000=
0<br>
&gt; (XEN) 32-bit Execution:<br>
&gt; (XEN)=C2=A0=C2=A0 Processor Features: 00000131:00011011<br>
&gt; (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Instruction Sets: AArch32 A32 Thumb Thum=
b-2 Jazelle<br>
&gt; (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Extensions: GenericTimer Security<br>
&gt; (XEN)=C2=A0=C2=A0 Debug Features: 03010066<br>
&gt; (XEN)=C2=A0=C2=A0 Auxiliary Features: 00000000<br>
&gt; (XEN)=C2=A0=C2=A0 Memory Model Features: 10201105 40000000 01260000 02=
102211<br>
&gt; (XEN)=C2=A0 ISA Features: 02101110 13112111 21232042 01112131 00011142=
 00011121<br>
&gt; (XEN) Using SMC Calling Convention v1.1<br>
&gt; (XEN) Using PSCI v1.1<br>
&gt; (XEN) SMP: Allowing 6 CPUs<br>
&gt; (XEN)<br>
&gt; (XEN) ****************************************<br>
&gt; (XEN) Panic on CPU 0:<br>
&gt; (XEN) Timer: Unable to retrieve IRQ 0 from the device tree<br>
<br>
XEN failed to find timer node in the device tree. r8a7796.dtsi has timer no=
de described, so it must be u-boot changed dtb.<br>
We have scheduled switching to Renesas Yocto 3.13 soon, so will coupe with =
the issue.<br>
But for now I would recommend you using 3.9 at most.<br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
</blockquote></div></div></div></div></div></div></div></div></div></div></=
div></div>

--000000000000186fb1057ff3f9be--


--===============5880197647583217057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5880197647583217057==--
