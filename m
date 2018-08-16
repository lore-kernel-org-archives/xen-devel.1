From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: Future of 32-bit PV support
Date: Wed, 15 Aug 2018 23:32:24 -0700
Message-ID: <CACMJ4GZti4ypL=CBSROj0CSh6GRXXkq+iqV7CtBWKiiF6CYinA@mail.gmail.com>
References: <ede80e02-5704-1d46-4edf-58515ad63f40@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7346469776678963889=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ubxr=k7=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fqBpc-00070Z-Lg
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 06:32:28 +0000
In-Reply-To: <ede80e02-5704-1d46-4edf-58515ad63f40@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, bouyer@netbsd.org, "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============7346469776678963889==
Content-Type: multipart/alternative; boundary="0000000000003854630573879b82"

--0000000000003854630573879b82
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 15, 2018 at 11:17 PM, Juergen Gross <jgross@suse.com> wrote:

> In the Xen x86 community call we have been discussing whether anyone
> really is depending on 32-bit PV guests. We'd like to evaluate whether
> anyone would see problems with:
>
> - deprecating 32-bit PV guest support in Xen, meaning that we'd
>   eventually switch to support 32-bit PV guests only via PV-shim from
>   Xen 4.12 or 4.13
>
> - dropping 32-bit PV support from upstream Linux kernel, resulting in
>   current 32-bit PV guests no longer being able to upgrade to the newest
>   kernel version any longer
>
> And related to that:
>
> - is there any Linux distribution still shipping 32-bit PV-capable
>   systems?
>
> - what about BSD? Is 32-bit PV support important there?
>


Juergen - just to be very clear about the scope here:
* would this proposal affect the ability to use a 32-bit dom0?
* is this proposal to affect x86 only or also for ARM?

Christopher

--0000000000003854630573879b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Wed, Aug 15, 2018 at 11:17 PM, Juergen Gross <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jgross@suse.com" target=3D"_blank">jgross@suse.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">In the Xen x86 community call =
we have been discussing whether anyone<br>
really is depending on 32-bit PV guests. We&#39;d like to evaluate whether<=
br>
anyone would see problems with:<br>
<br>
- deprecating 32-bit PV guest support in Xen, meaning that we&#39;d<br>
=C2=A0 eventually switch to support 32-bit PV guests only via PV-shim from<=
br>
=C2=A0 Xen 4.12 or 4.13<br>
<br>
- dropping 32-bit PV support from upstream Linux kernel, resulting in<br>
=C2=A0 current 32-bit PV guests no longer being able to upgrade to the newe=
st<br>
=C2=A0 kernel version any longer<br>
<br>
And related to that:<br>
<br>
- is there any Linux distribution still shipping 32-bit PV-capable<br>
=C2=A0 systems?<br>
<br>
- what about BSD? Is 32-bit PV support important there?<br></blockquote><di=
v><br></div><div><br></div><div>Juergen - just to be very clear about the s=
cope here:</div><div>* would this proposal affect the ability to use a 32-b=
it dom0?<br></div><div>* is this proposal to affect x86 only or also for AR=
M?<br></div><br></div><div class=3D"gmail_quote">Christopher</div><div clas=
s=3D"gmail_quote"><br></div></div></div>

--0000000000003854630573879b82--


--===============7346469776678963889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7346469776678963889==--
