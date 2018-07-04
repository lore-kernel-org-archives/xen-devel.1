From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 05 Jul 2018 01:59:11 +1000
Message-ID: <8146633.jAX8UBOXDT@wopr.lan.crc.id.au>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <FA03802B-3308-4BF8-B3D9-1E6DAB3DA64B@citrix.com>
 <23356.60431.470201.125684@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7073144572106643806=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=g09h=ju=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fakBZ-0004AG-MW
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:59:17 +0000
In-Reply-To: <23356.60431.470201.125684@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============7073144572106643806==
Content-Type: multipart/signed; boundary="nextPart7363736.UuHk3IXPUc"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7363736.UuHk3IXPUc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, 5 July 2018 1:47:27 AM AEST Ian Jackson wrote:
> George Dunlap writes ("Re: [Xen-devel] [Notes for xen summit 2018 design=
=20
session] Process changes: is the 6 monthly release Cadence too short, Secur=
ity=20
Process, ..."):
> > I seem to recall saying that even if we agreed that moving to continuous
> > delivery was a goal we wanted to pursue, we would still be several years
> > away from achieving anything like it; and so in the mean time, it would
> > probably make sense to move back to a 9-month cycle while we attack the
> > problem.
> Another thing that is that as our window of N years'
> security-supported releases has filled up with ~6-month releases,
> there are more of them.
>=20
> I know we had concerns that this makes backporting harder.  I'm not
> really sure that's true.  The total amount of backporting lossage
> (merge conflicts etc.) is the same, and trivial automatic backports
> are nearly no work.
>=20
> But one thing that is noticeable is that this significantly increases
> our test load when a security update comes out.  Each
> security-supported branch gets updates, and osstest suddenly needs to
> test them all.

I did like the idea of an 'LTS' vs 'testing' release. The idea that odd / e=
ven=20
or similar varied in lifecycle - allowing entire versions to be killed off=
=20
rapidly.

If we had 'LTS' support at 2 (or more?) years, and 'testing' support at 6 (=
or=20
less?) months, would this help?

I guess the idea would be that the 'testing' versions are where all the rap=
id=20
features are added, which is then 'frozen' into an LTS release at some poin=
t=20
to only get security fixes via point releases (ala linux kernel version typ=
e=20
bumping).

Is this even practical? I guess this would depend on how often an LTS relea=
se=20
is spawned...

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart7363736.UuHk3IXPUc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAls87s8ACgkQQa811Xp9
MdznuQ//VC+cqcwffbTZZ1CNkqLq+djA1LD67xbF8oOkwWOWYvCYYBEj/ButW4rG
Or8tIpSqydPuKG/+/WK676PpaW7gn3Jjg503SvYF78IKm2bHevOlrltoS0DARqcF
443GLb+pqol2PyP4nj97Uhtg5khlPgflLjyh3359CbRTckbfuQmoQwBFJHjWDM9K
kgSaf8x3XZqvLx1rZXZsX7IPnCieqdKNR3yFg7+wpGZS0riEIzptS5e9x0HFcLsh
nY1tYHm/LpxNeMOiF9D6yLeI/A1ODGl8nPEak+yOSNyktihvg82BzfOT+IHEi2ze
os2l/PQ0oDRU40freDAK9D/gNUXu+cMfCMVELDGT2de7ZZKx2sopCZ5kDbyM7KNA
v3YvL8bIHpD6i7fMRSJ0HwcQmUplCVKHm94BBTINdjU5L2zZAzoFt+LIlwJFNbB4
xZfxH9ipXV9/ZnqEnArlxULVsqcMT2v0p9Xv59FhzuhjQ6Auklu1WMPlQjN4yXI6
IHk4aZYFdBwU/ZyRTJRI4YG1hh3BgEGtZ8ZvRo6qXUIoHQ651YF95lkAbPwuZ6NX
U45wdgl/oeIPeh2P5Fka3oQYjb2j6F8+XiLxTWRVq/Bb0RMcuLGW3xkimX+9CXMF
AUCqMQTC0TFb3+XHRu1bBfYLMHpgla8K+nHRBSoG6+AS9LCKnkg=
=PZza
-----END PGP SIGNATURE-----

--nextPart7363736.UuHk3IXPUc--





--===============7073144572106643806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7073144572106643806==--
