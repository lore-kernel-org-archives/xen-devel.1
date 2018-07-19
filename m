From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: 4.9.3 preparations
Date: Wed, 18 Jul 2018 17:43:46 -0700
Message-ID: <CACMJ4GZ=cELoVyEwKNAJDgDvbsPhvAhKvL5_FYLacEtbVOFGWg@mail.gmail.com>
References: <5B3CA46202000078001D0F7F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5123151243875237444=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i3mt=kd=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ffx2s-0004Ad-8A
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 00:43:50 +0000
Received: by mail-lj1-x22e.google.com with SMTP id s12-v6so5684474ljj.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jul 2018 17:43:48 -0700 (PDT)
In-Reply-To: <5B3CA46202000078001D0F7F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Lars Kurth <lars.kurth@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============5123151243875237444==
Content-Type: multipart/alternative; boundary="000000000000da445205714f7856"

--000000000000da445205714f7856
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 4, 2018 at 3:41 AM, Jan Beulich <JBeulich@suse.com> wrote:

> All,
>
> this is supposed to go out in about 3 weeks time. Please point out backport
> candidates you find missing from its staging branch, but which you consider
> relevant.
>


Marek's patches below are each straightforward and enable clean builds with
newer gcc.

fa7789e : tools/libxc: fix strncpy size
27751d8 : tools/misc: fix hypothetical buffer overflow in xen-lowmemd
938c8f5 : tools/xenpmd: fix possible '\0' truncation
7f601f7 : tools/gdbsx: fix -Wstringop-truncation warning
437e00f : tools/kdd: mute spurious gcc warning
2de2b10 : tools/kdd: alternative way of muting spurious gcc warning
3a633c2 : tools/blktap2: fix hypothetical buffer overflow
850e89b : tools/blktap2: fix possible '\0' truncation

This additional patch that I just posted is probably too new for
consideration for this, but it fixes a build warning with gcc 8.1:

https://lists.xenproject.org/archives/html/xen-devel/2018-07/msg01718.html
 : tools/xentop : replace use of deprecated vwprintw

so maybe not for this one, but perhaps the next.

The full set above passed compile test for x86-64, applied on top of
current staging-4.9.

Christopher

--000000000000da445205714f7856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jul 4, 2018 at 3:41 AM, Jan Beulich <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">All,<br=
>
<br>
this is supposed to go out in about 3 weeks time. Please point out backport=
<br>
candidates you find missing from its staging branch, but which you consider=
<br>
relevant.<br></blockquote><div><br></div><div><br></div><div><div>Marek&#39=
;s patches below are each straightforward and enable clean builds with newe=
r gcc.</div><div><br></div><div>fa7789e : tools/libxc: fix strncpy size</di=
v><div>27751d8 : tools/misc: fix hypothetical buffer overflow in xen-lowmem=
d</div><div>938c8f5 : tools/xenpmd: fix possible &#39;\0&#39; truncation</d=
iv><div>7f601f7 : tools/gdbsx: fix -Wstringop-truncation warning</div><div>=
437e00f : tools/kdd: mute spurious gcc warning</div><div>2de2b10 : tools/kd=
d: alternative way of muting spurious gcc warning</div><div>3a633c2 : tools=
/blktap2: fix hypothetical buffer overflow</div><div>850e89b : tools/blktap=
2: fix possible &#39;\0&#39; truncation</div><div><br></div><div>This addit=
ional patch that I just posted is probably too new for consideration for th=
is, but it fixes a build warning with gcc 8.1:</div><div><br></div><div><di=
v style=3D"font-size:small;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><a href=3D"https://lists.xen=
project.org/archives/html/xen-devel/2018-07/msg01718.html">https://lists.xe=
nproject.org/archives/html/xen-devel/2018-07/msg01718.html</a></div>=C2=A0:=
 tools/xentop : replace use of deprecated vwprintw</div><div><br></div><div=
>so maybe not for this one, but perhaps the next.</div><div><br></div><div>=
The full set above passed compile test for x86-64, applied on top of curren=
t staging-4.9.</div></div><div><br></div><div>Christopher</div><div><br></d=
iv><div><br></div></div></div></div>

--000000000000da445205714f7856--


--===============5123151243875237444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5123151243875237444==--
