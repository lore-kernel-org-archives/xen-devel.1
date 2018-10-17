From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Wed, 17 Oct 2018 18:05:59 +0200
Message-ID: <20181017160559.GB2755@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
 <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
 <23495.21043.960987.833172@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4102368364137143745=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=y9w2=m5=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gCoKm-0006ik-36
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 16:06:08 +0000
In-Reply-To: <23495.21043.960987.833172@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============4102368364137143745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 04:16:03PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: [RFC PATCH v2 00/17] Add sup=
port for qemu-xen runnning in a Linux-based stubdomain."):
> > [stuff]
>=20
> So, I only got a little way through this series, but it was a while
> ago and you say things are done differently now.  I'm not sure if it
> is useful for me to review the rest of it.
>=20
> Would it be better for me to await a repost ?

All the xenconsoled stuff is unchanged (and unlikely to change), so it
should be safe to review it. Patches 06 and 07 also shouldn't change.

The thing that will change is qemu cmdline and qmp handling. TBH I'm not su=
re
if its better to touch qmp now, or after reworked qmp handling by
Anthony will be merged. There will definitely be some conflicts and it
may even affects what underlying mechanism is chosen for qmp transport.
Based on discussion here, and in libxl__ev_qmp_* thread, I see two
viable options:

1. libvchan
  pros:
   - out of band reset support, so qmp capabilities negotiation can be
     handled gracefully
  cons:
   - more work, require patching qemu (or adding vchan->socket proxy),
     adds dependency on libvchan to libxl (probably not a problem)
   - possibly more complex libxl__ev_qmp_* handling, or at least needs
     separate handling of send/receive for stubdomain case
2. pv console
  pros:
   - no qemu modifications
   - same read()/write() on libxl side
  cons:
   - no out of band reset, needs libxl handling for that (skipping
     negotiation)
   - possibly other problems from that (events filling up some buffers
     when no one is listening?)

In both cases, there is only one simultaneous connection to qemu, so
some locking will be needed at libxl side.
BTW Does libxl listed for qmp events?

There is also third option: xenstore, but that would probably require
totally separate libxl__ev_qmp_* implementation, so I'd rule it out.

If problems with pv console could be solved, I'd go this way. But
otherwise libvchan seems like a good alternative.

Adding Anthony.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvHXegACgkQ24/THMrX
1ywPfQf8C6vd77GvTRqWMACURgevDAbKMSibj9Y8d8OXHCBiTQui7IUPKCjURQGX
LvUqBBqF4srzlLR77JQrvkDDdyhxP1Xr97bqw/zFBRpBAUK37F9k3VOPaYJI40j/
HHuo2fhWKBz5dFRRdmW8qFGwwut7TzOSVCtRH4n4pdNI6tIk+C3S57Q2Ph5rTHor
xJ5vtNLxpk9cWzrWYwJn7Mi+NPkgzUgFhmZCNlgSlDfrEymfsnh23BVCc8N7EE2F
fCzCu+ziDgwr3mxN4IMmvObdyYvITgGQ+IzTZLo/c20eeOtjmrUNsjNAuZxCcXxE
coiRm7Ynm4KyLA3q/wt82QKjYjsT7A==
=rnJt
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--


--===============4102368364137143745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4102368364137143745==--
