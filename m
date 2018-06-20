From: Liam Shepherd <liam@dancer.es>
Subject: Re: BUG: jumbo frames broken after commit xen-netfront:
 Fix race between device setup and open
Date: Wed, 20 Jun 2018 23:15:29 +0100
Message-ID: <CAB8B+d2qVWOq410pKuPu87pk83csZ=-saDFmhPfNkFSeOKDGRg@mail.gmail.com>
References: <CAK=Wzwcjz5JKzfrdGpWNXhb6ZmTrpbNjSJxiivZt3HF8cKYi3Q@mail.gmail.com>
 <CABxcv=mKA=Ueu6PmPs5OQgpU_jkG4BhDxNLwEpiiOSV5t8xzrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1586218022168095206=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hsux=jg=dancer.es=liam@srs-us1.protection.inumbo.net>)
 id 1fVlO1-0008RK-8L
 for xen-devel@lists.xenproject.org; Wed, 20 Jun 2018 22:15:33 +0000
Received: by mail-yb0-x243.google.com with SMTP id h141-v6so446118ybg.4
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jun 2018 15:15:30 -0700 (PDT)
In-Reply-To: <CABxcv=mKA=Ueu6PmPs5OQgpU_jkG4BhDxNLwEpiiOSV5t8xzrg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Jeddeloh <andrew.jeddeloh@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dustymabe@redhat.com, stable@vger.kernel.org, Ross Lagerwall <ross.lagerwall@citrix.com>, netdev <netdev@vger.kernel.org>, xen-devel@lists.xenproject.org, Laura Abbott <labbott@redhat.com>, "David S. Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

--===============1586218022168095206==
Content-Type: multipart/alternative; boundary="000000000000f7aa1c056f1a221e"

--000000000000f7aa1c056f1a221e
Content-Type: text/plain; charset="UTF-8"

> The patch "xen-netfront: Fix race between device setup and open" seems
> to have introduced a regression preventing setting MTU's larger than
> 1500. We experienced this downstream with Container Linux and
> confirmed with Fedora 28 as well.
>
> It's commit f599c64fdf7d9c108e8717fb04bc41c680120da4 in the linux-stable
tree.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/
linux-stable.git/commit/?id=f599c64fdf7d9c108e8717fb04bc41c680120da4
>
> Downstream bugs:
> https://github.com/coreos/bugs/issues/2443
> https://bugzilla.redhat.com/show_bug.cgi?id=1584216
>
> We've confirmed that reverting that commit fixes the bug. It be
> reliably can be reproduced on AWS with t2.micro instances (and
> presumably other systems using the same driver). Both using
> systemd-networkd to set the mtu and manual ip link commands cause the
> link to repsond with "Invalid argument" when trying to set the MTU >
> 1500.

Sorry for the spam, but this issue I believe this issue is linked with:
https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg00254.html

Thanks

--000000000000f7aa1c056f1a221e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; The patch &quot;xen-netfront: Fix race between d=
evice setup and open&quot; seems<br>
&gt; to have introduced a regression preventing setting MTU&#39;s larger th=
an<br>
&gt; 1500. We experienced this downstream with Container Linux and<br>
&gt; confirmed with Fedora 28 as well.<br>
&gt;<br>
&gt; It&#39;s commit f599c64fdf7d9c108e8717fb04bc41<wbr>c680120da4 in the l=
inux-stable tree.<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x-stable.git/commit/?id=3Df599c64fdf7d9c108e8717fb04bc41c680120da4" rel=3D"=
noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/linux/ker=
nel/git/stable/<wbr>linux-stable.git/commit/?id=3D<wbr>f599c64fdf7d9c108e87=
17fb04bc41<wbr>c680120da4</a><br>
&gt;<br>
&gt; Downstream bugs:<br>
&gt; <a href=3D"https://github.com/coreos/bugs/issues/2443" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/coreos/<wbr>bugs/issues/2443</a><b=
r>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1584216" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/<wbr>show_bug=
.cgi?id=3D1584216</a><br>
&gt;<br>
&gt; We&#39;ve confirmed that reverting that commit fixes the bug. It be<br=
>
&gt; reliably can be reproduced on AWS with t2.micro instances (and<br>
&gt; presumably other systems using the same driver). Both using<br>
&gt; systemd-networkd to set the mtu and manual ip link commands cause the<=
br>
&gt; link to repsond with &quot;Invalid argument&quot; when trying to set t=
he MTU &gt;<br>
&gt; 1500.<br></div><div><br></div><div>Sorry for the spam, but this issue =
I believe this issue is linked with: <a href=3D"https://lists.xenproject.or=
g/archives/html/xen-devel/2018-06/msg00254.html">https://lists.xenproject.o=
rg/archives/html/xen-devel/2018-06/msg00254.html</a></div><div><br></div><d=
iv class=3D"gmail_extra">Thanks<br></div></div>

--000000000000f7aa1c056f1a221e--


--===============1586218022168095206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1586218022168095206==--
