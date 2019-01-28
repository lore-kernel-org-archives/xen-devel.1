From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Tue, 29 Jan 2019 02:20:32 +0900
Message-ID: <CACrvCsYb0ANJASKYxeA0V2yg0aqKM0OaKCB=_i1zX9DPLwrNrQ@mail.gmail.com>
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
 <CACrvCsZB-tps6=Vr=1Phf5oo5eUReabMLJzkbO3d2hmNLDOxww@mail.gmail.com>
 <7e217489-2c1a-c35f-d51f-0969654aa8cc@gmail.com>
 <CACrvCsaYJ-zGkZwfdV7BXDABW8u_EDQetU3pq+2otRGXWTXagw@mail.gmail.com>
 <4d078801-b804-06e7-ad5c-8032b1dbaa84@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2198472923921362570=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4d078801-b804-06e7-ad5c-8032b1dbaa84@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============2198472923921362570==
Content-Type: multipart/alternative; boundary="0000000000006ff9960580802abf"

--0000000000006ff9960580802abf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrii,

Thank you for your previous mail.

I am sorry for taking so long to answer.

The rest of the mail is inline

2019=E5=B9=B41=E6=9C=8822=E6=97=A5(=E7=81=AB) 18:00 Andrii Anisov <andrii.a=
nisov@gmail.com>:

>
>
> On 22.01.19 12:45, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
> > Yes. Since you pointed out that the U-boot version was not what you
> expected, I downgraded to Yocto 3.9. I am able to boot Linux 4.14 but Xen=
,
> of any version continues to give me absolutely no output.
> Ok, let you try to start with earlyprintk. Follow next steps
>   - Go to <your Yocto dir>/build/tmp/work/aarch64-poky-linux/xen/<your
> version>/git/
>   - Run `make distclean`
>   - Go to <your Yocto dir>/build/tmp/work/aarch64-poky-linux/xen/<your
> version>/temp/
>   - Edit a file hidden behind a symbolic link `run.do_compile`: find
> `oe_runmake_call()` function, to the line `make -j8 STDVGA....` add
> `CONFIG_EARLY_PRINTK=3Drcar3`, correct `debug=3Dy`.
>   - Run `./run.do_configure`
>   - Run ./run.do_compile
>   - Go to <your Yocto dir>/build/tmp/work/aarch64-poky-linux/xen/<your
> version>/git/xen/
>   - Run `mkimage -A arm64 -C none -T kernel -a 0x78080000 -e 0x78080000 -=
n
> "XEN" -d xen xen.uImage`
>   - Boot your board with just created xen.uImage.
>
>
I was able to compile the Xen image with earlyprintk without issue. It is
comforting to get some sort of feedback from the device, even if it is
failing.


> But I'm 99 percents sure you will see memory initialization error from
> XEN, so you should merge your memory nodes.
>
> >     Do not forget following:
> >
> >      >      >          memory@48000000 {
> >      >      >                  device_type =3D "memory";
> >      >      >                  /* first 128MB is reserved for secure
> area. */
> >      >      >                  reg =3D <0x0 0x48000000 0x0 0x38000000>;
> >      >      >          };
> >      >      >
> >      >      >          memory@600000000 {
> >      >      >                  device_type =3D "memory";
> >      >      >                  reg =3D <0x6 0x00000000 0x0 0x40000000>;
> >      >      >          };
> >      >     Merge memory nodes to be sure u-boot do not duplicate memory
> ranges.
> >
> >
> > Is this merge also required for Renesas' Yocto 3.9?
> Yes, we escalated the problem and the solution to Renesas, but 3.9 still
> needs memory nodes merging.
> They should have unset `CONFIG_ARCH_FIXUP_FDT` in a u-boot config. But
> Yocto 3.9 still have `CONFIG_ARCH_FIXUP_FDT=3Dy` configured for u-boot.
>
>
I was also able to make a compilable DTB file by merging the memory ranges.
I used the following configuration:

 memory@48000000 {
                device_type =3D "memory";
                /* first 128MB is reserved for secure area. */
               reg =3D <0x0 0x48000000 0x0 0x38000000>,  <0x6 0x00000000 0x=
0
0x40000000>;
}



