From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH v1 0/5] libxl: add PV sound device
Date: Mon, 5 Feb 2018 13:04:53 +0200
Message-ID: <CACvf2oXt=A3xwsG4r+1=iVdNO9WFE2V1ib7Zt8K3kSx+NtQiqw@mail.gmail.com>
References: <1509548687-6071-1-git-send-email-al1img@gmail.com>
 <CACvf2oW8ys6p_Nape3S=VyjNP=GcOfQAxkdnwNAb_qm4c463_w@mail.gmail.com>
 <CACvf2oVw=154E+=Xic67FWnFFyHN99FWouiqZVSAQi68e-kpYg@mail.gmail.com>
 <CACvf2oXMK8NLjv7ocok=1m5v_oB1o9AfJsCnr+t4mtUv9zgN6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5560050492680069891=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nht/=e7=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eiea0-0003u0-D8
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 11:04:56 +0000
Received: by mail-io0-x22d.google.com with SMTP id f4so29843806ioh.8
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2018 03:04:54 -0800 (PST)
In-Reply-To: <CACvf2oXMK8NLjv7ocok=1m5v_oB1o9AfJsCnr+t4mtUv9zgN6w@mail.gmail.com>
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

--===============5560050492680069891==
Content-Type: multipart/alternative; boundary="94eb2c059b36235a9c056475083f"

--94eb2c059b36235a9c056475083f
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 9, 2018 at 1:30 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> On Mon, Nov 20, 2017 at 3:44 PM, Oleksandr Grytsov <al1img@gmail.com>
> wrote:
>
>> On Tue, Nov 14, 2017 at 2:38 PM, Oleksandr Grytsov <al1img@gmail.com>
>> wrote:
>>
>>> On Wed, Nov 1, 2017 at 5:04 PM, Oleksandr Grytsov <al1img@gmail.com>
>>> wrote:
>>>
>>>> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>>>>
>>>> This patch set adds PV sound device support to xl.cfg and xl.
>>>> See sndif.h for protocol implementation details.
>>>>
>>>> Changes since initial:
>>>>  * fix code style
>>>>  * change unique-id from int to string (to make id more user readable)
>>>>
>>>> Oleksandr Grytsov (5):
>>>>   libxl: add PV sound device
>>>>   libxl: add vsnd list and info
>>>>   xl: add PV sound condif parser
>>>>   xl: add vsnd CLI commands
>>>>   docs: add PV sound device config
>>>>
>>>>  docs/man/xl.cfg.pod.5.in             | 150 ++++++++
>>>>  docs/man/xl.pod.1.in                 |  30 ++
>>>>  tools/libxl/Makefile                 |   2 +-
>>>>  tools/libxl/libxl.h                  |  24 ++
>>>>  tools/libxl/libxl_create.c           |   1 +
>>>>  tools/libxl/libxl_internal.h         |   1 +
>>>>  tools/libxl/libxl_types.idl          |  83 +++++
>>>>  tools/libxl/libxl_types_internal.idl |   1 +
>>>>  tools/libxl/libxl_utils.h            |   3 +
>>>>  tools/libxl/libxl_vsnd.c             | 699
>>>> +++++++++++++++++++++++++++++++++++
>>>>  tools/xl/Makefile                    |   2 +-
>>>>  tools/xl/xl.h                        |   3 +
>>>>  tools/xl/xl_cmdtable.c               |  15 +
>>>>  tools/xl/xl_parse.c                  | 246 ++++++++++++
>>>>  tools/xl/xl_parse.h                  |   1 +
>>>>  tools/xl/xl_vsnd.c                   | 203 ++++++++++
>>>>  16 files changed, 1462 insertions(+), 2 deletions(-)
>>>>  create mode 100644 tools/libxl/libxl_vsnd.c
>>>>  create mode 100644 tools/xl/xl_vsnd.c
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

--94eb2c059b36235a9c056475083f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jan 9, 2018 at 1:30 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=
=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div cla=
ss=3D"h5"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Mon, Nov=
 20, 2017 at 3:44 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_5746210956719363149H=
OEnZb"><div class=3D"m_5746210956719363149h5"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Nov 14, 2017 at 2:38 PM=
, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=3D"mailto:al1img@gmail.co=
m" target=3D"_blank">al1img@gmail.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><div><div class=3D"m_574621095671936314=
9m_7361427090113817149h5"><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote">On Wed, Nov 1, 2017 at 5:04 PM, Oleksandr Grytsov <span dir=3D"ltr">&l=
t;<a href=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Oleksandr Gryts=
ov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.com" target=3D"_blank">olek=
sandr_grytsov@epam.com</a>&gt;<br>
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
<span class=3D"m_5746210956719363149m_7361427090113817149m_-489556295673204=
0766HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div></div></div><div class=3D"gmail_=
extra">ping<span class=3D"m_5746210956719363149m_7361427090113817149HOEnZb"=
><font color=3D"#888888"><br clear=3D"all"></font></span></div><span class=
=3D"m_5746210956719363149m_7361427090113817149HOEnZb"><font color=3D"#88888=
8"><div class=3D"gmail_extra"><br>-- <br><div class=3D"m_574621095671936314=
9m_7361427090113817149m_-4895562956732040766gmail_signature" data-smartmail=
=3D"gmail_signature">Best Regards,<br>Oleksandr Grytsov.</div>
</div></font></span></div>
</blockquote></div><br></div><div class=3D"gmail_extra">ping<br clear=3D"al=
l"></div><div class=3D"gmail_extra"><br>-- <br><div class=3D"m_574621095671=
9363149m_7361427090113817149gmail_signature" data-smartmail=3D"gmail_signat=
ure">Best Regards,<br>Oleksandr Grytsov.</div>
</div></div>
</div></div></blockquote></div><br></div></div></div><div class=3D"gmail_ex=
tra">Ian, Wei,</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Could you review this patch set?<br clear=3D"all"></div><span clas=
s=3D""><div class=3D"gmail_extra"><br>-- <br><div class=3D"m_57462109567193=
63149gmail_signature" data-smartmail=3D"gmail_signature">Best Regards,<br>O=
leksandr Grytsov.</div>
</div></span></div>
</blockquote></div><br></div><div class=3D"gmail_extra">ping<br clear=3D"al=
l"></div><div class=3D"gmail_extra"><br>-- <br><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">Best Regards,<br>Oleksandr Grytsov.</=
div>
</div></div>

--94eb2c059b36235a9c056475083f--


--===============5560050492680069891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5560050492680069891==--
