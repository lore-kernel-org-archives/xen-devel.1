From: "vikram k.s." <vikram.ks123@gmail.com>
Subject: [XEN][ARM64]: Qemu unhandled level 1 translation fault
 and p2m failure
Date: Wed, 9 Jan 2019 14:43:30 +0530
Message-ID: <CAFR-8FHDiKPLFFUaZy7t84JN-EvQG93ZTsMSVDmQgSyNBfWwTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1161655937306953247=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qffc=PR=gmail.com=vikram.ks123@srs-us1.protection.inumbo.net>)
 id 1gh9vk-0005KK-R9
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 09:13:44 +0000
Received: by mail-qt1-x830.google.com with SMTP id d19so7527292qtq.9
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 01:13:42 -0800 (PST)
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

--===============1161655937306953247==
Content-Type: multipart/alternative; boundary="000000000000d381af057f02e096"

--000000000000d381af057f02e096
Content-Type: text/plain; charset="UTF-8"

Hello,

   - We are using XEN-4.12.
   - Linux 4.14 as dom0 and Linux4.19 as domU.

When domU is create getting below log.
qemu-system-i38[3478]: unhandled level 1 translation fault (11) at
0x00000010, esr 0x92000005, in libxengnttab.so.1.2[7faf9cd000+3000]

Also  p2m is failing .
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=0xffff80001dfa1090
flags=0x1 par=0x80

Not sure whether these two issue are dependent or not. Please help in
resolving this issue.

Please find the complete domU boot log attached below.

Regards
Vks

--000000000000d381af057f02e096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, <br></div><div><ul><li>We are using XEN-4.12.<=
/li><li>Linux 4.14 as dom0 and Linux4.19 as domU.</li></ul><div>When domU i=
s create getting below log.</div><div>qemu-system-i38[3478]: unhandled leve=
l 1 translation fault (11) at 0x00000010, esr 0x92000005, in libxengnttab.s=
o.1.2[7faf9cd000+3000]</div><div><br></div><div>Also=C2=A0 p2m is failing .=
</div><div>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80001df=
a1090 flags=3D0x1 par=3D0x80</div><div><br></div><div>Not sure whether thes=
e two issue are dependent or not. Please help in resolving this issue.</div=
><div><br></div><div>Please find the complete domU boot log attached below.=
</div><div><br></div><div>Regards</div><div>Vks<br></div></div></div>

--000000000000d381af057f02e096--


--===============1161655937306953247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1161655937306953247==--
