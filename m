From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Tue, 9 Jan 2018 13:34:29 +0200
Message-ID: <CACvf2oUDKQvX+KCXNfGRJCbcC0wz6j5xQNZ4rYjApeOzwaXvcg@mail.gmail.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7798241259817920857=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mj+z=ee=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eYsAp-0002wE-DX
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 11:34:31 +0000
Received: by mail-it0-x244.google.com with SMTP id f190so11550779ita.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 03:34:30 -0800 (PST)
In-Reply-To: <1513260853-3450-1-git-send-email-al1img@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============7798241259817920857==
Content-Type: multipart/alternative; boundary="089e0820061043c0580562564c87"

--089e0820061043c0580562564c87
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 14, 2017 at 4:14 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>
> We have following arm-based setup:
>
> - Dom0 with xen and xen tools;
> - Dom1 with device backends (but it is not the driver domain);
> - Dom2 with device frontend;
>
> On Dom2 destroying we have timeout error. Because xl treats our
> Dom1 as driver domain and waits for backend path to be cleared
> by the driver domain which is not our case.
>
> According to libxl__domain_make in case of driver domain it has
> "libxl" xen store entry:
>
>     if (libxl_defbool_val(info->driver_domain)) {
>         /*
>          * Create a local "libxl" directory for each guest, since we might
> want
>          * to use libxl from inside the guest
>          */
>         libxl__xs_mknod(gc, t, GCSPRINTF("%s/libxl", dom_path), rwperm,
>                         ARRAY_SIZE(rwperm));
>
> This patch introduces libxl__is_driver_domain which determines the driver
> domain by checking if "libxl" entry is present and uses this function on
> device destroy to check by whom domain path should be cleaned up (libxl
> or the driver domain).
>
> Oleksandr Grytsov (1):
>   libxl: add libxl__is_driver_domain function
>
>  tools/libxl/libxl_device.c   | 17 ++++++++++-------
>  tools/libxl/libxl_internal.c | 16 ++++++++++++++++
>  tools/libxl/libxl_internal.h |  4 ++++
>  3 files changed, 30 insertions(+), 7 deletions(-)
>
> --
> 2.7.4
>
>

ping and update

There is run_hotplug_scripts parameter in xl.cfg. I guess it is related to
this issue. But looking
through the code I see that this parameter is not used. Could anyone
provide more info about
this parameter?

-- 
Best Regards,
Oleksandr Grytsov.

--089e0820061043c0580562564c87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Dec 14, 2017 at 4:14 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span clas=
s=3D"gmail-">From: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_grytso=
v@epam.com">oleksandr_grytsov@epam.com</a>&gt;<br>
<br>
We have following arm-based setup:<br>
<br>
- Dom0 with xen and xen tools;<br>
- Dom1 with device backends (but it is not the driver domain);<br>
- Dom2 with device frontend;<br>
<br>
On Dom2 destroying we have timeout error. Because xl treats our<br>
Dom1 as driver domain and waits for backend path to be cleared<br>
by the driver domain which is not our case.<br>
<br>
According to libxl__domain_make in case of driver domain it has<br>
&quot;libxl&quot; xen store entry:<br>
<br>
=C2=A0 =C2=A0 if (libxl_defbool_val(info-&gt;<wbr>driver_domain)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Create a local &quot;libxl&quot; direct=
ory for each guest, since we might want<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to use libxl from inside the guest<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxl__xs_mknod(gc, t, GCSPRINTF(&quot;%s/libxl=
&quot;, dom_path), rwperm,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(rwperm));<br>
<br>
This patch introduces libxl__is_driver_domain which determines the driver<b=
r>
domain by checking if &quot;libxl&quot; entry is present and uses this func=
tion on<br>
device destroy to check by whom domain path should be cleaned up (libxl<br>
or the driver domain).<br>
<br>
Oleksandr Grytsov (1):<br>
=C2=A0 libxl: add libxl__is_driver_domain function<br>
<br>
</span><span class=3D"gmail-">=C2=A0tools/libxl/libxl_device.c=C2=A0 =C2=A0=
| 17 ++++++++++-------<br>
=C2=A0tools/libxl/libxl_internal.c | 16 ++++++++++++++++<br>
=C2=A0tools/libxl/libxl_internal.h |=C2=A0 4 ++++<br>
=C2=A03 files changed, 30 insertions(+), 7 deletions(-)<br>
<br>
</span>--<br>
2.7.4<br>
<br>
</blockquote></div><br><br clear=3D"all"></div><div class=3D"gmail_extra">p=
ing and update</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">There is run_hotplug_scripts parameter in xl.cfg. I guess it is re=
lated to this issue. But looking</div><div class=3D"gmail_extra">through th=
e code I see that this parameter is not used. Could anyone provide more inf=
o about</div><div class=3D"gmail_extra">this parameter?<br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">-- <br><div class=3D"=
gmail_signature">Best Regards,<br>Oleksandr Grytsov.</div>
</div></div>

--089e0820061043c0580562564c87--


--===============7798241259817920857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7798241259817920857==--
