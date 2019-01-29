From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Wed, 30 Jan 2019 00:30:49 +0900
Message-ID: <CACrvCsbhjtN6gr9-qqUZ2m1WYM3ZexDhngXM3G0rYcyp3BPJrw@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
 <3aecad20-41f5-4249-46be-bfef80c88ea3@gmail.com>
 <623d0b16-8616-183c-d8d4-559ad81363ed@gmail.com>
 <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
 <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
 <CACrvCsZuh+tj2ejA2RYh78QnySw0fBBEXxWpam_TcFZAORSCXw@mail.gmail.com>
 <feb11726-086c-c6ad-9fca-30c7a22e4d9d@gmail.com>
 <CACrvCsZB-tps6=Vr=1Phf5oo5eUReabMLJzkbO3d2hmNLDOxww@mail.gmail.com>
 <7e217489-2c1a-c35f-d51f-0969654aa8cc@gmail.com>
 <CACrvCsaYJ-zGkZwfdV7BXDABW8u_EDQetU3pq+2otRGXWTXagw@mail.gmail.com>
 <4d078801-b804-06e7-ad5c-8032b1dbaa84@gmail.com>
 <CACrvCsYb0ANJASKYxeA0V2yg0aqKM0OaKCB=_i1zX9DPLwrNrQ@mail.gmail.com>
 <28e6dfab-6a3f-7bea-eca9-2d812903d9f7@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0137485027646338571=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <28e6dfab-6a3f-7bea-eca9-2d812903d9f7@gmail.com>
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

--===============0137485027646338571==
Content-Type: multipart/alternative; boundary="000000000000bbc94b058092bf8f"

--000000000000bbc94b058092bf8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrii,

YEY!

I have finally got an error message!

The rest of the mail is inline.

2019=E5=B9=B41=E6=9C=8828=E6=97=A5(=E6=9C=88) 17:25 Andrii Anisov <andrii.a=
nisov@gmail.com>:

