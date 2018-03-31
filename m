From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v1] xen/arm: Add MVEBU UART driver for
 Armada 3700 SoC
Date: Sat, 31 Mar 2018 09:15:57 +0000
Message-ID: <CAF3u54CEwSSt-M=+M+iEP=NXdx5S7X-xdubvdMN8vDQ+3vAGxg@mail.gmail.com>
References: <1521221662-6782-1-git-send-email-amittomer25@gmail.com>
 <89bac393-8535-d954-e6df-054fc647fb4b@arm.com>
 <CABHD4K-3J4nWwFkTFfMnc3jKZ_MKbB95s8SrVfnZ42xfDAb5AQ@mail.gmail.com>
 <alpine.DEB.2.10.1803300925130.15200@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2591634730444677692=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hl6e=gv=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f2CcN-00032i-1p
 for xen-devel@lists.xenproject.org; Sat, 31 Mar 2018 09:16:11 +0000
Received: by mail-oi0-x242.google.com with SMTP id x9-v6so9392664oig.7
 for <xen-devel@lists.xenproject.org>; Sat, 31 Mar 2018 02:16:09 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1803300925130.15200@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: tim@xen.org, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, ian.jackson@eu.citrix.com, Amit Tomer <amittomer25@gmail.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2591634730444677692==
Content-Type: multipart/alternative; boundary="000000000000ac2d460568b1ce3b"

--000000000000ac2d460568b1ce3b
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Mar 2018, 00:27 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Fri, 30 Mar 2018, Amit Tomer wrote:
> > Hello,
> >
> > > I tested this on my board and it works like expected. I would very much
> > > like to see this driver still in 4.11.
> >
> > Thanks for looking into it and Many Thanks for testing it out.
>
> FYI the deadline is the end of next week. If you submit a patch by then
> addressing Andre's comment I would be happy to check it in.
>

I also had comments on the previous version. So it would be nice to give me
sometimes to review it again.

Cheers,


>
> > > Some (minor) comments on the code below.
> > >
> > > On 16/03/18 17:34, Amit Singh Tomar wrote:
> > >> This patch adds driver for UART controller found on Armada 3700 SoC.
> > >
> > > Can you please mention "Marvell" in the subject?
> >
> > Ok.
> >
> > > These should be indented by one tab (plus two spaces for the help
> text).
> > > It's not obvious - I got this wrong myself the other day ;-), but it's
> > > how the rest of the file works.
> >
> > Ok.
> >
> > > No need for the brackets.
> >
> > Ok.
> >
> > > Indentation.
> >
> > Ok.
> >
> > > So why do we need this include file, in a shared directory?
> > > All those bits are private to the UART driver and don't need to be
> > > exposed to Xen at all.
> > > If it's about the earlyprintk support: that's just two values needed
> > > there, nothing worth a new include file, I think.
> > > So I would recommend to declare the required constants directly in the
> > > driver file.
> >
> > Yes, I thought earlyprintk could also use a couple of common defines and
> other
> > drivers do the same way.
> >
> >
> > Thanks
> > -Amit
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000ac2d460568b1ce3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, 31 Mar 2018, 00=
:27 Stefano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstab=
ellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Fri, 30 Mar 2018, Amit Tomer wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; &gt; I tested this on my board and it works like expected. I would ver=
y much<br>
&gt; &gt; like to see this driver still in 4.11.<br>
&gt;<br>
&gt; Thanks for looking into it and Many Thanks for testing it out.<br>
<br>
FYI the deadline is the end of next week. If you submit a patch by then<br>
addressing Andre&#39;s comment I would be happy to check it in.<br></blockq=
uote></div><div><br></div><div>I also had comments on the previous version.=
 So it would be nice to give me sometimes to review it again.</div><div><br=
></div><div>Cheers,</div><div><br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
<br>
&gt; &gt; Some (minor) comments on the code below.<br>
&gt; &gt;<br>
&gt; &gt; On 16/03/18 17:34, Amit Singh Tomar wrote:<br>
&gt; &gt;&gt; This patch adds driver for UART controller found on Armada 37=
00 SoC.<br>
&gt; &gt;<br>
&gt; &gt; Can you please mention &quot;Marvell&quot; in the subject?<br>
&gt;<br>
&gt; Ok.<br>
&gt;<br>
&gt; &gt; These should be indented by one tab (plus two spaces for the help=
 text).<br>
&gt; &gt; It&#39;s not obvious - I got this wrong myself the other day ;-),=
 but it&#39;s<br>
&gt; &gt; how the rest of the file works.<br>
&gt;<br>
&gt; Ok.<br>
&gt;<br>
&gt; &gt; No need for the brackets.<br>
&gt;<br>
&gt; Ok.<br>
&gt;<br>
&gt; &gt; Indentation.<br>
&gt;<br>
&gt; Ok.<br>
&gt;<br>
&gt; &gt; So why do we need this include file, in a shared directory?<br>
&gt; &gt; All those bits are private to the UART driver and don&#39;t need =
to be<br>
&gt; &gt; exposed to Xen at all.<br>
&gt; &gt; If it&#39;s about the earlyprintk support: that&#39;s just two va=
lues needed<br>
&gt; &gt; there, nothing worth a new include file, I think.<br>
&gt; &gt; So I would recommend to declare the required constants directly i=
n the<br>
&gt; &gt; driver file.<br>
&gt;<br>
&gt; Yes, I thought earlyprintk could also use a couple of common defines a=
nd other<br>
&gt; drivers do the same way.<br>
&gt;<br>
&gt;<br>
&gt; Thanks<br>
&gt; -Amit<br>
&gt;<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--000000000000ac2d460568b1ce3b--


--===============2591634730444677692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2591634730444677692==--