> >      > That my M3 is old sounds unfortunate.
> >      > What limitation for Xen would I have to live with, with a lack o=
f
> a IPMMU?
> >     I'm not 100% sure, but as long as it works, there should not be
> other issues.
> >     You just will not be able to passthrough peripherals to guest
> domains (that is what IPMMU is needed for).
> >
> >
> > Ah, it is a shame that I won't be able to passthrough peripherals to
> guest domains. Fortunately at this point in time I only need to benchmark
> the CPUs so this should not affect me.
> It must be ok from the technical point of view.
>
> --
> Sincerely,
> Andrii Anisov.
>


When attempting to boot the Xen image created I did get print messages but
I get the following:

[    0.000191] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57)
Rev.1.0.21
[    0.005753] NOTICE:  BL2: PRR is R-Car M3
Ver.1.0
[    0.010422] NOTICE:  BL2: Board is Starter Kit
Rev.1.0
[    0.015534] NOTICE:  BL2: Boot device is
HyperFlash(80MHz)
[    0.020960] NOTICE:  BL2: LCM state is
CM
[    0.025002] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=3D0x53
[    0.030989] NOTICE:  BL2: DDR3200(rev.0.33)NOTICE:  [COLD_BOOT]NOTICE:
..0
[    0.086118] NOTICE:  BL2: DRAM Split is 2ch
[    0.090003] NOTICE:  BL2: QoS is default setting(rev.0.19)
[    0.095507] NOTICE:  BL2: Lossy Decomp areas
[    0.099680] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
DCMPAREACRBx:0x570
[    0.106765] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
DCMPAREACRBx:0x0
[    0.113677] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
DCMPAREACRBx:0x0
[    0.120591] NOTICE:  BL2: v1.4(release):15dba6b
[    0.125081] NOTICE:  BL2: Built : 11:34:26, Jan 21 2019
[    0.130269] NOTICE:  BL2: Normal boot
[    0.133914] NOTICE:  BL2: dst=3D0xe6320d00 src=3D0x8180000 len=3D512(0x2=
00)
[    0.140297] NOTICE:  BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x=
1800)
[    0.146918] NOTICE:  BL2: dst=3D0x44000000 src=3D0x81c0000 len=3D65536(0=
x10000)
[    0.154148] NOTICE:  BL2: dst=3D0x44100000 src=3D0x8200000
len=3D1048576(0x100000)
[    0.168971] NOTICE:  BL2: dst=3D0x50000000 src=3D0x8640000
len=3D1048576(0x100000)

</ redacted u-boot image load information>

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

- UART enabled -
- CPU 00000000 booting -
- Current EL 00000004 -
- Xen must be entered in NS EL2 mode -
- Please update the bootloader -
- Boot failed -

I thought that using the U-boot image from Yocto 3.9 would automatically
let me avoid the issue with boot loader entering the wrong mode.

As I mentioned before I am using the rocko branches from
meta-virtualization and meta-selinux as shown below:

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

I have no idea if that affects the u-boot creation, but I thought I might
as well mention that.

Once again thank you for all the help. If there is any other information I
can give you, please let me know.

Best regards,

Jairo

--0000000000006ff9960580802abf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Andrii,</div><div><br></di=
v><div>Thank you for your previous mail.</div><div><br></div><div>I am sorr=
y for taking so long to answer.</div><div><br></div><div>The rest of the ma=
il is inline<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">2019=E5=B9=B41=E6=9C=8822=E6=97=A5(=E7=81=AB) 18:00 A=
ndrii Anisov &lt;<a href=3D"mailto:andrii.anisov@gmail.com">andrii.anisov@g=
mail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 22.01.19 12:45, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:<br>
&gt; Yes. Since you pointed out that the U-boot version was not what you ex=
pected, I downgraded to Yocto 3.9. I am able to boot Linux 4.14 but Xen, of=
 any version continues to give me absolutely no output.<br>
