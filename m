From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Tue, 6 Feb 2018 15:08:45 +0200
Message-ID: <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <20180206123635.xqjoqsq4dfgve73d@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2653124852284160343=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=axhc=fa=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1ej2zP-00054u-Q8
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 13:08:47 +0000
Received: by mail-it0-x234.google.com with SMTP id b66so2417135itd.5
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2018 05:08:46 -0800 (PST)
In-Reply-To: <20180206123635.xqjoqsq4dfgve73d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Oleksandr Grytsov <oleksandr_grytsov@epam.com>
List-Id: xen-devel@lists.xenproject.org

--===============2653124852284160343==
Content-Type: multipart/alternative; boundary="001a11c15188f430b805648ae0ad"

--001a11c15188f430b805648ae0ad
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 6, 2018 at 2:36 PM, Wei Liu <wei.liu2@citrix.com> wrote:

> On Thu, Dec 14, 2017 at 04:14:12PM +0200, Oleksandr Grytsov wrote:
> > From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> >
> > We have following arm-based setup:
> >
> > - Dom0 with xen and xen tools;
> > - Dom1 with device backends (but it is not the driver domain);
>
> What is your definition of a "driver domain"? What does it do in this
> case?
>
> I seem to have seen people use this term in different contexts to mean
> slightly different things. I need to figure out what you actually mean
> first.
>
>
I see in the libxl/xl sources that closing PV devices is done differently
in case backends are in Dom0 and are in other domain. It is called as
driver domain in the sources. So, I don't have clear understanding
what does it mean. In our setup backends are in Dom1 and xl is in Dom0.
And I see that xl dosn't close PV device on domain reboot or shutdown.


> > - Dom2 with device frontend;
> >
> > On Dom2 destroying we have timeout error. Because xl treats our
> > Dom1 as driver domain and waits for backend path to be cleared
> > by the driver domain which is not our case.
> >
> > According to libxl__domain_make in case of driver domain it has
> > "libxl" xen store entry:
> >
> >     if (libxl_defbool_val(info->driver_domain)) {
> >         /*
> >          * Create a local "libxl" directory for each guest, since we
> might want
> >          * to use libxl from inside the guest
> >          */
> >         libxl__xs_mknod(gc, t, GCSPRINTF("%s/libxl", dom_path), rwperm,
> >                         ARRAY_SIZE(rwperm));
> >
> > This patch introduces libxl__is_driver_domain which determines the driver
> > domain by checking if "libxl" entry is present and uses this function on
> > device destroy to check by whom domain path should be cleaned up (libxl
> > or the driver domain).
> >
> > Oleksandr Grytsov (1):
> >   libxl: add libxl__is_driver_domain function
> >
> >  tools/libxl/libxl_device.c   | 17 ++++++++++-------
> >  tools/libxl/libxl_internal.c | 16 ++++++++++++++++
> >  tools/libxl/libxl_internal.h |  4 ++++
> >  3 files changed, 30 insertions(+), 7 deletions(-)
> >
> > --
> > 2.7.4
> >
>



-- 
Best Regards,
Oleksandr Grytsov.

--001a11c15188f430b805648ae0ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 6, 2018 at 2:36 PM, Wei Liu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Dec 1=
4, 2017 at 04:14:12PM +0200, Oleksandr Grytsov wrote:<br>
&gt; From: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_grytsov@epam.c=
om">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt;<br>
&gt; We have following arm-based setup:<br>
&gt;<br>
&gt; - Dom0 with xen and xen tools;<br>
&gt; - Dom1 with device backends (but it is not the driver domain);<br>
<br>
</span>What is your definition of a &quot;driver domain&quot;? What does it=
 do in this<br>
case?<br>
<br>
I seem to have seen people use this term in different contexts to mean<br>
slightly different things. I need to figure out what you actually mean<br>
first.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>I see in the libxl/xl sources that closing PV devices is done=
 differently<br></div><div>in case backends are in Dom0 and are in other do=
main. It is called as<br></div><div>driver domain in the sources. So, I don=
&#39;t have clear understanding<br></div><div>what does it mean. In our set=
up backends are in Dom1 and xl is in Dom0.<br></div><div>And I see that xl =
dosn&#39;t close PV device on domain reboot or shutdown.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D=
"h5">
&gt; - Dom2 with device frontend;<br>
&gt;<br>
&gt; On Dom2 destroying we have timeout error. Because xl treats our<br>
&gt; Dom1 as driver domain and waits for backend path to be cleared<br>
&gt; by the driver domain which is not our case.<br>
&gt;<br>
&gt; According to libxl__domain_make in case of driver domain it has<br>
&gt; &quot;libxl&quot; xen store entry:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (libxl_defbool_val(info-&gt;<wbr>driver_domain))=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Create a local &quot;libxl&quot; d=
irectory for each guest, since we might want<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to use libxl from inside the guest=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libxl__xs_mknod(gc, t, GCSPRINTF(&quo=
t;%s/libxl&quot;, dom_path), rwperm,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(rwperm));<br>
&gt;<br>
&gt; This patch introduces libxl__is_driver_domain which determines the dri=
ver<br>
&gt; domain by checking if &quot;libxl&quot; entry is present and uses this=
 function on<br>
&gt; device destroy to check by whom domain path should be cleaned up (libx=
l<br>
&gt; or the driver domain).<br>
&gt;<br>
&gt; Oleksandr Grytsov (1):<br>
&gt;=C2=A0 =C2=A0libxl: add libxl__is_driver_domain function<br>
&gt;<br>
&gt;=C2=A0 tools/libxl/libxl_device.c=C2=A0 =C2=A0| 17 ++++++++++-------<br=
>
&gt;=C2=A0 tools/libxl/libxl_internal.c | 16 ++++++++++++++++<br>
&gt;=C2=A0 tools/libxl/libxl_internal.h |=C2=A0 4 ++++<br>
&gt;=C2=A0 3 files changed, 30 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Best Regards,<br>Ol=
eksandr Grytsov.</div>
</div></div>

--001a11c15188f430b805648ae0ad--


--===============2653124852284160343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2653124852284160343==--
