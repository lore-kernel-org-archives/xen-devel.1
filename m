From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Tue, 13 Feb 2018 15:32:04 +0200
Message-ID: <CACvf2oWkY6=tHqQ=pYHj6cH+g01FrSrr_iJbu1qPrrnmeXgJYw@mail.gmail.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <20180206123635.xqjoqsq4dfgve73d@citrix.com>
 <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
 <20180213120658.bshetw3jommut5nj@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2510363628688325201=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xsgf=fh=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1elago-0005eZ-Jc
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 13:32:06 +0000
Received: by mail-io0-x22b.google.com with SMTP id d13so21263717iog.5
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2018 05:32:05 -0800 (PST)
In-Reply-To: <20180213120658.bshetw3jommut5nj@citrix.com>
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

--===============2510363628688325201==
Content-Type: multipart/alternative; boundary="001a113ed2f238de6f056518051a"

--001a113ed2f238de6f056518051a
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 13, 2018 at 2:06 PM, Wei Liu <wei.liu2@citrix.com> wrote:

> On Tue, Feb 06, 2018 at 03:08:45PM +0200, Oleksandr Grytsov wrote:
> > On Tue, Feb 6, 2018 at 2:36 PM, Wei Liu <wei.liu2@citrix.com> wrote:
> >
> > > On Thu, Dec 14, 2017 at 04:14:12PM +0200, Oleksandr Grytsov wrote:
> > > > From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> > > >
> > > > We have following arm-based setup:
> > > >
> > > > - Dom0 with xen and xen tools;
> > > > - Dom1 with device backends (but it is not the driver domain);
> > >
> > > What is your definition of a "driver domain"? What does it do in this
> > > case?
> > >
> > > I seem to have seen people use this term in different contexts to mean
> > > slightly different things. I need to figure out what you actually mean
> > > first.
> > >
> > >
> > I see in the libxl/xl sources that closing PV devices is done differently
> > in case backends are in Dom0 and are in other domain. It is called as
> > driver domain in the sources. So, I don't have clear understanding
> > what does it mean. In our setup backends are in Dom1 and xl is in Dom0.
> > And I see that xl dosn't close PV device on domain reboot or shutdown.
>
> Do you run xl devd in your backend domain?
>
> Wei.
>

No I don't

-- 
Best Regards,
Oleksandr Grytsov.

--001a113ed2f238de6f056518051a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 13, 2018 at 2:06 PM, Wei Liu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue,=
 Feb 06, 2018 at 03:08:45PM +0200, Oleksandr Grytsov wrote:<br>
&gt; On Tue, Feb 6, 2018 at 2:36 PM, Wei Liu &lt;<a href=3D"mailto:wei.liu2=
@citrix.com">wei.liu2@citrix.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Thu, Dec 14, 2017 at 04:14:12PM +0200, Oleksandr Grytsov wrote=
:<br>
&gt; &gt; &gt; From: Oleksandr Grytsov &lt;<a href=3D"mailto:oleksandr_gryt=
sov@epam.com">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We have following arm-based setup:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - Dom0 with xen and xen tools;<br>
&gt; &gt; &gt; - Dom1 with device backends (but it is not the driver domain=
);<br>
&gt; &gt;<br>
&gt; &gt; What is your definition of a &quot;driver domain&quot;? What does=
 it do in this<br>
&gt; &gt; case?<br>
&gt; &gt;<br>
&gt; &gt; I seem to have seen people use this term in different contexts to=
 mean<br>
&gt; &gt; slightly different things. I need to figure out what you actually=
 mean<br>
&gt; &gt; first.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; I see in the libxl/xl sources that closing PV devices is done differen=
tly<br>
&gt; in case backends are in Dom0 and are in other domain. It is called as<=
br>
&gt; driver domain in the sources. So, I don&#39;t have clear understanding=
<br>
&gt; what does it mean. In our setup backends are in Dom1 and xl is in Dom0=
.<br>
&gt; And I see that xl dosn&#39;t close PV device on domain reboot or shutd=
own.<br>
<br>
</span>Do you run xl devd in your backend domain?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Wei.<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">No I =
don&#39;t<br clear=3D"all"></div><div class=3D"gmail_extra"><br>-- <br><div=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Best Regards,=
<br>Oleksandr Grytsov.</div>
</div></div>

--001a113ed2f238de6f056518051a--


--===============2510363628688325201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2510363628688325201==--
