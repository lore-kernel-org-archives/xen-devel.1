From: ".. .." <abhijeetpatil8848@gmail.com>
Subject: Building xen-hypervisor 4.10 and xen-tools on Ubuntu
 16.04 for PVH
Date: Tue, 29 May 2018 03:32:40 +0000
Message-ID: <CAAKQd5yo=koeeRvThzG_bYkZOb2-+UNUKGWY03o_ZmP-5zSuqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7668119381532431318=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f11q=iq=gmail.com=abhijeetpatil8848@srs-us1.protection.inumbo.net>)
 id 1fNVNf-0001FD-Si
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 03:33:03 +0000
Received: by mail-ua0-x22f.google.com with SMTP id c23-v6so2500284uan.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 May 2018 20:33:02 -0700 (PDT)
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

--===============7668119381532431318==
Content-Type: multipart/alternative; boundary="000000000000242597056d4fe443"

--000000000000242597056d4fe443
Content-Type: text/plain; charset="UTF-8"

Hello,

I am doing a study on Virtual Machine Introspection on Intel SGX based
system using Xen based VMs.

I followed the article  -

https://wiki.xenproject.org/wiki/Linux_PVH
<https://blog.werk21.de/en/2018/02/08/build-xen-hypervisor-410-and-xen-tools-ubuntu-1604-pvh>

, in order to build xen-hypervisor 4.10 and xen-tools on Ubuntu 16.04 for
PVH.

However, after installing xen-tools and reboting, my machine, Ubuntu 16.4
is stuck in a login loop. I am able to log in but after a few seconds it
logs out and goes back to login screen.

Also, during the service enabling steps, all except xenstored.service were
enabled. So I am not sure if the login loop issue is due to that.

I tried updating the grub, using recovery mode, but still the issue
persists.
I would be truly thankful if you could suggest me some solution.

Thank You,
Good Day.

--000000000000242597056d4fe443
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello,<br><br></div><div>I a=
m doing a study on Virtual Machine Introspection on Intel SGX based system =
using Xen based VMs.<br><br></div>I followed the article=C2=A0 - <br><br><a=
 href=3D"https://blog.werk21.de/en/2018/02/08/build-xen-hypervisor-410-and-=
xen-tools-ubuntu-1604-pvh" target=3D"_blank">https://wiki.xenproject.org/wi=
ki/Linux_PVH</a> <br><br></div><div>, in order to build xen-hypervisor 4.10=
 and xen-tools on Ubuntu 16.04 for PVH.<br></div><br></div>However, after i=
nstalling
 xen-tools and reboting, my machine, Ubuntu 16.4 is stuck in a login loop. =
I am able=20
to log in but after a few seconds it logs out and goes back to login=20
screen.<br><br>Also, during the service enabling steps, all except xenstore=
d.service=20
were enabled. So I am not sure if the login loop issue is due to that. <br>=
<div><div><div><div><br></div></div></div></div></div>I tried updating the =
grub, using recovery mode, but still the issue persists.<br></div>I would b=
e truly thankful if you could suggest me some solution. <br><br></div><div>=
<div><div><div>Thank You,<br></div><div>Good Day.</div></div></div></div><b=
r></div>

--000000000000242597056d4fe443--


--===============7668119381532431318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7668119381532431318==--
