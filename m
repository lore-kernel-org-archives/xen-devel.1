From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] xenconsole: add option to avoid escape
 sequences in log
Date: Tue, 31 Jul 2018 18:11:15 +0200
Message-ID: <20180731161115.GS1371@mail-itl>
References: <20180731031532.11752-1-marmarek@invisiblethingslab.com>
 <20180731091010.chflw6m32uqeatsq@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2020262908886500393=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=01/i=kp=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkXF1-0003of-Qc
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 16:11:19 +0000
In-Reply-To: <20180731091010.chflw6m32uqeatsq@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2020262908886500393==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U7F39clxgs+06sAz"
Content-Disposition: inline


--U7F39clxgs+06sAz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 10:10:10AM +0100, Wei Liu wrote:
> On Tue, Jul 31, 2018 at 05:15:32AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Add --replace-escape option to xenconsoled, which replaces ESC with
> > '.' in console output written to log file. This makes it slightly safer
> > to do tail -f on a console output of untrusted guest.
> > The pty output is unaffected by this option.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Acked-by: Wei Liu <wei.liu2@citrix.com>
>=20
> ... though I would like to make a minor modification when committing.
> See below.
>=20
> >  static int write_all(int fd, const char* buf, size_t len)
> >  {
> > +	char buf_replaced[1024];
> > +	size_t this_round;
>=20
> These two can be moved into ...=20
>=20
> > +
> >  	while (len) {
> > -		ssize_t ret =3D write(fd, buf, len);
> > +		ssize_t ret;
> > +		if (replace_escape) {
>=20
> ... here.
>=20
> Let me know if you disagree.

Sure, that's fine with me.

> > +			if (len > sizeof(buf_replaced))
> > +				this_round =3D sizeof(buf_replaced);
> > +			else
> > +				this_round =3D len;
> > +			do_replace_escape(buf, buf_replaced, this_round);
> > +			ret =3D write(fd, buf_replaced, this_round);
> > +		} else
> > +			ret =3D write(fd, buf, len);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--U7F39clxgs+06sAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltgiiMACgkQ24/THMrX
1yy4Zgf+LIwHJ7XYt8bKO3iKRwv0kT/2h4LHYf0dx5NHS2rNPoE1bS4diNfLf/Xi
I2nVbYzOILOmSlHNWETAXUD/Kih14qPxZbiU3ozyfRY1XFXCjtyORjJclywBFyAY
udM/RlSDLcTOd60XSalRnB3+oYc7yIzZXGKsgWFKSD4mojOSiPef3qCSWPKO+lqH
WpWkuhEBzB0UPxFWl1qzvTM82sLPXspuSmE6+KrYdW3mUuVgoqSPieaORv1m95B3
TqwoA0ITJWZhmUd02QMLeyRjMxGm1xuLY01FXy5C8egrs5onCViMvtbxu3a5X0b5
Bbr5GE6c1YV4+rO/q/P2rWiEwngqTQ==
=3l/S
-----END PGP SIGNATURE-----

--U7F39clxgs+06sAz--


--===============2020262908886500393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2020262908886500393==--
