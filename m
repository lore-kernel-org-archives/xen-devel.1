From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v3 0/5] libxl: add PV sound device
Date: Mon, 2 Jul 2018 15:59:04 +0300
Message-ID: <CACvf2oUHph81v0FFVU6UeAjBDvmjaiibmK2OVhQeaO4pZ==KGg@mail.gmail.com>
References: <20180615101518.11161-1-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1891293274062738086=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gpod=js=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1fZyQ6-0001cJ-Ov
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 12:59:06 +0000
Received: by mail-it0-x242.google.com with SMTP id s7-v6so1082352itb.4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jul 2018 05:59:05 -0700 (PDT)
In-Reply-To: <20180615101518.11161-1-al1img@gmail.com>
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

--===============1891293274062738086==
Content-Type: multipart/alternative; boundary="00000000000025607f057003c371"

--00000000000025607f057003c371
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 15, 2018 at 1:15 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>
> This patch set adds PV sound device support to xl.cfg and xl.
> See sndif.h for protocol implementation details.
>
> Changes since v2:
>  * address comments
>  * rename libxl_vsnd_stream.id -> libxl_vsnd_stream.unique_id
>  * use XENSND_FIELD_... defines in xl_parse.c and xl_vsnd.c
>
> Oleksandr Grytsov (5):
>   libxl: add PV sound device
>   libxl: add vsnd list and info
>   xl: add PV sound condif parser
>   xl: add vsnd CLI commands
>   docs: add PV sound device config
>
>  docs/man/xl.cfg.pod.5.in             | 149 ++++++
>  docs/man/xl.pod.1.in                 |  30 ++
>  tools/libxl/Makefile                 |   2 +-
>  tools/libxl/libxl.h                  |  24 +
>  tools/libxl/libxl_create.c           |   1 +
>  tools/libxl/libxl_internal.h         |   1 +
>  tools/libxl/libxl_types.idl          |  83 ++++
>  tools/libxl/libxl_types_internal.idl |   1 +
>  tools/libxl/libxl_utils.h            |   3 +
>  tools/libxl/libxl_vsnd.c             | 684 +++++++++++++++++++++++++++
>  tools/xl/Makefile                    |   2 +-
>  tools/xl/xl.h                        |   3 +
>  tools/xl/xl_cmdtable.c               |  15 +
>  tools/xl/xl_parse.c                  | 246 ++++++++++
>  tools/xl/xl_parse.h                  |   1 +
>  tools/xl/xl_vsnd.c                   | 206 ++++++++
>  16 files changed, 1449 insertions(+), 2 deletions(-)
>  create mode 100644 tools/libxl/libxl_vsnd.c
>  create mode 100644 tools/xl/xl_vsnd.c
>
> --
> 2.17.1
>
>
ping

--00000000000025607f057003c371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Jun 15, 2018 at 1:15 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Oleksandr Grytsov &lt;<=
a href=3D"mailto:oleksandr_grytsov@epam.com">oleksandr_grytsov@epam.com</a>=
&gt;<br>
<br>
This patch set adds PV sound device support to xl.cfg and xl.<br>
See sndif.h for protocol implementation details.<br>
<br>
Changes since v2:<br>
=C2=A0* address comments<br>
=C2=A0* rename <a href=3D"http://libxl_vsnd_stream.id" rel=3D"noreferrer" t=
arget=3D"_blank">libxl_vsnd_stream.id</a> -&gt; libxl_vsnd_stream.unique_id=
<br>
=C2=A0* use XENSND_FIELD_... defines in xl_parse.c and xl_vsnd.c<br>
<br>
Oleksandr Grytsov (5):<br>
=C2=A0 libxl: add PV sound device<br>
=C2=A0 libxl: add vsnd list and info<br>
=C2=A0 xl: add PV sound condif parser<br>
=C2=A0 xl: add vsnd CLI commands<br>
=C2=A0 docs: add PV sound device config<br>
<br>
=C2=A0docs/man/<a href=3D"http://xl.cfg.pod.5.in" rel=3D"noreferrer" target=
=3D"_blank">xl.cfg.pod.5.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 149 ++++++<br>
=C2=A0docs/man/<a href=3D"http://xl.pod.1.in" rel=3D"noreferrer" target=3D"=
_blank">xl.pod.1.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 30 ++<br>
=C2=A0tools/libxl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0tools/libxl/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 24 +<br>
=C2=A0tools/libxl/libxl_create.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_types.idl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 83 ++++<br>
=C2=A0tools/libxl/libxl_types_<wbr>internal.idl |=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_utils.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
=C2=A0tools/libxl/libxl_vsnd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 684 +++++++++++++++++++++++++++<br>
=C2=A0tools/xl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0tools/xl/xl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0tools/xl/xl_cmdtable.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 15 +<br>
=C2=A0tools/xl/xl_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 246 ++++++++++<br>
=C2=A0tools/xl/xl_parse.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tools/xl/xl_vsnd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 206 ++++++++<br>
=C2=A016 files changed, 1449 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 tools/libxl/libxl_vsnd.c<br>
=C2=A0create mode 100644 tools/xl/xl_vsnd.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
2.17.1<br>
<br>
</font></span></blockquote></div></div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">ping<br></div></div>

--00000000000025607f057003c371--


--===============1891293274062738086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1891293274062738086==--
