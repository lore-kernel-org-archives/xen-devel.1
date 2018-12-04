From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH 1/2] xen/link: Link proc_info_list in .data
 instead of .init.data
Date: Tue, 4 Dec 2018 19:34:58 +0200
Message-ID: <CAPD2p-mQ7HHtyGYxn-DMUphBpNn-JVWZAS6zHqOD2mUfmMTRpQ@mail.gmail.com>
References: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
 <1543923745-29877-2-git-send-email-olekstysh@gmail.com>
 <5d6df477-e159-85c6-781e-f3af73f345cd@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0488743108003025419=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=es3t=on=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gUEbH-0003DN-68
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 17:35:11 +0000
Received: by mail-it1-x136.google.com with SMTP id o19so16703050itg.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 09:35:10 -0800 (PST)
In-Reply-To: <5d6df477-e159-85c6-781e-f3af73f345cd@arm.com>
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

--===============0488743108003025419==
Content-Type: multipart/alternative; boundary="000000000000e2b96b057c35af38"

--000000000000e2b96b057c35af38
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 4, 2018 at 7:13 PM Julien Grall <julien.grall@arm.com> wrote:

> Hi,
>
Hi, Julien


>
> Title: xen/arm: link: ...
>
ok


>
> On 12/4/18 11:42 AM, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >
> > To be able to use it for the hot pluged CPUs as well.
>
> s/hot pluged/hot-plugged/
>
ok


>
> >
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > ---
> >   xen/arch/arm/xen.lds.S | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 245a0e0..003301a 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -88,6 +88,12 @@ SECTIONS
> >          . = ALIGN(PAGE_SIZE);
> >          *(.data.page_aligned)
> >          *(.data)
> > +
> > +       . = ALIGN(POINTER_ALIGN);
> > +       __proc_info_start = .;
> > +       *(.init.proc.info)
>
> This is a bit odd to see .init.* section in .data. So I think we want to
> rename it.
>
indeed, will rename


>
> Cheers,
>
> --
> Julien Grall
>


-- 
Regards,

Oleksandr Tyshchenko

--000000000000e2b96b057c35af38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Dec 4, 2018 at 7:13 PM Julien Grall &lt;<a href=3D"mailto:julien.grall@ar=
m.com">julien.grall@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi,<br></blockquote><div>Hi, Julien</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Title: xen/arm: link: ...<br></blockquote><div>ok</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
On 12/4/18 11:42 AM, Oleksandr Tyshchenko wrote:<br>
&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tyshchenko@=
epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<br>
&gt; <br>
&gt; To be able to use it for the hot pluged CPUs as well.<br>
<br>
s/hot pluged/hot-plugged/<br></blockquote><div>ok</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_ty=
shchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/xen.lds.S | 10 ++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S<br>
&gt; index 245a0e0..003301a 100644<br>
&gt; --- a/xen/arch/arm/xen.lds.S<br>
&gt; +++ b/xen/arch/arm/xen.lds.S<br>
&gt; @@ -88,6 +88,12 @@ SECTIONS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 . =3D ALIGN(PAGE_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data.page_aligned)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.data)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D ALIGN(POINTER_ALIGN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__proc_info_start =3D .;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*(.<a href=3D"http://init.proc.info" rel=
=3D"noreferrer" target=3D"_blank">init.proc.info</a>)<br>
<br>
This is a bit odd to see .init.* section in .data. So I think we want to <b=
r>
rename it.<br></blockquote><div>indeed, will rename</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"background-c=
olor:rgb(255,255,255)"><font size=3D"2"><span style=3D"color:rgb(51,51,51);=
font-family:Arial,sans-serif">Regards,</span></font></span></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"background-color:rg=
b(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font></span></div></=
div></div></div></div></div></div></div>

--000000000000e2b96b057c35af38--


--===============0488743108003025419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0488743108003025419==--
