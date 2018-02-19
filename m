From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Subject: Re:
	=?utf-8?q?Getting_Hypercall_=5Bop_=3D_0x0040001a_=5D_?=
	=?utf-8?b?b24gdHJhY2Ug77+877+877+877+877+8?=
Date: Mon, 19 Feb 2018 22:00:58 +0000
Message-ID: <CAAQRGoCXyiSD68dj-95-kYvMyuo2jynZKR7Sb4TpW1f9NxGWXQ@mail.gmail.com>
References: <CAAQRGoBHTHkEQTDbQ8X_MbJD2jfc2=AO+Usp8NTo2cXKE7DE1g@mail.gmail.com>
 <20180219171311.5s4dentbjsiu6tlf@citrix.com>
 <20180219173344.n73f5hetwxbgrsuc@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8347822290100983783=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180219173344.n73f5hetwxbgrsuc@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============8347822290100983783==
Content-Type: multipart/alternative; boundary="000000000000d27a8f056597d4c6"

--000000000000d27a8f056597d4c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the clarification.

On Mon, Feb 19, 2018, 17:33 Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wro=
te:

> On Mon, Feb 19, 2018 at 05:13:11PM +0000, Wei Liu wrote:
> > On Mon, Feb 19, 2018 at 04:23:33PM +0000, Charles Gon=C3=A7alves wrote:
> > > Hello,
> > >
> > > Im getting this Hypercall [op =3D 0x0040001a ] on xen trace  but can'=
t
> figure
> > > out which operation this is.
> > >
> > > Using old Xen 4.4.1.
> > > Looking at documentation  and also using grep into source code couldn=
't
> > > figure out which hypercall this is.
> > >
> > > Can someone help clarify this?
> >
> > See public/trace.h for the exact definition of the event.
> >
> > I can't seem to be able to find 0x004xxxxx in the latest upstream code
> > though.
>
> AFAICT the 0x004xxxxx comes from TRC_PV_HYPERCALL_V2_ARG_32, which is
> used by __trace_hypercall, for __HYPERVISOR_mmuext_op that would be:
>
> d.op =3D __HYPERVISOR_mmuext_op | (0x1 << 22);
>
> Roger.
>
--=20
Atenciosamente,
Charles F.'. Gon=C3=A7alves

--000000000000d27a8f056597d4c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the clarification.</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Mon, Feb 19, 2018, 17:33 Roger Pau Monn=C3=A9 &=
lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Mon, Feb 19, 2018 at 05:13:1=
1PM +0000, Wei Liu wrote:<br>
&gt; On Mon, Feb 19, 2018 at 04:23:33PM +0000, Charles Gon=C3=A7alves wrote=
:<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Im getting this Hypercall [op =3D 0x0040001a ] on xen trace=C2=A0=
 but can&#39;t figure<br>
&gt; &gt; out which operation this is.<br>
&gt; &gt;<br>
&gt; &gt; Using old Xen 4.4.1.<br>
&gt; &gt; Looking at documentation=C2=A0 and also using grep into source co=
de couldn&#39;t<br>
&gt; &gt; figure out which hypercall this is.<br>
&gt; &gt;<br>
&gt; &gt; Can someone help clarify this?<br>
&gt;<br>
&gt; See public/trace.h for the exact definition of the event.<br>
&gt;<br>
&gt; I can&#39;t seem to be able to find 0x004xxxxx in the latest upstream =
code<br>
&gt; though.<br>
<br>
AFAICT the 0x004xxxxx comes from TRC_PV_HYPERCALL_V2_ARG_32, which is<br>
used by __trace_hypercall, for __HYPERVISOR_mmuext_op that would be:<br>
<br>
d.op =3D __HYPERVISOR_mmuext_op | (0x1 &lt;&lt; 22);<br>
<br>
Roger.<br>
</blockquote></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><div>Atenciosamente,=C2=A0</d=
iv>Charles F.&#39;. Gon=C3=A7alves</div></div>

--000000000000d27a8f056597d4c6--


--===============8347822290100983783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8347822290100983783==--
