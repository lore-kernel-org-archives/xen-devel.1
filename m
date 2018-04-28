From: Ajay Garg <ajaygargnsit@gmail.com>
Subject: [cubieboard2] Bringing up dom0
Date: Sat, 28 Apr 2018 22:42:19 +0530
Message-ID: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6497950032873000924=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5x+0=hr=gmail.com=ajaygargnsit@srs-us1.protection.inumbo.net>)
 id 1fCTOa-0005nN-DI
 for xen-devel@lists.xenproject.org; Sat, 28 Apr 2018 17:12:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6497950032873000924==
Content-Type: multipart/alternative; boundary="00000000000029e6f3056aebb99b"

--00000000000029e6f3056aebb99b
Content-Type: text/plain; charset="UTF-8"

Hi All.

We have brought up the cubieboard2 from almost scratch, following are the
steps done :


== u-boot ==

u-boot has been compiled using bleeding-edge mainline
(ec5c4a8fd64a178a4d159917cda0aa176e5a9be5), via :

* make Cubieboard2_defconfig
* make ARCH=arm
CROSS_COMPILE=/home/ajay/arm-toolchain-6.2/arm-linux-gnueabihf-

This gives us u-boot-sunxi-with-spl.bin



== kernel ==

kernel also has been compiled using bleeding-edge mainline
(6d08b06e67cd117f6992c46611dfb4ce267cd71e) via :

* make clean
* make ARCH=arm sunxi_defconfig menuconfig

  In the menu, enabled following additional features :

  * General setup => System V IPC
  * General setup => POSIX Message Queues
  * Kernel features => Xen guest support on ARM


* make -j$(nproc) ARCH=arm
CROSS_COMPILE=/home/ajay/arm-toolchain-6.2/arm-linux-gnueabihf- zImage
* make -j$(nproc) ARCH=arm
CROSS_COMPILE=/home/ajay/arm-toolchain-6.2/arm-linux-gnueabihf-
sun7i-a20-cubieboard2.dtb

This gives us zImage and sun7i-a20-cubieboard2.dtb.



== integration, and starting up ==

Followed the steps as per
https://github.com/maronai/cubieboard/wiki/3.1.-Compiling-mainline-kernel-for-CubieBoard2-and-CubieTruck,
but with following differences :

a)
Used u-boot-sunxi-with-spl.bin, zImage, sun7i-a20-cubieboard2.dtb from
above steps.

b)
Used (and compiled to boot.scr) the following boot.cmd :

fatload mmc 0 0x46000000 zImage
fatload mmc 0 0x49000000 sun7i-a20-cubieboard2.dtb
setenv bootargs console=ttyS0,115200 rw root=/dev/mmcblk0p2
bootz 0x46000000 - 0x49000000

c)
Extracted debian-wheezy-7.5-armhf.com-20140603.tar to the rootfs partition
on the sd-card.

d)
Finally, inserted the sdcard in cubieboard2, following are the brief bootup
logs :

##################################################################
U-Boot SPL 2018.05-rc2-00118-gec5c4a8 (Apr 28 2018 - 08:40:48
+0530)
DRAM: 1024
MiB
CPU: 912000000Hz, AXI/AHB/APB:
3/2/2
Trying to boot from
MMC1




U-Boot 2018.05-rc2-00118-gec5c4a8 (Apr 28 2018 - 08:40:48 +0530) Allwinner
Techy


CPU:   Allwinner A20
(SUN7I)
Model: Cubietech
Cubieboard2
I2C:
ready
DRAM:  1
GiB
MMC:   SUNXI SD/MMC:
0
Loading Environment from FAT... *** Warning - bad CRC, using default
environment


Failed
(-5)
In:
serial
Out:
serial
Err:
serial
SCSI:  SATA link 0
timeout.
AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl SATA
mode
flags: ncq stag pm led clo only pmp pio slum part ccc
apst
Net:   eth0: ethernet@01c50000

starting
USB...
USB0:   USB EHCI
1.00
USB1:   USB OHCI
1.0
USB2:   USB EHCI
1.00
USB3:   USB OHCI
1.0
scanning bus 0 for devices... 1 USB Device(s)
found
scanning bus 2 for devices... 1 USB Device(s)
found
       scanning usb for storage devices... 0 Storage Device(s)
