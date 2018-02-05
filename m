From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Mon, 5 Feb 2018 13:02:29 +0200
Message-ID: <CACvf2oXVwgt117aMEdHR34U__pJwYb=KdPyUOjUW-KkhgrfqYw@mail.gmail.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <CACvf2oUDKQvX+KCXNfGRJCbcC0wz6j5xQNZ4rYjApeOzwaXvcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0859649818289163577=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nht/=e7=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eieXg-0003cI-2H
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 11:02:32 +0000
Received: by mail-it0-x242.google.com with SMTP id e1so15452119ita.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2018 03:02:30 -0800 (PST)
In-Reply-To: <CACvf2oUDKQvX+KCXNfGRJCbcC0wz6j5xQNZ4rYjApeOzwaXvcg@mail.gmail.com>
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

--===============0859649818289163577==
Content-Type: multipart/alternative; boundary="94eb2c08917a87b9c1056474ff53"

--94eb2c08917a87b9c1056474ff53
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 9, 2018 at 1:34 PM, Oleksandr Grytsov <al1img@gmail.com> wrote:

> On Thu, Dec 14, 2017 at 4:14 PM, Oleksandr Grytsov <al1img@gmail.com>
> wrote:
>
>> From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
>>
>> We have following arm-based setup:
>>
>> - Dom0 with xen and xen tools;
>> - Dom1 with device backends (but it is not the driver domain);
>> - Dom2 with device frontend;
>>
>> On Dom2 destroying we have timeout error. Because xl treats our
>> Dom1 as driver domain and waits for backend path to be cleared
>> by the driver domain which is not our case.
>>
>> According to libxl__domain_make in case of driver domain it has
>> "libxl" xen store entry:
>>
>>     if (libxl_defbool_val(info->driver_domain)) {
>>         /*
>>          * Create a local "libxl" directory for each guest, since we
>> might want
>>          * to use libxl from inside the guest
>>          */
>>         libxl__xs_mknod(gc, t, GCSPRINTF("%s/libxl", dom_path), rwperm,
>>                         ARRAY_SIZE(rwperm));
>>
>> This patch introduces libxl__is_driver_domain which determines the driver
>> domain by checking if "libxl" entry is present and uses this function on
>> device destroy to check by whom domain path should be cleaned up (libxl
>> or the driver domain).
>>
>> Oleksandr Grytsov (1):
>>   libxl: add libxl__is_driver_domain function
>>
>>  tools/libxl/libxl_device.c   | 17 ++++++++++-------
>>  tools/libxl/libxl_internal.c | 16 ++++++++++++++++
>>  tools/libxl/libxl_internal.h |  4 ++++
>>  3 files changed, 30 insertions(+), 7 deletions(-)
>>
>> --
>> 2.7.4
>>
>>
>
> ping and update
>
> There is run_hotplug_scripts parameter in xl.cfg. I guess it is related to
> this issue. But looking
> through the code I see that this parameter is not used. Could anyone
> provide more info about
> this parameter?
>
> --
> Best Regards,
> Oleksandr Grytsov.
>

ping

-- 
Best Regards,
Oleksandr Grytsov.

--94eb2c08917a87b9c1056474ff53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jan 9, 2018 at 1:34 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=
=3D"mailto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div cla=
ss=3D"h5"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Thu, Dec=
 14, 2017 at 4:14 PM, Oleksandr Grytsov <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:al1img@gmail.com" target=3D"_blank">al1img@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"m_=
7278245943740682198gmail-">From: Oleksandr Grytsov &lt;<a href=3D"mailto:ol=
eksandr_grytsov@epam.com" target=3D"_blank">oleksandr_grytsov@epam.com</a>&=
gt;<br>
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
=C2=A0 =C2=A0 if (libxl_defbool_val(info-&gt;drive<wbr>r_domain)) {<br>
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
</span><span class=3D"m_7278245943740682198gmail-">=C2=A0tools/libxl/libxl_=
device.c=C2=A0 =C2=A0| 17 ++++++++++-------<br>
=C2=A0tools/libxl/libxl_internal.c | 16 ++++++++++++++++<br>
=C2=A0tools/libxl/libxl_internal.h |=C2=A0 4 ++++<br>
=C2=A03 files changed, 30 insertions(+), 7 deletions(-)<br>
<br>
</span>--<br>
2.7.4<br>
<br>
</blockquote></div><br><br clear=3D"all"></div></div></div><div class=3D"gm=
ail_extra">ping and update</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">There is run_hotplug_scripts parameter in xl.cfg. I gu=
ess it is related to this issue. But looking</div><div class=3D"gmail_extra=
">through the code I see that this parameter is not used. Could anyone prov=
ide more info about</div><div class=3D"gmail_extra">this parameter?<span cl=
ass=3D"HOEnZb"><font color=3D"#888888"><br></font></span></div><span class=
=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">-- <br><div class=3D"m_7278245943740682198gmail_si=
gnature">Best Regards,<br>Oleksandr Grytsov.</div>
</div></font></span></div>
</blockquote></div><br></div><div class=3D"gmail_extra">ping<br clear=3D"al=
l"></div><div class=3D"gmail_extra"><br>-- <br><div class=3D"gmail_signatur=
e" data-smartmail=3D"gmail_signature">Best Regards,<br>Oleksandr Grytsov.</=
div>
</div></div>

--94eb2c08917a87b9c1056474ff53--


--===============0859649818289163577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0859649818289163577==--
