From: Oleksandr Grytsov <al1img@gmail.com>
Subject: Re: [PATCH] libxl: add libxl__is_driver_domain function
Date: Mon, 26 Feb 2018 12:14:55 +0200
Message-ID: <CACvf2oXkN6xfNmveFT2hQCPdicrdTe1pedLmCXsOVsx8OLBW-A@mail.gmail.com>
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <20180206123635.xqjoqsq4dfgve73d@citrix.com>
 <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
 <20180213120658.bshetw3jommut5nj@citrix.com>
 <CACvf2oWkY6=tHqQ=pYHj6cH+g01FrSrr_iJbu1qPrrnmeXgJYw@mail.gmail.com>
 <20180223174448.3vmc7a74vr6b42lx@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7018145064819484593=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=yn5a=fu=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1eqFo9-0002yf-IQ
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:14:57 +0000
Received: by mail-it0-x22d.google.com with SMTP id a75so10182162itd.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2018 02:14:56 -0800 (PST)
In-Reply-To: <20180223174448.3vmc7a74vr6b42lx@citrix.com>
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

--===============7018145064819484593==
Content-Type: multipart/alternative; boundary="001a1147cdd816c65f05661ac826"

--001a1147cdd816c65f05661ac826
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 23, 2018 at 7:44 PM, Wei Liu <wei.liu2@citrix.com> wrote:

> On Tue, Feb 13, 2018 at 03:32:04PM +0200, Oleksandr Grytsov wrote:
> > On Tue, Feb 13, 2018 at 2:06 PM, Wei Liu <wei.liu2@citrix.com> wrote:
> >
> > > On Tue, Feb 06, 2018 at 03:08:45PM +0200, Oleksandr Grytsov wrote:
> > > > On Tue, Feb 6, 2018 at 2:36 PM, Wei Liu <wei.liu2@citrix.com> wrote:
> > > >
> > > > > On Thu, Dec 14, 2017 at 04:14:12PM +0200, Oleksandr Grytsov wrote:
> > > > > > From: Oleksandr Grytsov <oleksandr_grytsov@epam.com>
> > > > > >
> > > > > > We have following arm-based setup:
> > > > > >
> > > > > > - Dom0 with xen and xen tools;
> > > > > > - Dom1 with device backends (but it is not the driver domain);
> > > > >
> > > > > What is your definition of a "driver domain"? What does it do in
> this
> > > > > case?
> > > > >
> > > > > I seem to have seen people use this term in different contexts to
> mean
> > > > > slightly different things. I need to figure out what you actually
> mean
> > > > > first.
> > > > >
> > > > >
> > > > I see in the libxl/xl sources that closing PV devices is done
> differently
> > > > in case backends are in Dom0 and are in other domain. It is called as
> > > > driver domain in the sources. So, I don't have clear understanding
> > > > what does it mean. In our setup backends are in Dom1 and xl is in
> Dom0.
> > > > And I see that xl dosn't close PV device on domain reboot or
> shutdown.
> > >
> > > Do you run xl devd in your backend domain?
> > >
> > > Wei.
> > >
> >
> > No I don't
>
> Can you try that? I think xl devd should clean up the stale entries --
> that's how we envisage driver domains to be used.
>
> Wei.
>

We will check this. Thanks.

-- 
Best Regards,
Oleksandr Grytsov.

--001a1147cdd816c65f05661ac826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Feb 23, 2018 at 7:44 PM, Wei Liu <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citrix.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Feb 13, =
2018 at 03:32:04PM +0200, Oleksandr Grytsov wrote:<br>
&gt; On Tue, Feb 13, 2018 at 2:06 PM, Wei Liu &lt;<a href=3D"mailto:wei.liu=
2@citrix.com">wei.liu2@citrix.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Tue, Feb 06, 2018 at 03:08:45PM +0200, Oleksandr Grytsov wrote=
:<br>
&gt; &gt; &gt; On Tue, Feb 6, 2018 at 2:36 PM, Wei Liu &lt;<a href=3D"mailt=
o:wei.liu2@citrix.com">wei.liu2@citrix.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Dec 14, 2017 at 04:14:12PM +0200, Oleksandr Gry=
tsov wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: Oleksandr Grytsov &lt;<a href=3D"mailto:olek=
sandr_grytsov@epam.com">oleksandr_grytsov@epam.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; We have following arm-based setup:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; - Dom0 with xen and xen tools;<br>
&gt; &gt; &gt; &gt; &gt; - Dom1 with device backends (but it is not the dri=
ver domain);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; What is your definition of a &quot;driver domain&quot;?=
 What does it do in this<br>
&gt; &gt; &gt; &gt; case?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I seem to have seen people use this term in different c=
ontexts to mean<br>
&gt; &gt; &gt; &gt; slightly different things. I need to figure out what yo=
u actually mean<br>
&gt; &gt; &gt; &gt; first.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; I see in the libxl/xl sources that closing PV devices is don=
e differently<br>
&gt; &gt; &gt; in case backends are in Dom0 and are in other domain. It is =
called as<br>
&gt; &gt; &gt; driver domain in the sources. So, I don&#39;t have clear und=
erstanding<br>
&gt; &gt; &gt; what does it mean. In our setup backends are in Dom1 and xl =
is in Dom0.<br>
&gt; &gt; &gt; And I see that xl dosn&#39;t close PV device on domain reboo=
t or shutdown.<br>
&gt; &gt;<br>
&gt; &gt; Do you run xl devd in your backend domain?<br>
&gt; &gt;<br>
&gt; &gt; Wei.<br>
&gt; &gt;<br>
&gt;<br>
&gt; No I don&#39;t<br>
<br>
</span>Can you try that? I think xl devd should clean up the stale entries =
--<br>
that&#39;s how we envisage driver domains to be used.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Wei.<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">We wi=
ll check this. Thanks.<br clear=3D"all"></div><div class=3D"gmail_extra"><b=
r>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
Best Regards,<br>Oleksandr Grytsov.</div>
</div></div>

--001a1147cdd816c65f05661ac826--


--===============7018145064819484593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7018145064819484593==--
