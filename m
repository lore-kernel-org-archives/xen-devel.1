From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen Project Security Process Whitepaper v1 is ready
 for community review
Date: Thu, 28 Jun 2018 00:47:07 +1000
Message-ID: <2259308.S7C7BiUIIS@wopr.lan.crc.id.au>
References: <2AF1AB1A-2DFE-429B-8F3B-0153D339EC5F@citrix.com>
 <5546007.nMA9FcojZc@wopr.lan.crc.id.au>
 <5B3356BE02000078001CE3F9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3115242893015385187=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=chrh=jn=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fYBj9-00085m-RS
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:47:24 +0000
In-Reply-To: <5B3356BE02000078001CE3F9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <dunlapg@umich.edu>, Marek Marczykowski <marmarek@invisiblethingslab.com>, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, Andrew Halley <andrew.halley@citrix.com>, Ajey Kulkarni <Ajey.Kulkarni@rackspace.com>
List-Id: xen-devel@lists.xenproject.org

--===============3115242893015385187==
Content-Type: multipart/signed; boundary="nextPart3433249.bxDSfRvNX4"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3433249.bxDSfRvNX4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, 27 June 2018 7:19:58 PM AEST Jan Beulich wrote:
> >>> On 27.06.18 at 06:05, <netwiz@crc.id.au> wrote:
> > Right now, we're at a stage where we could probably justify a new relea=
se
> > of 4.6, 4.7, 4.8, 4.9, and 4.10 due to the depth of XSAs contained with=
in
> > that can't be patched on top of the release archive.
>=20
> 4.7.6 and 4.8.4 are imminent anyway, and 4.9.3 is due in about a
> month's time (I'll send a respective call for pointing out missing
> backports once I've flushed out my own queue). There's not going to
> be another release off the 4.6 branch, at least not one organized by
> XenProject. Even us meaning to do so for 4.7 is only because of the
> circumstances.
>=20
> As mentioned before - personally I'm not fancying to do more frequent
> stable releases.

Surely we are able to automate the majority of the process?

I could imagine that with a regular release schedule, it could be refined=20
enough to automatically package the current git branch based on just=20
committing a tag.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart3433249.bxDSfRvNX4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlszo2sACgkQQa811Xp9
MdwgmQ/5AWDIFBO3uKR/bJitwrOseAaeFfzp1RKl30sPoK2OXbvMv9nZOsYK6h/o
AMSos9i7/U+AlUaUHSSHIkY+872lSGnpzvScquHFQvuqO7aE7CoaV4pXJk2OThAw
8veXAmziB2gNsSwqXsBdyWU0/UnVwaRS86vQF6H92suokIJPhvcQmptYta6C9JAt
326BXoPOuz2rWG0qOx1b9rosZeKv5OoC7Xrm0qaplsPacNC+MYgs1im18NFwXYFd
j6lKSQCNHiLjY4nRWYqeO4iSgtys5E6N3/q+hYEdg7n2PxHz3ItLbd4aZyLZGb9s
xDfxdni1WsY532ngj+BLyB9ChOE3PQKG5Oem/dE5yhdsa8iBXtYZ46DlMc0X4GMy
PCLgEAdL+BVKSwP9BfKh8sj06/wkgROgsZY+Q+KWLrMlMgwGQp5lVFr9gEsI2Scu
XS3MIOR2NgwO4xuEOA8zZ4FMP4NBVK5N8SKHEVEchg7RN8jMMUJy6czxZNfMnsUj
TBNahLo4cWTiRxfkzQoEo5/lvfGboEJgFkY4Ryj6cBJr5VEtyryslY9RhaOOre3v
w9QdirpWMBDg0P+ZueBdowM0oGStJPCtLQZ0TbdisFwLVPYziysnW9Xmj8VsnMMb
qQFOd9Dm+4tOI0HYgHCFvLwtkV5vmCKiXXQrRgFdIYKTZnJ2H6k=
=CQ8x
-----END PGP SIGNATURE-----

--nextPart3433249.bxDSfRvNX4--





--===============3115242893015385187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3115242893015385187==--
