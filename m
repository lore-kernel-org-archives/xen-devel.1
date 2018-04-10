From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Tue, 10 Apr 2018 20:41:47 +0000
Message-ID: <CAAWQecsriGDV9g+m2q5Y79477HGOUN4VDCwmt2hxKF6=8A-kpA@mail.gmail.com>
References: <20180410085729.GA472@aepfle.de> <20180410155949.GB7177@aepfle.de>
 <ebdd4cb871b2d754959e8358641810d61b3d0856.camel@suse.com>
 <20180410190302.GC7177@aepfle.de>
 <42c5d682348a351420290dc1ecf5b1e2a60b98be.camel@suse.com>
 <20180410200958.GD7177@aepfle.de> <20180410201315.GE7177@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4303599467487805302=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180410201315.GE7177@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============4303599467487805302==
Content-Type: multipart/alternative; boundary="000000000000b7594c0569848dc5"

--000000000000b7594c0569848dc5
Content-Type: text/plain; charset="UTF-8"

Il Mar 10 Apr 2018, 22:16 Olaf Hering <olaf@aepfle.de> ha scritto:

> On Tue, Apr 10, Olaf Hering wrote:
>
> > On Tue, Apr 10, Dario Faggioli wrote:
> >
> > > In the meanwhile --let me repeat myself-- just go ahead with "node:2",
> > > "node:3", etc. :-D
> >
> > I did, and that fails.
>
> I think the man page is not that clear, to me. If there is a difference
> between 'node' vs. 'nodes' for a single digit it may need a dedicated
> sentence to state that fact.


Mmm... I honestly don't recall, and I don't have the code in front of me
any longer.

I remember specifically wanting for it to support not only "nodes:", but
also "node:", because I thought that, e.g., "nodes:3" would have sound
weird to users.

I'd also say, however, that both "node:0-4" and "nodes:3" should work, but
I may be wrong.

Sorry for the manpage not being clear... I tried hard, back then, to come
up with a nice interface, and to describe it properly, but it is very much
possible that I failed. :-/

Regards,
Dario


I will try that once it comes back from reboot.
>
> Olaf
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000b7594c0569848dc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">Il Mar 1=
0 Apr 2018, 22:16 Olaf Hering &lt;<a href=3D"mailto:olaf@aepfle.de">olaf@ae=
pfle.de</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue,=
 Apr 10, Olaf Hering wrote:<br>
<br>
&gt; On Tue, Apr 10, Dario Faggioli wrote:<br>
&gt;<br>
&gt; &gt; In the meanwhile --let me repeat myself-- just go ahead with &quo=
t;node:2&quot;,<br>
&gt; &gt; &quot;node:3&quot;, etc. :-D<br>
&gt;<br>
&gt; I did, and that fails.<br>
<br>
I think the man page is not that clear, to me. If there is a difference<br>
between &#39;node&#39; vs. &#39;nodes&#39; for a single digit it may need a=
 dedicated<br>
sentence to state that fact. </blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Mmm... I honestly don&#39;t recall, and I don&#39;=
t have the code in front of me any longer.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I remember specifically wanting for it to support not on=
ly &quot;nodes:&quot;, but also &quot;node:&quot;, because I thought that, =
e.g., &quot;nodes:3&quot; would have sound weird to users.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I&#39;d also say, however, that both &qu=
ot;node:0-4&quot; and &quot;nodes:3&quot; should work, but I may be wrong.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry for the manpage no=
t being clear... I tried hard, back then, to come up with a nice interface,=
 and to describe it properly, but it is very much possible that I failed. :=
-/</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div di=
r=3D"auto">Dario</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">I will try that once it comes back from reboot.<br>
<br>
Olaf<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000b7594c0569848dc5--


--===============4303599467487805302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4303599467487805302==--
