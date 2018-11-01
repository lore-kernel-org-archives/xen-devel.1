From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [RFC PATCH v2 06/17] libxl: create vkb device only
 for guests with graphics output
Date: Thu, 1 Nov 2018 13:24:13 -0700
Message-ID: <alpine.DEB.2.10.1811011321530.7220@sstabellini-ThinkPad-X260>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <ba6c6d2d241f3a41c65951180a5842dde29bd9ce.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.12894.797150.731485@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1338813342-1541103851=:7220"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0sdp=nm=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gIJW7-0000iT-4b
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 20:24:35 +0000
In-Reply-To: <23515.12894.797150.731485@mariner.uk.xensource.com>
Content-ID: <alpine.DEB.2.10.1811011324120.7220@sstabellini-ThinkPad-X260>
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

--8323329-1338813342-1541103851=:7220
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.10.1811011324121.7220@sstabellini-ThinkPad-X260>

On Thu, 1 Nov 2018, Ian Jackson wrote:
> (CCing Stefano's new address.)

Thank you, I am still responsive at my kernel.org address too.


> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 06/17] libxl: crea=
te vkb device only for guests with graphics output"):
> > The forced vkb device is meant for better performance of qemu access
> > (at least according to ebbd2561b4cefb299f0f68a88b2788504223de18 "libxl:
> > Add a vkbd frontend/backend pair for HVM guests"), which isn't used if
> > there is no configured channel to actually access that keyboard.
>=20
> I think the background here is that the "usb keyboard/mouse" referred
> to in ebbd2561 is supposedly used only for vnc ?

Yes. The idea is that if the guest doesn't use the usb keyboard/mouse,
QEMU will need far less frequent wakeups in Dom0.


> I think we still support SDL though, so maybe that needs to be checked
> too.  I did `git-grep -i sdl tools/libxl' and there's a few
> occurrences of something like this
>   tools/libxl/libxl_dm.c:        if (!sdl && !vnc)
> in particular, in one of these cases it passes -nographic to qemu.
>=20
> Probably the situations where we shouldn't unconditionally provide a
> vkb are those where -nographic is passed to qemu ?

Yes, if the configured machine already is meant to be used without
emulated usb keyboard mouse, then vkb is not necessary.


> Maybe we need a helper inline function for sdl || vnc.  If you decide
> to introduce one, please do that in a patch before this one.
=20
--8323329-1338813342-1541103851=:7220
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1338813342-1541103851=:7220--
