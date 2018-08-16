From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: Future of 32-bit PV support
Date: Thu, 16 Aug 2018 11:42:45 -0700
Message-ID: <CACMJ4GYPLibjtU1oO19+SYm-PUeGMXaLGSYdiFPMrKYHu=Ox8Q@mail.gmail.com>
References: <ede80e02-5704-1d46-4edf-58515ad63f40@suse.com>
 <CACMJ4GZti4ypL=CBSROj0CSh6GRXXkq+iqV7CtBWKiiF6CYinA@mail.gmail.com>
 <5B751EFB02000078001DEB46@suse.com>
 <9bcc6e34-ae5e-dcc4-0257-b8c2ab75a998@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2173737993703433764=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ubxr=k7=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fqNEO-0002Le-IO
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 18:42:48 +0000
In-Reply-To: <9bcc6e34-ae5e-dcc4-0257-b8c2ab75a998@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, bouyer@netbsd.org, Jan Beulich <JBeulich@suse.com>, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2173737993703433764==
Content-Type: multipart/alternative; boundary="000000000000202378057391cf73"

--000000000000202378057391cf73
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 12:55 AM, Juergen Gross <jgross@suse.com> wrote:

> On 16/08/18 08:51, Jan Beulich wrote:
> >>>> On 16.08.18 at 08:32, <christopher.w.clark@gmail.com> wrote:
> >> On Wed, Aug 15, 2018 at 11:17 PM, Juergen Gross <jgross@suse.com>
> wrote:
> >>
> >>> In the Xen x86 community call we have been discussing whether anyone
> >>> really is depending on 32-bit PV guests. We'd like to evaluate whether
> >>> anyone would see problems with:
> >>>
> >>> - deprecating 32-bit PV guest support in Xen, meaning that we'd
> >>>   eventually switch to support 32-bit PV guests only via PV-shim from
> >>>   Xen 4.12 or 4.13
> >>>
> >>> - dropping 32-bit PV support from upstream Linux kernel, resulting in
> >>>   current 32-bit PV guests no longer being able to upgrade to the
> newest
> >>>   kernel version any longer
> >>>
> >>> And related to that:
> >>>
> >>> - is there any Linux distribution still shipping 32-bit PV-capable
> >>>   systems?
> >>>
> >>> - what about BSD? Is 32-bit PV support important there?
> >>
> >> Juergen - just to be very clear about the scope here:
> >> * would this proposal affect the ability to use a 32-bit dom0?
> >
> > If the Dom0 is to be PV - yes, of course. For the time being there's
> > no complete PVH Dom0 support, so if 32-bit is needed here, PV is
> > for now indeed the only option.
>

ack. I asked because it's not necessarily obvious to all that dom0 is
included in the term "guest", and it widens the consequences of this change.


>
> And to be more precise: the first step would be to remove 32-bit PV
> support from upstream Linux kernel. This would result in the loss of
> the ability to use a _new_ Linux (e.g. >= 4.20 / 5.0) as a 32-bit dom0.
> A 32-bit dom0 using a kernel <= 4.19 would still work until we remove
> 32-bit PV support from the hypervisor (which we wouldn't do before full
> support of PVH dom0, I guess).
>

That makes sense.


>
> Is there a special reason you want to use a 32-bit dom0?
>

In short, no.
OpenXT currently uses a 32-bit PV dom0, but work is already under way to
migrate to 64-bit. I think your proposal is justified and good.

Christopher

--000000000000202378057391cf73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 16, 2018 at 12:55 AM, Juergen Gross <span dir=3D"ltr">&lt;<=
a href=3D"mailto:jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 16/08/=
18 08:51, Jan Beulich wrote:<br>
&gt;&gt;&gt;&gt; On 16.08.18 at 08:32, &lt;<a href=3D"mailto:christopher.w.=
clark@gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt; wrote:<br>
</span><span class=3D"">&gt;&gt; On Wed, Aug 15, 2018 at 11:17 PM, Juergen =
Gross &lt;<a href=3D"mailto:jgross@suse.com">jgross@suse.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt;&gt; In the Xen x86 community call we have been discussing whether =
anyone<br>
&gt;&gt;&gt; really is depending on 32-bit PV guests. We&#39;d like to eval=
uate whether<br>
&gt;&gt;&gt; anyone would see problems with:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - deprecating 32-bit PV guest support in Xen, meaning that we&=
#39;d<br>
&gt;&gt;&gt;=C2=A0 =C2=A0eventually switch to support 32-bit PV guests only=
 via PV-shim from<br>
&gt;&gt;&gt;=C2=A0 =C2=A0Xen 4.12 or 4.13<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - dropping 32-bit PV support from upstream Linux kernel, resul=
ting in<br>
&gt;&gt;&gt;=C2=A0 =C2=A0current 32-bit PV guests no longer being able to u=
pgrade to the newest<br>
&gt;&gt;&gt;=C2=A0 =C2=A0kernel version any longer<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; And related to that:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - is there any Linux distribution still shipping 32-bit PV-cap=
able<br>
&gt;&gt;&gt;=C2=A0 =C2=A0systems?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - what about BSD? Is 32-bit PV support important there?<br>&gt=
;&gt;<br>
&gt;&gt; Juergen - just to be very clear about the scope here:<br>
&gt;&gt; * would this proposal affect the ability to use a 32-bit dom0?<br>
&gt; <br>
</span><span class=3D"">&gt; If the Dom0 is to be PV - yes, of course. For =
the time being there&#39;s<br>
&gt; no complete PVH Dom0 support, so if 32-bit is needed here, PV is<br>
&gt; for now indeed the only option.<br></span></blockquote><div><br></div>=
<div>ack. I asked because it&#39;s not necessarily obvious to all that dom0=
 is included in the term &quot;guest&quot;, and it widens the consequences =
of this change.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">
<br>
</span>And to be more precise: the first step would be to remove 32-bit PV<=
br>
support from upstream Linux kernel. This would result in the loss of<br>
the ability to use a _new_ Linux (e.g. &gt;=3D 4.20 / 5.0) as a 32-bit dom0=
.<br>
A 32-bit dom0 using a kernel &lt;=3D 4.19 would still work until we remove<=
br>
32-bit PV support from the hypervisor (which we wouldn&#39;t do before full=
<br>
support of PVH dom0, I guess).<br></blockquote><div><br></div><div>That mak=
es sense.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Is there a special reason you want to use a 32-bit dom0?<br></blockquote><d=
iv><br></div><div>In short, no.</div><div>OpenXT currently uses a 32-bit PV=
 dom0, but work is already under way to migrate to 64-bit. I think your pro=
posal is justified and good.</div><div><br></div><div>Christopher</div><div=
><br></div></div></div></div>

--000000000000202378057391cf73--


--===============2173737993703433764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2173737993703433764==--
