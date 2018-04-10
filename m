From: Peter McLaren <petermclaren_aus@hotmail.com>
Subject: BUG - 'xl restore' does not overwrite HVM
Date: Tue, 10 Apr 2018 06:07:12 +0000
Message-ID: <SLXP216MB0400FAF0B3B6F63F1C26830EFBBE0@SLXP216MB0400.KORP216.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1902234099094249699=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-AU
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============1902234099094249699==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_SLXP216MB0400FAF0B3B6F63F1C26830EFBBE0SLXP216MB0400KORP_"

--_000_SLXP216MB0400FAF0B3B6F63F1C26830EFBBE0SLXP216MB0400KORP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi
with at least 1 version of Windows 10 (build 16299), the 'xl restore' comma=
nd does not overwrite the previously running HVM. The symptoms are:
1) the restore appears to rapidly complete after approx 50% of the time
2)  files created after the save in the running HVM are present after the r=
estore
3) the Windows system tries to recover.

I have tried restoring both with a shutdown of the Windows system or a dest=
roy. In both cases the results are the same.

I have listed some relevant info below. Any help would be appreciated.

Thanks

Peter


My xen config is immediately below and the HVM config below that:
root@debian:~# xl info
host                   : debian
release                : 3.16.0-4-amd64
version                : #1 SMP Debian 3.16.51-3 (2017-12-13)
machine                : x86_64
nr_cpus                : 2
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 2
threads_per_core       : 1
cpu_mhz                : 2926
hw_caps                : bfebfbff:20100800:00000000:00000900:0408e3bd:00000=
000:00000001:00000000
virt_caps              : hvm
total_memory           : 4060
free_memory            : 2248
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 4
xen_extra              : .1
xen_version            : 4.4.1
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-=
3.0-x86_32p hvm-3.0-x86_64
xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :
xen_commandline        : placeholder
cc_compiler            : gcc (Debian 4.9.2-10) 4.9.2
cc_compile_by          : ian.jackson
cc_compile_domain      : eu.citrix.com
cc_compile_date        : Thu Sep  7 18:01:06 UTC 2017
xend_config_format     : 4

