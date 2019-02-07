From: Julien Grall <julien.grall@gmail.com>
Subject: Re: RT Xen on ARM - R-Car series
Date: Thu, 7 Feb 2019 11:59:07 +0100
Message-ID: <CAF3u54ANHMf1-3=W=R3w-25JbK3_bR_mDiM888pU5UzSTKTVPg@mail.gmail.com>
References: <alpine.DEB.2.10.1901311345570.22962@sstabellini-ThinkPad-X260>
 <2a651c5d-3f94-378d-baf9-f52cab0cdc62@arm.com>
 <20190201165314.ofuvpddlfpzbc247@mac>
 <56b433e0-645e-997d-1bff-de3c4f7fe250@arm.com>
 <20190204125307.aft4tzkjjrxdd34o@mac>
 <fcd6618d-de13-212f-8afb-e2ef0b37396d@arm.com>
 <f045b9a9-2e1a-4d3e-b2ce-51dca97720a8@gmail.com>
 <6457d3e5-1897-d124-ba49-c6325076b393@gmail.com>
 <alpine.DEB.2.10.1902061300540.2723@sstabellini-ThinkPad-X260>
 <ffe52ce4-2fb6-d730-991e-c48c7fc10c5e@gmail.com>
 <20190207103513.ky7xnftn3pj7r2lf@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3632201834137251872=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190207103513.ky7xnftn3pj7r2lf@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org, "LOPEZ,
 FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

--===============3632201834137251872==
Content-Type: multipart/alternative; boundary="0000000000000aebe205814bbcb4"

--0000000000000aebe205814bbcb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(sorry for the formatting)

On Thu, 7 Feb 2019, 11:37 Roger Pau Monn=C3=A9, <roger.pau@citrix.com> wrot=
e:

> On Thu, Feb 07, 2019 at 11:42:16AM +0200, Andrii Anisov wrote:
> > Hello All,
> >
> > On 06.02.19 23:03, Stefano Stabellini wrote:
> > > That's great. Could you or Roger take care of cleaning up the patch a=
nd
> > > properly submitting it to the list?
> >
> > I can take it for cleaning up.
> >
> > > And also double check that it won't
> > > break any guests (at least the ones we know about: Linux and Windows =
on
> > > x86).
> >
> > I'm not sure I could properly check it for x86. For sure can't do that
> for windows guest.
>
> I've been thinking about this with other Citrix folks, and I'm not
> sure the proposed patch is a good solution. It's not possible for us
> to know whether there's a kernel somewhere relying on changing the
> virtual address of the runtime state area without issuing a new
> hypercall.
>
> If such kernel existed by making this change we would introduce random
> memory corruption to that kernel, which would be very hard to track
> and considered a regression.
>
> I think the best way to move forward is to pick my patch and introduce
> a new hypercall that instead of a virtual address takes a guest
> physical address. Will you be OK with this Andrii
>

In that case I would prefer if we don't keep the runstate mapped.

Cheers,

--0000000000000aebe205814bbcb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(sorry for the formatting)<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Thu, 7 Feb 2019, 11:37 Roger Pau Monn=C3=A9, &lt;<a href=3D"mailto:ro=
ger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On Thu, Feb 07, 2019 at 11:42:16AM +0200, Andrii Aniso=
v wrote:<br>
&gt; Hello All,<br>
&gt; <br>
&gt; On 06.02.19 23:03, Stefano Stabellini wrote:<br>
&gt; &gt; That&#39;s great. Could you or Roger take care of cleaning up the=
 patch and<br>
&gt; &gt; properly submitting it to the list?<br>
&gt; <br>
&gt; I can take it for cleaning up.<br>
&gt; <br>
&gt; &gt; And also double check that it won&#39;t<br>
&gt; &gt; break any guests (at least the ones we know about: Linux and Wind=
ows on<br>
&gt; &gt; x86).<br>
&gt; <br>
&gt; I&#39;m not sure I could properly check it for x86. For sure can&#39;t=
 do that for windows guest.<br>
<br>
I&#39;ve been thinking about this with other Citrix folks, and I&#39;m not<=
br>
sure the proposed patch is a good solution. It&#39;s not possible for us<br=
>
to know whether there&#39;s a kernel somewhere relying on changing the<br>
virtual address of the runtime state area without issuing a new<br>
hypercall.<br>
<br>
If such kernel existed by making this change we would introduce random<br>
memory corruption to that kernel, which would be very hard to track<br>
and considered a regression.<br>
<br>
I think the best way to move forward is to pick my patch and introduce<br>
a new hypercall that instead of a virtual address takes a guest<br>
physical address. Will you be OK with this Andrii<br></blockquote></div><di=
v><br></div><div>In that case I would prefer if we don&#39;t keep the runst=
ate mapped.</div><div><br></div><div>Cheers,</div>

--0000000000000aebe205814bbcb4--


--===============3632201834137251872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3632201834137251872==--
