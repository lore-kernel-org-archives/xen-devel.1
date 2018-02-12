From: Yessine Daoud <da.yessine@gmail.com>
Subject: Re: Slow HVM boot time, was "HVM boot time optimization"
Date: Mon, 12 Feb 2018 09:27:25 +0100
Message-ID: <CABLtV0Aq4JZfqZSZHYwsOp3PcebPhyQ90kQoqvxJid_2-owwHA@mail.gmail.com>
References: <CABLtV0BqS_Y6oMt8TyCx55Nf9mB=-L7To+xY2on76p+1KDyXSQ@mail.gmail.com>
 <alpine.DEB.2.10.1802080826470.15787@sstabellini-ThinkPad-X260>
 <20180208164810.7h7equv4gfbjyzet@citrix.com>
 <20180208165600.GC1740@perard.uk.xensource.com>
 <20180208173233.6dejumgyqsz3ecjv@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6038426677262432107=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xd4s=fg=gmail.com=da.yessine@srs-us1.protection.inumbo.net>)
 id 1el9SR-0001Zk-OC
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 08:27:27 +0000
Received: by mail-io0-x236.google.com with SMTP id p188so16402284ioe.12
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2018 00:27:26 -0800 (PST)
In-Reply-To: <20180208173233.6dejumgyqsz3ecjv@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6038426677262432107==
Content-Type: multipart/alternative; boundary="001a113962d8dc57e80564ffa515"

--001a113962d8dc57e80564ffa515
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hello,

Thank you for your quick response.
Any hints how can I "fix" this "issue"? *Any workaround?

=E1=90=A7

2018-02-08 18:32 GMT+01:00 Wei Liu <wei.liu2@citrix.com>:

> On Thu, Feb 08, 2018 at 04:56:00PM +0000, Anthony PERARD wrote:
> > On Thu, Feb 08, 2018 at 04:48:10PM +0000, Wei Liu wrote:
> > > On Thu, Feb 08, 2018 at 08:31:40AM -0800, Stefano Stabellini wrote:
> > > > CC'ing xen-devel and a few relevant people
> > > >
> > > > On Thu, 8 Feb 2018, Yessine Daoud wrote:
> > > > > Dear Sir,
> > > > > I need your help please.
> > > > >
> > > > > I am using a direct kernel boot (HVM guest) with kernel + ramdisk=
.
> > > > > At boot, seabios is bloqued about 20 seconds (or more) at the
> following state:
> > > > >
> > >
> > > The manual seems a bit confusing to me but maybe I misremember how it
> > > works. My understanding is direct kernel boot jumps straight to kerne=
l
> > > entry point without going through firmware.
> > >
> > > If this is direct kernel boot why is seabios involved?
> >
> > seabios is the one to load the kernel into memory and start it.
> >
>
> I see. Thank for explaining.
>
> Wei.
>

--001a113962d8dc57e80564ffa515
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">Hello,</span><div style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;text-decoration-style:initial;text-decoration-color:initi=
al"><br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:small;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-de=
coration-style:initial;text-decoration-color:initial">Thank you for your qu=
ick response.</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;te=
xt-decoration-style:initial;text-decoration-color:initial">Any hints how ca=
n I &quot;fix&quot; this &quot;issue&quot;? *Any workaround?</div>

<br></div><div hspace=3D"streak-pt-mark" style=3D"max-height:1px"><img alt=
=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=3D"https://mai=
lfoogae.appspot.com/t?sender=3DaZGEueWVzc2luZUBnbWFpbC5jb20%3D&amp;type=3Dz=
erocontent&amp;guid=3Dad7c5dc6-0d7a-44c3-aad1-e177cc7000a4"><font color=3D"=
#ffffff" size=3D"1">=E1=90=A7</font></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">2018-02-08 18:32 GMT+01:00 Wei Liu <span dir=3D"lt=
r">&lt;<a href=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@ci=
trix.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>On Thu, Feb 08, 2018 at 04:56:00PM +0000, Anthony PERARD wrote:<br>
&gt; On Thu, Feb 08, 2018 at 04:48:10PM +0000, Wei Liu wrote:<br>
&gt; &gt; On Thu, Feb 08, 2018 at 08:31:40AM -0800, Stefano Stabellini wrot=
e:<br>
&gt; &gt; &gt; CC&#39;ing xen-devel and a few relevant people<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 8 Feb 2018, Yessine Daoud wrote:<br>
&gt; &gt; &gt; &gt; Dear Sir,<br>
&gt; &gt; &gt; &gt; I need your help please.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I am using a direct kernel boot (HVM guest) with kernel=
 + ramdisk.<br>
&gt; &gt; &gt; &gt; At boot, seabios is bloqued about 20 seconds (or more) =
at the following state:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The manual seems a bit confusing to me but maybe I misremember ho=
w it<br>
&gt; &gt; works. My understanding is direct kernel boot jumps straight to k=
ernel<br>
&gt; &gt; entry point without going through firmware.<br>
&gt; &gt;<br>
&gt; &gt; If this is direct kernel boot why is seabios involved?<br>
&gt;<br>
&gt; seabios is the one to load the kernel into memory and start it.<br>
&gt;<br>
<br>
</span>I see. Thank for explaining.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Wei.<br>
</font></span></blockquote></div><br></div>

--001a113962d8dc57e80564ffa515--


--===============6038426677262432107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6038426677262432107==--
