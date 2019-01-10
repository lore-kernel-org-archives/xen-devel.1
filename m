From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Thu, 10 Jan 2019 14:24:26 -0500
Message-ID: <CAF3u54A-1_cum6u-nXm4m+60=7tFF=Y1vnR-0+fEKg2y6_68rw@mail.gmail.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
 <5C37013C020000780020C17D@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8070969217683429021=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KFn8=PS=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ghfwX-0005UI-9V
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 19:24:41 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b74so7722107vsd.9
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 11:24:39 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============8070969217683429021==
Content-Type: multipart/alternative; boundary="00000000000097a27a057f1f878b"

--00000000000097a27a057f1f878b
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jan 2019, 12:29 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 10 Jan 2019, Jan Beulich wrote:
> > >>> On 10.01.19 at 03:40, <julien.grall@gmail.com> wrote:
> > > On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, <sstabellini@kernel.org>
> > > wrote:
> > >
> > >> Introduce a macro, SYMBOL, which is similar to RELOC_HIDE, but it is
> > >> meant to be used everywhere symbols such as _stext and _etext are used
> > >> in the code. It can take an array type as a parameter, and it returns
> > >> the same type.
> > >>
> > >> SYMBOL is needed when accessing symbols such as _stext and _etext
> > >> because the C standard forbids for both comparisons and substraction
> > >> (see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between pointers
> > >> pointing to different objects. _stext, _etext, etc. are all pointers
> to
> > >> different objects from ANCI C point of view.
> > >>
> > >
> > > This does not make sense because you still return a pointer and
> therefore
> > > the undefined behavior is still present.
> > >
> > > I really don't believe this patch is going to make the MISRA tool
> happy.
> >
> > Well, till now I've been assuming that no version of this series was
> > posted without being certain the changes achieve the goal (of
> > making that tool happy).
>
> No, Jan: unfortunately we cannot re-run the scanning tool against any
> version of Xen we wish to :-(
>
> We cannot know in advance if a set of changes will make the tool happy
> or not.
>
> If I knew that SYMBOL returning the native point type as in v6 is
> sufficient to make the tool happy, I wouldn't be here arguing. We cannot
> know for sure until we commit the changes, then we ask PRQA to re-scan
> against a more recent version of Xen. It is an heavy process and for
> this reason I preferred the safer of the two approaches.
>


> Anyway, I would rather get something in, even if insufficient, than
> nothing. So I'll address all your comments based on returning the
> pointer type, and submit a new version. The bothersome changes are the
> ones to the call sites, and I would like to get those in no matter the
> implementation of SYMBOL.


It is not only insufficient but wrong when you read the commit message. You
also were not convinced about this approach.

I understand that we need to commit so we can get the result from the PRQA
tool. However, we should have talked with people knowing MISRA to
understand whether it could work.

You also didn't address my point on why Linux needs to go through unsigned
long.

So I don't think it is right to merge it without more ground.

On that basis:

Nacked-by: Julien Grall <julien.grall@arm.com>

Cheers,

>

--00000000000097a27a057f1f878b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 10 Jan 2019, 12=
:29 Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstab=
ellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Thu, 10 Jan 2019, Jan Beulich wrote:<br>
&gt; &gt;&gt;&gt; On 10.01.19 at 03:40, &lt;<a href=3D"mailto:julien.grall@=
gmail.com" target=3D"_blank">julien.grall@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
<br>
&gt; &gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;&gt; Introduce a macro, SYMBOL, which is similar to RELOC_HIDE, bu=
t it is<br>
&gt; &gt;&gt; meant to be used everywhere symbols such as _stext and _etext=
 are used<br>
&gt; &gt;&gt; in the code. It can take an array type as a parameter, and it=
 returns<br>
&gt; &gt;&gt; the same type.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; SYMBOL is needed when accessing symbols such as _stext and _e=
text<br>
&gt; &gt;&gt; because the C standard forbids for both comparisons and subst=
raction<br>
&gt; &gt;&gt; (see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between p=
ointers<br>
&gt; &gt;&gt; pointing to different objects. _stext, _etext, etc. are all p=
ointers to<br>
&gt; &gt;&gt; different objects from ANCI C point of view.<br>
&gt; &gt;&gt;<br>
&gt; &gt; <br>
&gt; &gt; This does not make sense because you still return a pointer and t=
herefore<br>
&gt; &gt; the undefined behavior is still present.<br>
&gt; &gt; <br>
&gt; &gt; I really don&#39;t believe this patch is going to make the MISRA =
tool happy.<br>
&gt; <br>
&gt; Well, till now I&#39;ve been assuming that no version of this series w=
as<br>
&gt; posted without being certain the changes achieve the goal (of<br>
&gt; making that tool happy).<br>
<br>
No, Jan: unfortunately we cannot re-run the scanning tool against any<br>
version of Xen we wish to :-(<br>
<br>
We cannot know in advance if a set of changes will make the tool happy<br>
or not.<br>
<br>
If I knew that SYMBOL returning the native point type as in v6 is<br>
sufficient to make the tool happy, I wouldn&#39;t be here arguing. We canno=
t<br>
know for sure until we commit the changes, then we ask PRQA to re-scan<br>
against a more recent version of Xen. It is an heavy process and for<br>
this reason I preferred the safer of the two approaches.<br></blockquote></=
div><div><br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Anyway, I would rather get something in, even if insufficient, than<br>
nothing. So I&#39;ll address all your comments based on returning the<br>
pointer type, and submit a new version. The bothersome changes are the<br>
ones to the call sites, and I would like to get those in no matter the<br>
implementation of SYMBOL.</blockquote></div><div><br></div><div>It is not o=
nly insufficient but wrong when you read the commit message. You also were =
not convinced about this approach.=C2=A0</div><div><br></div><div>I underst=
and that we need to commit so we can get the result from the PRQA tool. How=
ever, we should have talked with people knowing MISRA to understand whether=
 it could work.</div><div><br></div><div>You also didn&#39;t address my poi=
nt on why Linux needs to go through unsigned long.</div><div><br></div><div=
>So I don&#39;t think it is right to merge it without more ground.</div><di=
v><br></div><div>On that basis:</div><div><br></div><div>Nacked-by: Julien =
Grall &lt;<a href=3D"mailto:julien.grall@arm.com">julien.grall@arm.com</a>&=
gt;</div><div><br></div><div>Cheers,</div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
</blockquote></div>

--00000000000097a27a057f1f878b--


--===============8070969217683429021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8070969217683429021==--
