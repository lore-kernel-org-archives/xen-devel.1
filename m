From: Danux <danuxx@gmail.com>
Subject: Xen from Xilinx 2018.3 not recognizing boot arguments
Date: Mon, 25 Mar 2019 13:54:41 -0700
Message-ID: <CAL7A2Dxm8eNb3F_HV3FjPGO8Bvgge0JH=eoOa+JKxdCiGKNrGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6747818974756809938=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aKhK=R4=gmail.com=danuxx@srs-us1.protection.inumbo.net>)
 id 1h8WcQ-0001ro-SA
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 20:54:54 +0000
Received: by mail-io1-xd2e.google.com with SMTP id f6so8877432iop.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2019 13:54:53 -0700 (PDT)
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

--===============6747818974756809938==
Content-Type: multipart/alternative; boundary="00000000000084bdf00584f16a68"

--00000000000084bdf00584f16a68
Content-Type: text/plain; charset="UTF-8"

Hi,

When adding altp2m=1 argument to xen,xen-bootargs via DTB, I can see the
parameter passed via xl info:

xen_commandline        : console=dtuart dtuart=serial0 dom0_mem=1G
bootscrub=0 maxcpus=1 timer_slop=0* altp2m=1*

However, I got an error like this at booting phase:

(XEN) parameter "*altp2m*" unknown!

Please shed some light on this.

Thanks.

-- 
DanUx

--00000000000084bdf00584f16a68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
,</div><div><br></div><div>When adding altp2m=3D1 argument to xen,xen-boota=
rgs via DTB, I can see the parameter passed via xl info:</div><div><br></di=
v><div>xen_commandline=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : console=
=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1G bootscrub=3D0 maxcpus=3D1 timer_sl=
op=3D0<b> altp2m=3D1</b><br></div><div><br></div><div>However, I got an err=
or like this at booting phase:<br></div><div><br></div><div>(XEN) parameter=
 &quot;<b>altp2m</b>&quot; unknown!<br></div><div><br></div><div>Please she=
d some light on this.</div><div><br></div><div>Thanks.<br></div><div><br>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature">DanUx</div></div></div></di=
v></div></div>

--00000000000084bdf00584f16a68--


--===============6747818974756809938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6747818974756809938==--
