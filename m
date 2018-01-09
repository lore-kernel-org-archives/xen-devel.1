From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v1 0/5] libxl: add PV sound device
Date: Tue, 9 Jan 2018 13:30:47 +0200
Message-ID: <CACvf2oXMK8NLjv7ocok=1m5v_oB1o9AfJsCnr+t4mtUv9zgN6w@mail.gmail.com>
References: <1509548687-6071-1-git-send-email-al1img@gmail.com>
 <CACvf2oW8ys6p_Nape3S=VyjNP=GcOfQAxkdnwNAb_qm4c463_w@mail.gmail.com>
 <CACvf2oVw=154E+=Xic67FWnFFyHN99FWouiqZVSAQi68e-kpYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8882899352631680290=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mj+z=ee=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eYs7F-0002ct-5Y
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 11:30:49 +0000
Received: by mail-io0-x244.google.com with SMTP id n14so18192033iob.4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 03:30:48 -0800 (PST)
In-Reply-To: <CACvf2oVw=154E+=Xic67FWnFFyHN99FWouiqZVSAQi68e-kpYg@mail.gmail.com>
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

--===============8882899352631680290==
Content-Type: multipart/alternative; boundary="001a114285e60516800562563f91"

--001a114285e60516800562563f91
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 20, 2017 at 3:44 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> On Tue, Nov 14, 2017 at 2:38 PM, Oleksandr Grytsov <al1img@gmail.com>
> wrote:
>
>> On Wed, Nov 1, 2017 at 5:04 PM, Oleksandr Grytsov <al1img@gmail.com>
>> wrote:
>>
>>> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>>>
>>> This patch set adds PV sound device support to xl.cfg and xl.
>>> See sndif.h for protocol implementation details.
>>>
>>> Changes since initial:
>>>  * fix code style
>>>  * change unique-id from int to string (to make id more user readable)
>>>
>>> Oleksandr Grytsov (5):
>>>   libxl: add PV sound device
>>>   libxl: add vsnd list and info
>>>   xl: add PV sound condif parser
>>>   xl: add vsnd CLI commands
>>>   docs: add PV sound device config
>>>
>>>  docs/man/xl.cfg.pod.5.in             | 150 ++++++++
>>>  docs/man/xl.pod.1.in                 |  30 ++
>>>  tools/libxl/Makefile                 |   2 +-
>>>  tools/libxl/libxl.h                  |  24 ++
>>>  tools/libxl/libxl_create.c           |   1 +
>>>  tools/libxl/libxl_internal.h         |   1 +
>>>  tools/libxl/libxl_types.idl          |  83 +++++
>>>  tools/libxl/libxl_types_internal.idl |   1 +
>>>  tools/libxl/libxl_utils.h            |   3 +
>>>  tools/libxl/libxl_vsnd.c             | 699
>>> +++++++++++++++++++++++++++++++++++
>>>  tools/xl/Makefile                    |   2 +-
>>>  tools/xl/xl.h                        |   3 +
>>>  tools/xl/xl_cmdtable.c               |  15 +
>>>  tools/xl/xl_parse.c                  | 246 ++++++++++++
>>>  tools/xl/xl_parse.h                  |   1 +
>>>  tools/xl/xl_vsnd.c                   | 203 ++++++++++
>>>  16 files changed, 1462 insertions(+), 2 deletions(-)
>>>  create mode 100644 tools/libxl/libxl_vsnd.c
>>>  create mode 100644 tools/xl/xl_vsnd.c
>>>
>>> --
>>> 2.7.4
>>>
>>>
>> ping
>>
>> --
>> Best Regards,
>> Oleksandr Grytsov.
>>
>
> ping
>
> --
> Best Regards,
> Oleksandr Grytsov.
>

Ian, Wei,

Could you review this patch set?

-- 
Best Regards,
Oleksandr Grytsov.

--001a114285e60516800562563f91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Nov 20, 2017 at 3:44 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div cl=
ass=3D"h5"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_=
quote">On Tue, Nov 14, 2017 at 2:38 PM, Oleksandr Grytsov <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
div><div class=3D"m_7361427090113817149h5"><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">On Wed, Nov 1, 2017 at 5:04 PM, Oleksandr Grytsov <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:al1img@gmail.com" target=3D"_blank">al=
1img@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.com" targe=
t=3D"_blank">oleksandr_grytsov@epam.com</a>&gt;<br>
<br>
This patch set adds PV sound device support to xl.cfg and xl.<br>
See sndif.h for protocol implementation details.<br>
<br>
Changes since initial:<br>
=C2=A0* fix code style<br>
=C2=A0* change unique-id from int to string (to make id more user readable)=
<br>
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
=C2=A0| 150 ++++++++<br>
=C2=A0docs/man/<a href=3D"http://xl.pod.1.in" rel=3D"noreferrer" target=3D"=
_blank">xl.pod.1.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 30 ++<br>
=C2=A0tools/libxl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0tools/libxl/libxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 24 ++<br>
=C2=A0tools/libxl/libxl_create.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_types.idl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 83 +++++<br>
=C2=A0tools/libxl/libxl_types_inter<wbr>nal.idl |=C2=A0 =C2=A01 +<br>
=C2=A0tools/libxl/libxl_utils.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
=C2=A0tools/libxl/libxl_vsnd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 699 ++++++++++++++++++++++++++++++<wbr>+++++<br>
=C2=A0tools/xl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0tools/xl/xl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0tools/xl/xl_cmdtable.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 15 +<br>
=C2=A0tools/xl/xl_parse.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 246 ++++++++++++<br>
=C2=A0tools/xl/xl_parse.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tools/xl/xl_vsnd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 203 ++++++++++<br>
=C2=A016 files changed, 1462 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 tools/libxl/libxl_vsnd.c<br>
=C2=A0create mode 100644 tools/xl/xl_vsnd.c<br>
<span class=3D"m_7361427090113817149m_-4895562956732040766HOEnZb"><font col=
or=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div></div></div><div class=3D"gmail_=
extra">ping<span class=3D"m_7361427090113817149HOEnZb"><font color=3D"#8888=
88"><br clear=3D"all"></font></span></div><span class=3D"m_7361427090113817=
149HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br>-- <br><d=
iv class=3D"m_7361427090113817149m_-4895562956732040766gmail_signature" dat=
a-smartmail=3D"gmail_signature">Best Regards,<br>Oleksandr Grytsov.</div>
</div></font></span></div>
</blockquote></div><br></div><div class=3D"gmail_extra">ping<br clear=3D"al=
l"></div><div class=3D"gmail_extra"><br>-- <br><div class=3D"m_736142709011=
3817149gmail_signature" data-smartmail=3D"gmail_signature">Best Regards,<br=
>Oleksandr Grytsov.</div>
</div></div>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Ian, We=
i,</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cou=
ld you review this patch set?<br clear=3D"all"></div><div class=3D"gmail_ex=
tra"><br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature">Best Regards,<br>Oleksandr Grytsov.</div>
</div></div>

--001a114285e60516800562563f91--


--===============8882899352631680290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8882899352631680290==--
