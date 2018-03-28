From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v2 01/17] arm: Placeholder for handling
 Group0/1 traps
Date: Wed, 28 Mar 2018 00:48:37 +0000
Message-ID: <CAF3u54BOfnpK5i_GGu3UHw426eAsB8tJM-FDnnqH3sLEEypnCA@mail.gmail.com>
References: <cover.1522135597.git.manish.jaggi@cavium.com>
 <180103cba43487879eea482ef48cf4daf93a09a5.1522135597.git.manish.jaggi@cavium.com>
 <f802a9c4-b547-4037-e81b-42c1063f61ee@arm.com>
 <e3fea2cd-acde-8c96-e4c5-c4fe28ede463@caviumnetworks.com>
 <a533364a-63be-a02c-fbac-69f222309799@arm.com>
 <alpine.DEB.2.10.1803271308480.12360@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8588766632765350208=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6iey=gs=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f0zGl-0000uC-JT
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 00:48:51 +0000
Received: by mail-ot0-x241.google.com with SMTP id 23-v6so856186otj.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Mar 2018 17:48:49 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1803271308480.12360@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Manish Jaggi <mjaggi@caviumnetworks.com>, Marc Zyngier <marc.zyngier@arm.com>, andre.przywara@arm.com, Manish Jaggi <manish.jaggi@cavium.com>, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============8588766632765350208==
Content-Type: multipart/alternative; boundary="000000000000bafe6705686e5ee2"

