From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Wed, 9 Jan 2019 02:04:51 +0900
Message-ID: <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <AM6PR03MB49199366C64C259BF04157D5E6B90@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <CACrvCsbxLrGXzN8Y8w0ndZ2VLQ=QEtUq+KLAVRLnLYZRpiaqhg@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
 <3aecad20-41f5-4249-46be-bfef80c88ea3@gmail.com>
 <623d0b16-8616-183c-d8d4-559ad81363ed@gmail.com>
 <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7772488765936545913=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
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

--===============7772488765936545913==
Content-Type: multipart/alternative; boundary="000000000000c96712057eeda01c"

--000000000000c96712057eeda01c
Content-Type: text/plain; charset="UTF-8"

Andrii,

I have attempted to update the bootloader from the srec files created by
the bitbake command.

I believe I have been able to update it, but I am still obtaining the same
results. The serial output is shown below:

[    0.000161] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA57)
Rev.1.0.17
[    0.005721] NOTICE:  BL2: PRR is R-Car H3 Ver2.0
[    0.010304] NOTICE:  BL2: Board is Starter Kit Rev1.0
[    0.015331] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.020757] NOTICE:  BL2: LCM state is CM
[    0.024802] NOTICE:  BL2: AVS setting succeeded. DVFS_SetVID=0x53
[    0.030786] NOTICE:  BL2: DDR3200(rev.0.28)NOTICE:  [COLD_BOOT]NOTICE:
..0
[    0.059996] NOTICE:  BL2: DRAM Split is 4ch
[    0.063882] NOTICE:  BL2: QoS is default setting(rev.0.18)
[    0.069381] NOTICE:  BL2: Lossy Decomp areas
[    0.073559] NOTICE:       Entry 0: DCMPAREACRAx:0x80000540
DCMPAREACRBx:0x570
[    0.080643] NOTICE:       Entry 1: DCMPAREACRAx:0x40000000
DCMPAREACRBx:0x0
[    0.087555] NOTICE:       Entry 2: DCMPAREACRAx:0x20000000
DCMPAREACRBx:0x0
[    0.094470] NOTICE:  BL2: v1.3(release):b15fefa
[    0.098960] NOTICE:  BL2: Built : 12:21:32, Dec 28 2018
[    0.104147] NOTICE:  BL2: Normal boot
[    0.107788] NOTICE:  BL2: dst=0xe6322210 src=0x8180000 len=512(0x200)
[    0.114335] NOTICE:  BL2: dst=0x43f00000 src=0x8180400 len=6144(0x1800)
[    0.120797] NOTICE:  BL2: dst=0x44000000 src=0x81c0000 len=65536(0x10000)
[    0.128022] NOTICE:  BL2: dst=0x44100000 src=0x8200000
len=524288(0x80000)
[    0.138503] NOTICE:  BL2: dst=0x50000000 src=0x8640000
len=1048576(0x100000)


U-Boot 2015.04 (Dec 28 2018 - 02:46:24)

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
=> setenv bootargs
=> setenv serverip 192.168.1.100
=> tftp 0x48080000 xen-h3ulcb.uImage
ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !
Half
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'xen-h3ulcb.uImage'.
Load address: 0x48080000
Loading: *
ARP Retry count exceeded; starting again
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !
Half

ARP Retry count exceeded; starting again
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'xen-h3ulcb.uImage'.
Load address: 0x48080000
Loading: ###########################################################
         25.4 MiB/s
done
Bytes transferred = 852368 (d0190 hex)
=> tftp 0x48000000 Image-r8a7795-h3ulcb-xen-local.dtb
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete..... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'Image-r8a7795-h3ulcb-xen-local.dtb'.
Load address: 0x48000000
Loading: #####
         11.7 KiB/s
done
Bytes transferred = 63778 (f922 hex)
=> tftp 0x7a000000 h3ulcb-image
ravb:0 is connected to ravb.  Reconnecting to ravb
ravb Waiting for PHY auto negotiation to complete... done
ravb: 1000Base/Full
Using ravb device
TFTP from server 192.168.1.100; our IP address is 192.168.1.40
Filename 'h3ulcb-image'.
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
         ########################################
         2.1 MiB/s
done
Bytes transferred = 15843840 (f1c200 hex)
=> bootm 0x48080000 - 0x48000000
## Booting kernel from Legacy Image at 48080000 ...
   Image Name:   XEN
   Image Type:   AArch64 Linux Kernel Image (uncompressed)
   Data Size:    852304 Bytes = 832.3 KiB
   Load Address: 78080000
   Entry Point:  78080000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 48000000
   Booting using the fdt blob at 0x48000000
   Loading Kernel Image ... OK
   Using Device Tree in place at 0000000048000000, end 0000000048012921

Starting kernel ...

</end output>

I have noticed that the uboot date has not changed from 2015.04 although
the build date is from the last time I ran a bitbake command.

