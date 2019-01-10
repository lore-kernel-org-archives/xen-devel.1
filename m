From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Thu, 10 Jan 2019 17:31:21 -0600
Message-ID: <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
 <5C37013C020000780020C17D@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
 <CAF3u54A-1_cum6u-nXm4m+60=7tFF=Y1vnR-0+fEKg2y6_68rw@mail.gmail.com>
 <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0251668601016005987=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KFn8=PS=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ghjnU-00079k-MC
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 23:31:36 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id p74so8163254vsc.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 15:31:34 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
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

--===============0251668601016005987==
Content-Type: multipart/alternative; boundary="000000000000a09ccf057f22fa6a"

--000000000000a09ccf057f22fa6a
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jan 2019, 15:36 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 10 Jan 2019, Julien Grall wrote:
> > On Thu, 10 Jan 2019, 12:29 Stefano Stabellini, <sstabellini@kernel.org>
> wrote:
> >       On Thu, 10 Jan 2019, Jan Beulich wrote:
> >       > >>> On 10.01.19 at 03:40, <julien.grall@gmail.com> wrote:
> >       > > On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, <
> sstabellini@kernel.org>
> >       > > wrote:
> >       > >
> >       > >> Introduce a macro, SYMBOL, which is similar to RELOC_HIDE,
> but it is
> >       > >> meant to be used everywhere symbols such as _stext and _etext
> are used
> >       > >> in the code. It can take an array type as a parameter, and it
> returns
> >       > >> the same type.
> >       > >>
> >       > >> SYMBOL is needed when accessing symbols such as _stext and
> _etext
> >       > >> because the C standard forbids for both comparisons and
> substraction
> >       > >> (see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between
> pointers
> >       > >> pointing to different objects. _stext, _etext, etc. are all
> pointers to
> >       > >> different objects from ANCI C point of view.
> >       > >>
> >       > >
> >       > > This does not make sense because you still return a pointer
> and therefore
> >       > > the undefined behavior is still present.
> >       > >
> >       > > I really don't believe this patch is going to make the MISRA
> tool happy.
> >       >
> >       > Well, till now I've been assuming that no version of this series
> was
> >       > posted without being certain the changes achieve the goal (of
> >       > making that tool happy).
> >
> >       No, Jan: unfortunately we cannot re-run the scanning tool against
> any
> >       version of Xen we wish to :-(
> >
> >       We cannot know in advance if a set of changes will make the tool
> happy
> >       or not.
> >
> >       If I knew that SYMBOL returning the native point type as in v6 is
> >       sufficient to make the tool happy, I wouldn't be here arguing. We
> cannot
> >       know for sure until we commit the changes, then we ask PRQA to
> re-scan
> >       against a more recent version of Xen. It is an heavy process and
> for
> >       this reason I preferred the safer of the two approaches.
> >
> >
> >
> >       Anyway, I would rather get something in, even if insufficient, than
> >       nothing. So I'll address all your comments based on returning the
> >       pointer type, and submit a new version. The bothersome changes are
> the
> >       ones to the call sites, and I would like to get those in no matter
> the
> >       implementation of SYMBOL.
> >
> >
> > It is not only insufficient but wrong when you read the commit message.
> You also were not convinced about this approach.
> >
> > I understand that we need to commit so we can get the result from the
> PRQA tool. However, we should have talked with people
> > knowing MISRA to understand whether it could work.
> >
> > You also didn't address my point on why Linux needs to go through
> unsigned long.
> >
> > So I don't think it is right to merge it without more ground.
> >
> > On that basis:
> >
> > Nacked-by: Julien Grall <julien.grall@arm.com>
>
> Hi Julien,
>
> I well understanding your thinking, I am not happy with this approach.
>
> However, changing all the call sites to use SYMBOL, even if SYMBOL does
> not do what you and I think it should, is still a valuable change to
> have:
>
> 1) it clearly highlight all the related violations
> 2) it is a burdensome set of changes to maintain off-tree which will be
>    difficult to rebase and will bitrot quickly
> 3) it will be simple to change the implementation of SYMBOL afterwards
>    as needed
> 4) regardless of MISRA, we still have a problem with gcc and symbols
>    like _start and _end, see the comment on top of RELOC_HIDE in linux
>    (include/linux/compiler-gcc.h)


> In fact, even not caring about C compliance, this series is still an
> improvement, a fix to a potential compiler problem. On that basis alone,
> I think it is a bad decision not to merge this series.
>

