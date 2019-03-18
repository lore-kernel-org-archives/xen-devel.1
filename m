From: Amit Tomer <amittomer25@gmail.com>
Subject: Running XEN on imx8mq
Date: Mon, 18 Mar 2019 13:09:06 +0530
Message-ID: <CABHD4K_TGznSkuX8T0tuBpqkcJnyyDtxrfa0YHGvz_t0BE3fAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0000000000006b3fb60584597cce"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hUHo=RV=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1h5mrg-0008UB-Sf
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 07:39:20 +0000
Received: by mail-oi1-x22f.google.com with SMTP id u12so9266316oiv.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2019 00:39:18 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, peng.fan@nxp.com
List-Id: xen-devel@lists.xenproject.org

--0000000000006b3fb60584597cce
Content-Type: text/plain; charset="UTF-8"

Hi,

Trying to run XEN on imx8mq which is different from imx8qm in term of
UART controller IP(attached is the debug code).

DTS used for host is :
https://github.com/boundarydevices/linux-imx6/blob/boundary-imx_4.9.x_2.0.0_ga/arch/arm64/boot/dts/freescale/fsl-imx8mq.dtsi

But , I see following issue:

=> setenv xen_addr_r 0x42000000 ;setenv fdt_addr_r 0x43000000;setenv
kernel_addr_r 0x40480000
=> setenv fdt_high 0xffffffff;fdt addr $fdt_addr_r;fdt resize
=> setenv xen_bootargs console=dtuart dom0_mem=1024M
=> setenv dom0_bootargs console=hvc0,115200n8 earlycon=xenboot debug
clk_ignore_unused root=/dev/mmcblk1p1 rw rootwait
=> fdt set /chosen xen,xen-bootargs \"$xen_bootargs\";
=> fdt set /chosen xen,dom0-bootargs \"$dom0_bootargs\";fdt mknode
/chosen modules
=> fdt set /chosen/modules '#address-cells' <1>;fdt set
/chosen/modules '#size-cells' <1>;fdt mknode /chosen/modules module@0
=> fdt set /chosen/modules/module@0 compatible "xen,linux-zimage"
"xen,multiboot-module"
=> fdt set /chosen/modules/module@0 reg < $kernel_addr_r 0x1800000 >
=>
=> booti ${xen_addr_r} - ${fdt_addr_r}
## Flattened Device Tree blob at 43000000
   Booting using the fdt blob at 0x43000000
   reserving fdt memory region: addr=43000000 size=d000
   Loading Device Tree to 00000000be510000, end 00000000be51ffff ... OK

Starting kernel ...

- UART enabled -
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000040000000 - 00000000bfffffff
(XEN)
(XEN) MODULE[0]: 00000000be510000 - 00000000be51d000 Device Tree
(XEN) MODULE[1]: 0000000040480000 - 0000000041c80000 Kernel
(XEN)  RESVD[0]: 0000000043000000 - 000000004300d000
(XEN)  RESVD[1]: 00000000be510000 - 00000000be51d000
(XEN)
(XEN)
(XEN) Command line: console=dtuart dom0_mem=1024M
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Taking dtuart configuration from /chosen/stdout-path
(XEN) Looking for dtuart at "/serial@30860000", options ""
(XEN) Unable to initialize dtuart: -9
(XEN) Bad console= option 'dtuart'
 Xen 4.12.0-rc
