From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [RFC PATCH v2 13/17] xenconsoled: add support for
 up to 3 secondary consoles
Date: Thu, 1 Nov 2018 13:27:28 -0700
Message-ID: <alpine.DEB.2.10.1811011324460.7220@sstabellini-ThinkPad-X260>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <58fad8fc7a60c5f9a6e107dafb52df2ef3d15665.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.14438.209179.640957@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-101477242-1541104021=:7220"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0sdp=nm=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gIJZA-0000s3-MU
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 20:27:44 +0000
In-Reply-To: <23515.14438.209179.640957@mariner.uk.xensource.com>
Content-ID: <alpine.DEB.2.10.1811011327020.7220@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-101477242-1541104021=:7220
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.10.1811011327021.7220@sstabellini-ThinkPad-X260>

On Thu, 1 Nov 2018, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 13/17] xenconsoled=
: add support for up to 3 secondary consoles"):
> > Based on previous few commits, this adds basic support for multiple
> > consoles in xenconsoled. A static number of them - up to 3 (+ one
> > primary).
>=20
> I'm confused.  I thought we already had support for multiple PV
> consoles.  Is the problem that the backend is in qemu rather than
> xenconsoled ?  I'm not sure how this patch interacts with the
> qemu-provided extra PV consoles in docs/misc/console.txt.

I haven't read this patch, but yes, it is as you wrote. Multiple PV
consoles are only suppored by QEMU, with the interface described in
docs/misc/console.txt. It could be nice to be able to support them with
xenconsoled, but we need to be careful they don't conflict. There is a
way to specify the desired console backend, either QEMU or xenconsoled,
so it shouldn't be a problem to have both backends being able to do
multiple consoles. But we wouldn't want to have a different interface
from the one described in docs/misc/console.txt, otherwise we'll break
existing guests (Linux for instance.)


> I'm afraid (as you probably predicted) I don't think this patch is
> suitable for upstream in its current form.  I can see that
> restructuring xenconsoled to be more dynamic is some work but I may be
> able to help there.
>=20
> CCing Stefano, the author of docs/misc/console.txt, at his new
> address.
--8323329-101477242-1541104021=:7220
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-101477242-1541104021=:7220--
