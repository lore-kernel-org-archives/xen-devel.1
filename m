From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 15/15] xen/arm: traps: Move the
 implementation of GUEST_BUG_ON in traps.h
Date: Mon, 20 Aug 2018 10:17:29 +0100
Message-ID: <CAEC2CxoFP2PvitM1TM2XYk6j1=a8W+DDqrBYTNB5Q74FvMLZYQ@mail.gmail.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-16-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141442070.15066@sstabellini-ThinkPad-X260>
 <1a6b5113-3ad5-50e2-1c0f-b9d532ec0b81@arm.com>
 <alpine.DEB.2.10.1808161112430.16354@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945526150658233955=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=o2yn=ld=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1frgJx-000883-Vo
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 09:17:58 +0000
Received: by mail-qt0-x22f.google.com with SMTP id b15-v6so15389615qtp.11
 for <xen-devel@lists.xenproject.org>; Mon, 20 Aug 2018 02:17:56 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1808161112430.16354@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

--===============0945526150658233955==
Content-Type: multipart/alternative; boundary="0000000000007cc4bb0573da6266"

--0000000000007cc4bb0573da6266
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

On Thu, 16 Aug 2018, 19:17 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 16 Aug 2018, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 08/14/2018 10:43 PM, Stefano Stabellini wrote:
> > > On Mon, 16 Jul 2018, Julien Grall wrote:
> > > > GUEST_BUG_ON may be used in other files doing guest emulation.
> > > >
> > > > Signed-off-by: Julien Grall <julien.grall@linaro.org>
> > >
> > > Given that GUEST_BUG_ON is not actually used in any other files in this
> > > patch series, I assume you are referring to one of your future series?
> >
> > It is going to be used later. However, I don't really refer to any
> series in
> > particular. It is just that this macros could be helpful in any
> emulation code
> > to catch what we think is a invalid architectural behavior.
>
> It is only that a concrete use-case helps. The idea of moving
> GUEST_BUG_ON is good, but where to? For instance, wouldn't it be better
> to move it to guest_access.h? I am just trying to point to an existing
> header which is more widely used across the emulators (vpl011,
> vgic-v3-its.c, hvm.c, ...)
>

Definitely not in guest_access.h or any wider in includes. If you look at
the implementation and documentation, it will crash the hypervisor because
the goal is to catch hardware bug or misunderstanding of the spec. This is
not meant to be used in emulation. We should not crash the guest/hypervisor
in bad behavior but inject an exception.

So trap.h is the best places for it as hardware trap are now split accros
multiples files.

Cheers,

--0000000000007cc4bb0573da6266
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefano,</div><div dir=3D"auto"><br><div class=3D=
"gmail_quote" dir=3D"auto"><div dir=3D"ltr">On Thu, 16 Aug 2018, 19:17 Stef=
ano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@k=
ernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
16 Aug 2018, Julien Grall wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 08/14/2018 10:43 PM, Stefano Stabellini wrote:<br>
&gt; &gt; On Mon, 16 Jul 2018, Julien Grall wrote:<br>
&gt; &gt; &gt; GUEST_BUG_ON may be used in other files doing guest emulatio=
n.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.gra=
ll@linaro.org" target=3D"_blank" rel=3D"noreferrer">julien.grall@linaro.org=
</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Given that GUEST_BUG_ON is not actually used in any other files i=
n this<br>
&gt; &gt; patch series, I assume you are referring to one of your future se=
ries?<br>
&gt; <br>
&gt; It is going to be used later. However, I don&#39;t really refer to any=
 series in<br>
&gt; particular. It is just that this macros could be helpful in any emulat=
ion code<br>
&gt; to catch what we think is a invalid architectural behavior.<br>
<br>
It is only that a concrete use-case helps. The idea of moving<br>
GUEST_BUG_ON is good, but where to? For instance, wouldn&#39;t it be better=
<br>
to move it to guest_access.h? I am just trying to point to an existing<br>
header which is more widely used across the emulators (vpl011,<br>
vgic-v3-its.c, hvm.c, ...)<br></blockquote></div></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Definitely not in guest_access.h or any wider in =
includes. If you look at the implementation and documentation, it will cras=
h the hypervisor because the goal is to catch hardware bug or misunderstand=
ing of the spec. This is not meant to be used in emulation. We should not c=
rash the guest/hypervisor in bad behavior but inject an exception.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">So trap.h is the best places for=
 it as hardware trap are now split accros multiples files.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000007cc4bb0573da6266--


--===============0945526150658233955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0945526150658233955==--
