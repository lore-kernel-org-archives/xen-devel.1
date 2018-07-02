From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH 0/1] libxl/xl: rename id to unique-id in
 vdispl xen store
Date: Mon, 2 Jul 2018 15:59:36 +0300
Message-ID: <CACvf2oU7mtFi_WgV0oBTvOswsxkS1U8YMZUQWirL-g+sMYvpdQ@mail.gmail.com>
References: <20180612154046.3492-1-al1img@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5351671533527167978=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gpod=js=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1fZyQd-0001gU-C6
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 12:59:39 +0000
Received: by mail-io0-x244.google.com with SMTP id s26-v6so14650496ioj.4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jul 2018 05:59:37 -0700 (PDT)
In-Reply-To: <20180612154046.3492-1-al1img@gmail.com>
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

--===============5351671533527167978==
Content-Type: multipart/alternative; boundary="00000000000014c418057003c55f"

--00000000000014c418057003c55f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 12, 2018 at 6:40 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>
> As new version of the display protocol introduces unique-id variable, it
> needs
> to be changed in libxl/xl. This patchset renames it in the xen store and in
> display device structures. Also it uses XENDISPL_FIELD_... defines instead
> of
> inline names.
>
> Oleksandr Grytsov (1):
>   libxl/xl: rename id to unique-id in vdispl xen store
>
>  docs/man/xl.cfg.pod.5.in    |  2 +-
>  tools/libxl/libxl_types.idl |  4 ++--
>  tools/libxl/libxl_vdispl.c  | 32 +++++++++++++++++---------------
>  tools/xl/xl_parse.c         |  2 +-
>  tools/xl/xl_vdispl.c        |  2 +-
>  5 files changed, 22 insertions(+), 20 deletions(-)
>
> --
> 2.17.1
>
>
ping

--00000000000014c418057003c55f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 12, 2018 at 6:40 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Oleksandr Grytsov &lt;<=
a href=3D"mailto:oleksandr_grytsov@epam.com">oleksandr_grytsov@epam.com</a>=
&gt;<br>
<br>
As new version of the display protocol introduces unique-id variable, it ne=
eds<br>
to be changed in libxl/xl. This patchset renames it in the xen store and in=
<br>
display device structures. Also it uses XENDISPL_FIELD_... defines instead =
of<br>
inline names.<br>
<br>
Oleksandr Grytsov (1):<br>
=C2=A0 libxl/xl: rename id to unique-id in vdispl xen store<br>
<br>
=C2=A0docs/man/<a href=3D"http://xl.cfg.pod.5.in" rel=3D"noreferrer" target=
=3D"_blank">xl.cfg.pod.5.in</a>=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0tools/libxl/libxl_types.idl |=C2=A0 4 ++--<br>
=C2=A0tools/libxl/libxl_vdispl.c=C2=A0 | 32 +++++++++++++++++-------------<=
wbr>--<br>
=C2=A0tools/xl/xl_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0tools/xl/xl_vdispl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A05 files changed, 22 insertions(+), 20 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
2.17.1<br>
<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">ping<=
br></div></div>

--00000000000014c418057003c55f--


--===============5351671533527167978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5351671533527167978==--
