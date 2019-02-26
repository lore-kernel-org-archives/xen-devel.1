From: =?utf-8?B?5pWP?= <lm11986@163.com>
Subject: =?utf-8?q?xl_create_domu_=EF=BC=9Aunable_to_add_disk_?=
 =?utf-8?q?devices?=
Date: Tue, 26 Feb 2019 21:20:35 +0800
Message-ID: <AFBDFBA5-BCFD-4A7C-A0E3-231B5903FD4F@163.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0223443767929556620=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uCaw=RB=163.com=lm11986@srs-us1.protection.inumbo.net>)
 id 1gycf2-0006jJ-TT
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 13:20:41 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============0223443767929556620==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-A48EE4E4-9AA5-4AC7-AF22-E40209CC2234


--Apple-Mail-A48EE4E4-9AA5-4AC7-AF22-E40209CC2234
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> I am trying to create domainu=EF=BC=88xen on FVP-Base-ReVC-2xAEMv8A=EF=BC=89=
but there is a issue
losetup /dev/loop0 /root/domU/rootfs.img
I run the command xl create domu.cfg
the domu.cfg=EF=BC=9A

kernel =3D "/root/domU/zImage=20
 memory =3D "128"
name =3D "domU"=20
 vcpus =3D 1=20
 disk =3D [ 'phy:/dev/loop0,xvda,w' ]
extra =3D "root=3D/dev/xvda rw console=3D"

libxl:error:libxl_exec.c:118:libxl_report_child_exitstatus:/etc/xen/scripts/=
block add[1985] exited with error status 127
libxl:error:libxl_creat.c:1298:domcreat_launch_dm:Domain6:unable to add disk=
 devices=

--Apple-Mail-A48EE4E4-9AA5-4AC7-AF22-E40209CC2234
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><span></span><blockquote type=3D"cite" preoffsettop=3D"130"><font c=
olor=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0); background-color:=
 rgba(255, 255, 255, 0);">I am trying to create domainu=EF=BC=88xen on FVP-B=
ase-ReVC-2xAEMv8A=EF=BC=89but there is a issue</span></font></blockquote><pr=
e style=3D"border: 1px solid rgb(221, 221, 221); padding: 1em; line-height: 1=
.3em;"><font face=3D"UICTFontTextStyleBody"><span style=3D"white-space: norm=
al; background-color: rgba(255, 255, 255, 0);">losetup /dev/loop0 /root/domU=
/rootfs.img</span></font></pre>I run the command xl create domu.cfg</div><di=
v dir=3D"ltr">the domu.cfg=EF=BC=9A</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr"><pre style=3D"border: 1px solid rgb(221, 221, 221); padding: 1em; l=
ine-height: 1.3em;"><font face=3D"UICTFontTextStyleBody"><span style=3D"whit=
e-space: normal; background-color: rgba(255, 255, 255, 0);">kernel =3D "/roo=
t/domU/zImage&nbsp;</span></font></pre><pre style=3D"border: 1px solid rgb(2=
21, 221, 221); padding: 1em; line-height: 1.3em;"><font face=3D"UICTFontText=
StyleBody"><span style=3D"white-space: normal; background-color: rgba(255, 2=
55, 255, 0);">&nbsp;memory =3D "128"</span></font></pre><pre style=3D"border=
: 1px solid rgb(221, 221, 221); padding: 1em; line-height: 1.3em;"><font fac=
e=3D"UICTFontTextStyleBody"><span style=3D"white-space: normal; background-c=
olor: rgba(255, 255, 255, 0);">name =3D "domU"&nbsp;</span></font></pre><pre=
 style=3D"border: 1px solid rgb(221, 221, 221); padding: 1em; line-height: 1=
.3em;"><font face=3D"UICTFontTextStyleBody"><span style=3D"white-space: norm=
al; background-color: rgba(255, 255, 255, 0);">&nbsp;vcpus =3D 1&nbsp;</span=
></font></pre><pre style=3D"border: 1px solid rgb(221, 221, 221); padding: 1=
em; line-height: 1.3em;"><font face=3D"UICTFontTextStyleBody"><span style=3D=
"white-space: normal; background-color: rgba(255, 255, 255, 0);">&nbsp;disk =3D=
 [ 'phy:/dev/loop0,xvda,w' ]</span></font></pre><pre style=3D"border: 1px so=
lid rgb(221, 221, 221); padding: 1em; line-height: 1.3em;"><pre style=3D"bor=
der: 1px solid rgb(221, 221, 221); padding: 1em; line-height: 1.3em;"><font f=
ace=3D"UICTFontTextStyleBody"><span style=3D"white-space: normal; background=
-color: rgba(255, 255, 255, 0);">extra =3D "root=3D/dev/xvda rw console=3D"<=
/span></font></pre></pre><span><br></span></div><div dir=3D"ltr"><span>libxl=
:error:libxl_exec.c:118:libxl_report_child_exitstatus:/etc/xen/scripts/block=
 add[1985] exited with error status 127</span><br><span>libxl:error:libxl_cr=
eat.c:1298:domcreat_launch_dm:Domain6:unable to add disk devices</span></div=
></body></html>=

--Apple-Mail-A48EE4E4-9AA5-4AC7-AF22-E40209CC2234--



--===============0223443767929556620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0223443767929556620==--