>From the different reading (see link in one of my previous), I don't
believe it will help the compiler. I would be interested to know the
rationale you think otherwise.

I am also worried that any change in the definition will require to
investigate all the callsite. This is a call for missing one.

So it still feels to me we are rushing the series.


>
> To answer your other questions: yes, we need more information about this
> compliance issue and MISRA, this is a good reason for committing the
> series so that we can have the tool a re-scan. It is also a great way
> to show the problem to a MISRA expert not familiar with Xen: "look at
> the way SYMBOL is used through the code..."
>
> I don't know why Linux is using unsigned long, I looked at the commit
> messages and comments but there isn't an explanation. However, it just
> makes sense to me. That is how I would have implemented the solution as
> well. Jan's approach looks very much like a partial workaround to me.
>

On one of my previous e-mail I provided a URL giving a bit more explanation
on the problem.


>
> In conclusion, I still agree with you and disagree with Jan, but it
> would be good to make progress regardless:
>
> - I think a series introducing the usage of SYMBOL through the code
>   should go in 4.12 regardless of the implementation of SYMBOL
> - even the bad implementation of SYMBOL would still help with the
>   potential gcc problems mentioned by Linux, if not with certifications


See above. I clearly don't believe it is solving anything. It will actually
make any change of SYMBOL more difficult if you decide to switch to
unsigned long.


>
> For everybody's reference, I have pushed both versions of the series,
> the one returning the native type, as asked by Jan:
> http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git
> certifications-7
>
> And the one returning unsigned long, as Julien and I would like:
> http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git
> certifications-7-unsigned_long
>
>
> Hoping we won't get stuck on this, regards,
>
> Stefano


Cheers,

--000000000000a09ccf057f22fa6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 10 Jan 2019, 15=
:36 Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstab=
ellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Thu, 10 Jan 2019, Julien Grall wrote:<br>
&gt; On Thu, 10 Jan 2019, 12:29 Stefano Stabellini, &lt;<a href=3D"mailto:s=
stabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Thu, 10 Jan 2019, Jan Beulich wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;&gt; On 10.01.19 at 03:40, &lt;=
<a href=3D"mailto:julien.grall@gmail.com" target=3D"_blank">julien.grall@gm=
ail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; On Wed, 9 Jan 2019, 18:43 Stefano =
Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank"=
>sstabellini@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; Introduce a macro, SYMBOL, whi=
ch is similar to RELOC_HIDE, but it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; meant to be used everywhere sy=
mbols such as _stext and _etext are used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; in the code. It can take an ar=
ray type as a parameter, and it returns<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; the same type.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; SYMBOL is needed when accessin=
g symbols such as _stext and _etext<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; because the C standard forbids=
 for both comparisons and substraction<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; (see C Standard, 6.5.6 [ISO/IE=
C 9899:2011] and [1]) between pointers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; pointing to different objects.=
 _stext, _etext, etc. are all pointers to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt; different objects from ANCI C =
