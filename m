From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Wed, 26 Dec 2018 01:07:23 +0900
Message-ID: <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6223685749857072855=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

--===============6223685749857072855==
Content-Type: multipart/alternative; boundary="000000000000c29fe9057dd3335c"

--000000000000c29fe9057dd3335c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrii,

Thank you for your response.

I am sorry for not being able to make time to answer sooner.

Hello to everyone from the Xen Development mailing list.

As I told Andrii, I am interested in RT Xen, but before getting anywhere
near that, I need to actually get my board to use Xen.

As a total newcomer to these boards and knowing that Xen is a little
complex to get running, I am sure there are a lot of steps that I am either
doing wrong, or have made the wrong assumptions.

The SoC information of the R-Car H3 I have is below:

CPU: Renesas Electronics R8A7795 rev 2.0
Board: H3ULCB
I2C:   ready
DRAM:  3.9 GiB
MMC:   sh-sdhi: 0, sh-sdhi: 1
In:    serial
Out:   serial
Err:   serial
Net:   ravb
Hit any key to stop autoboot:  0
=3D> [    0.000158] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57)
Rev.1.0.16
[    0.005718] NOTICE:  BL2: PRR is R-Car H3 Ver2.0
[    0.010301] NOTICE:  BL2: Board is Starter Kit Rev1.0
[    0.015328] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.020754] NOTICE:  BL2: LCM state is CM
[    0.024799] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
[    0.030782] NOTICE:  BL2: DDR3200(rev.0.27)NOTICE:  [COLD_BOOT]NOTICE:
..0
[    0.057151] NOTICE:  BL2: DRAM Split is 4ch
[    0.061034] NOTICE:  BL2: QoS is default setting(rev.0.18)
[    0.066533] NOTICE:  BL2: Lossy Decomp areas
[    0.070711] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
DCMPAREACRBx:0x570
[    0.077796] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
DCMPAREACRBx:0x0
[    0.084708] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
DCMPAREACRBx:0x0
[    0.091623] NOTICE:  BL2: v1.3(release):0387358
[    0.096113] NOTICE:  BL2: Built : 04:35:44, Jun 22 2018
[    0.101300] NOTICE:  BL2: Normal boot
[    0.104941] NOTICE:  BL2: dst=3D0xe6320210 src=3D0x8180000 len=3D512(0x2=
00)
[    0.111487] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x=
1800)
[    0.117949] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000 len=3D65536(0=
x10000)
[    0.125175] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
len=3D524288(0x80000)
[    0.135655] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
len=3D1048576(0x100000)
[    0.149770] NOTICE:  BL3-1 : Rev.1.0.16
[    0.154065] NOTICE:  BL31: v1.3(release):0387358
[    0.157189] NOTICE:  BL31: Built : 04:35:47, Jun 22 2018


U-Boot 2015.04 (Jun 22 2018 - 13:36:27)

CPU: Renesas Electronics R8A7795 rev 2.0
Board: H3ULCB
I2C:   ready
DRAM:  3.9 GiB
MMC:   sh-sdhi: 0, sh-sdhi: 1
In:    serial
Out:   serial
Err:   serial
Net:   ravb

I believe this is the SoC information. If there is any other method of
extracting the information, please let me know so I can transmit it.
I took a look at [1] and decided to start from scratch to attempt to get
the minimum workspace functioning.

As I mentioned before I attempted using the Salvator-X guideline for the
H3ULCB.

In previous attempts, I had to modify some recipes to get the compilation
working, but this time I would like to confirm with everyone the initial
steps before I take them.

I have not done anything other than what the Wiki (
https://www.renesas.com/us/en/solutions/automotive/adas/solution-kits/r-car=
-starter-kit.html)
says I should.
After adding all the layers, I start bitbake:

$ bitbake core-image-minimal

Build
Configuration:
BB_VERSION        =3D
"1.30.0"
BUILD_SYS         =3D
"x86_64-linux"
NATIVELSBSTRING   =3D
"universal"
TARGET_SYS        =3D
"aarch64-poky-linux"
MACHINE           =3D
"h3ulcb"
DISTRO            =3D
"poky"
DISTRO_VERSION    =3D
"2.1.2"
TUNE_FEATURES     =3D "aarch64
cortexa57-cortexa53"
TARGET_FPU        =3D
""
SOC_FAMILY        =3D
"rcar-gen3:r8a7796"
meta

meta-poky

meta-yocto-bsp    =3D
"tmp:cca8dd15c8096626052f6d8d25ff1e9a606104a3"
meta-rcar-gen3    =3D
"tmp:95cb48ba09bc7e55fd549817e3e26723409e68d5"
meta-linaro-toolchain

meta-optee        =3D
"tmp:2f51d38048599d9878f149d6d15539fb97603f8f"
meta-oe           =3D
"tmp:55c8a76da5dc099a7bc3838495c672140cedb78e"
meta-virtualization =3D
"morty:6249631f59ad6ee3dc93762de49fc4b443d99abc"
meta-selinux      =3D
"jethro:4c75d9cbcf1d75043c7c5ab315aa383d9b227510"
meta-networking

meta-python       =3D
"tmp:55c8a76da5dc099a7bc3838495c672140cedb78e"
meta-rcar-gen3-xen =3D
"master:60699c631d541aeeaebaeec9a087efed9385ee42"


