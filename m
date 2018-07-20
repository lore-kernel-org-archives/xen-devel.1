From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 22:26:03 -0700
Message-ID: <CACMJ4GbKn-t3OOwVA2Ue6UyoKxTP3gvYYV8xO_rkqHVPQrAX7A@mail.gmail.com>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
 <5B50D9420200007800137603@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
 <5B50E13E020000780013763E@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807191233140.19154@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0051022027233321725=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gv0p=ke=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1fgNvb-0007sP-R3
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 05:26:07 +0000
Received: by mail-lj1-x243.google.com with SMTP id l15-v6so10090683lji.6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jul 2018 22:26:05 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1807191233140.19154@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, julien.grall@arm.com, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============0051022027233321725==
Content-Type: multipart/alternative; boundary="00000000000037dfc30571678837"

--00000000000037dfc30571678837
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 12:34 PM, Stefano Stabellini <sstabellini@kernel.org
> wrote:

> On Thu, 19 Jul 2018, Jan Beulich wrote:
> > >>> Stefano Stabellini <sstabellini@kernel.org> 07/19/18 8:49 PM >>>
> > >On Thu, 19 Jul 2018, Jan Beulich wrote:
> > >> >>> Stefano Stabellini <sstabellini@kernel.org> 07/19/18 7:00 PM >>>
> > >> >On Thu, 19 Jul 2018, Jan Beulich wrote:
> > >> >> > Signed-off-by: Christopher Clark <christopher.clark6@
> baesystems.com>
> > >> >> > ---
> > >> >> > Please use my gmail address for any correspondence to me.
> > >> >>
> > >> >> I think it is generally considered bad practice to have From: and
> S-o-b
> > >> >> differ.
> > >> >
> > >> >Why? That is perfectly fine. Signed-off-by is about copyright of the
> > >> >code while From: is about authorship.
> > >>
> > >> Well, in this particular case Christopher had even asked that
> communication
> > >> to go to the mail address he sent from. How is anyone going to know
> that if
> > >> judging just from the eventual commit in git?
> > >
> > >Yeah, that bit of information is lost in the commit message,
> > >unfortunately. At that point, the patch is already committed, so it is
> > >usually not a big deal.
> >
> > What if there is an issue with the change, or simply a question about it?
> > I'd expect to be able to get in touch with the author by using the
> provided
> > email address, at least if the commit isn't overly old yet.
>
> Thinking about it, the From: email address will end up in the Author:
> field of the commit. So actually, the information will be retained.
>

Thanks for the group input on the From/Author and S-o-b identifiers.

Context on the constraints which lead to the structure of my original message
on this thread:

* Email message source:

My messages are sent to the list from my gmail account as that's the one I
have easiest access to from my development environment. Shouldn't be a
concern as I'm easily reachable there and as Stefano pointed out, inclusion
of an alternate 'From:' in within the message body is enough to change the
git 'Author' if the patch is merged.

* Commit Author:

I can provide either address for the From/Author address for the commit.

My preference is for it being the address I am reliably reachable at --
which would be my gmail account as noted. My reachability at this email
address has exceeded that of any other email address I have ever had,
surviving multiple changes of organizational affiliation.

* Commit Signed-off-by:

I have a legal requirement to ensure that copyright is attributed for the
work, and I have used the S-o-b address to do so.  In the patch I sent, the
email address provided for the S-o-b is under the administrative control of
the legal owner of the copyright, which seems appropriate for it.

I could change the S-o-b to match the From/Author, and add further language
to the commit message to clarify copyright attribution, but that seems
incorrect and would require further effort to support any automation for
eg. harvesting community contribution statistics.

Re: Jan's feedback on the patch content:

The hint to CFLAGS was helpful, thanks, as this double define is indeed
being triggered when CFLAGS is not cleared, so: this patch isn't necessary.

I still haven't quite determined why a top level "make install" triggers a
"make -C xen-root/xen distclean", which then causes further compilation to
be performed, in what should be an install-only step, which made this other
behaviour visible (since in the cross-compile system I'm working with,
CFLAGS is being explicitly cleared for the "make" but happened not to be
for "make install").

It's also been brought to my attention that this isn't the first time this
undefine has been proposed on this list -- so apologies for the revisit.

thanks,

Christopher

