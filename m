From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v1 0/6] libxl: create standalone vkb device
Date: Mon, 5 Feb 2018 13:03:53 +0200
Message-ID: <CACvf2oXrxK6An_Uy+KEr-3qczF25jekoGAzmxZ0TRY27_LgXcQ@mail.gmail.com>
References: <1509548707-6134-1-git-send-email-al1img@gmail.com>
 <CACvf2oUMgNjjbudxA22MNX1icZ1soidt-gpULQVo-29WTKWpoA@mail.gmail.com>
 <CACvf2oXKhOSRfJmMz5H=ZVDXA-ksC-L0L+vmuE5NJE+XwR6Ckg@mail.gmail.com>
 <CACvf2oU5hdkdUXLe2b_fFhCEXWg8_ThHhQs1Mph0xEvG1aMA=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7085513401139848277=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nht/=e7=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eieZ2-0003iw-26
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 11:03:56 +0000
Received: by mail-io0-x241.google.com with SMTP id d13so29832853iog.5
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2018 03:03:54 -0800 (PST)
In-Reply-To: <CACvf2oU5hdkdUXLe2b_fFhCEXWg8_ThHhQs1Mph0xEvG1aMA=w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============7085513401139848277==
Content-Type: multipart/alternative; boundary="001a113ed3c88f645005647504e9"

--001a113ed3c88f645005647504e9
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 9, 2018 at 1:31 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

>
>
> On Mon, Nov 20, 2017 at 3:44 PM, Oleksandr Grytsov <al1img@gmail.com>
> wrote:
>
>> On Tue, Nov 14, 2017 at 2:39 PM, Oleksandr Grytsov <al1img@gmail.com>
>> wrote:
>>
>>> On Wed, Nov 1, 2017 at 5:05 PM, Oleksandr Grytsov <al1img@gmail.com>
>>> wrote:
>>>
>>>> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>>>>
>>>> Changes since initial:
>>>>  * add setting backend-type to xenstore
>>>>  * add id field to indentify the vkb device on backend side
>>>>
>>>> Oleksandr Grytsov (6):
>>>>   libxl: move vkb device to libxl_vkb.c
>>>>   libxl: fix vkb XS entry and type
>>>>   libxl: add backend type and id to vkb
>>>>   libxl: vkb add list and info functions
>>>>   xl: add vkb config parser and CLI
>>>>   docs: add vkb device to xl.cfg and xl
>>>>
>>>>  docs/man/xl.cfg.pod.5.in    |  28 ++++++
>>>>  docs/man/xl.pod.1.in        |  22 +++++
>>>>  tools/libxl/Makefile        |   1 +
>>>>  tools/libxl/libxl.h         |  10 ++
>>>>  tools/libxl/libxl_console.c |  53 -----------
>>>>  tools/libxl/libxl_create.c  |   3 +
>>>>  tools/libxl/libxl_dm.c      |   1 +
>>>>  tools/libxl/libxl_types.idl |  19 ++++
>>>>  tools/libxl/libxl_utils.h   |   3 +
>>>>  tools/libxl/libxl_vkb.c     | 226 ++++++++++++++++++++++++++++++
>>>> ++++++++++++++
>>>>  tools/xl/Makefile           |   2 +-
>>>>  tools/xl/xl.h               |   3 +
>>>>  tools/xl/xl_cmdtable.c      |  15 +++
>>>>  tools/xl/xl_parse.c         |  75 ++++++++++++++-
>>>>  tools/xl/xl_parse.h         |   2 +-
>>>>  tools/xl/xl_vkb.c           | 142 ++++++++++++++++++++++++++++
>>>>  16 files changed, 549 insertions(+), 56 deletions(-)
>>>>  create mode 100644 tools/libxl/libxl_vkb.c
>>>>  create mode 100644 tools/xl/xl_vkb.c
>>>>
>>>> --
>>>> 2.7.4
>>>>
>>>>
>>> ping
>>>
>>> --
>>> Best Regards,
>>> Oleksandr Grytsov.
>>>
>>
>> ping
>>
>> --
>> Best Regards,
>> Oleksandr Grytsov.
>>
>
> Ian, Wei,
>
> Could you review this patch set?
>
> --
> Best Regards,
> Oleksandr Grytsov.
>

ping

-- 
Best Regards,
Oleksandr Grytsov.