> Hello Jairo,
>
> On 28.01.19 19:20, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
>
> > I was able to compile the Xen image with earlyprintk without issue.
>
> Cool.
>
> > It is comforting to get some sort of feedback from the device, even if
> it is failing.
>
> Indeed:)
>
> > When attempting to boot the Xen image created I did get print messages
> but I get the following:
> ...
>
> I see you have freshly built BL2:
>
> > [    0.120591] NOTICE:  BL2: v1.4(release):15dba6b
> > [    0.125081] NOTICE:  BL2: Built : 11:34:26, Jan 21 2019
> ...
> > - UART enabled -
> > - CPU 00000000 booting -
> > - Current EL 00000004 -
> > - Xen must be entered in NS EL2 mode -
>
> But something went wrong, and your BL2 did not start u-boot in EL2.
> Consequently, hypervisor is not started in EL2 and can not do its work.
> Please verify you have your ATF built with `
> RCAR_BL33_EXECUTION_EL=3DBL33_EL2` as it is stated in the correspondent
> recipe [1].
> You can search for it in <yocto dir>/build/tmp/work/<board
> name>-poky-linux/v1.4+renesas+<revision>/tmp/* .
> And if it is compiled with the flag, then take care to reflash all
> bootloader images on your board.
>
> [1]
> https://github.com/xen-troops/meta-demo/blob/master/meta-rcar-gen3-xen/re=
cipes-bsp/arm-trusted-firmware/arm-trusted-firmware_git.bbappend
>
> --
> Sincerely,
> Andrii Anisov.
>


As you mentioned, I checked the ATF build at the following path:

<yocto dir>/build/tmp/work/<board
name>-poky-linux/arm-trusted-firmware/v1.4+renesas+<revision>/temp

Much to my surprise I found no trace of thr RCAR_BL33_EXECUTION_EL=3DBL33_E=
L2.

It seems that at some point in time I removed the Xen troops meta-demo
layer which nullified the ATFW_OPT_append in that layer.

I was able to readjust the layers and check that the compilation included
the necessary ATF option.

After a successful u-boot firmware update, I was met with the following
information on the R-Car M3:

[    0.000191] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57)
Rev.1.0.21
[    0.005753] NOTICE:  BL2: PRR is R-Car M3 Ver.1.0
[    0.010422] NOTICE:  BL2: Board is Starter Kit Rev.1.0
[    0.015534] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.020960] NOTICE:  BL2: LCM state is CM
[    0.025002] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
[    0.030989] NOTICE:  BL2: DDR3200(rev.0.33)NOTICE:  [COLD_BOOT]NOTICE:
..0
[    0.086113] NOTICE:  BL2: DRAM Split is 2ch
[    0.089998] NOTICE:  BL2: QoS is default setting(rev.0.19)
[    0.095502] NOTICE:  BL2: Lossy Decomp areas
[    0.099675] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
DCMPAREACRBx:0x570
[    0.106760] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
DCMPAREACRBx:0x0
[    0.113672] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
DCMPAREACRBx:0x0
[    0.120586] NOTICE:  BL2: v1.4(release):15dba6b
[    0.125076] NOTICE:  BL2: Built : 14:48:12, Jan 29 2019
[    0.130264] NOTICE:  BL2: Normal boot
[    0.133909] NOTICE:  BL2: dst=3D0xe6320d00 src=3D0x8180000 len=3D512(0x2=
00)
[    0.140292] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x=
1800)
[    0.146913] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000 len=3D65536(0=
x10000)
[    0.154144] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
len=3D1048576(0x100000)
[    0.168967] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
len=3D1048576(0x100000)


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

First, it is nice to know where to look for the build time for the BL2!

After loading earlyprintk enabled Xen and the 4.14 Linux kernel from Yocto
3.9, I was met with the following output:

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
(XEN) RAM: 0000000048000000 - 000000007fffffff
(XEN) RAM: 0000000600000000 - 000000063fffffff
(XEN) RAM: 0000000600000000 - 000000063fffffff
(XEN)
(XEN) MODULE[0]: 0000000048000000 - 0000000048011000 Device Tree
(XEN) MODULE[1]: 000000007a000000 - 000000007c000000 Kernel
(XEN)  RESVD[0]: 0000000048000000 - 0000000048011000
(XEN)
(XEN)
(XEN) Command line: dom0_mem=3D752M console=3Ddtuart dtuart=3Dserial0
dom0_max_vcpus=3D4
(XEN) PFN compression on bits 19...20
(XEN) Xen BUG at page_alloc.c:274
(XEN) ----[ Xen-4.12.0-rc  arm64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     000000000028b310 page_alloc.c#bootmem_region_add+0x188/0x198
(XEN) LR:     000000000028b370
(XEN) SP:     00000000002d7d00
(XEN) CPSR:   800003c9 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000000600000  X1: 0000000000000003  X2: 0000000000000004
(XEN)      X3: 0000000000640000  X4: 0000800008011000  X5: 0000000000000028
(XEN)      X6: 0000000000600000  X7: 0000000000000004  X8: 0000000000000001
(XEN)      X9: 000000000000000a X10: 00000000002d7afa X11: 0000000000000032
(XEN)     X12: 0000000000000002 X13: 000000000026e5d8 X14: 0000000000000020
(XEN)     X15: 0000000000400000 X16: 0000000000000000 X17: 0000000000000000
(XEN)     X18: 000000007fe5ae30 X19: 0000000000600000 X20: 0000000000640000
(XEN)     X21: 0000000640000000 X22: 0000000600000000 X23: 0000000640000000
(XEN)     X24: 000000000028b320 X25: 00000000002b83e0 X26: 0000000048000000
(XEN)     X27: 0000000640000000 X28: 0000000000000002  FP: 00000000002d7d00
(XEN)
(XEN)   VTCR_EL2: 80000000
(XEN)  VTTBR_EL2: 0000000000000000
(XEN)
(XEN)  SCTLR_EL2: 30cd183d
(XEN)    HCR_EL2: 000000000078663f
(XEN)  TTBR0_EL2: 0000000078194000
(XEN)
(XEN)    ESR_EL2: f2000001
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 0000000000000000
(XEN)
(XEN) Xen stack trace from sp=3D00000000002d7d00:
(XEN)    00000000002d7d40 000000000028b370 0000000000000001 000000060000000=
0
(XEN)    0000000640000000 0000000600000000 0000000640000000 00000000002d7d9=
0
(XEN)    00000000002d7d90 000000000029c81c 0000000000000001 000000060000000=
0
(XEN)    0000000640000000 0000000600000000 0000000640000000 000000000000000=
1
(XEN)    00000000002e0000 0000000600000000 00000000002d7de0 000000000029d9e=
8
(XEN)    0000000640000000 0000000600000000 0000000640000000 00000000002b83c=
0
(XEN)    ffffffffffffffff 00000000002b83d8 0000000048000000 000000004801100=
0
(XEN)    000000007fe5a940 0000000000200608 0000000078080000 0000000077e8000=
0
(XEN)    0000000048000000 0000000000000000 0000000000400000 000000000000000=
0
(XEN)    0000000000000001 0000000000000000 0000000078080000 000000000000040=
0
(XEN)    0000000000000000 0000000000011000 0000000048000000 00000000b800000=
0
(XEN)    00000000002b83c0 000000000028b320 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000300000000 ffffffff00000000 000004000000004=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN) Xen call trace:
(XEN)    [<000000000028b310>] page_alloc.c#bootmem_region_add+0x188/0x198
(PC)
(XEN)    [<000000000028b370>] init_boot_pages+0x50/0x17c (LR)
(XEN)    [<000000000028b370>] init_boot_pages+0x50/0x17c
(XEN)    [<000000000029c81c>] dt_unreserved_regions+0xc8/0xdc
(XEN)    [<000000000029d9e8>] start_xen+0xbec/0xc5c
(XEN)    [<0000000000200608>] arm64/head.o#paging+0x60/0x98
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Xen BUG at page_alloc.c:274
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

I am using a 4.12.0-rc Xen, specifically from commit
08b908ba63dee8bc313983c5e412852cbcbcda85 dated Jan 16, 16:16:56 2019.

Do you have any idea what could be the matter?

Thank you very much for all the support.

Best regards,

Jairo

--000000000000bbc94b058092bf8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Andrii,</div><div><br></div><div>YEY!</div><div><br></div><d=
iv>I have finally got an error message!<br></div><div><br></div><div>The re=
st of the mail is inline.<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">2019=E5=B9=B41=E6=9C=8828=E6=97=A5(=E6=
=9C=88) 17:25 Andrii Anisov &lt;<a href=3D"mailto:andrii.anisov@gmail.com">=
andrii.anisov@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Jairo,<br>
<br>
On 28.01.19 19:20, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:<br>
<br>
&gt; I was able to compile the Xen image with earlyprintk without issue.<br=
>
<br>
Cool.<br>
<br>
&gt; It is comforting to get some sort of feedback from the device, even if=
 it is failing.<br>
<br>
Indeed:)<br>
<br>
&gt; When attempting to boot the Xen image created I did get print messages=
 but I get the following:<br>
...<br>
<br>
I see you have freshly built BL2:<br>
<br>
&gt; [=C2=A0 =C2=A0 0.120591] NOTICE:=C2=A0 BL2: v1.4(release):15dba6b<br>
&gt; [=C2=A0 =C2=A0 0.125081] NOTICE:=C2=A0 BL2: Built : 11:34:26, Jan 21 2=
019<br>
...<br>
&gt; - UART enabled -<br>
&gt; - CPU 00000000 booting -<br>
&gt; - Current EL 00000004 -<br>
&gt; - Xen must be entered in NS EL2 mode -<br>
<br>
But something went wrong, and your BL2 did not start u-boot in EL2. Consequ=
ently, hypervisor is not started in EL2 and can not do its work.<br>
Please verify you have your ATF built with ` RCAR_BL33_EXECUTION_EL=3DBL33_=
EL2` as it is stated in the correspondent recipe [1].<br>
You can search for it in &lt;yocto dir&gt;/build/tmp/work/&lt;board name&gt=
;-poky-linux/v1.4+renesas+&lt;revision&gt;/tmp/* .<br>
And if it is compiled with the flag, then take care to reflash all bootload=
er images on your board.<br>
<br>
[1] <a href=3D"https://github.com/xen-troops/meta-demo/blob/master/meta-rca=
r-gen3-xen/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_git.bbappe=
nd" rel=3D"noreferrer" target=3D"_blank">https://github.com/xen-troops/meta=
-demo/blob/master/meta-rcar-gen3-xen/recipes-bsp/arm-trusted-firmware/arm-t=
rusted-firmware_git.bbappend</a><br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br></blockquote><div><br></div><div><br></div><div>As you me=
ntioned, I checked the ATF build at the following path:</div><div><br></div=
><div>&lt;yocto dir&gt;/build/tmp/work/&lt;board name&gt;-poky-linux/arm-tr=
usted-firmware/v1.4+renesas+&lt;revision&gt;/temp</div><div><br></div><div>=
Much to my surprise I found no trace of thr RCAR_BL33_EXECUTION_EL=3DBL33_E=
L2.</div><div><br></div><div>It seems that at some point in time I removed =
the Xen troops meta-demo layer which nullified the ATFW_OPT_append in that =
layer.</div><div><br></div><div>I was able to readjust the layers and check=
 that the compilation included the necessary ATF option.</div><div><br></di=
v><div>After a successful u-boot firmware update, I was met with the follow=
ing information on the R-Car M3:</div><div><br></div><div>[=C2=A0=C2=A0=C2=
=A0 0.000191] NOTICE:=C2=A0 BL2: R-Car Gen3 Initial Program Loader(CA57) Re=
v.1.0.21<br>[=C2=A0=C2=A0=C2=A0 0.005753] NOTICE:=C2=A0 BL2: PRR is R-Car M=
3 Ver.1.0<br>[=C2=A0=C2=A0=C2=A0 0.010422] NOTICE:=C2=A0 BL2: Board is Star=
ter Kit Rev.1.0<br>[=C2=A0=C2=A0=C2=A0 0.015534] NOTICE:=C2=A0 BL2: Boot de=
vice is HyperFlash(80MHz)<br>[=C2=A0=C2=A0=C2=A0 0.020960] NOTICE:=C2=A0 BL=
2: LCM state is CM<br>[=C2=A0=C2=A0=C2=A0 0.025002] NOTICE:=C2=A0 BL2: AVS =
setting succeeded. DVFS_SetVID=3D0x53<br>[=C2=A0=C2=A0=C2=A0 0.030989] NOTI=
CE:=C2=A0 BL2: DDR3200(rev.0.33)NOTICE:=C2=A0 [COLD_BOOT]NOTICE:=C2=A0 ..0<=
br>[=C2=A0=C2=A0=C2=A0 0.086113] NOTICE:=C2=A0 BL2: DRAM Split is 2ch<br>[=
=C2=A0=C2=A0=C2=A0 0.089998] NOTICE:=C2=A0 BL2: QoS is default setting(rev.=
0.19)<br>[=C2=A0=C2=A0=C2=A0 0.095502] NOTICE:=C2=A0 BL2: Lossy Decomp area=
s<br>[=C2=A0=C2=A0=C2=A0 0.099675] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570<br>[=C2=A0=C2=A0=C2=
=A0 0.106760] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry 1: DCMPAREA=
CRAx:0x40000000 DCMPAREACRBx:0x0<br>[=C2=A0=C2=A0=C2=A0 0.113672] NOTICE:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry 2: DCMPAREACRAx:0x20000000 DCMPA=
REACRBx:0x0<br>[=C2=A0=C2=A0=C2=A0 0.120586] NOTICE:=C2=A0 BL2: v1.4(releas=
e):15dba6b<br>[=C2=A0=C2=A0=C2=A0 0.125076] NOTICE:=C2=A0 BL2: Built : 14:4=
8:12, Jan 29 2019<br>[=C2=A0=C2=A0=C2=A0 0.130264] NOTICE:=C2=A0 BL2: Norma=
l boot<br>[=C2=A0=C2=A0=C2=A0 0.133909] NOTICE:=C2=A0 BL2: dst=3D0xe6320d00=
 src=3D0x8180000 len=3D512(0x200)<br>[=C2=A0=C2=A0=C2=A0 0.140292] NOTICE:=
=C2=A0 BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x1800)<br>[=C2=A0=
=C2=A0=C2=A0 0.146913] NOTICE:=C2=A0 BL2: dst=3D0x44000000 src=3D0x81c0000 =
len=3D65536(0x10000)<br>[=C2=A0=C2=A0=C2=A0 0.154144] NOTICE:=C2=A0 BL2: ds=
t=3D0x44100000 src=3D0x8200000 len=3D1048576(0x100000)<br>[=C2=A0=C2=A0=C2=
=A0 0.168967] NOTICE:=C2=A0 BL2: dst=3D0x50000000 src=3D0x8640000 len=3D104=
8576(0x100000)<br><br><br>U-Boot 2015.04 (Jan 21 2019 - 20:33:02)<br><br>CP=
U: Renesas Electronics R8A7796 rev 1.0<br>Board: M3ULCB<br>I2C:=C2=A0=C2=A0=
 ready<br>DRAM:=C2=A0 1.9 GiB<br>Bank #0: 0x048000000 - 0x07fffffff, 896 Mi=
B<br>Bank #1: 0x600000000 - 0x63fffffff, 1 GiB<br><br>MMC:=C2=A0=C2=A0 sh-s=
dhi: 0, sh-sdhi: 1<br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=A0=C2=A0 seri=
al<br>Err:=C2=A0=C2=A0 serial<br>Net:=C2=A0=C2=A0 ravb<br></div><div><br></=
div><div>First, it is nice to know where to look for the build time for the=
 BL2!<br></div><div><br></div><div>After loading earlyprintk enabled Xen an=
d the 4.14 Linux kernel from Yocto 3.9, I was met with the following output=
:</div><div><br></div><div>Starting kernel ...<br><br>- UART enabled -<br>-=
 CPU 00000000 booting -<br>- Current EL 00000008 -<br>- Xen starting at EL2=
 -<br>- Zero BSS -<br>- Setting up control registers -<br>- Turning on pagi=
ng -<br>- Ready -<br>(XEN) Checking for initrd in /chosen<br>(XEN) RAM: 000=
0000048000000 - 000000007fffffff<br>(XEN) RAM: 0000000600000000 - 000000063=
fffffff<br>(XEN) RAM: 0000000600000000 - 000000063fffffff<br>(XEN) <br>(XEN=
) MODULE[0]: 0000000048000000 - 0000000048011000 Device Tree <br>(XEN) MODU=
LE[1]: 000000007a000000 - 000000007c000000 Kernel=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <br>(XEN)=C2=A0 RESVD[0]: 0000000048000000 - 0000000048011000<br>(XE=
N) <br>(XEN) <br>(XEN) Command line: dom0_mem=3D752M console=3Ddtuart dtuar=
t=3Dserial0 dom0_max_vcpus=3D4<br>(XEN) PFN compression on bits 19...20<br>=
(XEN) Xen BUG at page_alloc.c:274<br>(XEN) ----[ Xen-4.12.0-rc=C2=A0 arm64=
=C2=A0 debug=3Dy=C2=A0=C2=A0 Not tainted ]----<br>(XEN) CPU:=C2=A0=C2=A0=C2=
=A0 0<br>(XEN) PC:=C2=A0=C2=A0=C2=A0=C2=A0 000000000028b310 page_alloc.c#bo=
otmem_region_add+0x188/0x198<br>(XEN) LR:=C2=A0=C2=A0=C2=A0=C2=A0 000000000=
028b370<br>(XEN) SP:=C2=A0=C2=A0=C2=A0=C2=A0 00000000002d7d00<br>(XEN) CPSR=
:=C2=A0=C2=A0 800003c9 MODE:64-bit EL2h (Hypervisor, handler)<br>(XEN)=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 X0: 0000000000600000=C2=A0 X1: 0000000000000003=
=C2=A0 X2: 0000000000000004<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X3: 0000=
000000640000=C2=A0 X4: 0000800008011000=C2=A0 X5: 0000000000000028<br>(XEN)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X6: 0000000000600000=C2=A0 X7: 0000000000000=
004=C2=A0 X8: 0000000000000001<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X9: 0=
00000000000000a X10: 00000000002d7afa X11: 0000000000000032<br>(XEN)=C2=A0=
=C2=A0=C2=A0=C2=A0 X12: 0000000000000002 X13: 000000000026e5d8 X14: 0000000=
000000020<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X15: 0000000000400000 X16: 00000=
00000000000 X17: 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X18: 000=
000007fe5ae30 X19: 0000000000600000 X20: 0000000000640000<br>(XEN)=C2=A0=C2=
=A0=C2=A0=C2=A0 X21: 0000000640000000 X22: 0000000600000000 X23: 0000000640=
000000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X24: 000000000028b320 X25: 00000000=
002b83e0 X26: 0000000048000000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 X27: 000000=
0640000000 X28: 0000000000000002=C2=A0 FP: 00000000002d7d00<br>(XEN) <br>(X=
EN)=C2=A0=C2=A0 VTCR_EL2: 80000000<br>(XEN)=C2=A0 VTTBR_EL2: 00000000000000=
00<br>(XEN) <br>(XEN)=C2=A0 SCTLR_EL2: 30cd183d<br>(XEN)=C2=A0=C2=A0=C2=A0 =
HCR_EL2: 000000000078663f<br>(XEN)=C2=A0 TTBR0_EL2: 0000000078194000<br>(XE=
N) <br>(XEN)=C2=A0=C2=A0=C2=A0 ESR_EL2: f2000001<br>(XEN)=C2=A0 HPFAR_EL2: =
0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 FAR_EL2: 0000000000000000<br>(X=
EN) <br>(XEN) Xen stack trace from sp=3D00000000002d7d00:<br>(XEN)=C2=A0=C2=
=A0=C2=A0 00000000002d7d40 000000000028b370 0000000000000001 00000006000000=
00<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000640000000 0000000600000000 00000006400=
00000 00000000002d7d90<br>(XEN)=C2=A0=C2=A0=C2=A0 00000000002d7d90 00000000=
0029c81c 0000000000000001 0000000600000000<br>(XEN)=C2=A0=C2=A0=C2=A0 00000=
00640000000 0000000600000000 0000000640000000 0000000000000001<br>(XEN)=C2=
=A0=C2=A0=C2=A0 00000000002e0000 0000000600000000 00000000002d7de0 00000000=
0029d9e8<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000640000000 0000000600000000 00000=
00640000000 00000000002b83c0<br>(XEN)=C2=A0=C2=A0=C2=A0 ffffffffffffffff 00=
000000002b83d8 0000000048000000 0000000048011000<br>(XEN)=C2=A0=C2=A0=C2=A0=
 000000007fe5a940 0000000000200608 0000000078080000 0000000077e80000<br>(XE=
N)=C2=A0=C2=A0=C2=A0 0000000048000000 0000000000000000 0000000000400000 000=
0000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000001 0000000000000000 =
0000000078080000 0000000000000400<br>(XEN)=C2=A0=C2=A0=C2=A0 00000000000000=
00 0000000000011000 0000000048000000 00000000b8000000<br>(XEN)=C2=A0=C2=A0=
=C2=A0 00000000002b83c0 000000000028b320 0000000000000000 0000000000000000<=
br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000300000000 ffffffff000000=
00 0000040000000040<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 00000000000=
00000 0000000000000000 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 00000000=
00000000 0000000000000000 0000000000000000 0000000000000000<br>(XEN)=C2=A0=
=C2=A0=C2=A0 0000000000000000 0000000000000000 0000000000000000 00000000000=
00000<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00000000=
00000000 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 00000=
00000000000 0000000000000000 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 00=
00000000000000 0000000000000000 0000000000000000 0000000000000000<br>(XEN)=
=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 0000000000000000 00000=
00000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 00=
00000000000000 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000=
 0000000000000000 0000000000000000 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=
=A0 0000000000000000 0000000000000000 0000000000000000 0000000000000000<br>=
(XEN)=C2=A0=C2=A0=C2=A0 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000<br>(XEN) Xen call trace:<br>(XEN)=C2=A0=C2=A0=C2=A0 [&lt;0=
00000000028b310&gt;] page_alloc.c#bootmem_region_add+0x188/0x198 (PC)<br>(X=
EN)=C2=A0=C2=A0=C2=A0 [&lt;000000000028b370&gt;] init_boot_pages+0x50/0x17c=
 (LR)<br>(XEN)=C2=A0=C2=A0=C2=A0 [&lt;000000000028b370&gt;] init_boot_pages=
+0x50/0x17c<br>(XEN)=C2=A0=C2=A0=C2=A0 [&lt;000000000029c81c&gt;] dt_unrese=
rved_regions+0xc8/0xdc<br>(XEN)=C2=A0=C2=A0=C2=A0 [&lt;000000000029d9e8&gt;=
] start_xen+0xbec/0xc5c<br>(XEN)=C2=A0=C2=A0=C2=A0 [&lt;0000000000200608&gt=
;] arm64/head.o#paging+0x60/0x98<br>(XEN) <br>(XEN) <br>(XEN) *************=
***************************<br>(XEN) Panic on CPU 0:<br>(XEN) Xen BUG at pa=
ge_alloc.c:274<br>(XEN) ****************************************<br>(XEN) <=
br>(XEN) Reboot in five seconds...<br><br></div><div>I am using a 4.12.0-rc=
 Xen, specifically from commit 08b908ba63dee8bc313983c5e412852cbcbcda85 dat=
ed Jan 16, 16:16:56 2019.</div><div><br></div><div>Do you have any idea wha=
t could be the matter?</div><div><br></div><div>Thank you very much for all=
 the support.</div><div><br></div><div>Best regards,</div><div><br></div><d=
iv>Jairo<br></div><div><br></div></div></div></div></div></div>

--000000000000bbc94b058092bf8f--


--===============0137485027646338571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0137485027646338571==--
