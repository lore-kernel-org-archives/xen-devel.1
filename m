From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] gic-vgic: fix assert condition
Date: Fri, 25 Jan 2019 08:55:40 +0200
Message-ID: <CAC1WxdjgOg1Qg4=2Me0nwdEO+CMS4C1WMr7E=pxpi74-ME9uTw@mail.gmail.com>
References: <1548354814-23208-1-git-send-email-andrii.anisov@gmail.com>
 <1548355642.9022.23.camel@amazon.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2722642765452649550=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qSih=QB=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmvP8-0004d9-B1
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 06:55:54 +0000
Received: by mail-ot1-x32d.google.com with SMTP id u16so7625981otk.8
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jan 2019 22:55:52 -0800 (PST)
In-Reply-To: <1548355642.9022.23.camel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>
Cc: "jgross@suse.com" <jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "julien.grall@arm.com" <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============2722642765452649550==
Content-Type: multipart/alternative; boundary="0000000000005778c3058042d107"

--0000000000005778c3058042d107
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefan,

You are absolutely correct.

Sent from my Android.

=D1=87=D1=82, 24 =D1=81=D1=96=D1=87. 2019, 20:47 Nuernberger, Stefan =D0=BA=
=D0=BE=D1=80=D0=B8=D1=81=D1=82=D1=83=D0=B2=D0=B0=D1=87 snu@amazon.de =D0=BF=
=D0=B8=D1=88=D0=B5:

> -    ASSERT(connect && desc);
> +    ASSERT(connect || desc);

I assume it should be ASSERT(!connect || desc);

- Stefan

--0000000000005778c3058042d107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:sans-serif;font-size:12.8px" di=
r=3D"auto">Hello Stefan,</div><div dir=3D"auto" style=3D"font-family:sans-s=
erif;font-size:12.8px"><br></div><div dir=3D"auto" style=3D"font-family:san=
s-serif;font-size:12.8px">You are absolutely correct.<br><br><div data-smar=
tmail=3D"gmail_signature" dir=3D"auto">Sent from my Android.</div><br><div =
dir=3D"auto" class=3D"elided-text"><div dir=3D"ltr">=D1=87=D1=82, 24 =D1=81=
=D1=96=D1=87. 2019, 20:47 Nuernberger, Stefan =D0=BA=D0=BE=D1=80=D0=B8=D1=
=81=D1=82=D1=83=D0=B2=D0=B0=D1=87=C2=A0<a href=3D"mailto:snu@amazon.de" sty=
le=3D"text-decoration-line:none;color:rgb(66,133,244)">snu@amazon.de</a>=C2=
=A0=D0=BF=D0=B8=D1=88=D0=B5:</div><div style=3D"color:purple"><blockquote s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">&gt; -=C2=A0=C2=A0=C2=A0=C2=A0ASSERT(connect &amp;&amp; desc=
);<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0ASSERT(connect || desc);<br><br>I assum=
e it should be=C2=A0ASSERT(!connect || desc);<br><br>- Stefan</blockquote><=
/div></div></div></div>

--0000000000005778c3058042d107--


--===============2722642765452649550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2722642765452649550==--
