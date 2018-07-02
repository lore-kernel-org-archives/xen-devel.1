From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v2 0/6] libxl: create standalone vkb device
Date: Mon, 2 Jul 2018 16:00:16 +0300
Message-ID: <CACvf2oUy3d9GdFEmPxvVGKSaQqCNjpj+c0PEXCfY=6Radpe=fQ@mail.gmail.com>
References: <20180612133147.807-1-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9044619684886795211=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gpod=js=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1fZyRG-0002Jx-DO
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 13:00:18 +0000
Received: by mail-it0-x244.google.com with SMTP id p4-v6so11987781itf.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jul 2018 06:00:17 -0700 (PDT)
In-Reply-To: <20180612133147.807-1-al1img@gmail.com>
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

--===============9044619684886795211==
Content-Type: multipart/alternative; boundary="000000000000704d08057003c747"

--000000000000704d08057003c747
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 12, 2018 at 4:31 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>
> Changes since initial:
>  * id field is changed to unique_id in libxl_device_vkb to be comply
>    with protocol;
>  * use XENKBD_FIELD_... defines from protocol to address xen store entries
>    and fields in domain config file;
>  * add support of new protocol parameters:
>     - XENKBD_FIELD_FEAT_DSBL_KEYBRD
>     - XENKBD_FIELD_FEAT_DSBL_POINTER
>     - XENKBD_FIELD_FEAT_ABS_POINTER
>     - XENKBD_FIELD_FEAT_RAW_POINTER
>     - XENKBD_FIELD_FEAT_MTOUCH
>
> Oleksandr Grytsov (6):
>   libxl: move vkb device to libxl_vkb.c
>   libxl: add backend type and id to vkb
>   libxl: vkb add list and info functions
>   xl: add vkb config parser and CLI
>   docs: add vkb device to xl.cfg and xl
>   libxl: vkb add extended parameters
>
>  docs/man/xl.cfg.pod.5.in    |  64 +++++++
>  docs/man/xl.pod.1.in        |  22 +++
>  tools/libxl/Makefile        |   2 +-
>  tools/libxl/libxl.h         |  10 ++
>  tools/libxl/libxl_console.c |  53 ------
>  tools/libxl/libxl_create.c  |   3 +
>  tools/libxl/libxl_dm.c      |   1 +
>  tools/libxl/libxl_types.idl |  29 +++
>  tools/libxl/libxl_utils.h   |   3 +
>  tools/libxl/libxl_vkb.c     | 346 ++++++++++++++++++++++++++++++++++++
>  tools/xl/Makefile           |   2 +-
>  tools/xl/xl.h               |   3 +
>  tools/xl/xl_cmdtable.c      |  16 ++
>  tools/xl/xl_parse.c         | 109 +++++++++++-
>  tools/xl/xl_parse.h         |   2 +-
>  tools/xl/xl_vkb.c           | 161 +++++++++++++++++
>  16 files changed, 769 insertions(+), 57 deletions(-)
>  create mode 100644 tools/libxl/libxl_vkb.c
>  create mode 100644 tools/xl/xl_vkb.c
>
> --
> 2.17.1
>
>
ping

--000000000000704d08057003c747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 12, 2018 at 4:31 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Oleksandr Grytsov &lt;<=
a href=3D"mailto:oleksandr_grytsov@epam.com">oleksandr_grytsov@epam.com</a>=
&gt;<br>
<br>
Changes since initial:<br>
=C2=A0* id field is changed to unique_id in libxl_device_vkb to be comply<b=
r>
=C2=A0 =C2=A0with protocol;<br>
=C2=A0* use XENKBD_FIELD_... defines from protocol to address xen store ent=
ries<br>
=C2=A0 =C2=A0and fields in domain config file;<br>
=C2=A0* add support of new protocol parameters:<br>
=C2=A0 =C2=A0 - XENKBD_FIELD_FEAT_DSBL_KEYBRD<br>
=C2=A0 =C2=A0 - XENKBD_FIELD_FEAT_DSBL_POINTER<br>
=C2=A0 =C2=A0 - XENKBD_FIELD_FEAT_ABS_POINTER<br>
=C2=A0 =C2=A0 - XENKBD_FIELD_FEAT_RAW_POINTER<br>
=C2=A0 =C2=A0 - XENKBD_FIELD_FEAT_MTOUCH<br>
<br>
Oleksandr Grytsov (6):<br>
=C2=A0 libxl: move vkb device to libxl_vkb.c<br>
=C2=A0 libxl: add backend type and id to vkb<br>
=C2=A0 libxl: vkb add list and info functions<br>
=C2=A0 xl: add vkb config parser and CLI<br>
=C2=A0 docs: add vkb device to xl.cfg and xl<br>
=C2=A0 libxl: vkb add extended parameters<br>
<br>
=C2=A0docs/man/<a href=3D"http://xl.cfg.pod.5.in" rel=3D"noreferrer" target=
=3D"_blank">xl.cfg.pod.5.in</a>=C2=A0 =C2=A0 |=C2=A0 64 +++++++<br>
=C2=A0docs/man/<a href=3D"http://xl.pod.1.in" rel=3D"noreferrer" target=3D"=
_blank">xl.pod.1.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +++<br>
=C2=A0tools/libxl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br=
>
=C2=A0tools/libxl/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br=
>
=C2=A0tools/libxl/libxl_console.c |=C2=A0 53 ------<br>
=C2=A0tools/libxl/libxl_create.c=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0tools/libxl/libxl_dm.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_types.idl |=C2=A0 29 +++<br>
=C2=A0tools/libxl/libxl_utils.h=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0tools/libxl/libxl_vkb.c=C2=A0 =C2=A0 =C2=A0| 346 ++++++++++++++++++++=
++++++++++<wbr>++++++<br>
=C2=A0tools/xl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0tools/xl/xl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0tools/xl/xl_cmdtable.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 ++<br>
=C2=A0tools/xl/xl_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 109 ++++++++++=
+-<br>
=C2=A0tools/xl/xl_parse.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+-<br>
=C2=A0tools/xl/xl_vkb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 161 +++++=
++++++++++++<br>
=C2=A016 files changed, 769 insertions(+), 57 deletions(-)<br>
=C2=A0create mode 100644 tools/libxl/libxl_vkb.c<br>
=C2=A0create mode 100644 tools/xl/xl_vkb.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
2.17.1<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">ping<=
br></div></div>

--000000000000704d08057003c747--


--===============9044619684886795211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9044619684886795211==--