Ok, let you try to start with earlyprintk. Follow next steps<br>
=C2=A0 - Go to &lt;your Yocto dir&gt;/build/tmp/work/aarch64-poky-linux/xen=
/&lt;your version&gt;/git/<br>
=C2=A0 - Run `make distclean`<br>
=C2=A0 - Go to &lt;your Yocto dir&gt;/build/tmp/work/aarch64-poky-linux/xen=
/&lt;your version&gt;/temp/<br>
=C2=A0 - Edit a file hidden behind a symbolic link `run.do_compile`: find `=
oe_runmake_call()` function, to the line `make -j8 STDVGA....` add `CONFIG_=
EARLY_PRINTK=3Drcar3`, correct `debug=3Dy`.<br>
=C2=A0 - Run `./run.do_configure`<br>
=C2=A0 - Run ./run.do_compile<br>
=C2=A0 - Go to &lt;your Yocto dir&gt;/build/tmp/work/aarch64-poky-linux/xen=
/&lt;your version&gt;/git/xen/<br>
=C2=A0 - Run `mkimage -A arm64 -C none -T kernel -a 0x78080000 -e 0x7808000=
0 -n &quot;XEN&quot; -d xen xen.uImage`<br>
=C2=A0 - Boot your board with just created xen.uImage.<br>
<br></blockquote><div><br></div><div>I was able to compile the Xen image wi=
th earlyprintk without issue. It is comforting to get some sort of feedback=
 from the device, even if it is failing.<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
But I&#39;m 99 percents sure you will see memory initialization error from =
XEN, so you should merge your memory nodes.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Do not forget following:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory@48000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 device_type =3D &quot;memory&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* first 128MB is reserved for secure area. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D &lt;0x0 0x48000000 0x0 0x38000000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memory@600000000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 device_type =3D &quot;memory&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 reg =3D &lt;0x6 0x00000000 0x0 0x40000000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Merge memory nodes to be s=
ure u-boot do not duplicate memory ranges.<br>
&gt; <br>
&gt; <br>
&gt; Is this merge also required for Renesas&#39; Yocto 3.9?<br>
Yes, we escalated the problem and the solution to Renesas, but 3.9 still ne=
eds memory nodes merging.<br>
They should have unset `CONFIG_ARCH_FIXUP_FDT` in a u-boot config. But Yoct=
o 3.9 still have `CONFIG_ARCH_FIXUP_FDT=3Dy` configured for u-boot.<br>
<br></blockquote><div><br></div><div>I was also able to make a compilable D=
TB file by merging the memory ranges. I used the following configuration:</=
div><div><br></div><div>=C2=A0memory@48000000 {<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_t=
ype =3D &quot;memory&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* first 128MB is reserved=
 for secure area. */<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x48000000 0x0 0x38000000=
&gt;,=C2=A0 &lt;0x6 0x00000000 0x0 0x40000000&gt;;<br>}</div><div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; That my M3 is old sounds unfortunate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; What limitation for Xen would I have to live =
with, with a lack of a IPMMU?<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not 100% sure, but as long as it works, the=
re should not be other issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0You just will not be able to passthrough peripheral=
s to guest domains (that is what IPMMU is needed for).<br>
&gt; <br>
&gt; <br>
&gt; Ah, it is a shame that I won&#39;t be able to passthrough peripherals =
to guest domains. Fortunately at this point in time I only need to benchmar=
k the CPUs so this should not affect me.<br>
It must be ok from the technical point of view.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Sincerely,<br>
Andrii Anisov.<br></blockquote><div><br></div><div><br></div><div>When atte=
mpting to boot the Xen image created I did get print messages but I get the=
 following:</div><div><br></div><div>[=C2=A0=C2=A0=C2=A0 0.000191] NOTICE:=