found
Hit any key to stop autoboot:
0
switch to partitions #0,
OK
mmc0 is current
device
Scanning mmc
0:1...
Found U-Boot script
/boot.scr
245 bytes read in 12 ms (19.5
KiB/s)
## Executing script at
43100000
4076736 bytes read in 247 ms (15.7
MiB/s)
26147 bytes read in 24 ms (1
MiB/s)
## Flattened Device Tree blob at
49000000
   Booting using the fdt blob at
0x49000000
   Loading Device Tree to 49ff6000, end 49fff622 ...
OK


Starting kernel
...


[    0.000000] Booting Linux on physical CPU
0x0
[    0.000000] Linux version 4.17.0-rc2 (ajay@latitude-3480) (gcc version
6.2.18
[    0.000000] CPU: ARMv7 Processor [410fc074] revision 4 (ARMv7),
cr=10c5387d
[    0.000000] CPU: div instructions available: patching division
code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instructie
[    0.000000] OF: fdt: Machine model: Cubietech
Cubieboard2
[    0.000000] Memory policy: Data cache
writealloc
[    0.000000] cma: Reserved 16 MiB at
0x7f000000
[    0.000000] psci: probing for conduit method from
DT.
[    0.000000] psci: Using PSCI v0.1 Function IDs from
DT
[    0.000000] random: get_random_bytes called from start_kernel+0xa0/0x3fc
wit0
[    0.000000] percpu: Embedded 16 pages/cpu @(ptrval) s34764 r8192 d22580
u6556
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
260608
[    0.000000] Kernel command line: console=ttyS0,115200 rw
root=/dev/mmcblk0p2
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144
bytes)
[    0.000000] Memory: 1013064K/1048576K available (6144K kernel code, 427K
rwd)
[    0.000000] Virtual kernel memory
layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4
kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072
kB)
[    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240
MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768
MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2
MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14
MB)
[    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (7136
kB)
[    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024
kB)
[    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 428
kB)
[    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 250
kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2,
Nodes=1
[    0.000000] Hierarchical RCU implementation.
##################################################################

Board came up, and we then sshed onto the board.



== getting xen ready ==

i)
Compiled xen on cubieboard itself, via :

   * git clone git://xenbits.xen.org/xen.git
   * cd xen
.  * ./configure --libdir=/usr/lib
   * make debball CONFIG_EARLY_PRINTK=sun7i -j4
   * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb
   * sudo reboot

ii)
Upon reboot, "sudo xl list" gives following :

##################################################################
debian@debian-armhf:~$ sudo  xl list
[sudo] password for debian:
xencall: error: Could not obtain handle on privileged command interface: No
such file or directory
libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
such file or directory
cannot init xl context
##################################################################



Now, we want to bring up the dom0 for xen.
I have gone through
https://xenbits.xen.org/docs/unstable/misc/arm/device-tree/booting.txt, but
am not sure what exact changes are needed.

As mentioned somewhere at the last in the link, we would prefer if no
changes in uboot are required, and the dom0-bootup can be achieved by only
changing the dt(s/b) file at
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts

Will be grateful for help.


Thanks and Regards,
Ajay

