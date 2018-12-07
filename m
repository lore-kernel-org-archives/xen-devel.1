From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v2 1/2] xen/arm: link: Link proc_info_list
 in .data instead of .init.data
Date: Fri, 7 Dec 2018 12:32:11 +0200
Message-ID: <CAPD2p-nCwEfm3T7MeErL8kyJ9K6Ym31MhmLGDGicfpD25EHF-Q@mail.gmail.com>
References: <1544175931-17047-1-git-send-email-olekstysh@gmail.com>
 <1544175931-17047-2-git-send-email-olekstysh@gmail.com>
 <5a524560-109e-55b2-922f-36d9449adab1@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8491397781482598907=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PsOz=OQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gVDQm-0007ob-VE
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 10:32:25 +0000
Received: by mail-io1-xd43.google.com with SMTP id l14so2863084ioj.5
 for <xen-devel@lists.xenproject.org>; Fri, 07 Dec 2018 02:32:23 -0800 (PST)
In-Reply-To: <5a524560-109e-55b2-922f-36d9449adab1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Mirela Simonovic <mirela.simonovic@aggios.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============8491397781482598907==
Content-Type: multipart/alternative; boundary="0000000000006af316057c6c21e5"

--0000000000006af316057c6c21e5
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 7, 2018 at 12:05 PM Julien Grall <julien.grall@arm.com> wrote:

> Hi Oleksandr,
>
Hi Julien


>
> On 07/12/2018 09:45, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > To be able to use it for the hot-plugged CPUs as well.
>
> You need to explain in the commit message why you rename .init.proc.info.
>
ok


>
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > ---
> >      Changes in v2:
> >          - Fix typoes
> >          - Rename ".init.proc.info" to ".data.proc.info"
> > ---
> >   xen/arch/arm/arm32/proc-v7.S |  6 +++---
> >   xen/arch/arm/xen.lds.S       | 10 ++++++----
> >   2 files changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
> > index 80a250d..a0c0c9e 100644
> > --- a/xen/arch/arm/arm32/proc-v7.S
> > +++ b/xen/arch/arm/arm32/proc-v7.S
> > @@ -30,7 +30,7 @@ brahma15mp_init:
> >           mcr   CP32(r0, ACTLR)
> >           mov   pc, lr
> >
> > -        .section ".init.proc.info", #alloc, #execinstr
> > +        .section ".data.proc.info", #alloc, #execinstr
>
> NIT: .proc.info would be sufficient. This would avoid to rename again the
> section if we decide to move it in a separate section.
>
ok


>
> >           .type __v7_ca15mp_proc_info, #object
> >   __v7_ca15mp_proc_info:
> >           .long 0x410FC0F0             /* Cortex-A15 */
> > @@ -39,7 +39,7 @@ __v7_ca15mp_proc_info:
> >           .long caxx_processor
> >           .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
> >
> > -        .section ".init.proc.info", #alloc, #execinstr
> > +        .section ".data.proc.info", #alloc, #execinstr
> >           .type __v7_ca7mp_proc_info, #object
> >   __v7_ca7mp_proc_info:
> >           .long 0x410FC070             /* Cortex-A7 */
> > @@ -48,7 +48,7 @@ __v7_ca7mp_proc_info:
> >           .long caxx_processor
> >           .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
> >
> > -        .section ".init.proc.info", #alloc, #execinstr
> > +        .section ".data.proc.info", #alloc, #execinstr
> >           .type __v7_brahma15mp_proc_info, #object
> >   __v7_brahma15mp_proc_info:
> >           .long 0x420F00F0             /* Broadcom Brahma-B15 */
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 245a0e0..624da9b 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -88,6 +88,12 @@ SECTIONS
> >          . = ALIGN(PAGE_SIZE);
> >          *(.data.page_aligned)
> >          *(.data)
> > +
> > +       . = ALIGN(POINTER_ALIGN);
> > +       __proc_info_start = .;
> > +       *(.data.proc.info)
> > +       __proc_info_end = .;
>
> Sorry I haven't noticed it in the previous version. proc.info should
> never
> modified, right? So it should be in rodata in that case.
>
agree, will link it in rodata.

May I resend just this patch after address your comments?


>
> > +
> >          . = ALIGN(8);
> >          __start_schedulers_array = .;
> >          *(.data.schedulers)
> > @@ -151,10 +157,6 @@ SECTIONS
> >          *(.init.setup)
> >          __setup_end = .;
> >
> > -       __proc_info_start = .;
> > -       *(.init.proc.info)
> > -       __proc_info_end = .;
> > -
> >          __initcall_start = .;
> >          *(.initcallpresmp.init)
> >          __presmp_initcall_end = .;
> >
>
> Cheers,
>
> --
> Julien Grall
>


-- 
Regards,

Oleksandr Tyshchenko