--00000000000037dfc30571678837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jul 19, 2018 at 12:34 PM, Stefano Stabellini <span dir=3D"ltr">=
&lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini=
@kernel.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><span class=3D"gmail-">On Thu, 19 Jul 2018, Jan Beulich wrote:<=
br>
&gt; &gt;&gt;&gt; Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kern=
el.org">sstabellini@kernel.org</a>&gt; 07/19/18 8:49 PM &gt;&gt;&gt;<br>
&gt; &gt;On Thu, 19 Jul 2018, Jan Beulich wrote:<br>
&gt; &gt;&gt; &gt;&gt;&gt; Stefano Stabellini &lt;<a href=3D"mailto:sstabel=
lini@kernel.org">sstabellini@kernel.org</a>&gt; 07/19/18 7:00 PM &gt;&gt;&g=
t;<br>
&gt; &gt;&gt; &gt;On Thu, 19 Jul 2018, Jan Beulich wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Christopher Clark &lt;<a href=3D=
"mailto:christopher.clark6@baesystems.com">christopher.clark6@<wbr>baesyste=
ms.com</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;&gt; &gt; Please use my gmail address for any corresponde=
nce to me.<br>
&gt; &gt;&gt; &gt;&gt; <br>
&gt; &gt;&gt; &gt;&gt; I think it is generally considered bad practice to h=
ave From: and S-o-b<br>
&gt; &gt;&gt; &gt;&gt; differ.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;Why? That is perfectly fine. Signed-off-by is about copyr=
ight of the<br>
&gt; &gt;&gt; &gt;code while From: is about authorship. <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Well, in this particular case Christopher had even asked that=
 communication<br>
&gt; &gt;&gt; to go to the mail address he sent from. How is anyone going t=
o know that if<br>
&gt; &gt;&gt; judging just from the eventual commit in git?<br>
&gt; &gt;<br>
&gt; &gt;Yeah, that bit of information is lost in the commit message,<br>
&gt; &gt;unfortunately. At that point, the patch is already committed, so i=
t is<br>
&gt; &gt;usually not a big deal.<br>
&gt; <br>
&gt; What if there is an issue with the change, or simply a question about =
it?<br>
&gt; I&#39;d expect to be able to get in touch with the author by using the=
 provided<br>
&gt; email address, at least if the commit isn&#39;t overly old yet.<br>
<br>
</span>Thinking about it, the From: email address will end up in the Author=
:<br>
field of the commit. So actually, the information will be retained.<br>
</blockquote></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Thanks for the group input on the From/Author and S-o-b identifiers=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Cont=
ext on the constraints which lead to the structure of my <span style=3D"fon=
t-size:small;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">original<span>=
=C2=A0</span></span>message on this thread:</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">* Email message source:</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">My messages are sen=
t to the list from my gmail account as that&#39;s the one I have easiest ac=
cess to from my development environment. Shouldn&#39;t be a concern as I&#3=
9;m easily reachable there and as Stefano pointed out, inclusion of an alte=
rnate &#39;From:&#39; in within the message body is enough to change the gi=
t &#39;Author&#39; if the patch is merged.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">* Commit Author:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">I can provide either addres=
s for the From/Author address for the commit.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">My preference is for it being the a=
ddress I am reliably reachable at -- which would be my gmail account as not=
ed. My reachability at this email address has exceeded that of any other em=
ail address I have ever had, surviving multiple changes of organizational a=
ffiliation.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">* Commit Signed-off-by:</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">I have a legal requirement to ensure that copyright=
 is attributed for the work, and I have used the S-o-b address to do so.=C2=
=A0 In the patch I sent, the email address provided for the S-o-b is under =
the administrative control of the legal owner of the copyright, which seems=
 appropriate for it.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I could change the S-o-b to match the From/Author, and add=
 further language to the commit message to clarify copyright attribution, b=
ut that seems incorrect and would require further effort to support any aut=
omation for eg. harvesting community contribution statistics.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Re: Jan&#39;s feedb=
ack on the patch content:</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">The hint to CFLAGS was helpful, thanks, as this double =
define is indeed being triggered when CFLAGS is not cleared, so: this patch=
 isn&#39;t necessary.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I still haven&#39;t quite determined why a top level &quot=
;make install&quot; triggers a &quot;make -C xen-root/xen distclean&quot;, =
which then causes further compilation to be performed, in what should be an=
 install-only step, which made this other behaviour visible (since in the c=
ross-compile system I&#39;m working with, CFLAGS is being explicitly cleare=
d for the &quot;make&quot; but happened not to be for &quot;make install&qu=
ot;).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
It&#39;s also been brought to my attention that this isn&#39;t the first ti=
me this undefine has been proposed on this list -- so apologies for the rev=
isit.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
thanks,</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Christopher</div><div><br></div></div><div class=3D"gmail_extra"><br></di=
v></div>

--00000000000037dfc30571678837--


--===============0051022027233321725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0051022027233321725==--
