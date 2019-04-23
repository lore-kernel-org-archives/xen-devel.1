From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 5/6] xen/arm: map reserved-memory regions as
 normal memory in dom0
Date: Tue, 23 Apr 2019 19:37:05 +0100
Message-ID: <CAF3u54CD7O0swVyTwMshxUhxnLg56=iF9S1xb5vKjuZq-F9BKQ@mail.gmail.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-5-git-send-email-sstabellini@kernel.org>
 <96e6defa-5c7b-81e2-a85e-f02884f339fb@arm.com>
 <alpine.DEB.2.10.1904221531470.1370@sstabellini-ThinkPad-X260>
 <811a9368-c6c6-a4ae-1101-f4aac16adc7b@arm.com>
 <alpine.DEB.2.10.1904231028540.24598@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4662224523791714464=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kNGF=SZ=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJ0ID-0004BD-8A
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 18:37:21 +0000
Received: by mail-vs1-xe41.google.com with SMTP id t23so8871822vso.10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2019 11:37:19 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1904231028540.24598@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, nd <nd@arm.com>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

--===============4662224523791714464==
Content-Type: multipart/alternative; boundary="000000000000f9f97d058736dfb0"

--000000000000f9f97d058736dfb0
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Tue, 23 Apr 2019, 18:34 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Tue, 23 Apr 2019, Julien Grall wrote:
> > Hi Stefano,
> >
> > On 4/22/19 11:42 PM, Stefano Stabellini wrote:
> > > On Tue, 26 Feb 2019, Julien Grall wrote:
> > > I am not sure about the suggestion of re-using the libfdt concept of
> > > "mem_rsv", which is meant to be for the old /memreserve/. Today, libfdt
> > > (at least our version of it) is not able to parse the new
> > > reserved-memory bindings. I don't think it is a good idea to modify
> > > libfdt for that. Also, the way we want to handle the old memreserve
> > > regions is quite different from the way we want to handle
> > > reserved-memory, right? I cannot see a way to improve this code using
> > > mem_rsv at the moment.
> >
> > I didn't mean to extend mem_rsv in libfdt but extend consider_modules and
> > dt_unreserved_regions to deal with /reserved-memory. Otherwise you
> > may miss some cases (for instance you left out discard_initial_modules).
> >
> > By extending those two functions you don't have to teach everyone how to
> skip
> > /reserved-memory.
>
> I think I get your point now. Although I don't think it should be
> correct for a bootloader to use a reserved-memory area to store a boot
> module, I wouldn't be suprised if that happens, so it is better to be
> prepared and extend dt_unreserved_regions. I'll do that.
>

Why wouldn't this be correct? It is nothing different /mem-reserve.


> However, we would still need something like check_reserved_memory,
> because we don't want setup_xenheap_mappings to be called on the
> reserved-memory area (or a memory region including the reserved memory
> area) in setup_mm. I don't think we can get away without it, but I can
> simplify it.
>

Hmmm, setup_xenheap_mappings is only doing the mapping in page-tables
allowing direct access in Xen. Are you worried of the memory attributes to
be different in Xen?

This would makes sense however setup_xenheap_mappings may still map the
reserved-memory because it is using 1G mapping... This is pretty wrong and
I have patches that should help to fix it.

 Also if you are concerned with /reserved-memory, then it should also be
fixed for /mem-reserve as they are not different. However, this may break
free_initmem as because we try to give back page to xenheap even if they
are reserved.

 The memory management is quite a mess today. I hope to make it better with
my upcoming series.

Cheers,

--000000000000f9f97d058736dfb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Sorry for the formatting.<br><br><div class=3D"gmail_quote" dir=3D"auto"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Apr 2019, 18:34 Stefano S=
tabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 23 Apr =
2019, Julien Grall wrote:<br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 4/22/19 11:42 PM, Stefano Stabellini wrote:<br>
&gt; &gt; On Tue, 26 Feb 2019, Julien Grall wrote:<br>
&gt; &gt; I am not sure about the suggestion of re-using the libfdt concept=
 of<br>
&gt; &gt; &quot;mem_rsv&quot;, which is meant to be for the old /memreserve=
/. Today, libfdt<br>
&gt; &gt; (at least our version of it) is not able to parse the new<br>
&gt; &gt; reserved-memory bindings. I don&#39;t think it is a good idea to =
modify<br>
&gt; &gt; libfdt for that. Also, the way we want to handle the old memreser=
ve<br>
&gt; &gt; regions is quite different from the way we want to handle<br>
&gt; &gt; reserved-memory, right? I cannot see a way to improve this code u=
sing<br>
&gt; &gt; mem_rsv at the moment.<br>
&gt; <br>
&gt; I didn&#39;t mean to extend mem_rsv in libfdt but extend consider_modu=
les and<br>
&gt; dt_unreserved_regions to deal with /reserved-memory. Otherwise you<br>
&gt; may miss some cases (for instance you left out discard_initial_modules=
).<br>
&gt; <br>
&gt; By extending those two functions you don&#39;t have to teach everyone =
how to skip<br>
&gt; /reserved-memory.<br>
<br>
I think I get your point now. Although I don&#39;t think it should be<br>
correct for a bootloader to use a reserved-memory area to store a boot<br>
module, I wouldn&#39;t be suprised if that happens, so it is better to be<b=
r>
prepared and extend dt_unreserved_regions. I&#39;ll do that.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why wouldn&#39;=
t this be correct? It is nothing different /mem-reserve.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
However, we would still need something like check_reserved_memory,<br>
because we don&#39;t want setup_xenheap_mappings to be called on the<br>
reserved-memory area (or a memory region including the reserved memory<br>
area) in setup_mm. I don&#39;t think we can get away without it, but I can<=
br>
simplify it.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Hmmm, setup_xenheap_mappings is only doing the mapping in page-=
tables allowing direct access in Xen. Are you worried of the memory attribu=
tes to be different in Xen?</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">This would makes sense however setup_xenheap_mappings may still map the=
 reserved-memory because it is using 1G mapping... This is pretty wrong and=
 I have patches that should help to fix it.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">=C2=A0Also if you are concerned with /reserved-memory, =
then it should also be fixed for /mem-reserve as they are not different. Ho=
wever, this may break free_initmem as because we try to give back page to x=
enheap even if they are reserved.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">=C2=A0The memory management is quite a mess today. I hope to make=
 it better with my upcoming series.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Cheers,</div></div>

--000000000000f9f97d058736dfb0--


--===============4662224523791714464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4662224523791714464==--
