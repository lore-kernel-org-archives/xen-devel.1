From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH] fix potential null dereference
Date: Mon, 15 Jan 2018 18:56:39 +0000
Message-ID: <CAEC2Cxpsk9W=gW8ucvJqUCWBDND28qH3CZ831P+KYOtkMC=Vaw@mail.gmail.com>
References: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
 <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
 <5A5C72F2020000780019EAB8@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801151049130.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7843946272983151464=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=92s9=ek=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eb9w2-0000It-Oh
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 18:56:42 +0000
Received: by mail-qk0-x22f.google.com with SMTP id d18so18015412qke.7
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2018 10:56:40 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1801151049130.5767@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============7843946272983151464==
Content-Type: multipart/alternative; boundary="94eb2c04316aa9b7cf0562d52c66"

--94eb2c04316aa9b7cf0562d52c66
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,


On 15 Jan 2018 19:51, "Stefano Stabellini" <sstabellini@kernel.org> wrote:

On Mon, 15 Jan 2018, Jan Beulich wrote:
> >>> On 13.01.18 at 07:21, <julien.grall@linaro.org> wrote:
> > On 01/12/2018 11:40 PM, Stefano Stabellini wrote:
> >> handles can theoretically be NULL, check for it explicitly before
> >> dereferencing it.
> >
> > I doubt handles could be NULL if LocateHandle succeed. This seems to be
> > confirmed by the spec (Page 208 in UEFI spec 2.7).
> >
> > So I am not entirely convince we should add yet another check in the
> > code. An ASSERT might be better.
>
> Indeed if there is a platform where NULL is coming back in the
> success case, that platform should be named as a justification
> in the commit message. Otherwise I don't see the value of this
> change.

Truthfully, it is mostly to silence Coverity. We can all appreciate when
static analysts cannot find defects in the code.


Can't you mark as such in coverity? I mean, I see limited value to always
try to fix in Xen something that we can consider as a false positive.



An ASSERT should satisfy it as well.


Cheers,

--94eb2c04316aa9b7cf0562d52c66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefano,</div><div dir=3D"auto"><br><div class=3D=
"gmail_extra" dir=3D"auto"><br><div class=3D"gmail_quote">On 15 Jan 2018 19=
:51, &quot;Stefano Stabellini&quot; &lt;<a href=3D"mailto:sstabellini@kerne=
l.org">sstabellini@kernel.org</a>&gt; wrote:<br type=3D"attribution"><block=
quote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div class=3D"elided-text">On Mon, 15 Jan 2018, Jan Beul=
ich wrote:<br>
&gt; &gt;&gt;&gt; On 13.01.18 at 07:21, &lt;<a href=3D"mailto:julien.grall@=
linaro.org">julien.grall@linaro.org</a>&gt; wrote:<br>
&gt; &gt; On 01/12/2018 11:40 PM, Stefano Stabellini wrote:<br>
&gt; &gt;&gt; handles can theoretically be NULL, check for it explicitly be=
fore<br>
&gt; &gt;&gt; dereferencing it.<br>
&gt; &gt;<br>
&gt; &gt; I doubt handles could be NULL if LocateHandle succeed. This seems=
 to be<br>
&gt; &gt; confirmed by the spec (Page 208 in UEFI spec 2.7).<br>
&gt; &gt;<br>
&gt; &gt; So I am not entirely convince we should add yet another check in =
the<br>
&gt; &gt; code. An ASSERT might be better.<br>
&gt;<br>
&gt; Indeed if there is a platform where NULL is coming back in the<br>
&gt; success case, that platform should be named as a justification<br>
&gt; in the commit message. Otherwise I don&#39;t see the value of this<br>
&gt; change.<br>
<br>
</div>Truthfully, it is mostly to silence Coverity. We can all appreciate w=
hen<br>
static analysts cannot find defects in the code.<br></blockquote></div></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Can&#39;t you mark as=
 such in coverity? I mean, I see limited value to always try to fix in Xen =
something that we can consider as a false positive.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
An ASSERT should satisfy it as well.<br></blockquote></div></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
</blockquote></div><br></div></div></div>

--94eb2c04316aa9b7cf0562d52c66--


--===============7843946272983151464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7843946272983151464==--