I do not know what version of uboot should be used without breaking the
current compiling versions.

Are there any other modifications that I can attempt?

Thank you very much for your time and patience.

Best regards,

Jairo

--000000000000c96712057eeda01c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Andrii,</div><div><br></div><div>I h=
ave attempted to update the bootloader from the srec files created by the b=
itbake command.</div><div><br></div><div>I believe I have been able to upda=
te it, but I am still obtaining the same results. The serial output is show=
n below:</div><div><br></div><div>[=C2=A0=C2=A0=C2=A0 0.000161] NOTICE:=C2=
=A0 BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.17<br>[=C2=A0=C2=
=A0=C2=A0 0.005721] NOTICE:=C2=A0 BL2: PRR is R-Car H3 Ver2.0<br>[=C2=A0=C2=
=A0=C2=A0 0.010304] NOTICE:=C2=A0 BL2: Board is Starter Kit Rev1.0<br>[=C2=
=A0=C2=A0=C2=A0 0.015331] NOTICE:=C2=A0 BL2: Boot device is HyperFlash(80MH=
z)<br>[=C2=A0=C2=A0=C2=A0 0.020757] NOTICE:=C2=A0 BL2: LCM state is CM<br>[=
=C2=A0=C2=A0=C2=A0 0.024802] NOTICE:=C2=A0 BL2: AVS setting succeeded. DVFS=
_SetVID=3D0x53<br>[=C2=A0=C2=A0=C2=A0 0.030786] NOTICE:=C2=A0 BL2: DDR3200(=
rev.0.28)NOTICE:=C2=A0 [COLD_BOOT]NOTICE:=C2=A0 ..0<br>[=C2=A0=C2=A0=C2=A0 =
0.059996] NOTICE:=C2=A0 BL2: DRAM Split is 4ch<br>[=C2=A0=C2=A0=C2=A0 0.063=
882] NOTICE:=C2=A0 BL2: QoS is default setting(rev.0.18)<br>[=C2=A0=C2=A0=
=C2=A0 0.069381] NOTICE:=C2=A0 BL2: Lossy Decomp areas<br>[=C2=A0=C2=A0=C2=
=A0 0.073559] NOTICE:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry 0: DCMPAREA=
CRAx:0x80000540 DCMPAREACRBx:0x570<br>[=C2=A0=C2=A0=C2=A0 0.080643] NOTICE:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Entry 1: DCMPAREACRAx:0x40000000 DCMPA=
REACRBx:0x0<br>[=C2=A0=C2=A0=C2=A0 0.087555] NOTICE:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0<br>[=C2=
=A0=C2=A0=C2=A0 0.094470] NOTICE:=C2=A0 BL2: v1.3(release):b15fefa<br>[=C2=
=A0=C2=A0=C2=A0 0.098960] NOTICE:=C2=A0 BL2: Built : 12:21:32, Dec 28 2018<=
br>[=C2=A0=C2=A0=C2=A0 0.104147] NOTICE:=C2=A0 BL2: Normal boot<br>[=C2=A0=
=C2=A0=C2=A0 0.107788] NOTICE:=C2=A0 BL2: dst=3D0xe6322210 src=3D0x8180000 =
len=3D512(0x200)<br>[=C2=A0=C2=A0=C2=A0 0.114335] NOTICE:=C2=A0 BL2: dst=3D=
0x43f00000 src=3D0x8180400 len=3D6144(0x1800)<br>[=C2=A0=C2=A0=C2=A0 0.1207=
97] NOTICE:=C2=A0 BL2: dst=3D0x44000000 src=3D0x81c0000 len=3D65536(0x10000=
)<br>[=C2=A0=C2=A0=C2=A0 0.128022] NOTICE:=C2=A0 BL2: dst=3D0x44100000 src=
=3D0x8200000 len=3D524288(0x80000)<br>[=C2=A0=C2=A0=C2=A0 0.138503] NOTICE:=
=C2=A0 BL2: dst=3D0x50000000 src=3D0x8640000 len=3D1048576(0x100000)<br><br=
><br>U-Boot 2015.04 (Dec 28 2018 - 02:46:24)<br><br>CPU: Renesas Electronic=
s R8A7795 rev 2.0<br>Board: H3ULCB<br>I2C:=C2=A0=C2=A0 ready<br>DRAM:=C2=A0=
 3.9 GiB<br>MMC:=C2=A0=C2=A0 sh-sdhi: 0, sh-sdhi: 1<br>In:=C2=A0=C2=A0=C2=
