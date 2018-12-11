From: Minjun Hong <nickeysgo@gmail.com>
Subject: Question about making system thread like kthread in
 Linux kernel
Date: Tue, 11 Dec 2018 21:40:35 +0900
Message-ID: <CAFX_q-Go=NXvmRyd9aHC_FVcZjCxa=fG60KPq03kMGJ13Y5yAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4888997104536072374=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67GX=OU=gmail.com=nickeysgo@srs-us1.protection.inumbo.net>)
 id 1gWhLH-0001iN-6c
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 12:40:51 +0000
Received: by mail-io1-xd2e.google.com with SMTP id f14so11671252iol.4
 for <xen-devel@lists.xenproject.org>; Tue, 11 Dec 2018 04:40:49 -0800 (PST)
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

--===============4888997104536072374==
Content-Type: multipart/alternative; boundary="0000000000001e3461057cbe6464"

--0000000000001e3461057cbe6464
Content-Type: text/plain; charset="UTF-8"

Hi. While I review the result of my research, suddenly a good idea comes
up, and I am looking for how to make threads in Xen like kthread in Linux
kernel.

However, after googling and searching for the source code by grep, I have
found only some information regarding stub domain and daemons, such as
xenconsoled and xenbus.

I want a simple thread in Xen to offload some works which is being executed
in the Credit scheduler.

Is there any data structure or API for that purpose in the Xen source code ?

Thanks!
Regards.

--0000000000001e3461057cbe6464
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi. While I review the result of my resea=
rch, suddenly a good idea comes up, and I am looking for how to make thread=
s in Xen like kthread in Linux kernel.</div><div dir=3D"ltr"><br></div><div=
>However, after googling and searching for the source code by grep, I have =
found only some information regarding stub domain and daemons, such as xenc=
onsoled and xenbus.</div><div><br></div><div>I want a simple thread in Xen =
to offload some works which is being executed in the Credit scheduler.</div=
><div><br></div><div>Is there any data structure or API for that purpose in=
 the Xen source code ?</div><div><br></div><div>Thanks!=C2=A0</div><div>Reg=
ards.</div></div>

--0000000000001e3461057cbe6464--


--===============4888997104536072374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4888997104536072374==--