NOTE: Preparing
RunQueue
NOTE: Executing SetScene
Tasks
NOTE: Executing RunQueue
Tasks
ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: QA Issue: xen:
Files/directories were installed but not shipped in any package:
  /usr/lib/libxenfsimage.so
  /usr/lib/libxenfsimage.so.4.12
  /usr/lib/libxenfsimage.so.4.12.0
  /usr/lib/xenfsimage/ext2fs-lib/fsimage.so
  /usr/lib/xenfsimage/ufs/fsimage.so
  /usr/lib/xenfsimage/fat/fsimage.so
  /usr/lib/xenfsimage/iso9660/fsimage.so
  /usr/lib/xenfsimage/reiserfs/fsimage.so
  /usr/lib/xenfsimage/zfs/fsimage.so
  /usr/lib/xen/bin/depriv-fd-checker
  /usr/sbin/xenmon
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
xen: 11 installed and not shipped files. [installed-vs-shipped]
ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Fatal QA errors
found, failing task.
ERROR: xen-unstable+gitAUTOINC+9d357cbaf7-r0 do_package: Function failed:
do_package
ERROR: Logfile of failure stored in:
/home/yocto/r-car/build/tmp/work/aarch64-poky-linux/xen/unstable+gitAUTOINC=
+9d357cbaf7-r0/temp/log.do_package.8954
ERROR: Task 329 (/home/yocto/r-car/meta-virtualization/recipes-extended/xen=
/
xen_git.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3642 tasks of which 3641 didn't need to be
rerun and 1 failed.
No currently running tasks (2517 of 3653)

Summary: 1 task failed:
  /home/yocto/r-car/meta-virtualization/recipes-extended/xen/xen_git.bb,
do_package
Summary: There were 3 WARNING messages shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

I am aware I am using a very old BSP. If there is a slightly better version
with which to start with, I would greatly like everyone's opinion.

>From the log it would seem that the xen_git.bb in the meta-virtualization
layer is being called and thus the recipe is attempting to compile the
newest version of Xen.

So my second question would be, what version of Xen should I point towards
for the board I am using?

I am sorry for the completely newcomer questions, but I hope to someday
soon be able to help with Xen ARM development.

Best regards,

2018=E5=B9=B412=E6=9C=8822=E6=97=A5(=E5=9C=9F) 21:21 Andrii Anisov <Andrii_=
Anisov@epam.com>:

> Hello Jairo,
>
> From: LOPEZ, FUENTES NACARINO Jairo Eduardo <jairo@ruri.waseda.jp>
> Sent: Saturday, December 22, 2018 3:55 AM
> To: Andrii Anisov; Iurii Artemenko
> Subject: RT Xen on ARM - R-Car series
>
> > My name is Jairo Lopez.
>
> > I am currently working as a doctorate student at Waseda University in
> the area of distributed systems.
>
> > We have previously used the R-Car M3 Starter Kit Pro and R-Car H3
> Starter Kit Premier
> > (
> https://www.renesas.com/us/en/solutions/automotive/adas/solution-kits/r-c=
ar-starter-kit.html)
> for some
> > demos and were interested in using them to test Xen on these machines.
> Since we are looking at
> > real-time distributed systems, your work on real-time for Xen greatly
> interests me.
>
> Thank you for your interest in XEN and RT in XEN. I hope you'll have grea=
t
> progress in your work and enrich XEN hypervisor with your findings.
>
> > I have attempted to use the Salvator-X guidelines (
> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/S=
alvator-X)
> on
> > the Xen Wiki to try to test Xen on the above mentioned machines
>
> What SoC revisions do you have on your boards? Keep in mind this [1],
> although it should not be a problem for you yet.
>
> > and although the build succeeds
>
> I hope you built x3ulcb targets instead of salvator-x. BTW, the BSP
> mentioned in the wiki is pretty old. Me currently using 3.9. But it shoul=
d
> not be a big problem on this stage.
>
> > I am left with a wonderful empty screen.
> And what do you see in a console? Any logs?
>
> > It is currently possible to boot Xen on the R-Car M3 or R-Car H3?
> Yes, sure. Our team constantly work with R-Car Gen3 based boards.
> Unfortunately, Renesas BSP still needs some adjustments to get XEN built
> and run with it.
>
> > If my laboratory is keen on getting Xen working on these machines, how
> could we go on about doing this?
> Carefully follow instructions. Provide detailed descriptions of your step=
s
> and results (build/boot logs) in case something went wrong on your site.
>
> ps. You know, XEN is an open-source project, it's better to ask questions
> through the mailing list [2]. You might have more answers hints and
> opinions from the community. I've copied this email to the list for you.
>
> [1]
> https://elinux.org/R-Car/Boards/Yocto-Gen3#Known_issues_and_limitations
> [2] https://www.xenproject.org/help/mailing-list.html
>
> ANDRII ANISOV
>

--000000000000c29fe9057dd3335c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0
ciI+PGRpdj5BbmRyaWksPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFuayB5b3UgZm9yIHlv
dXIgcmVzcG9uc2UuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIHNvcnJ5IGZvciBub3Qg
YmVpbmcgYWJsZSB0byBtYWtlIHRpbWUgdG8gYW5zd2VyIHNvb25lci48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkhlbGxvIHRvIGV2ZXJ5b25lIGZyb20gdGhlIFhlbiBEZXZlbG9wbWVudCBtYWls
aW5nIGxpc3QuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5BcyBJIHRvbGQgQW5kcmlpLCBJIGFt
IGludGVyZXN0ZWQgaW4gUlQgWGVuLCBidXQgYmVmb3JlIGdldHRpbmcgYW55d2hlcmUgbmVhciB0
aGF0LCBJIG5lZWQgdG8gYWN0dWFsbHkgZ2V0IG15IGJvYXJkIHRvIHVzZSBYZW4uPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5BcyBhIHRvdGFsIG5ld2NvbWVyIHRvIHRoZXNlIGJvYXJkcyBhbmQg
a25vd2luZyB0aGF0IFhlbiBpcyBhIGxpdHRsZSBjb21wbGV4IHRvIGdldCBydW5uaW5nLCBJIGFt
IHN1cmUgdGhlcmUgYXJlIGEgbG90IG9mIHN0ZXBzIHRoYXQgSSBhbSBlaXRoZXIgZG9pbmcgd3Jv
bmcsIG9yIGhhdmUgbWFkZSB0aGUgd3JvbmcgYXNzdW1wdGlvbnMuPC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5UaGUgU29DIGluZm9ybWF0aW9uIG9mIHRoZSBSLUNhciBIMyBJIGhhdmUgaXMgYmVs
b3c6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5DUFU6IFJlbmVzYXMgRWxlY3Ryb25pY3MgUjhB
Nzc5NSByZXYgMi4wPGJyPkJvYXJkOiBIM1VMQ0I8YnI+STJDOsKgwqAgcmVhZHk8YnI+RFJBTTrC
oCAzLjkgR2lCPGJyPk1NQzrCoMKgIHNoLXNkaGk6IDAsIHNoLXNkaGk6IDE8YnI+SW46wqDCoMKg
IHNlcmlhbDxicj5PdXQ6wqDCoCBzZXJpYWw8YnI+RXJyOsKgwqAgc2VyaWFsPGJyPk5ldDrCoMKg
IHJhdmI8YnI+SGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDrCoCAwPGJyPj0mZ3Q7IFvCoMKg
wqAgMC4wMDAxNThdIE5PVElDRTrCoCBCTDI6IFItQ2FyIEdlbjMgSW5pdGlhbCBQcm9ncmFtIExv
YWRlcihDQTU3KSBSZXYuMS4wLjE2PGJyPlvCoMKgwqAgMC4wMDU3MThdIE5PVElDRTrCoCBCTDI6
IFBSUiBpcyBSLUNhciBIMyBWZXIyLjA8YnI+W8KgwqDCoCAwLjAxMDMwMV0gTk9USUNFOsKgIEJM
MjogQm9hcmQgaXMgU3RhcnRlciBLaXQgUmV2MS4wPGJyPlvCoMKgwqAgMC4wMTUzMjhdIE5PVElD
RTrCoCBCTDI6IEJvb3QgZGV2aWNlIGlzIEh5cGVyRmxhc2goODBNSHopPGJyPlvCoMKgwqAgMC4w
MjA3NTRdIE5PVElDRTrCoCBCTDI6IExDTSBzdGF0ZSBpcyBDTTxicj5bwqDCoMKgIDAuMDI0Nzk5
XSBOT1RJQ0U6wqAgQkwyOiBBVlMgc2V0dGluZyBzdWNjZWVkZWQuIERWRlNfU2V0VklEPTB4NTM8
YnI+W8KgwqDCoCAwLjAzMDc4Ml0gTk9USUNFOsKgIEJMMjogRERSMzIwMChyZXYuMC4yNylOT1RJ
Q0U6wqAgW0NPTERfQk9PVF1OT1RJQ0U6wqAgLi4wPGJyPlvCoMKgwqAgMC4wNTcxNTFdIE5PVElD
RTrCoCBCTDI6IERSQU0gU3BsaXQgaXMgNGNoPGJyPlvCoMKgwqAgMC4wNjEwMzRdIE5PVElDRTrC
oCBCTDI6IFFvUyBpcyBkZWZhdWx0IHNldHRpbmcocmV2LjAuMTgpPGJyPlvCoMKgwqAgMC4wNjY1
MzNdIE5PVElDRTrCoCBCTDI6IExvc3N5IERlY29tcCBhcmVhczxicj5bwqDCoMKgIDAuMDcwNzEx
XSBOT1RJQ0U6wqDCoMKgwqDCoMKgIEVudHJ5IDA6IERDTVBBUkVBQ1JBeDoweDgwMDAwNTQwIERD
TVBBUkVBQ1JCeDoweDU3MDxicj5bwqDCoMKgIDAuMDc3Nzk2XSBOT1RJQ0U6wqDCoMKgwqDCoMKg
IEVudHJ5IDE6IERDTVBBUkVBQ1JBeDoweDQwMDAwMDAwIERDTVBBUkVBQ1JCeDoweDA8YnI+W8Kg
wqDCoCAwLjA4NDcwOF0gTk9USUNFOsKgwqDCoMKgwqDCoCBFbnRyeSAyOiBEQ01QQVJFQUNSQXg6
MHgyMDAwMDAwMCBEQ01QQVJFQUNSQng6MHgwPGJyPlvCoMKgwqAgMC4wOTE2MjNdIE5PVElDRTrC
oCBCTDI6IHYxLjMocmVsZWFzZSk6MDM4NzM1ODxicj5bwqDCoMKgIDAuMDk2MTEzXSBOT1RJQ0U6
wqAgQkwyOiBCdWlsdCA6IDA0OjM1OjQ0LCBKdW4gMjIgMjAxODxicj5bwqDCoMKgIDAuMTAxMzAw
XSBOT1RJQ0U6wqAgQkwyOiBOb3JtYWwgYm9vdDxicj5bwqDCoMKgIDAuMTA0OTQxXSBOT1RJQ0U6
wqAgQkwyOiBkc3Q9MHhlNjMyMDIxMCBzcmM9MHg4MTgwMDAwIGxlbj01MTIoMHgyMDApPGJyPlvC
oMKgwqAgMC4xMTE0ODddIE5PVElDRTrCoCBCTDI6IGRzdD0weDQzZjAwMDAwIHNyYz0weDgxODA0
MDAgbGVuPTYxNDQoMHgxODAwKTxicj5bwqDCoMKgIDAuMTE3OTQ5XSBOT1RJQ0U6wqAgQkwyOiBk
c3Q9MHg0NDAwMDAwMCBzcmM9MHg4MWMwMDAwIGxlbj02NTUzNigweDEwMDAwKTxicj5bwqDCoMKg
IDAuMTI1MTc1XSBOT1RJQ0U6wqAgQkwyOiBkc3Q9MHg0NDEwMDAwMCBzcmM9MHg4MjAwMDAwIGxl
bj01MjQyODgoMHg4MDAwMCk8YnI+W8KgwqDCoCAwLjEzNTY1NV0gTk9USUNFOsKgIEJMMjogZHN0
PTB4NTAwMDAwMDAgc3JjPTB4ODY0MDAwMCBsZW49MTA0ODU3NigweDEwMDAwMCk8YnI+W8KgwqDC
oCAwLjE0OTc3MF0gTk9USUNFOsKgIEJMMy0xIDogUmV2LjEuMC4xNjxicj5bwqDCoMKgIDAuMTU0
MDY1XSBOT1RJQ0U6wqAgQkwzMTogdjEuMyhyZWxlYXNlKTowMzg3MzU4PGJyPlvCoMKgwqAgMC4x
NTcxODldIE5PVElDRTrCoCBCTDMxOiBCdWlsdCA6IDA0OjM1OjQ3LCBKdW4gMjIgMjAxODxicj48
YnI+PGJyPlUtQm9vdCAyMDE1LjA0IChKdW4gMjIgMjAxOCAtIDEzOjM2OjI3KTxicj48YnI+Q1BV
OiBSZW5lc2FzIEVsZWN0cm9uaWNzIFI4QTc3OTUgcmV2IDIuMDxicj5Cb2FyZDogSDNVTENCPGJy
PkkyQzrCoMKgIHJlYWR5PGJyPkRSQU06wqAgMy45IEdpQjxicj5NTUM6wqDCoCBzaC1zZGhpOiAw
LCBzaC1zZGhpOiAxPGJyPkluOsKgwqDCoCBzZXJpYWw8YnI+T3V0OsKgwqAgc2VyaWFsPGJyPkVy
cjrCoMKgIHNlcmlhbDxicj5OZXQ6wqDCoCByYXZiPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+SSBiZWxpZXZlIHRoaXMgaXMgdGhlIFNvQyBpbmZvcm1hdGlvbi4gSWYgdGhlcmUgaXMgYW55
IG90aGVyIG1ldGhvZCBvZiBleHRyYWN0aW5nIHRoZSBpbmZvcm1hdGlvbiwgcGxlYXNlIGxldCBt
ZSBrbm93IHNvIEkgY2FuIHRyYW5zbWl0IGl0Ljxicj48L2Rpdj48ZGl2PkkgdG9vayBhIGxvb2sg
YXQgWzFdIGFuZCBkZWNpZGVkIHRvIHN0YXJ0IGZyb20gc2NyYXRjaCB0byBhdHRlbXB0IHRvIGdl
dCB0aGUgbWluaW11bSB3b3Jrc3BhY2UgZnVuY3Rpb25pbmcuIDxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkFzIEkgbWVudGlvbmVkIGJlZm9yZSBJIGF0dGVtcHRlZCB1c2luZyB0aGUgU2Fs
dmF0b3ItWCBndWlkZWxpbmUgZm9yIHRoZSBIM1VMQ0IuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5JbiBwcmV2aW91cyBhdHRlbXB0cywgSSBoYWQgdG8gbW9kaWZ5IHNvbWUgcmVjaXBlcyB0byBn
ZXQgdGhlIGNvbXBpbGF0aW9uIHdvcmtpbmcsIGJ1dCB0aGlzIHRpbWUgSSB3b3VsZCBsaWtlIHRv
IGNvbmZpcm0gd2l0aCBldmVyeW9uZSB0aGUgaW5pdGlhbCBzdGVwcyBiZWZvcmUgSSB0YWtlIHRo
ZW0uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgbm90IGRvbmUgYW55dGhpbmcgb3Ro
ZXIgdGhhbiB3aGF0IHRoZSBXaWtpICg8YSBocmVmPSJodHRwczovL3d3dy5yZW5lc2FzLmNvbS91
cy9lbi9zb2x1dGlvbnMvYXV0b21vdGl2ZS9hZGFzL3NvbHV0aW9uLWtpdHMvci1jYXItc3RhcnRl
ci1raXQuaHRtbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cu
cmVuZXNhcy5jb20vdXMvZW4vc29sdXRpb25zL2F1dG9tb3RpdmUvYWRhcy9zb2x1dGlvbi1raXRz
L3ItY2FyLXN0YXJ0ZXIta2l0Lmh0bWw8L2E+KSBzYXlzIEkgc2hvdWxkLjxicj48L2Rpdj48ZGl2
PkFmdGVyIGFkZGluZyBhbGwgdGhlIGxheWVycywgSSBzdGFydCBiaXRiYWtlOjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PiQgYml0YmFrZSBjb3JlLWltYWdlLW1pbmltYWw8YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5CdWlsZCBDb25maWd1cmF0aW9uOsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkJCX1ZFUlNJ
T07CoMKgwqDCoMKgwqDCoCA9ICZxdW90OzEuMzAuMCZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+QlVJTERfU1lTwqDCoMKgwqDCoMKgwqDCoCA9
ICZxdW90O3g4Nl82NC1saW51eCZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8YnI+TkFUSVZFTFNCU1RSSU5HwqDCoCA9ICZxdW90O3VuaXZlcnNhbCZxdW90O8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+VEFSR0VUX1NZU8KgwqDCoMKgwqDC
oMKgID0gJnF1b3Q7YWFyY2g2NC1wb2t5LWxpbnV4JnF1b3Q7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDxicj5NQUNISU5FwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtoM3VsY2ImcXVvdDvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkRJU1RST8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtwb2t5JnF1b3Q7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+RElTVFJPX1ZFUlNJT07CoMKgwqAgPSAm
cXVvdDsyLjEuMiZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxicj5UVU5FX0ZFQVRVUkVTwqDCoMKgwqAgPSAmcXVvdDthYXJjaDY0IGNvcnRleGE1
Ny1jb3J0ZXhhNTMmcXVvdDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPlRBUkdFVF9GUFXCoMKgwqDCoMKgwqDCoCA9ICZxdW90
OyZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8YnI+U09DX0ZBTUlMWcKgwqDCoMKgwqDCoMKgID0gJnF1b3Q7cmNhci1nZW4zOnI4
YTc3OTYmcXVvdDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1wb2t5wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPGJyPm1ldGEteW9jdG8tYnNwwqDCoMKgID0gJnF1b3Q7dG1wOmNjYThkZDE1YzgwOTY2
MjYwNTJmNmQ4ZDI1ZmYxZTlhNjA2MTA0YTMmcXVvdDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8YnI+bWV0YS1yY2FyLWdlbjPCoMKgwqAgPSAmcXVvdDt0bXA6OTVjYjQ4YmEwOWJjN2U1NWZk
NTQ5ODE3ZTNlMjY3MjM0MDllNjhkNSZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxi
cj5tZXRhLWxpbmFyby10b29sY2hhaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1vcHRlZcKgwqDCoMKgwqDCoMKgID0g
JnF1b3Q7dG1wOjJmNTFkMzgwNDg1OTlkOTg3OGYxNDlkNmQxNTUzOWZiOTc2MDNmOGYmcXVvdDvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1vZcKgwqDCoMKgwqDCoMKgwqDCoMKg
ID0gJnF1b3Q7dG1wOjU1YzhhNzZkYTVkYzA5OWE3YmMzODM4NDk1YzY3MjE0MGNlZGI3OGUmcXVv
dDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS12aXJ0dWFsaXphdGlvbiA9ICZx
dW90O21vcnR5OjYyNDk2MzFmNTlhZDZlZTNkYzkzNzYyZGU0OWZjNGI0NDNkOTlhYmMmcXVvdDvC
oMKgwqDCoMKgwqDCoMKgwqAgPGJyPm1ldGEtc2VsaW51eMKgwqDCoMKgwqAgPSAmcXVvdDtqZXRo
cm86NGM3NWQ5Y2JjZjFkNzUwNDNjN2M1YWIzMTVhYTM4M2Q5YjIyNzUxMCZxdW90O8KgwqDCoMKg
wqDCoMKgwqDCoMKgIDxicj5tZXRhLW5ldHdvcmtpbmfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1w
eXRob27CoMKgwqDCoMKgwqAgPSAmcXVvdDt0bXA6NTVjOGE3NmRhNWRjMDk5YTdiYzM4Mzg0OTVj
NjcyMTQwY2VkYjc4ZSZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5tZXRhLXJj
YXItZ2VuMy14ZW4gPSAmcXVvdDttYXN0ZXI6NjA2OTljNjMxZDU0MWFlZWFlYmFlZWM5YTA4N2Vm
ZWQ5Mzg1ZWU0MiZxdW90O8KgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPk5PVEU6IFByZXBhcmluZyBSdW5RdWV1ZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj5O
T1RFOiBFeGVjdXRpbmcgU2V0U2NlbmUgVGFza3PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+Tk9URTogRXhlY3V0aW5nIFJ1blF1ZXVlIFRhc2tzwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPkVSUk9SOiB4ZW4tdW5zdGFibGUr
Z2l0QVVUT0lOQys5ZDM1N2NiYWY3LXIwIGRvX3BhY2thZ2U6IFFBIElzc3VlOiB4ZW46IEZpbGVz
L2RpcmVjdG9yaWVzIHdlcmUgaW5zdGFsbGVkIGJ1dCBub3Qgc2hpcHBlZCBpbiBhbnkgcGFja2Fn
ZTo8YnI+wqAgL3Vzci9saWIvbGlieGVuZnNpbWFnZS5zbzxicj7CoCAvdXNyL2xpYi9saWJ4ZW5m
c2ltYWdlLnNvLjQuMTI8YnI+wqAgL3Vzci9saWIvbGlieGVuZnNpbWFnZS5zby40LjEyLjA8YnI+
wqAgL3Vzci9saWIveGVuZnNpbWFnZS9leHQyZnMtbGliL2ZzaW1hZ2Uuc288YnI+wqAgL3Vzci9s
aWIveGVuZnNpbWFnZS91ZnMvZnNpbWFnZS5zbzxicj7CoCAvdXNyL2xpYi94ZW5mc2ltYWdlL2Zh
dC9mc2ltYWdlLnNvPGJyPsKgIC91c3IvbGliL3hlbmZzaW1hZ2UvaXNvOTY2MC9mc2ltYWdlLnNv
PGJyPsKgIC91c3IvbGliL3hlbmZzaW1hZ2UvcmVpc2VyZnMvZnNpbWFnZS5zbzxicj7CoCAvdXNy
L2xpYi94ZW5mc2ltYWdlL3pmcy9mc2ltYWdlLnNvPGJyPsKgIC91c3IvbGliL3hlbi9iaW4vZGVw
cml2LWZkLWNoZWNrZXI8YnI+wqAgL3Vzci9zYmluL3hlbm1vbjxicj5QbGVhc2Ugc2V0IEZJTEVT
IHN1Y2ggdGhhdCB0aGVzZSBpdGVtcyBhcmUgcGFja2FnZWQuIEFsdGVybmF0aXZlbHkgaWYgdGhl
eSBhcmUgdW5uZWVkZWQsIGF2b2lkIGluc3RhbGxpbmcgdGhlbSBvciBkZWxldGUgdGhlbSB3aXRo
aW4gZG9faW5zdGFsbC48YnI+eGVuOiAxMSBpbnN0YWxsZWQgYW5kIG5vdCBzaGlwcGVkIGZpbGVz
LiBbaW5zdGFsbGVkLXZzLXNoaXBwZWRdPGJyPkVSUk9SOiB4ZW4tdW5zdGFibGUrZ2l0QVVUT0lO
Qys5ZDM1N2NiYWY3LXIwIGRvX3BhY2thZ2U6IEZhdGFsIFFBIGVycm9ycyBmb3VuZCwgZmFpbGlu
ZyB0YXNrLjxicj5FUlJPUjogeGVuLXVuc3RhYmxlK2dpdEFVVE9JTkMrOWQzNTdjYmFmNy1yMCBk
b19wYWNrYWdlOiBGdW5jdGlvbiBmYWlsZWQ6IGRvX3BhY2thZ2U8YnI+RVJST1I6IExvZ2ZpbGUg
b2YgZmFpbHVyZSBzdG9yZWQgaW46IC9ob21lL3lvY3RvL3ItY2FyL2J1aWxkL3RtcC93b3JrL2Fh
cmNoNjQtcG9reS1saW51eC94ZW4vdW5zdGFibGUrZ2l0QVVUT0lOQys5ZDM1N2NiYWY3LXIwL3Rl
bXAvbG9nLmRvX3BhY2thZ2UuODk1NDxicj5FUlJPUjogVGFzayAzMjkgKC9ob21lL3lvY3RvL3It
Y2FyL21ldGEtdmlydHVhbGl6YXRpb24vcmVjaXBlcy1leHRlbmRlZC94ZW4vPGEgaHJlZj0iaHR0
cDovL3hlbl9naXQuYmIiPnhlbl9naXQuYmI8L2E+LCBkb19wYWNrYWdlKSBmYWlsZWQgd2l0aCBl
eGl0IGNvZGUgJiMzOTsxJiMzOTs8YnI+Tk9URTogVGFza3MgU3VtbWFyeTogQXR0ZW1wdGVkIDM2
NDIgdGFza3Mgb2Ygd2hpY2ggMzY0MSBkaWRuJiMzOTt0IG5lZWQgdG8gYmUgcmVydW4gYW5kIDEg
ZmFpbGVkLjxicj5ObyBjdXJyZW50bHkgcnVubmluZyB0YXNrcyAoMjUxNyBvZiAzNjUzKTxicj48
YnI+U3VtbWFyeTogMSB0YXNrIGZhaWxlZDo8YnI+wqAgL2hvbWUveW9jdG8vci1jYXIvbWV0YS12
aXJ0dWFsaXphdGlvbi9yZWNpcGVzLWV4dGVuZGVkL3hlbi88YSBocmVmPSJodHRwOi8veGVuX2dp
dC5iYiI+eGVuX2dpdC5iYjwvYT4sIGRvX3BhY2thZ2U8YnI+U3VtbWFyeTogVGhlcmUgd2VyZSAz
IFdBUk5JTkcgbWVzc2FnZXMgc2hvd24uPGJyPlN1bW1hcnk6IFRoZXJlIHdlcmUgMyBFUlJPUiBt
ZXNzYWdlcyBzaG93biwgcmV0dXJuaW5nIGEgbm9uLXplcm8gZXhpdCBjb2RlLjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PkkgYW0gYXdhcmUgSSBhbSB1c2luZyBhIHZlcnkgb2xkIEJTUC4g
SWYgdGhlcmUgaXMgYSBzbGlnaHRseSBiZXR0ZXIgdmVyc2lvbiB3aXRoIHdoaWNoIHRvIHN0YXJ0
IHdpdGgsIEkgd291bGQgZ3JlYXRseSBsaWtlIGV2ZXJ5b25lJiMzOTtzIG9waW5pb24uPC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5Gcm9tIHRoZSBsb2cgaXQgd291bGQgc2VlbSB0aGF0IHRoZSA8
YSBocmVmPSJodHRwOi8veGVuX2dpdC5iYiI+eGVuX2dpdC5iYjwvYT4gaW4gdGhlIG1ldGEtdmly
dHVhbGl6YXRpb24gbGF5ZXIgaXMgYmVpbmcgY2FsbGVkIGFuZCB0aHVzIHRoZSByZWNpcGUgaXMg
YXR0ZW1wdGluZyB0byBjb21waWxlIHRoZSBuZXdlc3QgdmVyc2lvbiBvZiBYZW4uPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5TbyBteSBzZWNvbmQgcXVlc3Rpb24gd291bGQgYmUsIHdoYXQgdmVy
c2lvbiBvZiBYZW4gc2hvdWxkIEkgcG9pbnQgdG93YXJkcyBmb3IgdGhlIGJvYXJkIEkgYW0gdXNp
bmc/PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBhbSBzb3JyeSBmb3IgdGhlIGNvbXBs
ZXRlbHkgbmV3Y29tZXIgcXVlc3Rpb25zLCBidXQgSSBob3BlIHRvIHNvbWVkYXkgc29vbiBiZSBh
YmxlIHRvIGhlbHAgd2l0aCBYZW4gQVJNIGRldmVsb3BtZW50LjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+QmVzdCByZWdhcmRzLDxicj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUi
PjxkaXYgZGlyPSJsdHIiPjIwMTjlubQxMuaciDIy5pelKOWcnykgMjE6MjEgQW5kcmlpIEFuaXNv
diAmbHQ7PGEgaHJlZj0ibWFpbHRvOkFuZHJpaV9Bbmlzb3ZAZXBhbS5jb20iPkFuZHJpaV9Bbmlz
b3ZAZXBhbS5jb208L2E+Jmd0Ozo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xp
ZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkhlbGxvIEphaXJvLDxicj4NCjxi
cj4NCkZyb206IExPUEVaLCBGVUVOVEVTIE5BQ0FSSU5PIEphaXJvIEVkdWFyZG8gJmx0OzxhIGhy
ZWY9Im1haWx0bzpqYWlyb0BydXJpLndhc2VkYS5qcCIgdGFyZ2V0PSJfYmxhbmsiPmphaXJvQHJ1
cmkud2FzZWRhLmpwPC9hPiZndDs8YnI+DQpTZW50OiBTYXR1cmRheSwgRGVjZW1iZXIgMjIsIDIw
MTggMzo1NSBBTTxicj4NClRvOiBBbmRyaWkgQW5pc292OyBJdXJpaSBBcnRlbWVua288YnI+DQpT
dWJqZWN0OiBSVCBYZW4gb24gQVJNIC0gUi1DYXIgc2VyaWVzPGJyPg0KPGJyPg0KJmd0OyBNeSBu
YW1lIGlzIEphaXJvIExvcGV6Ljxicj4NCjxicj4NCiZndDsgSSBhbSBjdXJyZW50bHkgd29ya2lu
ZyBhcyBhIGRvY3RvcmF0ZSBzdHVkZW50IGF0IFdhc2VkYSBVbml2ZXJzaXR5IGluIHRoZSBhcmVh
IG9mIGRpc3RyaWJ1dGVkIHN5c3RlbXMuPGJyPg0KPGJyPg0KJmd0OyBXZSBoYXZlIHByZXZpb3Vz
bHkgdXNlZCB0aGUgUi1DYXIgTTMgU3RhcnRlciBLaXQgUHJvIGFuZCBSLUNhciBIMyBTdGFydGVy
IEtpdCBQcmVtaWVyPGJyPg0KJmd0OyAoPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVuZXNhcy5jb20v
dXMvZW4vc29sdXRpb25zL2F1dG9tb3RpdmUvYWRhcy9zb2x1dGlvbi1raXRzL3ItY2FyLXN0YXJ0
ZXIta2l0Lmh0bWwiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3
LnJlbmVzYXMuY29tL3VzL2VuL3NvbHV0aW9ucy9hdXRvbW90aXZlL2FkYXMvc29sdXRpb24ta2l0
cy9yLWNhci1zdGFydGVyLWtpdC5odG1sPC9hPikgZm9yIHNvbWU8YnI+DQomZ3Q7IGRlbW9zIGFu
ZCB3ZXJlIGludGVyZXN0ZWQgaW4gdXNpbmcgdGhlbSB0byB0ZXN0IFhlbiBvbiB0aGVzZSBtYWNo
aW5lcy4gU2luY2Ugd2UgYXJlIGxvb2tpbmcgYXQ8YnI+DQomZ3Q7IHJlYWwtdGltZSBkaXN0cmli
dXRlZCBzeXN0ZW1zLCB5b3VyIHdvcmsgb24gcmVhbC10aW1lIGZvciBYZW4gZ3JlYXRseSBpbnRl
cmVzdHMgbWUuPGJyPg0KPGJyPg0KVGhhbmsgeW91IGZvciB5b3VyIGludGVyZXN0wqBpbiBYRU4g
YW5kIFJUIGluIFhFTi4gSSBob3BlIHlvdSYjMzk7bGwgaGF2ZSBncmVhdCBwcm9ncmVzcyBpbiB5
b3VyIHdvcmsgYW5kIGVucmljaCBYRU4gaHlwZXJ2aXNvciB3aXRoIHlvdXIgZmluZGluZ3MuPGJy
Pg0KPGJyPg0KJmd0OyBJIGhhdmUgYXR0ZW1wdGVkIHRvIHVzZSB0aGUgU2FsdmF0b3ItWCBndWlk
ZWxpbmVzICg8YSBocmVmPSJodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5fQVJN
X3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucy9TYWx2YXRvci1YIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9YZW5f
QVJNX3dpdGhfVmlydHVhbGl6YXRpb25fRXh0ZW5zaW9ucy9TYWx2YXRvci1YPC9hPikgb24gPGJy
Pg0KJmd0OyB0aGUgWGVuIFdpa2kgdG8gdHJ5IHRvIHRlc3QgWGVuIG9uIHRoZSBhYm92ZSBtZW50
aW9uZWQgbWFjaGluZXM8YnI+DQo8YnI+DQpXaGF0IFNvQyByZXZpc2lvbnMgZG8geW91IGhhdmUg
b24geW91ciBib2FyZHM/IEtlZXAgaW4gbWluZCB0aGlzIFsxXSwgYWx0aG91Z2ggaXQgc2hvdWxk
IG5vdCBiZSBhIHByb2JsZW0gZm9yIHlvdSB5ZXQuPGJyPg0KPGJyPg0KJmd0OyBhbmQgYWx0aG91
Z2ggdGhlIGJ1aWxkIHN1Y2NlZWRzPGJyPg0KPGJyPg0KSSBob3BlIHlvdSBidWlsdCB4M3VsY2Ig
dGFyZ2V0cyBpbnN0ZWFkIG9mIHNhbHZhdG9yLXguIEJUVywgdGhlIEJTUCBtZW50aW9uZWQgaW4g
dGhlIHdpa2kgaXMgcHJldHR5IG9sZC4gTWUgY3VycmVudGx5IHVzaW5nIDMuOS4gQnV0IGl0IHNo
b3VsZCBub3QgYmUgYSBiaWcgcHJvYmxlbSBvbiB0aGlzIHN0YWdlLjxicj4NCjxicj4NCiZndDsg
SSBhbSBsZWZ0IHdpdGggYSB3b25kZXJmdWwgZW1wdHkgc2NyZWVuLjxicj4NCkFuZCB3aGF0IGRv
IHlvdSBzZWUgaW4gYSBjb25zb2xlPyBBbnkgbG9ncz88YnI+DQo8YnI+DQomZ3Q7IEl0IGlzIGN1
cnJlbnRseSBwb3NzaWJsZSB0byBib290IFhlbiBvbiB0aGUgUi1DYXIgTTMgb3IgUi1DYXIgSDM/
PGJyPg0KWWVzLCBzdXJlLiBPdXIgdGVhbSBjb25zdGFudGx5IHdvcmsgd2l0aCBSLUNhciBHZW4z
IGJhc2VkIGJvYXJkcy4gVW5mb3J0dW5hdGVseSwgUmVuZXNhcyBCU1Agc3RpbGwgbmVlZHMgc29t
ZSBhZGp1c3RtZW50cyB0byBnZXQgWEVOIGJ1aWx0IGFuZCBydW4gd2l0aCBpdC48YnI+DQo8YnI+
DQomZ3Q7IElmIG15IGxhYm9yYXRvcnkgaXMga2VlbiBvbiBnZXR0aW5nIFhlbiB3b3JraW5nIG9u
IHRoZXNlIG1hY2hpbmVzLCBob3cgY291bGQgd2UgZ28gb24gYWJvdXQgZG9pbmcgdGhpcz88YnI+
DQpDYXJlZnVsbHkgZm9sbG93IGluc3RydWN0aW9ucy4gUHJvdmlkZSBkZXRhaWxlZCBkZXNjcmlw
dGlvbnMgb2YgeW91ciBzdGVwcyBhbmQgcmVzdWx0cyAoYnVpbGQvYm9vdCBsb2dzKSBpbiBjYXNl
IHNvbWV0aGluZyB3ZW50IHdyb25nIG9uIHlvdXIgc2l0ZS48YnI+DQo8YnI+DQpwcy4gWW91IGtu
b3csIFhFTiBpcyBhbiBvcGVuLXNvdXJjZSBwcm9qZWN0LCBpdCYjMzk7cyBiZXR0ZXIgdG8gYXNr
IHF1ZXN0aW9ucyB0aHJvdWdoIHRoZSBtYWlsaW5nIGxpc3QgWzJdLiBZb3UgbWlnaHQgaGF2ZSBt
b3JlIGFuc3dlcnMgaGludHMgYW5kIG9waW5pb25zIGZyb20gdGhlIGNvbW11bml0eS4gSSYjMzk7
dmUgY29waWVkIHRoaXMgZW1haWwgdG8gdGhlIGxpc3QgZm9yIHlvdS48YnI+DQo8YnI+DQpbMV0g
PGEgaHJlZj0iaHR0cHM6Ly9lbGludXgub3JnL1ItQ2FyL0JvYXJkcy9Zb2N0by1HZW4zI0tub3du
X2lzc3Vlc19hbmRfbGltaXRhdGlvbnMiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vZWxpbnV4Lm9yZy9SLUNhci9Cb2FyZHMvWW9jdG8tR2VuMyNLbm93bl9pc3N1ZXNf
YW5kX2xpbWl0YXRpb25zPC9hPjxicj4NClsyXSA8YSBocmVmPSJodHRwczovL3d3dy54ZW5wcm9q
ZWN0Lm9yZy9oZWxwL21haWxpbmctbGlzdC5odG1sIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL3d3dy54ZW5wcm9qZWN0Lm9yZy9oZWxwL21haWxpbmctbGlzdC5odG1s
PC9hPjxicj4NCjxicj4NCkFORFJJSSBBTklTT1Y8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9k
aXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo=
--000000000000c29fe9057dd3335c--


--===============6223685749857072855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6223685749857072855==--
