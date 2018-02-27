From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen Security Advisory 255 - grant table v2 -> v1
	transition may crash Xen
Date: Wed, 28 Feb 2018 01:48:16 +1100
Message-ID: <3005966.RCB7UnNRCF@wopr.lan.crc.id.au>
References: <E1eqdvU-0006ly-7n@xenbits.xenproject.org>
 <5A9577A402000078001AC45E@prv-mh.provo.novell.com>
 <e035f383-5106-ebfb-b24d-4853435859ea@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5913490411190727554=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=flab=fv=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1eqgYL-0001jv-Us
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 14:48:26 +0000
Received: from wopr.lan.crc.id.au
 (2407-e400-b000-201-11ab-990d-80c9-ac1c-cpe.spintel.net.au
 [IPv6:2407:e400:b000:201:11ab:990d:80c9:ac1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 54FF220C99
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2018 01:48:20 +1100 (AEDT)
In-Reply-To: <e035f383-5106-ebfb-b24d-4853435859ea@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5913490411190727554==
Content-Type: multipart/signed; boundary="nextPart12063973.D7qaxpjaVd"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart12063973.D7qaxpjaVd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, 28 February 2018 1:36:14 AM AEDT George Dunlap wrote:
> On 02/27/2018 02:22 PM, Jan Beulich wrote:
> >>>> On 27.02.18 at 13:37, <netwiz@crc.id.au> wrote:
> >> On Tuesday, 27 February 2018 11:00:08 PM AEDT Xen. org security team=20
wrote:
> >>> RESOLUTION
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=20
> >>> Applying the appropriate attached patch resolves this issue.
> >>>=20
> >>> xsa255-?.patch         xen-unstable, Xen 4.10.x
> >>> xsa255-4.9-?.patch     Xen 4.9.x, Xen 4.8.x
> >>> xsa255-4.7-?.patch     Xen 4.7.x
> >>> xsa255-4.6-?.patch     Xen 4.6.x
> >>=20
> >> Is there a missing pre-requisite patch required for 4.6.6?
> >>=20
> >> I'm currently getting a failure on these patches as follows:
> >>=20
> >> Patch #55 (xsa255-4.6-1.patch):
> >> + echo 'Patch #55 (xsa255-4.6-1.patch):'
> >> + /bin/cat /builddir/build/SOURCES/xsa255-4.6-1.patch
> >> + /usr/bin/patch -p1 --fuzz=3D2
> >> patching file xen/arch/arm/domain.c
> >> patching file xen/arch/arm/mm.c
> >> Hunk #2 FAILED at 1075.
> >> Hunk #3 FAILED at 1090.
> >> 2 out of 3 hunks FAILED -- saving rejects to file xen/arch/arm/mm.c.rej
> >=20
> > I've just applied the patches to all stable branches, and they all
> > applied fine, including the 4.6 ones. Are you perhaps missing the
> > XSA-235 fix there? In any event, as said a number of times in
> > the past, the patches we provide are against the staging branches
> > for the respective stable versions; we don't guarantee patches
> > apply to vanilla stable releases.
>=20
> And as other people have said several times, most downstreams don't
> build from stable-XX, but take a tarball and add patches to it.  I
> expect Steven was asking if someone could point him to specific commits
> from stable-XX that might be required.

Hi George,

Yes, you are correct.

As XSA-235 was an ARM only issue (and I don't build anything for ARM), thes=
e=20
usually get skipped in my packaging.

As XSA-255 is *both* ARM & x86, it needed that extra bit of TLC... This=20
probably makes it a little unique in how XSAs are normally presented.

I did look at the two patches in XSA-255, but it looked like there is a=20
combination of both ARM & x86 changes in specifically the -2 patch which le=
ad=20
me to the conclusion that I couldn't just remove one patch to take out the=
=20
common and x86 parts.

I figured something was missing, but wasn't able to track it back to the pa=
tch=20
from August last year.

Thanks to Jan for the pointers to the missing requirement - I've got packag=
es=20
built for 4.6 now to push shortly.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart12063973.D7qaxpjaVd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlqVb7AACgkQQa811Xp9
MdxghA/8CJLu/Dg2ZUMBr+QVj4QXFJtuiZdB1EXjlF3m4u88scz58Y4kp7irvivT
WcNZZhSAefLHB2HZRuuBHhBi5Zq2ewZmOYkPf8sWjqOQV6Qaf6bIRRCUmN5lz5w3
RBgBUoRv87DSO3/xomZK1eZT5ddyRrrvoQumebjrwkUUuMc5RuBj5xHZdCwh1qnf
Fn0Asc9DsI34R8851JaTJ65kO8ef3HEVyX1gym8YD3wVv1X7DQc4kQRIVyrRbrrG
3bNecWVtIKj1XZktrxfTOCch+ucF4Mx9kEHDl/7U26uMfd+r9/VdfiDDQhC47aIb
L0nTjwj2M5YkyQnb+Uspwt/yABbqZmkHLj+2EGFflTwxPr3oRvTXS9HalBzsrg3Y
zbvCVFCieMLKV/XsKzCccLq+mO2+40K4HLpMgkAoTI9N4hFTrqSRhzKDKM+mdG4D
snefeLCQR5tCBn7YP5HdbJpx7Q9a00H8UTumGsjhadNTwf7ZpSWe4AXyQltrbWdn
Gw3NQMyq8mwd2myY57XBuFfoLkrMk4bOvTBDJuIpc8uNCucOOZ/UTSh8Fd9gfQpg
bEs8XJJ52Rjx4++7m93LHFxE7NOEHgtb4grjOk5P0BgjWTmG+BE+HHMe2tkV6sR2
svAhVdyFFEHdGI42eIzlZ/2MRyMzHoh39TRCkYP3YPPfXi1ihTk=
=F0OA
-----END PGP SIGNATURE-----

--nextPart12063973.D7qaxpjaVd--





--===============5913490411190727554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5913490411190727554==--