--000000000000bafe6705686e5ee2
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Wed, 28 Mar 2018, 04:18 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Tue, 27 Mar 2018, Marc Zyngier wrote:
> > On 27/03/18 11:10, Manish Jaggi wrote:
> > >
> > >
> > > On 03/27/2018 03:31 PM, Marc Zyngier wrote:
> > >> On 27/03/18 10:07, Manish Jaggi wrote:
> > >>> The errata will require to emulate the GIC virtual CPU interface in
> Xen.
> > >>> Because the hypervisor will update its internal state of the vGIC,
> we want
> > >>> to avoid messing up with it. So the errata is handled separately
> from the
> > >>> rest of the hypervisor.
> > >>>
> > >>> New file vgic-v3-sr.c is added which will hold trap and emulate code
> > >>> for group0 / group1 registers. Workaround for cavium Errata 30115
> > >>> needs this emulation code.
> > >>>
> > >>> vgic_v3_handle_cpuif_access would be called from do_trap_guest_sync
> > >>> in subsequent patches based on errata macros.
> > >>>
> > >>> Signed-off-by: Manish Jaggi <manish.jaggi@cavium.com>
> > >>> ---
> > >>>   xen/arch/arm/arm64/vgic-v3-sr.c   | 60
> +++++++++++++++++++++++++++++++++++++++
> > >>>   xen/include/asm-arm/arm64/traps.h |  2 ++
> > >>>   2 files changed, 62 insertions(+)
> > >>>   create mode 100644 xen/arch/arm/arm64/vgic-v3-sr.c
> > >>>
> > >>> diff --git a/xen/arch/arm/arm64/vgic-v3-sr.c
> b/xen/arch/arm/arm64/vgic-v3-sr.c
> > >>> new file mode 100644
> > >>> index 0000000000..39ab1ed6ca
> > >>> --- /dev/null
> > >>> +++ b/xen/arch/arm/arm64/vgic-v3-sr.c
> > >>> @@ -0,0 +1,60 @@
> > >>> +/*
> > >>> + * xen/arch/arm/arm64/vgic-v3-sr.c
> > >>> + *
> > >>> + * Code to emulate group0/group1 traps for handling
> > >>> + * cavium erratum 30115
> > >>> + *
> > >>> + * Manish Jaggi <manish.jaggi@cavium.com>
> > >>> + * Copyright (c) 2018 Cavium.
> > >> IANAL, but I don't think this copyright notice is correct.
> > >>
> > >> I wrote about 90% of this series, and the copyright for that code is
> > >> owned by ARM, and licensed under the GPLv2. You have the right to
> > >> duplicate that code and do almost whatever you want with (within the
> > >> limits of the GPLv2), but you still don't own the copyright.
> > >>
> > >> I suggest you get in touch with your legal department for
> clarification
> > >> on the matter.
> > > I will remove the copyright line, and add this
> > > Original Author: Marc Zyngier <>
> > > Ported to Xen by: Manish Jaggi <>
> >
> > You're missing the point. I don't give a damn about the authorship (I'm
> > not exactly proud to have written that code).
>
> :-D
>
> > The problem at hand is the
> > ARM copyright, which should be preserved (as no-one in Cavium wrote a
> > single line of the original code).
>
> I have been asking myself similar questions for a while now when we
> import code from Linux. The copyright/author line at the top of the file
> is somewhat arbitrary as every person that touched the code has
> copyright over her modifications. This is why at some point I thought we
> had to retain the full list of Signed-off-by lines that ever touched the
> code in question, but then, reading the DCO terms one more time:
>
>  (b) The contribution is based upon previous work that, to the best
>      of my knowledge, is covered under an appropriate open source
>      license and I have the right under that license to submit that
>      work with modifications, whether created in whole or in part
>      by me, under the same open source license (unless I am
>      permitted to submit under a different license), as indicated
>      in the file; or
>
> I checked in the Linux kernel when code was imported from the Xen
> hypervisor to KVM a long time ago, and only a singled Signed-off-by of
> the person importing the code was used.


It does not mean it was a good practice ;).


> This is how I came to the conclusion that actually we don't need to do
> anything special, although it would be nice as a courtesy to retain the
> copyright/author lines at the top of the file. It would also be nice to
> have the original Linux commit id in the commit message to help tracking
> the history.
>

We had a similar discussion on the spectre patches a couple of months ago.
The original author is useful to know if we need to relicense some files.

Having just the commit id from Linux would create more overhead.

Lars suggested to create a file listing where all the work come from. For
commit, I think it would be ok to just add the Signed-off in the commit and
retain copyright in the code.

Of course, it is ok add the Cavium one if code is changed. But no copyright
should be dropped.

Cheers,


> But I would love to have a clear guideline on this from a lawyer.
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000bafe6705686e5ee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div>Hi,<div><br></div><div>Sorry for the formatting.<br><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 28 Mar 2018, 04:18 Stefano =
Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kerne=
l.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 27 Mar=
 2018, Marc Zyngier wrote:<br>
&gt; On 27/03/18 11:10, Manish Jaggi wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On 03/27/2018 03:31 PM, Marc Zyngier wrote:<br>
&gt; &gt;&gt; On 27/03/18 10:07, Manish Jaggi wrote:<br>
&gt; &gt;&gt;&gt; The errata will require to emulate the GIC virtual CPU in=
terface in Xen.<br>
&gt; &gt;&gt;&gt; Because the hypervisor will update its internal state of =
the vGIC, we want<br>
&gt; &gt;&gt;&gt; to avoid messing up with it. So the errata is handled sep=
arately from the<br>
&gt; &gt;&gt;&gt; rest of the hypervisor.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; New file vgic-v3-sr.c is added which will hold trap and e=
mulate code<br>
&gt; &gt;&gt;&gt; for group0 / group1 registers. Workaround for cavium Erra=
ta 30115<br>
&gt; &gt;&gt;&gt; needs this emulation code.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; vgic_v3_handle_cpuif_access would be called from do_trap_=
guest_sync<br>
&gt; &gt;&gt;&gt; in subsequent patches based on errata macros.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Manish Jaggi &lt;<a href=3D"mailto:manish.=
jaggi@cavium.com" target=3D"_blank">manish.jaggi@cavium.com</a>&gt;<br>
&gt; &gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0xen/arch/arm/arm64/vgic-v3-sr.c=C2=A0 =C2=A0|=
 60 +++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0xen/include/asm-arm/arm64/traps.h |=C2=A0 2 +=
+<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A02 files changed, 62 insertions(+)<br>
&gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 xen/arch/arm/arm64/vgic-v3=
-sr.c<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; diff --git a/xen/arch/arm/arm64/vgic-v3-sr.c b/xen/arch/a=
rm/arm64/vgic-v3-sr.c<br>
&gt; &gt;&gt;&gt; new file mode 100644<br>
&gt; &gt;&gt;&gt; index 0000000000..39ab1ed6ca<br>
&gt; &gt;&gt;&gt; --- /dev/null<br>
&gt; &gt;&gt;&gt; +++ b/xen/arch/arm/arm64/vgic-v3-sr.c<br>
&gt; &gt;&gt;&gt; @@ -0,0 +1,60 @@<br>
&gt; &gt;&gt;&gt; +/*<br>
&gt; &gt;&gt;&gt; + * xen/arch/arm/arm64/vgic-v3-sr.c<br>
&gt; &gt;&gt;&gt; + *<br>
&gt; &gt;&gt;&gt; + * Code to emulate group0/group1 traps for handling<br>
&gt; &gt;&gt;&gt; + * cavium erratum 30115<br>
&gt; &gt;&gt;&gt; + *<br>
&gt; &gt;&gt;&gt; + * Manish Jaggi &lt;<a href=3D"mailto:manish.jaggi@caviu=
m.com" target=3D"_blank">manish.jaggi@cavium.com</a>&gt;<br>
&gt; &gt;&gt;&gt; + * Copyright (c) 2018 Cavium.<br>
&gt; &gt;&gt; IANAL, but I don&#39;t think this copyright notice is correct=
.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I wrote about 90% of this series, and the copyright for that =
code is<br>
&gt; &gt;&gt; owned by ARM, and licensed under the GPLv2. You have the righ=
t to<br>
&gt; &gt;&gt; duplicate that code and do almost whatever you want with (wit=
hin the<br>
&gt; &gt;&gt; limits of the GPLv2), but you still don&#39;t own the copyrig=
ht.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I suggest you get in touch with your legal department for cla=
rification<br>
&gt; &gt;&gt; on the matter.<br>
&gt; &gt; I will remove the copyright line, and add this<br>
&gt; &gt; Original Author: Marc Zyngier &lt;&gt;<br>
&gt; &gt; Ported to Xen by: Manish Jaggi &lt;&gt;<br>
&gt;<br>
&gt; You&#39;re missing the point. I don&#39;t give a damn about the author=
ship (I&#39;m<br>
&gt; not exactly proud to have written that code).<br>
<br>
:-D<br>
<br>
&gt; The problem at hand is the<br>
&gt; ARM copyright, which should be preserved (as no-one in Cavium wrote a<=
br>
&gt; single line of the original code).<br>
<br>
I have been asking myself similar questions for a while now when we<br>
import code from Linux. The copyright/author line at the top of the file<br=
>
is somewhat arbitrary as every person that touched the code has<br>
copyright over her modifications. This is why at some point I thought we<br=
>
had to retain the full list of Signed-off-by lines that ever touched the<br=
>
code in question, but then, reading the DCO terms one more time:<br>
<br>
=C2=A0(b) The contribution is based upon previous work that, to the best<br=
>
=C2=A0 =C2=A0 =C2=A0of my knowledge, is covered under an appropriate open s=
ource<br>
=C2=A0 =C2=A0 =C2=A0license and I have the right under that license to subm=
it that<br>
=C2=A0 =C2=A0 =C2=A0work with modifications, whether created in whole or in=
 part<br>
=C2=A0 =C2=A0 =C2=A0by me, under the same open source license (unless I am<=
br>
=C2=A0 =C2=A0 =C2=A0permitted to submit under a different license), as indi=
cated<br>
=C2=A0 =C2=A0 =C2=A0in the file; or<br>
<br>
I checked in the Linux kernel when code was imported from the Xen<br>
hypervisor to KVM a long time ago, and only a singled Signed-off-by of<br>
the person importing the code was used.</blockquote></div><div><br></div><d=
iv>It does not mean it was a good practice ;).</div><div><br></div><div cla=
ss=3D"gmail_quote"></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
This is how I came to the conclusion that actually we don&#39;t need to do<=
br>
anything special, although it would be nice as a courtesy to retain the<br>
copyright/author lines at the top of the file. It would also be nice to<br>
have the original Linux commit id in the commit message to help tracking<br=
>
the history.<br></blockquote></div></div><div><br></div><div>We had a simil=
ar discussion on the spectre patches a couple of months ago. The original a=
uthor is useful to know if we need to relicense some files.<br><br>Having j=
ust the commit id from Linux would create more overhead.<br><br>Lars sugges=
ted to create a file listing where all the work come from. For commit, I th=
ink it would be ok to just add the Signed-off in the commit and retain copy=
right in the code.<br><br>Of course, it is ok  add the Cavium one if code i=
s changed. But no copyright should be dropped.<br><br>Cheers,<br></div><div=
><br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
But I would love to have a clear guideline on this from a lawyer.<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--000000000000bafe6705686e5ee2--


--===============8588766632765350208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8588766632765350208==--