(XEN) Xen version 4.12.0-rc (amit@) (aarch64-linux-gnu-gcc (Linaro GCC
7.3-2018.05) 7.3.1 20180425 [linaro-7.3-2018.05 revision
d29120a424ecfbc167ef90065c0eeb7f91977701]) debug=y  Mon Mar 18
12:30:38 I9
(XEN) Latest ChangeSet: Tue Mar 5 12:48:52 2019 +0000 git:4deeaf2-dirty
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000001002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:10011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v1.0
(XEN) SMP: Allowing 4 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 8333 KHz
(XEN) GICv3 initialization:
(XEN)       gic_dist_addr=0x00000038800000
(XEN)       gic_maintenance_irq=25
(XEN)       gic_rdist_stride=0
(XEN)       gic_rdist_regions=1
(XEN)       redistributor regions:
(XEN)         - region 0: 0x00000038880000 - 0x00000038940000
(XEN) GICv3: 160 lines, (IID 0001143b).
(XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001a000
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Allocated console ring of 32 KiB.
(XEN) Bringing up CPU1
- CPU 00000001 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) GICv3: CPU1: Found redistributor in region 0 @000000004003a000
(XEN) Adding cpu 1 to runqueue 0
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 00000002 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) GICv3: CPU2: Found redistributor in region 0 @000000004005a000
(XEN) Adding cpu 2 to runqueue 0
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
- CPU 00000003 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) GICv3: CPU3: Found redistributor in region 0 @000000004007a000
(XEN) Adding cpu 3 to runqueue 0
(XEN) CPU 3 booted.
(XEN) Brought up 4 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: d884da2ad279978f5b120cd02aca4034d898f133
(XEN) alternatives: Patching with alt table 00000000002abbf8 -> 00000000002ac240
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading Domd0 kernel from boot module @ 0000000040480000
(XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
(XEN) BANK[0] 0x00000060000000-0x000000a0000000 (1024MB)
(XEN) Grant table range: 0x00000042000000-0x00000042040000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000040480000 to 0000000060080000-0000000061880000
(XEN) dom0 IPA 0x0000000060080000
(XEN) P2M @ 0000000801bff4a0 mfn:0xbffcc
(XEN) Using concatenated root table 0
(XEN) 1ST[0x1] = 0x02c00000400006fd
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Unable to copy the kernel in the hwdom memory
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

--0000000000006b3fb60584597cce
Content-Type: application/octet-stream; name="debug-imx8mq.inc"
Content-Disposition: attachment; filename="debug-imx8mq.inc"
Content-Transfer-Encoding: base64
Content-ID: <f_jte1edl80>
X-Attachment-Id: f_jte1edl80

LyoKICogeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlteDhtcS5pbmMKICoKICogSU1YOE1RIHNw
ZWNpZmljIGRlYnVnIGNvZGUuCiAqCiAqIENvcHlyaWdodCAoYykgMjAxOSwgQW1pdCBTaW5naCBU
b21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPi4KICoKICogVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogKiBtb2RpZnkgaXQgdW5k
ZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKICog
TGljZW5zZSwgdmVyc2lvbiAyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91
bmRhdGlvbi4KICoKICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsCiAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91
dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRO
RVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCiAqIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICoKICogWW91IHNob3VsZCBoYXZlIHJlY2Vp
dmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCiAqIExpY2Vuc2UgYWxvbmcgd2l0
aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMv
Pi4KICovCgojZGVmaW5lIElNWF9VQVJUX1VUU19SRUcgICAgICAgIDB4YjQKI2RlZmluZSBJTVhf
VUFSVF9VVFhEX1JFRyAgICAgICAweDQwCiNkZWZpbmUgSU1YX1VBUlRfVVRTX1RYRlVMTCAgICAg
NAojZGVmaW5lIElNWF9VQVJUX1VUU19UWEVNUFRZICAgIDYKCi8qCiAqIElNWDhNUSBVQVJUIHdh
aXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFuc21pdAogKiB4YjogcmVnaXN0ZXIgd2hpY2ggY29u
dGFpbnMgdGhlIFVBUlQgYmFzZSBhZGRyZXNzCiAqIGM6IHNjcmF0Y2ggcmVnaXN0ZXIKICovCi5t
YWNybyBlYXJseV91YXJ0X3JlYWR5IHhiIGMKMToKICAgICAgICBsZHIgICAgIHdcYywgW1x4Yiwg
I0lNWF9VQVJUX1VUU19SRUddICAgICAgICAvKiBVQVJUIFRlc3QgUmVnaXN0ZXIgKi8KICAgICAg
ICB0YnogICAgd1xjLCAjSU1YX1VBUlRfVVRTX1RYRU1QVFksIDFiICAgICAgICAvKiBDaGVjayBU
WEVNUFRZIGJpdCAqLwouZW5kbQoKLyoKICogSU1YOE1RIFVBUlQgdHJhbnNtaXQgY2hhcmFjdGVy
CiAqIHhiOiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKICog
d3Q6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBjaGFyYWN0ZXIgdG8gdHJhbnNtaXQKICov
Ci5tYWNybyBlYXJseV91YXJ0X3RyYW5zbWl0IHhiIHd0CglzdHIgICAgXHd0LCBbXHhiLCAjSU1Y
X1VBUlRfVVRYRF9SRUddCi5lbmRtCgovKgogKiBMb2NhbCB2YXJpYWJsZXM6CiAqIG1vZGU6IEFT
TQogKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKICogRW5kOgogKi8K
--0000000000006b3fb60584597cce
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--0000000000006b3fb60584597cce--