--00000000000029e6f3056aebb99b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBBbGwuPGJyPjxicj5XZSBoYXZlIGJyb3VnaHQgdXAgdGhl
IGN1YmllYm9hcmQyIGZyb20gYWxtb3N0IHNjcmF0Y2gsIGZvbGxvd2luZyBhcmUgdGhlIHN0ZXBz
IGRvbmUgOjxicj48YnI+PGJyPj09IHUtYm9vdCA9PTxicj48YnI+dS1ib290IGhhcyBiZWVuIGNv
bXBpbGVkIHVzaW5nIGJsZWVkaW5nLWVkZ2UgbWFpbmxpbmUgKGVjNWM0YThmZDY0YTE3OGE0ZDE1
OTkxN2NkYTBhYTE3NmU1YTliZTUpLCB2aWEgOjxicj48YnI+KiBtYWtlIEN1YmllYm9hcmQyX2Rl
ZmNvbmZpZzxicj4qIG1ha2UgQVJDSD1hcm0gQ1JPU1NfQ09NUElMRT0vaG9tZS9hamF5L2FybS10
b29sY2hhaW4tNi4yL2FybS1saW51eC1nbnVlYWJpaGYtPGJyPjxicj5UaGlzIGdpdmVzIHVzIHUt
Ym9vdC1zdW54aS13aXRoLXNwbC5iaW48YnI+PGJyPjxicj48YnI+PT0ga2VybmVsID09PGJyPjxi
cj5rZXJuZWwgYWxzbyBoYXMgYmVlbiBjb21waWxlZCB1c2luZyBibGVlZGluZy1lZGdlIG1haW5s
aW5lICg2ZDA4YjA2ZTY3Y2QxMTdmNjk5MmM0NjYxMWRmYjRjZTI2N2NkNzFlKSB2aWEgOjxicj48
YnI+KiBtYWtlIGNsZWFuPGJyPiogbWFrZSBBUkNIPWFybSBzdW54aV9kZWZjb25maWcgbWVudWNv
bmZpZzxicj48YnI+PC9kaXY+PGRpdj7CoCBJbiB0aGUgbWVudSwgZW5hYmxlZCBmb2xsb3dpbmcg
YWRkaXRpb25hbCBmZWF0dXJlcyA6PGJyPjxicj48L2Rpdj48ZGl2PsKgICogR2VuZXJhbCBzZXR1
cCA9Jmd0OyBTeXN0ZW0gViBJUEM8YnI+PC9kaXY+PGRpdj7CoCAqIEdlbmVyYWwgc2V0dXAgPSZn
dDsgUE9TSVggTWVzc2FnZSBRdWV1ZXM8YnI+PC9kaXY+PGRpdj7CoCAqIEtlcm5lbCBmZWF0dXJl
cyA9Jmd0OyBYZW4gZ3Vlc3Qgc3VwcG9ydCBvbiBBUk08YnI+PC9kaXY+PGRpdj48YnI+PGJyPiog
bWFrZSAtaiQobnByb2MpIEFSQ0g9YXJtIENST1NTX0NPTVBJTEU9L2hvbWUvYWpheS9hcm0tdG9v
bGNoYWluLTYuMi9hcm0tbGludXgtZ251ZWFiaWhmLSB6SW1hZ2U8YnI+KiBtYWtlIC1qJChucHJv
YykgQVJDSD1hcm0gQ1JPU1NfQ09NUElMRT0vaG9tZS9hamF5L2FybS10b29sY2hhaW4tNi4yL2Fy
bS1saW51eC1nbnVlYWJpaGYtIHN1bjdpLWEyMC1jdWJpZWJvYXJkMi5kdGI8YnI+PGJyPlRoaXMg
Z2l2ZXMgdXMgekltYWdlIGFuZCBzdW43aS1hMjAtY3ViaWVib2FyZDIuZHRiLjxicj48YnI+PGJy
Pjxicj49PSBpbnRlZ3JhdGlvbiwgYW5kIHN0YXJ0aW5nIHVwID09PGJyPjxicj5Gb2xsb3dlZCB0
aGUgc3RlcHMgYXMgcGVyIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9tYXJvbmFpL2N1Ymll
Ym9hcmQvd2lraS8zLjEuLUNvbXBpbGluZy1tYWlubGluZS1rZXJuZWwtZm9yLUN1YmllQm9hcmQy
LWFuZC1DdWJpZVRydWNrIj5odHRwczovL2dpdGh1Yi5jb20vbWFyb25haS9jdWJpZWJvYXJkL3dp
a2kvMy4xLi1Db21waWxpbmctbWFpbmxpbmUta2VybmVsLWZvci1DdWJpZUJvYXJkMi1hbmQtQ3Vi
aWVUcnVjazwvYT4sIGJ1dCB3aXRoIGZvbGxvd2luZyBkaWZmZXJlbmNlcyA6PGJyPjxicj5hKTxi
cj5Vc2VkIHUtYm9vdC1zdW54aS13aXRoLXNwbC5iaW4sIHpJbWFnZSwgc3VuN2ktYTIwLWN1Ymll
Ym9hcmQyLmR0YiBmcm9tIGFib3ZlIHN0ZXBzLjxicj48YnI+Yik8YnI+VXNlZCAoYW5kIGNvbXBp
bGVkIHRvIGJvb3Quc2NyKSB0aGUgZm9sbG93aW5nIGJvb3QuY21kIDo8YnI+PGJyPmZhdGxvYWQg
bW1jIDAgMHg0NjAwMDAwMCB6SW1hZ2U8YnI+ZmF0bG9hZCBtbWMgMCAweDQ5MDAwMDAwIHN1bjdp
LWEyMC1jdWJpZWJvYXJkMi5kdGI8YnI+c2V0ZW52IGJvb3RhcmdzIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIHJ3IHJvb3Q9L2Rldi9tbWNibGswcDI8YnI+Ym9vdHogMHg0NjAwMDAwMCAtIDB4NDkwMDAw
MDA8YnI+PGJyPmMpPGJyPkV4dHJhY3RlZCBkZWJpYW4td2hlZXp5LTcuNS1hcm1oZi5jb20tMjAx
NDA2MDMudGFyIHRvIHRoZSByb290ZnMgcGFydGl0aW9uIG9uIHRoZSBzZC1jYXJkLjxicj48YnI+
ZCk8YnI+RmluYWxseSwgaW5zZXJ0ZWQgdGhlIHNkY2FyZCBpbiBjdWJpZWJvYXJkMiwgZm9sbG93
aW5nIGFyZSB0aGUgYnJpZWYgYm9vdHVwIGxvZ3MgOjxicj48YnI+IyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPlUtQm9v
dCBTUEwgMjAxOC4wNS1yYzItMDAxMTgtZ2VjNWM0YTggKEFwciAyOCAyMDE4IC0gMDg6NDA6NDgg
KzA1MzApwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+RFJBTTogMTAyNCBNaULCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxicj5DUFU6IDkxMjAwMDAwMEh6LCBBWEkvQUhCL0FQQjogMy8yLzLCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+VHJ5aW5nIHRvIGJvb3QgZnJvbSBNTUMxwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+VS1Cb290IDIwMTguMDUtcmMyLTAwMTE4
LWdlYzVjNGE4IChBcHIgMjggMjAxOCAtIDA4OjQwOjQ4ICswNTMwKSBBbGx3aW5uZXIgVGVjaHk8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkNQVTrC
oMKgIEFsbHdpbm5lciBBMjAgKFNVTjdJKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+TW9kZWw6IEN1YmlldGVjaCBDdWJpZWJvYXJkMsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+STJDOsKgwqAgcmVhZHnCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8YnI+RFJBTTrCoCAxIEdpQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxi
cj5NTUM6wqDCoCBTVU5YSSBTRC9NTUM6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkxvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBG
QVQuLi4gKioqIFdhcm5pbmcgLSBiYWQgQ1JDLCB1c2luZyBkZWZhdWx0IGVudmlyb25tZW50PGJy
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5GYWlsZWQg
KC01KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkluOsKgwqDCoCBzZXJpYWzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPk91dDrCoMKgIHNlcmlhbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+RXJyOsKg
wqAgc2VyaWFswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5TQ1NJOsKgIFNBVEEgbGluayAwIHRpbWVv
dXQuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkFI
Q0kgMDAwMS4wMTAwIDMyIHNsb3RzIDEgcG9ydHMgMyBHYnBzIDB4MSBpbXBsIFNBVEEgbW9kZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5mbGFnczogbmNx
IHN0YWcgcG0gbGVkIGNsbyBvbmx5IHBtcCBwaW8gc2x1bSBwYXJ0IGNjYyBhcHN0wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5OZXQ6wqDCoCBldGgwOiBldGhl
cm5ldEAwMWM1MDAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxi
cj5zdGFydGluZyBVU0IuLi7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+VVNCMDrCoMKgIFVTQiBFSENJIDEu
MDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8YnI+VVNCMTrCoMKgIFVTQiBPSENJIDEuMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlVTQjI6wqDCoCBVU0IgRUhD
SSAxLjAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPlVTQjM6wqDCoCBVU0IgT0hDSSAxLjDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5zY2FubmluZyBidXMg
MCBmb3IgZGV2aWNlcy4uLiAxIFVTQiBEZXZpY2UocykgZm91bmTCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+c2Nhbm5pbmcgYnVzIDIg
Zm9yIGRldmljZXMuLi4gMSBVU0IgRGV2aWNlKHMpIGZvdW5kwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgwqDCoMKgwqDCoCBzY2Fu
bmluZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAwIFN0b3JhZ2UgRGV2aWNlKHMpIGZvdW5k
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+SGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDrC
oCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+c3dpdGNoIHRvIHBh
cnRpdGlvbnMgIzAsIE9LwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPGJyPm1tYzAgaXMgY3VycmVudCBkZXZpY2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlNjYW5uaW5nIG1tYyAwOjEuLi7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPGJyPkZvdW5kIFUtQm9vdCBzY3JpcHQgL2Jvb3Quc2NywqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+MjQ1IGJ5dGVzIHJlYWQgaW4gMTIgbXMgKDE5
LjUgS2lCL3MpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPiMjIEV4ZWN1dGluZyBz
Y3JpcHQgYXQgNDMxMDAwMDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PGJyPjQwNzY3MzYgYnl0ZXMgcmVhZCBpbiAyNDcgbXMgKDE1LjcgTWlCL3MpwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8YnI+MjYxNDcgYnl0ZXMgcmVhZCBpbiAyNCBtcyAoMSBNaUIvcynCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj4jIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBh
dCA0OTAwMDAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgwqAgQm9vdGluZyB1c2luZyB0aGUg
ZmR0IGJsb2IgYXQgMHg0OTAwMDAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoCBMb2FkaW5nIERl
dmljZSBUcmVlIHRvIDQ5ZmY2MDAwLCBlbmQgNDlmZmY2MjIgLi4uIE9LwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+U3RhcnRpbmcga2VybmVsIC4uLsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlvCoMKg
wqAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXggb24gcGh5c2ljYWwgQ1BVIDB4MMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5b
wqDCoMKgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDQuMTcuMC1yYzIgKGFqYXlAbGF0aXR1ZGUt
MzQ4MCkgKGdjYyB2ZXJzaW9uIDYuMi4xODxicj5bwqDCoMKgIDAuMDAwMDAwXSBDUFU6IEFSTXY3
IFByb2Nlc3NvciBbNDEwZmMwNzRdIHJldmlzaW9uIDQgKEFSTXY3KSwgY3I9MTBjNTM4N2TCoCA8
YnI+W8KgwqDCoCAwLjAwMDAwMF0gQ1BVOiBkaXYgaW5zdHJ1Y3Rpb25zIGF2YWlsYWJsZTogcGF0
Y2hpbmcgZGl2aXNpb24gY29kZcKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+W8KgwqDCoCAwLjAwMDAw
MF0gQ1BVOiBQSVBUIC8gVklQVCBub25hbGlhc2luZyBkYXRhIGNhY2hlLCBWSVBUIGFsaWFzaW5n
IGluc3RydWN0aWU8YnI+W8KgwqDCoCAwLjAwMDAwMF0gT0Y6IGZkdDogTWFjaGluZSBtb2RlbDog
Q3ViaWV0ZWNoIEN1YmllYm9hcmQywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPGJyPlvCoMKgwqAgMC4wMDAwMDBdIE1lbW9yeSBwb2xpY3k6IERhdGEgY2FjaGUgd3JpdGVh
bGxvY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDxicj5bwqDCoMKgIDAuMDAwMDAwXSBjbWE6IFJlc2VydmVkIDE2IE1pQiBhdCAweDdmMDAw
MDAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxicj5bwqDCoMKgIDAuMDAwMDAwXSBwc2NpOiBwcm9iaW5nIGZvciBjb25kdWl0IG1l
dGhvZCBmcm9tIERULsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPGJyPlvCoMKgwqAgMC4wMDAwMDBdIHBzY2k6IFVzaW5nIFBTQ0kgdjAuMSBGdW5jdGlvbiBJ
RHMgZnJvbSBEVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxi
cj5bwqDCoMKgIDAuMDAwMDAwXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZyb20g
c3RhcnRfa2VybmVsKzB4YTAvMHgzZmMgd2l0MDxicj5bwqDCoMKgIDAuMDAwMDAwXSBwZXJjcHU6
IEVtYmVkZGVkIDE2IHBhZ2VzL2NwdSBAKHB0cnZhbCkgczM0NzY0IHI4MTkyIGQyMjU4MCB1NjU1
Njxicj5bwqDCoMKgIDAuMDAwMDAwXSBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxpdHkgZ3JvdXBp
bmcgb24uwqAgVG90YWwgcGFnZXM6IDI2MDYwOMKgwqDCoCA8YnI+W8KgwqDCoCAwLjAwMDAwMF0g
S2VybmVsIGNvbW1hbmQgbGluZTogY29uc29sZT10dHlTMCwxMTUyMDAgcncgcm9vdD0vZGV2L21t
Y2JsazBwMiA8YnI+W8KgwqDCoCAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50
cmllczogMTMxMDcyIChvcmRlcjogNywgNTI0Mjg4IGJ5dGVzKSA8YnI+W8KgwqDCoCAwLjAwMDAw
MF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA2NTUzNiAob3JkZXI6IDYsIDI2MjE0
NCBieXRlcynCoMKgIDxicj5bwqDCoMKgIDAuMDAwMDAwXSBNZW1vcnk6IDEwMTMwNjRLLzEwNDg1
NzZLIGF2YWlsYWJsZSAoNjE0NEsga2VybmVsIGNvZGUsIDQyN0sgcndkKTxicj5bwqDCoMKgIDAu
MDAwMDAwXSBWaXJ0dWFsIGtlcm5lbCBtZW1vcnkgbGF5b3V0OsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlvC
oMKgwqAgMC4wMDAwMDBdwqDCoMKgwqAgdmVjdG9ywqAgOiAweGZmZmYwMDAwIC0gMHhmZmZmMTAw
MMKgwqAgKMKgwqAgNCBrQinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlvCoMKg
wqAgMC4wMDAwMDBdwqDCoMKgwqAgZml4bWFwwqAgOiAweGZmYzAwMDAwIC0gMHhmZmYwMDAwMMKg
wqAgKDMwNzIga0IpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5bwqDCoMKgIDAu
MDAwMDAwXcKgwqDCoMKgIHZtYWxsb2MgOiAweGYwODAwMDAwIC0gMHhmZjgwMDAwMMKgwqAgKCAy
NDAgTUIpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5bwqDCoMKgIDAuMDAwMDAw
XcKgwqDCoMKgIGxvd21lbcKgIDogMHhjMDAwMDAwMCAtIDB4ZjAwMDAwMDDCoMKgICggNzY4IE1C
KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+W8KgwqDCoCAwLjAwMDAwMF3CoMKg
wqDCoCBwa21hcMKgwqAgOiAweGJmZTAwMDAwIC0gMHhjMDAwMDAwMMKgwqAgKMKgwqAgMiBNQinC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlvCoMKgwqAgMC4wMDAwMDBdwqDCoMKg
wqAgbW9kdWxlcyA6IDB4YmYwMDAwMDAgLSAweGJmZTAwMDAwwqDCoCAowqAgMTQgTUIpwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5bwqDCoMKgIDAuMDAwMDAwXcKgwqDCoMKgwqDC
oCAudGV4dCA6IDB4KHB0cnZhbCkgLSAweChwdHJ2YWwpwqDCoCAoNzEzNiBrQinCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlvCoMKgwqAgMC4wMDAwMDBdwqDCoMKgwqDCoMKgIC5p
bml0IDogMHgocHRydmFsKSAtIDB4KHB0cnZhbCnCoMKgICgxMDI0IGtCKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8YnI+W8KgwqDCoCAwLjAwMDAwMF3CoMKgwqDCoMKgwqAgLmRhdGEg
OiAweChwdHJ2YWwpIC0gMHgocHRydmFsKcKgwqAgKCA0Mjgga0IpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDxicj5bwqDCoMKgIDAuMDAwMDAwXcKgwqDCoMKgwqDCoMKgIC5ic3MgOiAw
eChwdHJ2YWwpIC0gMHgocHRydmFsKcKgwqAgKCAyNTAga0IpwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDxicj5bwqDCoMKgIDAuMDAwMDAwXSBTTFVCOiBIV2FsaWduPTY0LCBPcmRlcj0w
LTMsIE1pbk9iamVjdHM9MCwgQ1BVcz0yLCBOb2Rlcz0xwqDCoMKgwqDCoMKgIDxicj5bwqDCoMKg
IDAuMDAwMDAwXSBIaWVyYXJjaGljYWwgUkNVIGltcGxlbWVudGF0aW9uLsKgIDxicj4jIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyM8YnI+PGJyPjwvZGl2PkJvYXJkIGNhbWUgdXAsIGFuZCB3ZSB0aGVuIHNzaGVkIG9udG8gdGhl
IGJvYXJkLjxicj48ZGl2Pjxicj48YnI+PC9kaXY+PGRpdj48YnI+PT0gZ2V0dGluZyB4ZW4gcmVh
ZHkgPT08YnI+PGJyPjwvZGl2PjxkaXY+aSk8YnI+PC9kaXY+PGRpdj5Db21waWxlZCB4ZW4gb24g
Y3ViaWVib2FyZCBpdHNlbGYsIHZpYSA6PGJyPjxicj7CoMKgICogZ2l0IGNsb25lIGdpdDovLzxh
IGhyZWY9Imh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdCI+eGVuYml0cy54ZW4ub3JnL3hl
bi5naXQ8L2E+PGJyPsKgwqAgKiBjZCB4ZW48YnI+LsKgICogLi9jb25maWd1cmUgLS1saWJkaXI9
L3Vzci9saWI8YnI+wqDCoCAqIG1ha2UgZGViYmFsbCBDT05GSUdfRUFSTFlfUFJJTlRLPXN1bjdp
IC1qNDxicj48L2Rpdj48ZGl2PsKgwqAgKiBzdWRvIGRwa2cgLWkgZGlzdC94ZW4tdXBzdHJlYW0t
NC4xMS11bnN0YWJsZS5kZWI8YnI+PC9kaXY+PGRpdj7CoMKgICogc3VkbyByZWJvb3Q8YnI+PGJy
PjwvZGl2PjxkaXY+aWkpPGJyPjwvZGl2PjxkaXY+VXBvbiByZWJvb3QsICZxdW90O3N1ZG8geGwg
bGlzdCZxdW90OyBnaXZlcyBmb2xsb3dpbmcgOjxicj48YnI+IyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjPGJyPmRlYmlhbkBk
ZWJpYW4tYXJtaGY6fiQgc3Vkb8KgIHhsIGxpc3Q8YnI+W3N1ZG9dIHBhc3N3b3JkIGZvciBkZWJp
YW46PGJyPnhlbmNhbGw6IGVycm9yOiBDb3VsZCBub3Qgb2J0YWluIGhhbmRsZSBvbiBwcml2aWxl
Z2VkIGNvbW1hbmQgaW50ZXJmYWNlOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5PGJyPmxpYnhs
OiBlcnJvcjogbGlieGwuYzoxMDI6bGlieGxfY3R4X2FsbG9jOiBjYW5ub3Qgb3BlbiBsaWJ4YyBo
YW5kbGU6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnk8YnI+Y2Fubm90IGluaXQgeGwgY29udGV4
dDxicj4jIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyM8YnI+PC9kaXY+PGRpdj7CoMKgIDxicj48YnI+PGJyPjwvZGl2PjxkaXY+
Tm93LCB3ZSB3YW50IHRvIGJyaW5nIHVwIHRoZSBkb20wIGZvciB4ZW4uPGJyPjwvZGl2PjxkaXY+
SSBoYXZlIGdvbmUgdGhyb3VnaCA8YSBocmVmPSJodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2Nz
L3Vuc3RhYmxlL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0Ij5odHRwczovL3hlbmJp
dHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0
PC9hPiwgYnV0IGFtIG5vdCBzdXJlIHdoYXQgZXhhY3QgY2hhbmdlcyBhcmUgbmVlZGVkLjxicj48
YnI+PC9kaXY+PGRpdj5BcyBtZW50aW9uZWQgc29tZXdoZXJlIGF0IHRoZSBsYXN0IGluIHRoZSBs
aW5rLCB3ZSB3b3VsZCBwcmVmZXIgaWYgbm8gY2hhbmdlcyBpbiB1Ym9vdCBhcmUgcmVxdWlyZWQs
IGFuZCB0aGUgZG9tMC1ib290dXAgY2FuIGJlIGFjaGlldmVkIGJ5IG9ubHkgY2hhbmdpbmcgdGhl
IGR0KHMvYikgZmlsZSBhdCA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGlu
dXgvYmxvYi9tYXN0ZXIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuN2ktYTIwLWN1YmllYm9hcmQyLmR0
cyI+aHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJt
L2Jvb3QvZHRzL3N1bjdpLWEyMC1jdWJpZWJvYXJkMi5kdHM8L2E+PGJyPjxicj48L2Rpdj48ZGl2
PldpbGwgYmUgZ3JhdGVmdWwgZm9yIGhlbHAuPGJyPjxicj48YnI+PC9kaXY+PGRpdj5UaGFua3Mg
YW5kIFJlZ2FyZHMsPGJyPjwvZGl2PjxkaXY+QWpheTxicj48L2Rpdj48L2Rpdj4NCg==
--00000000000029e6f3056aebb99b--


--===============6497950032873000924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6497950032873000924==--
