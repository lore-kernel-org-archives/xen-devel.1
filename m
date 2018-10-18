From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: Re: Intel Z270 support
Date: Thu, 18 Oct 2018 19:45:37 +0100
Message-ID: <CANkmNDfjr+2xJ9XOv=ktVnSYiquHeT6PSmBDLW1agOTyp-17KQ@mail.gmail.com>
References: <CANkmNDfWfZt_17ewcHX0=EkvpymqVGLSDyd6uyObr7rOHc9tig@mail.gmail.com>
 <375d8065-e141-4cd7-e051-e0f698d76e96@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3005645269031821131=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n+uv=m6=gmail.com=aaronngray.lists@srs-us1.protection.inumbo.net>)
 id 1gDDJ0-00080q-Bo
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 18:45:58 +0000
Received: by mail-ed1-x52b.google.com with SMTP id m6-v6so5691473eds.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Oct 2018 11:45:56 -0700 (PDT)
In-Reply-To: <375d8065-e141-4cd7-e051-e0f698d76e96@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3005645269031821131==
Content-Type: multipart/alternative; boundary="0000000000006cbfaf0578853229"

--0000000000006cbfaf0578853229
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Oct 2018 at 19:11, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 18/10/2018 18:57, Aaron Gray wrote:
> > I have two ASUS PRIME Z270-A machines based on Intel Z270 chipset and
> > am wondering about when support will be available for them and what I
> > can do to speed this up.
> >
> > But I have not done anything to do with kernel work since years ago
> > when I read a lot of the main parts of the Linux 2.4 Kernel. Also I
> > did code to get into and out of protected mode before this.
> >
> > Heres the datasheets that cover the chipset :-
> >
> >
> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-1.html
> >
> https://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datasheet-vol-2.html
> >
>
> Xen doesn't have a list of individual support chips/systems, because
> kernels don't really work like that.  We work feature by feature, or
> device by device.
>
> You appear to have a Broadwell-era system.  Any recent Linux distro
> should work for you, including the provided Xen package.


I tried installing Xen 4.9 provided with Fedora 28 but it did not work. Can
I get support with this please ?

Aaron

--0000000000006cbfaf0578853229
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 18 Oct=
 2018 at 19:11, Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.c=
om">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On 18/10/2018 18:57, Aaron Gray wrote:<br>
&gt; I have two ASUS PRIME Z270-A machines based on Intel Z270 chipset and<=
br>
&gt; am wondering about when support will be available for them and what I<=
br>
&gt; can do to speed this up.<br>
&gt;<br>
&gt; But I have not done anything to do with kernel work since years ago<br=
>
&gt; when I read a lot of the main parts of the Linux 2.4 Kernel. Also I<br=
>
&gt; did code to get into and out of protected mode before this.<br>
&gt;<br>
&gt; Heres the datasheets that cover the chipset :-<br>
&gt;<br>
&gt; <a href=3D"https://www.intel.com/content/www/us/en/chipsets/200-series=
-chipset-pch-datasheet-vol-1.html" target=3D"_blank" rel=3D"noreferrer">htt=
ps://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datash=
eet-vol-1.html</a><br>
&gt; <a href=3D"https://www.intel.com/content/www/us/en/chipsets/200-series=
-chipset-pch-datasheet-vol-2.html" target=3D"_blank" rel=3D"noreferrer">htt=
ps://www.intel.com/content/www/us/en/chipsets/200-series-chipset-pch-datash=
eet-vol-2.html</a><br>
&gt;<br>
<br>
Xen doesn&#39;t have a list of individual support chips/systems, because<br=
>
kernels don&#39;t really work like that.=C2=A0 We work feature by feature, =
or<br>
device by device.<br>
<br>
You appear to have a Broadwell-era system.=C2=A0 Any recent Linux distro<br=
>
should work for you, including the provided Xen package.</blockquote><div><=
br></div><div>I tried installing Xen 4.9 provided with Fedora 28 but it did=
 not work. Can I get support with this please ?</div><div><br></div><div>Aa=
ron</div><div><br></div></div></div>

--0000000000006cbfaf0578853229--


--===============3005645269031821131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3005645269031821131==--