Config:
#kernel=3D@/usr/lib/xen-4.0/boot/hvmloader@
builder =3D 'hvm'
memory =3D 2048
vcpus =3D 1
name=3D"W10N"
vif =3D ['bridge=3Dxenbr0']
#disk =3D ['phy:/dev/vg0/W10N,xvda,w','file:/media/usb/isos/windows10_16299=
.iso,hdc:cdrom,r']
disk =3D ['phy:/dev/vg0/W10N,xvda,w','file:/root/windows10_16299.iso,hdc:cd=
rom,r']
acpi =3D 1
boot =3D "cdn"
sdl =3D 0
serial =3D 'pty'
usb =3D 1
keymap=3D"en-gb"
vnc =3D 1
vnclisten =3D ''
vncpasswd =3D ""
root@debian:~#

Peter McLaren


--_000_SLXP216MB0400FAF0B3B6F63F1C26830EFBBE0SLXP216MB0400KORP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
with at least 1 version of Windows 10 (build 16299), the 'xl restore' comma=
nd does not overwrite the previously running HVM. The symptoms are:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
1) the restore appears to rapidly complete&nbsp;after&nbsp;approx 50% of th=
e time</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
2)&nbsp;&nbsp;files created after the save in the running HVM are present a=
fter the restore</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
3) the Windows system tries to recover.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I have tried restoring both with a shutdown of the Windows system or a dest=
roy. In both cases the results are the same.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I have listed some relevant info below. Any help would be appreciated.</div=
>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Peter</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
My xen&nbsp;config&nbsp;is immediately below and the HVM config below that:=
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<div>root@debian:~# xl info</div>
<div>host&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;: debian</div>
<div>release&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 3.16.=
0-4-amd64</div>
<div>version&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : #1 SM=
P Debian 3.16.51-3 (2017-12-13)</div>
<div>machine&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : x86_6=
4</div>
<div>nr_cpus&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 2</di=
v>
<div>max_cpu_id&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 3</div>
<div>nr_nodes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 1</di=
v>
<div>cores_per_socket&nbsp; &nbsp; &nbsp; &nbsp;: 2</div>
<div>threads_per_core&nbsp; &nbsp; &nbsp; &nbsp;: 1</div>
<div>cpu_mhz&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 2926<=
/div>
<div>hw_caps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : bfebf=
bff:20100800:00000000:00000900:0408e3bd:00000000:00000001:00000000</div>
<div>virt_caps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : hvm</div>
<div>total_memory&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 4060</div>
<div>free_memory&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 2248</div>
<div>sharing_freed_memory&nbsp; &nbsp;: 0</div>
<div>sharing_used_memory&nbsp; &nbsp; : 0</div>
<div>outstanding_claims&nbsp; &nbsp; &nbsp;: 0</div>
<div>free_cpus&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 0</div>
<div>xen_major&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 4</div>
<div>xen_minor&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 4</div>
<div>xen_extra&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : .1</div>
<div>xen_version&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 4.4.1</div>
<div>xen_caps&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: xen-3=
.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64</di=
v>
<div>xen_scheduler&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : credit</div>
<div>xen_pagesize&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: 4096</div>
<div>platform_params&nbsp; &nbsp; &nbsp; &nbsp; : virt_start=3D0xffff800000=
000000</div>
<div>xen_changeset&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :</div>
<div>xen_commandline&nbsp; &nbsp; &nbsp; &nbsp; : placeholder</div>
<div>cc_compiler&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : gcc (Debian 4.9=
.2-10) 4.9.2</div>
<div>cc_compile_by&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : ian.jackson</div>
<div>cc_compile_domain&nbsp; &nbsp; &nbsp; : eu.citrix.com</div>
<div>cc_compile_date&nbsp; &nbsp; &nbsp; &nbsp; : Thu Sep&nbsp; 7 18:01:06 =
UTC 2017</div>
<div>xend_config_format&nbsp; &nbsp; &nbsp;: 4</div>
<div><br>
</div>
Config:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<div>#kernel=3D@/usr/lib/xen-4.0/boot/hvmloader@</div>
<div>builder =3D 'hvm'</div>
<div>memory =3D 2048</div>
<div>vcpus =3D 1</div>
<div>name=3D&quot;W10N&quot;</div>
<div>vif =3D ['bridge=3Dxenbr0']</div>
<div>#disk =3D ['phy:/dev/vg0/W10N,xvda,w','file:/media/usb/isos/windows10_=
16299.iso,hdc:cdrom,r']</div>
<div>disk =3D ['phy:/dev/vg0/W10N,xvda,w','file:/root/windows10_16299.iso,h=
dc:cdrom,r']</div>
<div>acpi =3D 1</div>
<div>boot =3D &quot;cdn&quot;</div>
<div>sdl =3D 0</div>
<div>serial =3D 'pty'</div>
<div>usb =3D 1</div>
<div>keymap=3D&quot;en-gb&quot;</div>
<div>vnc =3D 1</div>
<div>vnclisten =3D ''</div>
<div>vncpasswd =3D &quot;&quot;</div>
<div>root@debian:~#</div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"signature">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt; color:#000000; ba=
ckground-color:#FFFFFF; font-family:Calibri,Arial,Helvetica,sans-serif">
<div><font face=3D"Geneva, Arial, Sans-serif">Peter McLaren</font></div>
<div><font size=3D"2"></font><br>
</div>
<div></div>
</div>
</div>
</body>
</html>

--_000_SLXP216MB0400FAF0B3B6F63F1C26830EFBBE0SLXP216MB0400KORP_--


--===============1902234099094249699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1902234099094249699==--