=C2=A0 BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.21<br>[=C2=A0=
=C2=A0=C2=A0 0.005753] NOTICE:=C2=A0 BL2: PRR is R-Car M3 Ver.1.0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>[=C2=A0=C2=
=A0=C2=A0 0.010422] NOTICE:=C2=A0 BL2: Board is Starter Kit Rev.1.0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>[=C2=A0=C2=A0=C2=A0 0.015534] NOTICE:=
=C2=A0 BL2: Boot device is HyperFlash(80MHz)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>[=C2=A0=C2=
=A0=C2=A0 0.020960] NOTICE:=C2=A0 BL2: LCM state is CM=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <br>[=C2=A0=C2=A0=C2=A0 0.025002] NOTICE:=C2=A0 BL2: =
AVS setting succeeded. DVFS_SetVID=3D0x53<br>[=C2=A0=C2=A0=C2=A0 0.030989] =
NOTICE:=C2=A0 BL2: DDR3200(rev.0.33)NOTICE:=C2=A0 [COLD_BOOT]NOTICE:=C2=A0 =
..0<br>[=C2=A0=C2=A0=C2=A0 0.086118] NOTICE:=C2=A0 BL2: DRAM Split is 2ch<b=
r>[=C2=A0=C2=A0=C2=A0 0.090003] NOTICE:=C2=A0 BL2: QoS is default setting(r=
ev.0.19)<br>[=C2=A0=C2=A0=C2=A0 0.095507] NOTICE:=C2=A0 BL2: Lossy Decomp a=
reas<br>[=C2=A0=C2=A0=C2=A0 0.099680] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570<br>[=C2=A0=C2=A0=
=C2=A0 0.106765] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry 1: DCMPA=
REACRAx:0x40000000 DCMPAREACRBx:0x0<br>[=C2=A0=C2=A0=C2=A0 0.113677] NOTICE=
:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry 2: DCMPAREACRAx:0x20000000 DCMP=
AREACRBx:0x0<br>[=C2=A0=C2=A0=C2=A0 0.120591] NOTICE:=C2=A0 BL2: v1.4(relea=
se):15dba6b<br>[=C2=A0=C2=A0=C2=A0 0.125081] NOTICE:=C2=A0 BL2: Built : 11:=
34:26, Jan 21 2019<br>[=C2=A0=C2=A0=C2=A0 0.130269] NOTICE:=C2=A0 BL2: Norm=
al boot<br>[=C2=A0=C2=A0=C2=A0 0.133914] NOTICE:=C2=A0 BL2: dst=3D0xe6320d0=
0 src=3D0x8180000 len=3D512(0x200)<br>[=C2=A0=C2=A0=C2=A0 0.140297] NOTICE:=
=C2=A0 BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x1800)<br>[=C2=A0=
=C2=A0=C2=A0 0.146918] NOTICE:=C2=A0 BL2: dst=3D0x44000000 src=3D0x81c0000 =
len=3D65536(0x10000)<br>[=C2=A0=C2=A0=C2=A0 0.154148] NOTICE:=C2=A0 BL2: ds=
t=3D0x44100000 src=3D0x8200000 len=3D1048576(0x100000)<br>[=C2=A0=C2=A0=C2=
=A0 0.168971] NOTICE:=C2=A0 BL2: dst=3D0x50000000 src=3D0x8640000 len=3D104=
8576(0x100000)<br></div><div><br></div><div>&lt;/ redacted u-boot image loa=
d information&gt;<br></div><div><br>U-Boot 2015.04 (Jan 21 2019 - 20:33:02)=
<br><br>CPU: Renesas Electronics R8A7796 rev 1.0<br>Board: M3ULCB<br>I2C:=
=C2=A0=C2=A0 ready<br>DRAM:=C2=A0 1.9 GiB<br>Bank #0: 0x048000000 - 0x07fff=
ffff, 896 MiB<br>Bank #1: 0x600000000 - 0x63fffffff, 1 GiB<br><br>MMC:=C2=
=A0=C2=A0 sh-sdhi: 0, sh-sdhi: 1<br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=
=A0=C2=A0 serial<br>Err:=C2=A0=C2=A0 serial<br>Net:=C2=A0=C2=A0 ravb<br>Hit=
 any key to stop autoboot:=C2=A0 0 <br><br></div><div>=3D&gt; bootm 0x48080=