point of view.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; This does not make sense because y=
ou still return a pointer and therefore<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; the undefined behavior is still pr=
esent.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &gt; I really don&#39;t believe this pa=
tch is going to make the MISRA tool happy.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Well, till now I&#39;ve been assuming t=
hat no version of this series was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; posted without being certain the change=
s achieve the goal (of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; making that tool happy).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0No, Jan: unfortunately we cannot re-run the =
scanning tool against any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0version of Xen we wish to :-(<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0We cannot know in advance if a set of change=
s will make the tool happy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0or not.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0If I knew that SYMBOL returning the native p=
oint type as in v6 is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sufficient to make the tool happy, I wouldn&=
#39;t be here arguing. We cannot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0know for sure until we commit the changes, t=
hen we ask PRQA to re-scan<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0against a more recent version of Xen. It is =
an heavy process and for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0this reason I preferred the safer of the two=
 approaches.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Anyway, I would rather get something in, eve=
n if insufficient, than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nothing. So I&#39;ll address all your commen=
ts based on returning the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pointer type, and submit a new version. The =
bothersome changes are the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ones to the call sites, and I would like to =
get those in no matter the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0implementation of SYMBOL.<br>
&gt; <br>
&gt; <br>
&gt; It is not only insufficient but wrong when you read the commit message=
. You also were not convinced about this approach.=C2=A0<br>
&gt; <br>
&gt; I understand that we need to commit so we can get the result from the =
PRQA tool. However, we should have talked with people<br>
&gt; knowing MISRA to understand whether it could work.<br>
&gt; <br>
&gt; You also didn&#39;t address my point on why Linux needs to go through =
unsigned long.<br>
&gt; <br>
&gt; So I don&#39;t think it is right to merge it without more ground.<br>
&gt; <br>
&gt; On that basis:<br>
&gt; <br>
&gt; Nacked-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com" ta=
rget=3D"_blank">julien.grall@arm.com</a>&gt;<br>
<br>
Hi Julien,<br>
<br>
I well understanding your thinking, I am not happy with this approach.<br>
<br>
However, changing all the call sites to use SYMBOL, even if SYMBOL does<br>
not do what you and I think it should, is still a valuable change to<br>
have:<br>
<br>
1) it clearly highlight all the related violations<br>
2) it is a burdensome set of changes to maintain off-tree which will be<br>
=C2=A0 =C2=A0difficult to rebase and will bitrot quickly<br>
3) it will be simple to change the implementation of SYMBOL afterwards<br>
=C2=A0 =C2=A0as needed<br>
4) regardless of MISRA, we still have a problem with gcc and symbols<br>
=C2=A0 =C2=A0like _start and _end, see the comment on top of RELOC_HIDE in =
linux<br>
=C2=A0 =C2=A0(include/linux/compiler-gcc.h)</blockquote></div><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
In fact, even not caring about C compliance, this series is still an<br>
improvement, a fix to a potential compiler problem. On that basis alone,<br=
>
I think it is a bad decision not to merge this series.<br></blockquote></di=
v><div><br></div><div>From the different reading (see link in one of my pre=
vious), I don&#39;t believe it will help the compiler. I would be intereste=
d to know the rationale you think otherwise.<br><br>I am also worried that =
any change in the definition will require to investigate all the callsite. =
This is a call for missing one.<br></div><div><br></div><div>So it still fe=
els to me we are rushing the series.</div><div><br></div><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
To answer your other questions: yes, we need more information about this<br=
>
compliance issue and MISRA, this is a good reason for committing the<br>
series so that we can have the tool a re-scan. It is also a great way<br>
to show the problem to a MISRA expert not familiar with Xen: &quot;look at<=
br>
the way SYMBOL is used through the code...&quot;<br>
<br>
I don&#39;t know why Linux is using unsigned long, I looked at the commit<b=
r>
messages and comments but there isn&#39;t an explanation. However, it just<=
br>
makes sense to me. That is how I would have implemented the solution as<br>
well. Jan&#39;s approach looks very much like a partial workaround to me.<b=
r></blockquote></div><div><br></div><div>On one of my previous e-mail I pro=
vided a URL giving a bit more explanation on the problem.</div><div><br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
In conclusion, I still agree with you and disagree with Jan, but it<br>
would be good to make progress regardless:<br>
<br>
- I think a series introducing the usage of SYMBOL through the code<br>
=C2=A0 should go in 4.12 regardless of the implementation of SYMBOL<br>
- even the bad implementation of SYMBOL would still help with the<br>
=C2=A0 potential gcc problems mentioned by Linux, if not with certification=
s</blockquote></div><div><br></div><div>See above. I clearly don&#39;t beli=
eve it is solving anything. It will actually make any change of SYMBOL more=
 difficult if you decide to switch to unsigned long.</div><div class=3D"gma=
il_quote"></div><div><br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
<br>
For everybody&#39;s reference, I have pushed both versions of the series,<b=
r>
the one returning the native type, as asked by Jan:<br>
<a href=3D"http://xenbits.xenproject.org/git-http/people/sstabellini/xen-un=
stable.git" rel=3D"noreferrer" target=3D"_blank">http://xenbits.xenproject.=
org/git-http/people/sstabellini/xen-unstable.git</a> certifications-7<br>
<br>
And the one returning unsigned long, as Julien and I would like:<br>
<a href=3D"http://xenbits.xenproject.org/git-http/people/sstabellini/xen-un=
stable.git" rel=3D"noreferrer" target=3D"_blank">http://xenbits.xenproject.=
org/git-http/people/sstabellini/xen-unstable.git</a> certifications-7-unsig=
ned_long<br>
<br>
<br>
Hoping we won&#39;t get stuck on this, regards,<br>
<br>
Stefano</blockquote></div><div><br></div><div>Cheers,</div><div class=3D"gm=
ail_quote"></div>

--000000000000a09ccf057f22fa6a--


--===============0251668601016005987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0251668601016005987==--