--001a113ed3c88f645005647504e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jan 9, 2018 at 1:31 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=
=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div clas=
s=3D"gmail_extra"><div><div class=3D"h5"><br><div class=3D"gmail_quote">On =
Mon, Nov 20, 2017 at 3:44 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div clas=
s=3D"m_2427215988470196317gmail-HOEnZb"><div class=3D"m_2427215988470196317=
gmail-h5"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote">On Tue, Nov 14, 2017 at 2:39 PM, Oleksandr Grytsov <span dir=3D"ltr">=
&lt;<a href=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div><div class=3D"m_2427215988470196317gmail-m_4288306359=
364594205h5"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Wed, =
Nov 1, 2017 at 5:05 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=3D"=
mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Oleksandr=
 Grytsov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.com" target=3D"_blank=
">oleksandr_grytsov@epam.com</a>&gt;<br>
<br>
Changes since initial:<br>
=C2=A0* add setting backend-type to xenstore<br>
=C2=A0* add id field to indentify the vkb device on backend side<br>
<br>
Oleksandr Grytsov (6):<br>
=C2=A0 libxl: move vkb device to libxl_vkb.c<br>
=C2=A0 libxl: fix vkb XS entry and type<br>
=C2=A0 libxl: add backend type and id to vkb<br>
=C2=A0 libxl: vkb add list and info functions<br>
=C2=A0 xl: add vkb config parser and CLI<br>
=C2=A0 docs: add vkb device to xl.cfg and xl<br>
<br>
=C2=A0docs/man/<a href=3D"http://xl.cfg.pod.5.in" rel=3D"noreferrer" target=
=3D"_blank">xl.cfg.pod.5.in</a>=C2=A0 =C2=A0 |=C2=A0 28 ++++++<br>
=C2=A0docs/man/<a href=3D"http://xl.pod.1.in" rel=3D"noreferrer" target=3D"=
_blank">xl.pod.1.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +++++<br>
=C2=A0tools/libxl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 ++<br=
>
=C2=A0tools/libxl/libxl_console.c |=C2=A0 53 -----------<br>
=C2=A0tools/libxl/libxl_create.c=C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0tools/libxl/libxl_dm.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_types.idl |=C2=A0 19 ++++<br>
=C2=A0tools/libxl/libxl_utils.h=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0tools/libxl/libxl_vkb.c=C2=A0 =C2=A0 =C2=A0| 226 ++++++++++++++++++++=
++++++++++<wbr>++++++++++++++<br>
=C2=A0tools/xl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0tools/xl/xl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0tools/xl/xl_cmdtable.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 +++<br>
=C2=A0tools/xl/xl_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 75 +++++=
+++++++++-<br>
=C2=A0tools/xl/xl_parse.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 =
+-<br>
=C2=A0tools/xl/xl_vkb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 142 +++++=
+++++++++++++++++++++++<br>
=C2=A016 files changed, 549 insertions(+), 56 deletions(-)<br>
=C2=A0create mode 100644 tools/libxl/libxl_vkb.c<br>
=C2=A0create mode 100644 tools/xl/xl_vkb.c<br>
<span class=3D"m_2427215988470196317gmail-m_4288306359364594205m_6424297356=
227893686HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div></div></div><div class=3D"gmail_=
extra">ping<span class=3D"m_2427215988470196317gmail-m_4288306359364594205H=
OEnZb"><font color=3D"#888888"><br clear=3D"all"></font></span></div><span =
class=3D"m_2427215988470196317gmail-m_4288306359364594205HOEnZb"><font colo=
r=3D"#888888"><div class=3D"gmail_extra"><br>-- <br><div class=3D"m_2427215=
988470196317gmail-m_4288306359364594205m_6424297356227893686gmail_signature=
">Best Regards,<br>Oleksandr Grytsov.</div>
</div></font></span></div>
</blockquote></div><br></div><div class=3D"gmail_extra">ping<br clear=3D"al=
l"></div><div class=3D"gmail_extra"><br>-- <br><div class=3D"m_242721598847=
0196317gmail-m_4288306359364594205gmail_signature">Best Regards,<br>Oleksan=
dr Grytsov.</div>
</div></div>
</div></div></blockquote></div><br></div></div><div class=3D"gmail_extra">I=
an, Wei,</div><div class=3D"gmail_extra"><br></div>Could you review this pa=
tch set?<span class=3D""><br clear=3D"all"><br>-- <br><div class=3D"m_24272=
15988470196317gmail_signature">Best Regards,<br>Oleksandr Grytsov.</div>
</span></div></div>
</blockquote></div><br></div><div class=3D"gmail_extra">ping<br clear=3D"al=
l"></div><div class=3D"gmail_extra"><br>-- <br><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">Best Regards,<br>Oleksandr Grytsov.</=
div>
</div></div>

--001a113ed3c88f645005647504e9--


--===============7085513401139848277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7085513401139848277==--
