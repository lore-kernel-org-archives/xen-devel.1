From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Problem with Xen 4.7.5
Date: Thu, 05 Apr 2018 20:02:57 +1000
Message-ID: <2806674.HxMyK3gPeZ@wopr.lan.crc.id.au>
References: <23237.2546.225198.36869@mariner.uk.xensource.com>
 <30b9ef708cf321c5975c07ce9d5dfba7@crc.id.au>
 <23237.59923.421239.170532@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1283238140449792579=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7gcu=g2=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1f41jf-0008AR-Ax
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 10:03:15 +0000
In-Reply-To: <23237.59923.421239.170532@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1283238140449792579==
Content-Type: multipart/signed; boundary="nextPart2040747.DTKmF6RyLk"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2040747.DTKmF6RyLk
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, 5 April 2018 7:19:15 PM AEST Ian Jackson wrote:
> Steven Haigh writes ("Re: Problem with Xen 4.7.5"):
> > On 2018-04-05 03:22, Ian Jackson wrote:
> > > Apologies for the inconvenience.
>=20
> ...
>=20
> > I'm wondering if the severity of this is high enough that I should
> > withdraw the 4.7.5 packages from my repos.
> >=20
> > Is this a show-stopper? Security issue? Dom0 crash?
> >=20
> > I released 4.7.5 packages within an hour of the 4.7.5 release
> > announcement - so there are quite a few user systems that have already
> > grabbed them.
>=20
> It's quite bad.  We don't understand the impact properly yet but it is
> at least a domU crash in some situations.
>=20
> I would withdraw the packages, yes.  Sorry.

Thanks Ian, its all good - I've withdrawn them and I'll send an announcemen=
t=20
to my user list to get them to downgrade etc...

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897

--nextPart2040747.DTKmF6RyLk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlrF9FEACgkQQa811Xp9
MdxTSQ//bpSBGgdhXwsTpZFgpgfO+Kxl7pd4hd7sUu/Y0L+H6cVDUfXLcPLs2IK2
vJJ3vVTKqKJGnvmKeBiBv0X6yM6xL7uza4H8M03rkeoT9HZTOSy6WwQ08LBYNP4E
nbngHgBylJe+CxyWqC4ExG6z5xpxrjJ/gb3sZmM4h0XVRLQw2dyPKvzgeUG7pnDM
hxaoEtwa4fW1cV8Ldyjx3B1jZZ/JUED03rEqlHWp0HKomu5fEjDeUDXwWxB2bjMG
QIDziBCCGB04ho0TPUafr+My+rCJZJ/xtUXtW6e/FB2Pp/Y/I3ko2zqBsTnuBwa8
rel9RBxguiSuKisv8/feBbmoeb0WNczFm+OoMsmsDCdebVRzFNiP2cYDeWid6U0Z
KypS1Wn0ufghF8Z3VacqEMN6hl3QHvkoZ0MwOwnSaPi7YajZcnCr/gcPrFda//Hs
zMB5lwH4DfnQLw0pr7M3MdvFdayBJktq9r+Nert8vXO+K0TUpSlNDcWKqHgpr7cR
GdYeFMXt7MwWwXFPoKP0jaVp7boOGsFxwIUZyLCeucHAasXmftDShMlnFpcE3mfa
/XNZaimKG9RhblkmuNXlaYHbzJgnvAegwA0DlQpu5hMv3xDFlf3ZXG0Q149EZFrM
F/GKBbcbFOjC8YSHyDmRHLjqZWK/4UAMtEnZ3ZBAm4lSkHhOubs=
=HFLe
-----END PGP SIGNATURE-----

--nextPart2040747.DTKmF6RyLk--





--===============1283238140449792579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1283238140449792579==--