=A0 serial<br>Out:=C2=A0=C2=A0 serial<br>Err:=C2=A0=C2=A0 serial<br>Net:=C2=
=A0=C2=A0 ravb<br>Hit any key to stop autoboot:=C2=A0 0 <br>=3D&gt; setenv =
bootargs<br>=3D&gt; setenv serverip 192.168.1.100<br>=3D&gt; tftp 0x4808000=
0 xen-h3ulcb.uImage<br>ravb Waiting for PHY auto negotiation to complete...=
...... TIMEOUT !<br>Half<br>Using ravb device<br>TFTP from server 192.168.1=
.100; our IP address is 192.168.1.40<br>Filename &#39;xen-h3ulcb.uImage&#39=
;.<br>Load address: 0x48080000<br>Loading: *<br>ARP Retry count exceeded; s=
tarting again<br>ravb:0 is connected to ravb.=C2=A0 Reconnecting to ravb<br=
>ravb Waiting for PHY auto negotiation to complete......... TIMEOUT !<br>Ha=
lf<br><br>ARP Retry count exceeded; starting again<br>ravb:0 is connected t=
o ravb.=C2=A0 Reconnecting to ravb<br>ravb Waiting for PHY auto negotiation=
 to complete... done<br>ravb: 1000Base/Full<br>Using ravb device<br>TFTP fr=
om server 192.168.1.100; our IP address is 192.168.1.40<br>Filename &#39;xe=
n-h3ulcb.uImage&#39;.<br>Load address: 0x48080000<br>Loading: #############=
##############################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 25.4 MiB/s<br>done<br>Bytes transferred =3D 852368=
 (d0190 hex)<br>=3D&gt; tftp 0x48000000 Image-r8a7795-h3ulcb-xen-local.dtb<=
br>ravb:0 is connected to ravb.=C2=A0 Reconnecting to ravb<br>ravb Waiting =
for PHY auto negotiation to complete..... done<br>ravb: 1000Base/Full<br>Us=
ing ravb device<br>TFTP from server 192.168.1.100; our IP address is 192.16=
8.1.40<br>Filename &#39;Image-r8a7795-h3ulcb-xen-local.dtb&#39;.<br>Load ad=
dress: 0x48000000<br>Loading: #####<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 11.7 KiB/s<br>done<br>Bytes transferred =3D 63778 (f922 hex)<b=
r>=3D&gt; tftp 0x7a000000 h3ulcb-image<br>ravb:0 is connected to ravb.=C2=
=A0 Reconnecting to ravb<br>ravb Waiting for PHY auto negotiation to comple=
te... done<br>ravb: 1000Base/Full<br>Using ravb device<br>TFTP from server =
192.168.1.100; our IP address is 192.168.1.40<br>Filename &#39;h3ulcb-image=
&#39;.<br>Load address: 0x7a000000<br>Loading: ############################=
#####################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ###########################################################=
######<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ################=
#################################################<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###############################################=
##################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ####=
#############################################################<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ###################################=
##############################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 #################################################################=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ######################=
###########################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #####################################################=
############<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ##########=
#######################################################<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #########################################=
########################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 #################################################################<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ##########################=
#######################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ########################################################=
#########<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #############=
####################################################<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ############################################=
#####################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #=
#######################################<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 2.1 MiB/s<br>done<br>Bytes transferred =3D 15843840 (f1c=
200 hex)<br>=3D&gt; bootm 0x48080000 - 0x48000000<br>## Booting kernel from=
 Legacy Image at 48080000 ...<br>=C2=A0=C2=A0 Image Name:=C2=A0=C2=A0 XEN<b=
r>=C2=A0=C2=A0 Image Type:=C2=A0=C2=A0 AArch64 Linux Kernel Image (uncompre=
ssed)<br>=C2=A0=C2=A0 Data Size:=C2=A0=C2=A0=C2=A0 852304 Bytes =3D 832.3 K=
iB<br>=C2=A0=C2=A0 Load Address: 78080000<br>=C2=A0=C2=A0 Entry Point:=C2=
=A0 78080000<br>=C2=A0=C2=A0 Verifying Checksum ... OK<br>## Flattened Devi=
ce Tree blob at 48000000<br>=C2=A0=C2=A0 Booting using the fdt blob at 0x48=
000000<br>=C2=A0=C2=A0 Loading Kernel Image ... OK<br>=C2=A0=C2=A0 Using De=
vice Tree in place at 0000000048000000, end 0000000048012921<br><br>Startin=
g kernel ...<br></div><div><br></div><div>&lt;/end output&gt;</div><div><br=
></div><div>I have noticed that the uboot date has not changed from 2015.04=
 although the build date is from the last time I ran a bitbake command.</di=
v><div><br></div><div>I do not know what version of uboot should be used wi=
thout breaking the current compiling versions.</div><div><br></div><div>Are=
 there any other modifications that I can attempt?</div><div><br></div><div=
>Thank you very much for your time and patience.</div><div><br></div><div>B=
est regards,</div><div><br></div><div>Jairo<br></div><div><br></div><div><b=
r></div><div><br></div></div></div>

--000000000000c96712057eeda01c--


--===============7772488765936545913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7772488765936545913==--