000 - 0x48000000<br>## Booting kernel from Legacy Image at 48080000 ...<br>=
=C2=A0=C2=A0 Image Name:=C2=A0=C2=A0 XEN<br>=C2=A0=C2=A0 Image Type:=C2=A0=
=C2=A0 AArch64 Linux Kernel Image (uncompressed)<br>=C2=A0=C2=A0 Data Size:=
=C2=A0=C2=A0=C2=A0 886096 Bytes =3D 865.3 KiB<br>=C2=A0=C2=A0 Load Address:=
 78080000<br>=C2=A0=C2=A0 Entry Point:=C2=A0 78080000<br>=C2=A0=C2=A0 Verif=
ying Checksum ... OK<br>## Flattened Device Tree blob at 48000000<br>=C2=A0=
=C2=A0 Booting using the fdt blob at 0x48000000<br>=C2=A0=C2=A0 Loading Ker=
nel Image ... OK<br>=C2=A0=C2=A0 Using Device Tree in place at 000000004800=
0000, end 0000000048013bc0<br><br>Starting kernel ...<br><br>- UART enabled=
 -<br>- CPU 00000000 booting -<br>- Current EL 00000004 -<br>- Xen must be =
entered in NS EL2 mode -<br>- Please update the bootloader -<br>- Boot fail=
ed -<br></div><div><br></div><div>I thought that using the U-boot image fro=
m Yocto 3.9 would automatically let me avoid the issue with boot loader ent=
ering the wrong mode.<br></div><div><br></div><div>As I mentioned before I =
am using the rocko branches from meta-virtualization and meta-selinux as sh=
own below:</div><div><br></div><div>Build Configuration:<br>BB_VERSION=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.36.0&=
quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;universal-4.9&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aarch64-poky-linux&quo=
t;<br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;m3ulcb&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky=
&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;2.4.=
2&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quo=
t;aarch64 cortexa57-cortexa53&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<br>SOC_FAMILY=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;rcar-gen3:=
r8a7796&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto-bsp=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;tmp:342fbd6a3e57021c8e28b124b3adb2=
41936f3d9d&quot;<br>meta-rcar-gen3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;tmp:fd078b6ece537d986852cb827bd21e022a797b2f&quot;<br>meta-optee=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;tmp:75d=
fb67bbb14a70cd47afda9726e2e1c76731885&quot;<br>meta-oe=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-python=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-networking=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;tmp:dacfa2b1920e285531bec55cd2f087=
43390aaf57&quot;<br>meta-selinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &quot;rocko:d855c624f32c5e599bf27e06cb8f5b25b3aae12d&quot;<br>me=
ta-virtualization=C2=A0 =3D &quot;rocko:b704c689b67639214b9568a3d62e82df27e=
9434f&quot;<br>meta-rcar-gen3-xen=C2=A0=C2=A0 =3D &quot;lastest_xen:cc6e6e1=
c07197207769331b0532fc88a9165a855&quot;<br></div><div><br></div><div>I have=
 no idea if that affects the u-boot creation, but I thought I might as well=
 mention that.</div><div><br></div><div>Once again thank you for all the he=
lp. If there is any other information I can give you, please let me know.</=
div><div><br></div><div>Best regards,</div><div><br></div><div>Jairo<br></d=
iv></div></div></div></div></div></div></div>

--0000000000006ff9960580802abf--


--===============2198472923921362570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2198472923921362570==--