--0000000000006af316057c6c21e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Fri, Dec 7, 2018 at 12:05 PM Julien Grall &lt;<a href=3D"mail=
to:julien.grall@arm.com">julien.grall@arm.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi Oleksandr,<br></blockquote>=
<div>Hi Julien</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
On 07/12/2018 09:45, Oleksandr Tyshchenko wrote:<br>
&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@=
epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; <br>
&gt; To be able to use it for the hot-plugged CPUs as well.<br>
<br>
You need to explain in the commit message why you rename .<a href=3D"http:/=
/init.proc.info" rel=3D"noreferrer" target=3D"_blank">init.proc.info</a>.<b=
r></blockquote><div>ok</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_ty=
shchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<=
br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Fix typoes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Rename &quot;.<a href=3D"http://in=
it.proc.info" rel=3D"noreferrer" target=3D"_blank">init.proc.info</a>&quot;=
 to &quot;.<a href=3D"http://data.proc.info" rel=3D"noreferrer" target=3D"_=
blank">data.proc.info</a>&quot;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/arm32/proc-v7.S |=C2=A0 6 +++---<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/xen.lds.S=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++=
++----<br>
&gt;=C2=A0 =C2=A02 files changed, 9 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7=
.S<br>
&gt; index 80a250d..a0c0c9e 100644<br>
&gt; --- a/xen/arch/arm/arm32/proc-v7.S<br>
&gt; +++ b/xen/arch/arm/arm32/proc-v7.S<br>
&gt; @@ -30,7 +30,7 @@ brahma15mp_init:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mcr=C2=A0 =C2=A0CP32(r0, ACTLR=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0pc, lr<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 .section &quot;.<a href=3D"http://init.pr=
oc.info" rel=3D"noreferrer" target=3D"_blank">init.proc.info</a>&quot;, #al=
loc, #execinstr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .section &quot;.<a href=3D"http://data.pr=
oc.info" rel=3D"noreferrer" target=3D"_blank">data.proc.info</a>&quot;, #al=
loc, #execinstr<br>
<br>
NIT: .<a href=3D"http://proc.info" rel=3D"noreferrer" target=3D"_blank">pro=
c.info</a> would be sufficient. This would avoid to rename again the <br>
section if we decide to move it in a separate section.<br></blockquote><div=
>ok</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type __v7_ca15mp_proc_info, #=
object<br>
&gt;=C2=A0 =C2=A0__v7_ca15mp_proc_info:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.long 0x410FC0F0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cortex-A15 */<br>
&gt; @@ -39,7 +39,7 @@ __v7_ca15mp_proc_info:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.long caxx_processor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size __v7_ca15mp_proc_info, .=
 - __v7_ca15mp_proc_info<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 .section &quot;.<a href=3D"http://init.pr=
oc.info" rel=3D"noreferrer" target=3D"_blank">init.proc.info</a>&quot;, #al=
loc, #execinstr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .section &quot;.<a href=3D"http://data.pr=
oc.info" rel=3D"noreferrer" target=3D"_blank">data.proc.info</a>&quot;, #al=
loc, #execinstr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type __v7_ca7mp_proc_info, #o=
bject<br>
&gt;=C2=A0 =C2=A0__v7_ca7mp_proc_info:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.long 0x410FC070=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Cortex-A7 */<br>
&gt; @@ -48,7 +48,7 @@ __v7_ca7mp_proc_info:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.long caxx_processor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size __v7_ca7mp_proc_info, . =
- __v7_ca7mp_proc_info<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 .section &quot;.<a href=3D"http://init.pr=
oc.info" rel=3D"noreferrer" target=3D"_blank">init.proc.info</a>&quot;, #al=
loc, #execinstr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .section &quot;.<a href=3D"http://data.pr=
oc.info" rel=3D"noreferrer" target=3D"_blank">data.proc.info</a>&quot;, #al=
loc, #execinstr<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type __v7_brahma15mp_proc_inf=
o, #object<br>
&gt;=C2=A0 =C2=A0__v7_brahma15mp_proc_info:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.long 0x420F00F0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Broadcom Brahma-B15 */<br>
&gt; diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S<br>
&gt; index 245a0e0..624da9b 100644<br>
&gt; --- a/xen/arch/arm/xen.lds.S<br>
&gt; +++ b/xen/arch/arm/xen.lds.S<br>
&gt; @@ -88,6 +88,12 @@ SECTIONS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(PAGE_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data.page_aligned)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D ALIGN(POINTER_ALIGN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__proc_info_start =3D .;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*(.<a href=3D"http://data.proc.info" rel=
=3D"noreferrer" target=3D"_blank">data.proc.info</a>)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__proc_info_end =3D .;<br>
<br>
Sorry I haven&#39;t noticed it in the previous version. <a href=3D"http://p=
roc.info" rel=3D"noreferrer" target=3D"_blank">proc.info</a> should never <=
br>
modified, right? So it should be in rodata in that case.<br></blockquote><d=
iv>agree, will link it in=C2=A0rodata.</div><div><br></div><div>May I resen=
d just this patch after address your comments?</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(8);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __start_schedulers_array =3D .;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data.schedulers)<br>
&gt; @@ -151,10 +157,6 @@ SECTIONS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.init.setup)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __setup_end =3D .;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0__proc_info_start =3D .;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0*(.<a href=3D"http://init.proc.info" rel=
=3D"noreferrer" target=3D"_blank">init.proc.info</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0__proc_info_end =3D .;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __initcall_start =3D .;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.initcallpresmp.init)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __presmp_initcall_end =3D .;<br>
&gt; <br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div></div>

--0000000000006af316057c6c21e5--


--===============8491397781482598907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8491397781482598907==--
